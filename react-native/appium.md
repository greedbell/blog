# react native 使用 appium

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

* [react native 使用 appium](#react-native-使用-appium)
	* [Appium](#appium)
	* [React Native](#react-native)
		* [iOS](#ios)
		* [Android](#android)
	* [神策：](#神策)
		* [iOS](#ios-1)
		* [Android](#android-1)
	* [结论](#结论)
	* [References](#references)

<!-- /code_chunk_output -->

## Appium

参考 [Find Elements](https://appium.io/docs/en/commands/element/find-elements/) Appium 通过 AccessibilityId 找到元素

```java
List<MobileElement> elementsOne = (MobileElement) driver.findElementsByAccessibilityId("SomeAccessibilityID");
```

`Accessibility ID`:

* iOS 对应 `accessibilityIdentifier`
* Android 对应 `ContentDescription`

## React Native

使用 RN [View](https://facebook.github.io/react-native/docs/view.html) 的 `testID` 或者 `accessibilityLabel`

### iOS

* `accessibilityLabel` 对应 `accessibilityLabel`
* `testID` 对应 `accessibilityIdentifier`

`RCTViewManager.m`:

```objc
RCT_REMAP_VIEW_PROPERTY(accessibilityLabel, reactAccessibilityElement.accessibilityLabel, NSString)
RCT_REMAP_VIEW_PROPERTY(testID, reactAccessibilityElement.accessibilityIdentifier, NSString)
```

### Android

* `accessibilityLabel` 对应 `ContentDescription`
* `testID` 对应 `Tag`

`BaseViewManager.java`:

```java
 private static final String PROP_ACCESSIBILITY_LABEL = "accessibilityLabel";
 public static final String PROP_TEST_ID = "testID";

@ReactProp(name = PROP_ACCESSIBILITY_LABEL)
public void setAccessibilityLabel(T view, String accessibilityLabel) {
  view.setContentDescription(accessibilityLabel);
}

@ReactProp(name = PROP_TEST_ID)
public void setTestId(T view, String testId) {
  view.setTag(R.id.react_test_id, testId);

  // temporarily set the tag and keyed tags to avoid end to end test regressions
  view.setTag(testId);
}
```

## 神策：

### iOS

* `$element_content` 对应  `accessibilityLabel`

```objc
[properties setValue:[uiView.accessibilityLabel stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] forKey:@"$element_content"];
```

### Android

* `$element_content` 对应 `getText`

## 结论

| Platform | System |  |  |
| :------------- | :------------- | :------------- | :------------- |
| React Native  | JS | testID | accessibilityLabel |
| React Native  | iOS | accessibilityIdentifier | accessibilityLabel |
| React Native  | Android | Tag | ContentDescription |
| Appium | iOS | AccessibilityId  | - |
| Appium | Android | - | AccessibilityId |

所以 Appium 在 React Native 中使用 AccessibilityId，必须同时设置 React Native 的 testID 和 accessibilityLabel 为同一值

## References

* [Is there any UI testing framework for React Native apps?](https://chase-seibert.github.io/blog/2017/01/06/appium-react-native-quickstart.html#accessibility-labels)
* [Finding elements by Accessibility ID](https://github.com/appium/python-client#finding-elements-by-accessibility-id)
* [appium](http://appium.io/) App 测试
* [Selenium](http://www.seleniumhq.org/) Web 测试
* [Cavy](https://github.com/pixielabs/cavy) react native 测试，react 方式获取 ref
* <https://github.com/facebook/react-native/pull/9942> appium 支持 react native 的讨论
* [Appium + React Native Quickstart](http://chase-seibert.github.io/blog/2017/01/06/appium-react-native-quickstart.html)
