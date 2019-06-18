# centos docker 方式安装 gitlab

* [docker-gitlab GitHub](https://github.com/sameersbn/docker-gitlab)
* [gitlab 源码](https://gitlab.com/gitlab-org/gitlab-ce)

所有安装都在 git 用户下

## 创建 git 用户

```shell
# useradd git
# passwd git
```

## git 用户添加 sudo 权限

```shell
# sudoedit /etc/sudoers
```
```
root    ALL=(ALL)       ALL
git     ALL=(ALL)       ALL
```

## 切换到 git 用户

```shell
# su - git
```

## 安装 docker

```shell
$ wget -qO- https://get.docker.com/ | sh
```

## 安装docker-gitlab

```shell
$ docker pull sameersbn/gitlab:8.8.4
```

## 启动

```
docker run --name gitlab-postgresql -d \
    --env 'DB_NAME=gitlabhq_production' \
    --env 'DB_USER=gitlab' --env 'DB_PASS=password' \
    --env 'DB_EXTENSION=pg_trgm' \
    --volume /srv/docker/gitlab/postgresql:/var/lib/postgresql \
    sameersbn/postgresql:9.4-22
```

Step 2. Launch a redis container

```
docker run --name gitlab-redis -d \
    --volume /srv/docker/gitlab/redis:/var/lib/redis \
    sameersbn/redis:latest
```

Step 3. Launch the gitlab container

```
docker run --name gitlab -d \
    --link gitlab-postgresql:postgresql --link gitlab-redis:redisio \
    --publish 10022:22 --publish 10080:80 \
    --env 'GITLAB_PORT=10080' --env 'GITLAB_SSH_PORT=10022' \
    --env 'GITLAB_SECRETS_DB_KEY_BASE=long-and-random-alpha-numeric-string' \
    --volume /srv/docker/gitlab/gitlab:/home/git/data \
    sameersbn/gitlab:8.8.4
```

## 日志路径

```sh
docker exec -it gitlab ls /var/log/gitlab
```

## 配置

```
docker exec -it gitlab cat config/gitlab.yml
```

## 查看服务

```
docker exec -it gitlab service gitlab status
```
