# react-native-screens

* [GitHub](https://github.com/kmagiera/react-native-screens)

## 基础组件

### Screen

### ScreenContainer

实现导航功能，导航条及导航动画是由 react-navigation 实现。

可以包含一个或多个 Screen

iOS 是利用 `- (void)addChildViewController:(UIViewController *)childController` 实现 screen 切换。
Android 利用 `Fragment`

### ScreenStack

实现导航功能，导航条及导航动画是原生实现。

可以包含一个或多个 Screen

### ScreenStackHeaderConfig

ScreenStack 导航条的配置

```XML
<Screen>
  <ScreenStackHeaderConfig>
    <ScreenStackHeaderTitleView/>
    <ScreenStackHeaderCenterView/>
    <ScreenStackHeaderRightView/>
    <ScreenStackHeaderLeftView/>
  </ScreenStackHeaderConfig>
</Screen>
```

## createNativeStackNavigator

```JS
import createNativeStackNavigator from 'react-native-screens/createNativeStackNavigator';
// 替代 createStackNavigator()
createNativeStackNavigator();
```

## 使用

```js
import { useScreens } from 'react-native-screens';
useScreens();
```

`useScreens()` 作用： `Screen` 和 `ScreenContainer` 使用原生方式实现

## Example

* <https://github.com/kmagiera/react-native-screens/blob/master/Example/App.js>

```JS
const SCREENS = {
  Stack: { screen: Stack, title: 'Screen container based stack' },
  NativeStack: { screen: NativeStack, title: 'Native stack example' },
  Tabs: { screen: Tabs, title: 'Tabs example' },
  NativeNavigation: {
    screen: NativeNavigation,
    title: 'Native stack bindings for RNN',
  },
  Navigation: {
    screen: Navigation,
    title: 'React Navigation with screen enabled',
  },
  NavigationTabsAndStack: {
    screen: NavigationTabsAndStack,
    title: 'React Navigation Tabs + Stack',
  },
};
```

### Stack

Stack 的导航由 ScreenContainer 实现

### NativeStack

NativeStack 的导航由 ScreenStack 实现

### Tab

RN + ScreenContainer 实现的 Tab

### Navigation

react-navigation 实现的导航

### NativeNavigation

原生导航

### NavigationTabsAndStack
