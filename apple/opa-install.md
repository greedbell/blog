# OTA 方式安装 APP



## plist 文件

Example：

```JSON
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>items</key>
    <array>
        <dict>
            <key>assets</key>
            <array>
                <dict>
                    <key>kind</key>
                    <string>software-package</string>
                    <key>url</key>
                    <string>【xxxxx】</string>
                </dict>
                <dict>
                    <key>kind</key>
                    <string>display-image</string>
                    <key>url</key>
                    <string>【xxxxx】</string>
                </dict>
                <dict>
                    <key>kind</key>
                    <string>full-size-image</string>
                    <key>url</key>
                    <string>【xxxxx】</string>
                </dict>
            </array>
            <key>metadata</key>
            <dict>
                <key>bundle-identifier</key>
                <string>【xxxxx】</string>
                <key>bundle-version</key>
                <string>【xxxxx】</string>
                <key>kind</key>
                <string>software</string>
                <key>title</key>
                <string>【xxxxx】</string>
            </dict>
        </dict>
    </array>
</dict>
</plist>
```

* `software-package` ipa 安装包地址
* `display-image` 57x57 图片地址
* `full-size-image` 512x512 图片地址
* `bundle-identifier` 包标识
* `bundle-version` 版本号
* `title` 应用名

## 安装

plist 链接必须以 https 开关
`itms-services://?action=download-manifest&url=https://mydomain.com/apps/MyInHouseApp.plist`
