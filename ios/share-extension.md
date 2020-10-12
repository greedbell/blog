# Share Extension

## Info.plist

### NSExtensionActivationRule

分享支持的格式，有对应的 key 表示支持，没有或者值为 false 表示不支持

* NSExtensionActivationSupportsAttachmentsWithMaxCount
* NSExtensionActivationSupportsAttachmentsWithMinCount
* NSExtensionActivationSupportsFileWithMaxCount
* NSExtensionActivationSupportsImageWithMaxCount
* NSExtensionActivationSupportsMovieWithMaxCount
* NSExtensionActivationSupportsText
* NSExtensionActivationSupportsWebURLWithMaxCount
* NSExtensionActivationSupportsWebPageWithMaxCount

## SLComposeServiceViewController

分享界面，如果要完全自定义界面，可以换成 UIViewController

## 打开 Host App

参考 [openURL:completionHandler:](https://developer.apple.com/documentation/foundation/nsextensioncontext/1416791-openurl?language=objc) `NSExtensionContext` 的 `openURL:completionHandler:` 只支持 `Today widget`。

所以采用下面的方式：

```OC
- (void)openHostApp {
    UIResponder *responder = self;
    SEL selector = NSSelectorFromString(@"openURL:");
    while (responder) {
        if ([responder respondsToSelector:selector]) {
            [responder performSelector:selector withObject:[NSURL URLWithString:@"example://"]];
            break;
        } else {
            responder = responder.nextResponder;
        }
    }
    [self.extensionContext completeRequestReturningItems:@[] completionHandler:nil];
}
```

## References

* [App Extension Programming Guide - Share](https://developer.apple.com/library/archive/documentation/General/Conceptual/ExtensibilityPG/Share.html)
