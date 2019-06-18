# 基于 node.js 的 github 前端

* [Github RESET Api](https://developer.github.com)

## 注册应用使用 OAuth tokens

> Register an application to generate OAuth tokens

`Github > settings > OAuth applications > Developer applications > Register a new application`

## 认证

* <https://developer.github.com/v3/oauth/>

### Web 认证

https://github.com/login/oauth/authorize?client_id=8100247edc7338dbaf32&client_secret=61a228029766325f1649a019bb0c88b84838282a&redirect_uri=https://github.com/greedlab/greedhub-front-end&scope=user,repo&state=random_string

### 认证回调：

```
access_token=e72e16c7e42f292c6912e7710c838347ae178b4a&scope=user%2Cgist&token_type=random_string
```

### 使用 access_token

```
GET https://api.github.com/user?access_token=...
```

或

```
curl -H "Authorization token:9446e3ecc32695747458" https://api.github.com/user/user/starred
```

## 注意

文档中的 `:username` 全部用对应的用户名替换。 `:org` 全部用对应的组织名替换。大小写不敏感。
