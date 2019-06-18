# npm5

添加了 `package-lock.json` 来锁定版本，

## 注意事项

* `npm i` 只会安装 `package-lock.json` 中对应版本的包，如果要升级包需要使用 `npm update` 或者 `npm i <package name>@<package version>`

* `npm i` 会从 node_modules 取对应的源地址保存到 `package-lock.json`，所以如果是多人协作，必须要统一使用同样的源，否则不同的人 `npm i` 之后都会修改 `package-lock.json`

## Questions

1. npm WARN invalid config loglevel="notice"

参考 <https://github.com/npm/npm/issues/16862#issuecomment-306389816>

```sh
npm config set loglevel warn
```
