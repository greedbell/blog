# 提交 App

参考 [How to upload IPA now that Application Loader is no longer included in Xcode 11](https://stackoverflow.com/questions/57976017/how-to-upload-ipa-now-that-application-loader-is-no-longer-included-in-xcode-11) Xcode11 之后 Application Loader 已经弃用，可以使用 `xcrun altool`， [Transporter](https://apps.apple.com/cn/app/transporter/id1450874784?mt=12) 或者 `fastlane pilot`

## xcrun altool

[appstoreconnect](https://appstoreconnect.apple.com/access/users) > 用户和访问 > 秘钥 > 生成秘钥：得到 `apiKey` 和 `apiIssuer` > 下载密钥到 `~/.private_keys/` 目录下

```sh
mkdir ~/.private_keys
cp ~/Downloads/AuthKey_GZD44LSXPN.p8 ~/.private_keys/
```

上传 TestFlight 包

```sh
xcrun altool --upload-app --type ios --file $APPFILE --apiKey $KEY --apiIssuer $ISSUER
```
