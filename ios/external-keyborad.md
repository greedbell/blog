# 外接键盘

iOS9 及以上 `UIKeyboard[Will|Did][Show|Hide]Notification` 这些通知照样有用，键盘 frame 改变时，如果计算键盘的位置超出 keyboardWindow 就是用了外接键盘。

## 通过键盘高度位置判断

参考 <https://github.com/shimohq/react-native-keyboard-view/blob/master/ios/YYKeyboardManager.m#L521-L533>

在 `UIKeyboardDidChangeFrameNotification` 的时候通过下面逻辑判断

```
- (void)updateInHardwareKeyboardMode:(CGRect)keyboardFrame {
    CGRect keyboardWindowFrame = [self keyboardWindow].frame;
    if (CGRectGetMaxY(keyboardFrame) == CGRectGetMaxY(keyboardWindowFrame)) {
        // >= iOS11, CGRectGetHeight(after) < 200 when in hardware keyboard mode
        [self setInHardwareKeyboardMode:CGRectGetHeight(keyboardFrame) < 200];
    } else if (CGRectGetMinY(keyboardFrame) == CGRectGetMaxY(keyboardWindowFrame) && CGRectGetHeight(keyboardFrame) < 200) {
        // iPhone in hardware keyboard mode
        [self setInHardwareKeyboardMode:YES];
    } else if (CGRectGetMinY(keyboardFrame) < CGRectGetMaxY(keyboardWindowFrame) && CGRectGetMaxY(keyboardFrame) > CGRectGetMaxY(keyboardWindowFrame)) {
        // iPad in hardware keyboard mode
        [self setInHardwareKeyboardMode:YES];
    }
}
```

## UIKeyboardImpl

<https://gist.github.com/myell0w/d8dfabde43f8da543f9c>

使用私有 API，可能被苹果封

## References

* [How can I detect if an external keyboard is present on an iPad?](https://stackoverflow.com/questions/2893267/how-can-i-detect-if-an-external-keyboard-is-present-on-an-ipad)
