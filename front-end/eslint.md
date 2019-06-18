# ESLint

* [官网](http://eslint.org/)
* [命令行使用](http://eslint.org/docs/user-guide/command-line-interface)
* [eslint-config-airbnb](https://github.com/airbnb/javascript/tree/master/packages)

## 安装

```shell
$ npm i -g eslint
```

## .eslintrc.*

* [01-Eslint静态代码检查](http://www.jianshu.com/p/1682b91756b1)
* [configuring](http://eslint.org/docs/user-guide/configuring)

```shell
$ eslint --init
```

### rules

```
"off" or 0 - turn the rule off
"warn" or 1 - turn the rule on as a warning (doesn’t affect exit code)
"error" or 2 - turn the rule on as an error (exit code is 1 when triggered)
```

#### [object-curly-spacing](http://eslint.org/docs/rules/object-curly-spacing)

强制在花括号中使用一致的空格, WebStorm： `Preferences > Editor > Code Style > Javascript > Spaces > Within > 勾选 ES6 import/export braces`

## .eslintignore

* [ignoring-files-from-linting](http://eslint.org/docs/user-guide/command-line-interface#ignoring-files-from-linting)
