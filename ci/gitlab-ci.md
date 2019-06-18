# centos 安装 gitlab ci

用 git 用户安装

* <https://gitlab.com/gitlab-org/gitlab-ci-multi-runner>

## 安装 gitlab-ci-runner

* <https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/blob/master/docs/install/linux-repository.md>

```shell
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.rpm.sh | sudo bash
yum install -y gitlab-ci-multi-runner
```

## docker 方式安装 gitlab-ci-runner

* <https://github.com/outcoldman/docker-gitlab-ci-multi-runner-ruby>

## .gitlab-ci.yml

* <http://192.168.1.11/help/ci/yaml/README.md>
