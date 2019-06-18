# 给apk签名

## 证书

生成证书

```sh
keytool -genkey -alias android -keypass 123456 -keyalg RSA -keysize 1024 -validity 3650 -keystore test.keystore -storepass 123456 -dname "CN=Debugger, OU=X5, O=X5, L=BJ, ST=BJ, C=CN"
```

参数解释:

* -genkey 产生证书文件
* -keyalg 指定密钥的算法,这里指定为RSA(非对称密钥算法)
* -alias 产生别名
* -keypass 123456    证书密钥，这里用123445，此处指定的值需要和 build.properties 文件中的 androidKeyAliasPassword 对应
* -storepass 123456  证书存储密钥，这里用123445，此处指定的值需要和 build.properties 文件中的 androidKeyStorePassword 对应
* -validity 3650     证书有效期，单位是天
* CN=Debugger        名字与姓氏
* OU=X5              组织单位名称
* O=X5               组织名称
* L=BJ               城市或区域名称
* ST=BJ              省/市/自治区名称
* C=CN               双字母国家/地区代码

查看信息

```sh
keytool -list -keystore test.keystore
```

签名

```sh
jarsigner -verbose -keystore test.keystore -signedjar -signed.apk unsigned.apk 'test.keystore'
```

参数说明:

* -verbose：指定生成详细输出
* -keystore：指定数字证书存储路径
* -signedjar：该选项的三个参数为 签名后的apk包 未签名的apk包 数字证书别名(注意顺序)

## build.gradle

* `storePassword` 证书存储密钥
* `keyPassword` 证书密钥
* `keyAlias` 证书别名
* `storeFile` 证书文件名

## References

* [Android给apk签名那点事](http://www.jianshu.com/p/e9a685c88258)
