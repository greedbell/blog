# laravel api 认证过程分析

参考  

* [API Authentication (Passport)](https://laravel.com/docs/5.4/passport)
* [API 授权 (Passport)](https://laravel-china.org/docs/5.3/passport)
* [Laravel 5.3 中使用 Laravel Passport 构建后端授权认证 API](https://laravel-china.org/topics/3287)

```sh
$ composer require laravel/passport

phpseclib/phpseclib suggests installing ext-libsodium (SSH2/SFTP can make use of some algorithms provided by the libsodium-php extension.)
phpseclib/phpseclib suggests installing ext-mcrypt (Install the Mcrypt extension in order to speed up a few other cryptographic operations.)
phpseclib/phpseclib suggests installing ext-gmp (Install the GMP (GNU Multiple Precision) extension in order to speed up arbitrary precision integer arithmetic operations.)
lcobucci/jwt suggests installing mdanter/ecc (Required to use Elliptic Curves based algorithms.)
league/oauth2-server suggests installing indigophp/hash-compat (Polyfill for hash_equals function for PHP 5.5)
```

```PHP
Illuminate\Foundation\Auth\AuthenticatesUsers
```

* `\Illuminate\Contracts\Auth\StatefulGuard > \Illuminate\Auth\GuardHelpers`
* `\Illuminate\Contracts\Auth\StatefulGuard > Illuminate\Auth\SessionGuard`
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
