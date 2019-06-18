# json web token

* [json-web-token](http://self-issued.info/docs/draft-ietf-oauth-json-web-token.html)
* [node-jsonwebtoken](https://github.com/auth0/node-jsonwebtoken)
* [JSON Web Token - 在Web应用间安全地传递信息 ](http://blog.leapoahead.com/2015/09/06/understanding-jwt/)

## JWT的组成

一个JWT实际上就是一个字符串，它由三部分组成，头部、载荷与签名。

## 载荷（Payload）

* iss: 该JWT的签发者
* sub: 该JWT所面向的用户
* aud: 接收该JWT的一方
* exp(expires): 什么时候过期，这里是一个Unix时间戳
* nbf(Not Before): 开始生效时间，这里是一个Unix时间戳
* iat(issued at): 在什么时候签发的

```JSON
{
    "iss": "John Wu JWT",
    "iat": 1441593502,
    "exp": 1441594722,
    "aud": "www.example.com",
    "sub": "jrocket@example.com",
    "from_user": "B",
    "target_user": "A"
}
```

## 头部（Header）

* alg 签名算法

```JSON
{
  "typ": "JWT",
  "alg": "HS256"
}
```

## 签名（签名）

通过密钥加密载荷和头部生成的字符串

## logout

一般用redis来缓存这些已经登出但没有失效的token
