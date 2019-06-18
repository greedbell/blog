# nvm

node 版本管理

* [GitHub](https://github.com/creationix/nvm)

## 安装 nvm

```shell
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
source ~/.bashrc
```

## 更新 nvm

```shell
(
  cd "$NVM_DIR"
  git fetch origin
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
) && . "$NVM_DIR/nvm.sh"
```

## 安装 node

```
nvm install --lts node
```

## 临时切换 node

```
nvm use node
```

## 永久切换 node

```
nvm alias default node
```
