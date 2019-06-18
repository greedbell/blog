# 面试

* [PHP面试题汇总](https://github.com/ycrao/mynotes/issues/1)


<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [面试](#面试)
  * [PHP 语法](#php-语法)
    * [数字](#数字)
    * [字符串转数字](#字符串转数字)
    * [&& 与 and](#与-and)
  * [安全](#安全)
    * [SQL 注入](#sql-注入)
    * [XSS(Cross-site scripting) 跨站脚本攻击](#xsscross-site-scripting-跨站脚本攻击)
    * [CSRF(Cross-site request forgery) 跨站伪造请求攻击](#csrfcross-site-request-forgery-跨站伪造请求攻击)
    * [文件上传漏洞攻击](#文件上传漏洞攻击)
    * [DDOS 分布式拒绝服务攻击](#ddos-分布式拒绝服务攻击)
    * [加密](#加密)

<!-- tocstop -->

## PHP 语法

### 数字

0开头是八进制，0x开头是16进制

### 字符串转数字

如果是数字开头的话则转换成改数字比如"15%"会变成15,如果不是数字开头则会变成0

### && 与 and

参考 [运算符优先级](http://php.net/manual/zh/language.operators.precedence.php) 优先级不一样

## 安全

安全域

### SQL 注入

参考 [SQL 注入](http://php.net/manual/zh/security.database.sql-injection.php)

* 永远不要使用超级用户或所有者帐号去连接数据库。
* 检查输入的数据是否具有所期望的数据格式。
* 要不择手段避免显示出任何有关数据库的信心，尤其是数据库结构
* 对于无法确定固定格式的变量，一定要进行特殊符号过滤或转义处理。
* 绑定变量使用预编译语句是预防SQL注入的最佳方式，使用 ？或者：代替参数。

### XSS(Cross-site scripting) 跨站脚本攻击

XSS的攻击目标:
为了盗取存储在客户端的cookie或者其他网站用于识别客户端身份的敏感信息。

XSS通常可以分为两大类：
* 一类是存储型XSS，恶意用户的Html输入Web程序->进入数据库->Web程序->用户浏览器
* 另一类是反射型XSS，主要做法是将脚本代码加入URL地址的请求参数里，请求参数进入程序后在页面直接输出，用户点击类似的恶意链接就可能受到攻击。

如何预防XSS：
* 坚决不要相信用户的任何输入，并过滤掉输入中的所有特殊字符
* 使用HTTP头指定类型

### CSRF(Cross-site request forgery) 跨站伪造请求攻击

参考 [9.1 预防CSRF攻击](https://github.com/astaxie/build-web-application-with-golang/blob/master/zh/09.1.md)

攻击者可以盗用你的登陆信息，以你的身份模拟发送各种请求

要完成一次CSRF攻击，受害者必须依次完成两个步骤 ：
1.登录受信任网站A，并在本地生成Cookie 。
2.在不退出A的情况下，访问危险网站B。

如何预防CSRF：
1、正确使用GET,POST和Cookie；
2、在非GET请求中增加伪随机数；

在非GET方式的请求中增加随机数，这个大概有三种方式来进行：

* 为每个用户生成一个唯一的cookie token，所有表单都包含同一个伪随机值，这种方案最简单，因为攻击者不能获得第三方的Cookie(理论上)，所以表单中的数据也就构造失败，但是由于用户的Cookie很容易由于网站的XSS漏洞而被盗取，所以这个方案必须要在没有XSS的情况下才安全。
* 每个请求使用验证码，这个方案是完美的，因为要多次输入验证码，所以用户友好性很差，所以不适合实际运用。
* 不同的表单包含一个不同的伪随机值


### 文件上传漏洞攻击

参考 [06.文件上传漏洞](https://github.com/cokepluscarbon/Security/blob/master/06.%E6%96%87%E4%BB%B6%E4%B8%8A%E4%BC%A0%E6%BC%8F%E6%B4%9E.md)

* 上传的文件可能是 PHP 等可执行文件
* filepath 加 `\0` 会阶段 URL，

预防措施：
* 建议使用算法来重命名文件名
* 单独设置文件服务器的域名，以防止XSS等利用同源策略发起的攻击。
* 文件上传的目录设置为不可执行。
* 禁止Web容器对上传文件目录下的文件执行脚本的能力。


### DDOS 分布式拒绝服务攻击

DdoS攻击是利用一批受控制的机器向一台机器发起攻击，这样来势迅猛的攻击令人难以防备，因此具有较大的破坏性。

如果预防：
* 过滤不必要的服务和端口
* 检查访问者的来源
* 过滤所有RFC1918 IP地址

### 加密

* 可逆加密
  * 对称加密：AES、DES
  * 非对称加密：RSA
* 不可逆加密：md5、SHA-1
