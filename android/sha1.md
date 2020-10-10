# Android 获取 md5 sha1

## keytool

```
keytool  -list -v -keystore <you-keystore-file>.keystore
```

## signingReport

```
./gradlew signingReport
```

这个命令会列出所有环境包的 md5 sha1
