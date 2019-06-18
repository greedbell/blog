# Universal Links

## 禁用 Universal Links

参考 <https://stackoverflow.com/questions/38450586/prevent-universal-links-from-opening-in-wkwebview-uiwebview>
```
//就是这么的简单粗暴
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    //返回+2的枚举值
    decisionHandler(WKNavigationActionPolicyAllow + 2);
}
```

## References

* [Support Universal Links](https://developer.apple.com/library/content/documentation/General/Conceptual/AppSearch/UniversalLinks.html)
* [Universal Link 前端部署采坑记](http://awhisper.github.io/2017/09/02/universallink/)
