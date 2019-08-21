# Dockerfile 使用

## 编译镜像

```shell
docker build -t <REPOSITORY:TAG> <Dockerfile Directory>
```

## 查看镜像

```shell
docker images
```

## 修改 tag

```shell
docker tag <IMAGE ID> <REPOSITORY:TAG>
```

Example: `docker tag ca1b6b825289 registry.cn-test.aliyuncs.com/xxxxxxx:v1.0`

## 创建容器

```shell
docker run -d -p <LOCAL PORT>:<CONTAINEr PORT> <REPOSITORY:TAG>
```

## 查看容器

```sh
docker ps -a
```
