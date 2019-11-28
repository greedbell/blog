# 升级 react native 到 0.60

更新 `react-native-cli` 到 2.0 以上版本

```
npm install -g react-native-cli
```

自动更新

```sh
react-native upgrade 0.60.5
```

可能会出错，如果出错请参考 [React Native upgrade guide](https://react-native-community.github.io/upgrade-helper/?from=0.59.10&to=0.60.5) 手动更新

## React Native

* 去掉 NetInfo，改用 [react-native-netinfo](https://github.com/react-native-community/react-native-netinfo)
* 去掉 Webview，改用 [react-native-webview](https://github.com/react-native-community/react-native-webview)
* 去掉 ListView，可以用 [deprecated-react-native-listview](https://github.com/facebookarchive/react-native-deprecated-modules/tree/master/deprecated-react-native-listview)
* 去掉 SwipeableListView，可以用 [deprecated-react-native-swipeablelistview](https://github.com/facebookarchive/react-native-deprecated-modules/tree/master/deprecated-react-native-swipeablelistview)

## iOS

依赖换成用 CocoaPods 管理

### Build input file double-conversion cannot be found

参考 <https://github.com/facebook/react-native/issues/21168#issuecomment-422431294>

```sh
$ cd node_modules/react-native/scripts && ./ios-install-third-party.sh && cd ../../../
$ cd node_modules/react-native/third-party/glog-0.3.5/ && ../../scripts/ios-configure-glog.sh && cd ../../../../
```

## Android

AndroidX

## References

* [Upgrading to new React Native versions](https://facebook.github.io/react-native/docs/upgrading)
* [Announcing React Native 0.60](https://facebook.github.io/react-native/blog/2019/07/03/version-60)
* [React Native upgrade guide](https://react-native-community.github.io/upgrade-helper/?from=0.59.10&to=0.60.5)
