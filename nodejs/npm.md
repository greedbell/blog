# npm

NodeJS包管理和分发工具,CommonJS 规范，require加载依赖

* [官网](https://www.npmjs.com/)
* [文档](https://docs.npmjs.com/)

## 安装

<https://www.npmjs.com/package/npm>

```shell
$ curl -L https://npmjs.org/install.sh | sh
```

## 更新

```shell
$ npm update npm -g
```

## 子命令

### install

安装包

<https://docs.npmjs.com/cli/install>

```
$ npm help install
```

#### -g

存储到全局

#### --save

自动把模块和版本号添加到 package.json 的 dependencies 部分。开发环境和生产环境都可以用。eg：koa

### --save-dev

自动把模块和版本号添加到 package.json 的 devdependencies 部分。只能在调试模式下运行。eg：eslint

### view

查看node模块的 package.json 文件夹

<https://docs.npmjs.com/cli/view>

```
$ npm help view
```

### init

创建`package.json`

<https://docs.npmjs.com/cli/init>

```
$ npm help init
```

### npm install

安装 package.json 中 dependencies 和 devDependencies 部分

### npm install --production

只安装 package.json 中 dependencies 部分， 如果是 npm5 ，要先删 package-lock.json，否则还是按 package-lock.json 安装。

## package.json

[各参数说明](https://docs.npmjs.com/getting-started/using-a-package.json)

```shell
$ npm help 5 package.json
```

### npm ci

### npm shrinkwrap

* [使用 npm shrinkwrap 来管理项目依赖](https://tech.meituan.com/2015/10/23/npm-shrinkwrap.html)

生成 `npm-shrinkwrap.json` 文件，固定包版本


## 换源

默认源是 `https://registry.npmjs.org/`。换成[淘宝](http://npm.taobao.org/)的 `https://registry.npm.taobao.org`
```
npm config set registry https://registry.npm.taobao.org
// 配置后可通过下面方式来验证是否成功
npm config get registry
```

### nrm 方式换源

* [GitHub](https://github.com/Pana/nrm)

```
// 全局安装
$ npm install -g nrm
// 查看有哪些镜像
$ nrm ls
// 对比各个镜像的访问速度
$ nrm test
// 使用淘宝的镜像
$ nrm use taobao
```

## 发布 npm 包

### 注册账号

#### 网站注册

* [sign up](https://www.npmjs.com/signup)

#### 命令行注册和登录

* [npm-adduser](https://docs.npmjs.com/cli/adduser)

```
$ npm adduser --registry=https://registry.npmjs.org/ --always-auth
```

然后输入用户名、密码、邮箱

### 查看登录状态

```
$ npm whoami
```

### 发布

* [publishing-npm-packages](https://docs.npmjs.com/getting-started/publishing-npm-packages)

`npm publish` 会取 `package.json` `version` 的 `tag` 发布
