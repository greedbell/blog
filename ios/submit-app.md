# 提交 App

参考 [How to upload IPA now that Application Loader is no longer included in Xcode 11](https://stackoverflow.com/questions/57976017/how-to-upload-ipa-now-that-application-loader-is-no-longer-included-in-xcode-11) Xcode11 之后 Application Loader 已经弃用，可以使用

```sh
xcrun altool --upload-app --type ios --file $APPFILE --apiKey $KEY --apiIssuer $ISSUER
```

上传 TestFlight 包
