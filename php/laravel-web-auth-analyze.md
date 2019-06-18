# laravel web 认证过程分析

参考 [用户认证](https://laravel-china.org/docs/5.3/authentication)

```PHP
Illuminate\Foundation\Auth\AuthenticatesUsers
```

* `\Illuminate\Contracts\Auth\StatefulGuard > \Illuminate\Auth\TokenGuard | Illuminate\Auth\SessionGuard`

* `Illuminate\Support\Facades\Password > \Illuminate\Contracts\Auth\PasswordBroker > \Illuminate\Auth\Passwords\PasswordBroker`

## login

登录

@import "resources/laravel-auth-analyze-login.dot"

代码流程

1. `\Illuminate\Foundation\Auth\AuthenticatesUsers.login`


## register

注册

@import "resources/laravel-auth-analyze-register.dot"

## logout

注销

代码流程

1. `\Illuminate\Foundation\Auth\AuthenticatesUsers.logout`
2. `Illuminate\Auth\SessionGuard.logout`

## sendResetLinkEmail

发送重置密码邮件

代码流程

1. `Illuminate\Foundation\Auth\SendsPasswordResetEmails.sendResetLinkEmail`
2. `\Illuminate\Auth\Passwords\PasswordBroker.sendResetLink`

## ResetsPasswords

重置密码

代码流程

1. `Illuminate\Foundation\Auth\ResetsPasswords.login`
