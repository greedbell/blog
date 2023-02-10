# React Native 支持 Monorepo

## Base

`metro.config.js` 添加如下配置

```diff
+ const path = require('path');

module.exports = {
  transformer: {
    getTransformOptions: async () => ({
      transform: {
        experimentalImportSupport: false,
        inlineRequires: true,
      },
    }),
  },
+  watchFolders: [
+    path.resolve(__dirname, '../../../node_modules'),
+    path.resolve(__dirname, '../../../node_modules/@shimo/cougar-apis'),
+  ],
};
```

## iOS

### Podfile

```diff
- require_relative '../node_modules/react-native/scripts/react_native_pods'
- require_relative '../node_modules/@react-native-community/cli-platform-ios/native_modules'
+ require_relative '../../../node_modules/react-native/scripts/react_native_pods'
+ require_relative '../../../node_modules/@react-native-community/cli-platform-ios/native_modules'
```

#### React Native ≥ 0.71

`Podfile` 做如下修改

```diff
react_native_post_install(
  installer,
+  config[:reactNativePath],
  # Set `mac_catalyst_enabled` to `true` in order to apply patches
  # necessary for Mac Catalyst builds
  :mac_catalyst_enabled => false
)
```

### `Xcode > Build Phases > Bundle React Native code and images`

```diff
- WITH_ENVIRONMENT="../../node_modules/react-native/scripts/xcode/with-environment.sh"
- REACT_NATIVE_XCODE="../../node_modules/react-native/scripts/react-native-xcode.sh"
+ WITH_ENVIRONMENT="../../../node_modules/react-native/scripts/xcode/with-environment.sh"
+ REACT_NATIVE_XCODE="../../../node_modules/react-native/scripts/react-native-xcode.sh"
```

## Android

### React Native ≥ 0.71

#### android/app/build.gradle

```diff
react {
+  hermesCommand = "../../node_modules/react-native/sdks/hermesc/%OS-BIN%/hermesc"
}

- apply from: file("../../node_modules/@react-native-community/cli-platform-android/native_modules.gradle"); applyNativeModulesAppBuildGradle(project)
+ apply from: file("../../../../../node_modules/@react-native-community/cli-platform-android/native_modules.gradle"); applyNativeModulesAppBuildGradle(project)
```

#### android/build.gradle

```diff
+ allprojects {
+     project.pluginManager.withPlugin("com.facebook.react") {
+         react {
+             reactNativeDir = rootProject.file("../../../node_modules/react-native/")
+             codegenDir = rootProject.file("../../../node_modules/react-native-codegen/")
+         }
+     }
+ }
```

#### android/settings.gradle

```diff
+ apply from: file("../../../node_modules/@react-native-community/cli-platform-android/native_modules.gradle"); applyNativeModulesSettingsGradle(settings)
+ includeBuild('../../../node_modules/react-native-gradle-plugin')
```

### React Native ≤ 0.71

TODO

## References

- [Setting up React Native Monorepo with Yarn Workspaces](https://www.callstack.com/blog/setting-up-react-native-monorepo-with-yarn-workspaces)
