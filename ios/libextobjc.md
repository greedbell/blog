# libextobjc

A Cocoa library to extend the Objective-C programming language.

* [Github地址](https://github.com/jspahrsummers/libextobjc)

## CocoaPods方式安装

```ruby
$ pod search libextobjc

-> libextobjc (0.4.1)
   A Cocoa library to extend the Objective-C programming language.
   pod 'libextobjc', '~> 0.4.1'
   - Homepage: https://github.com/jspahrsummers/libextobjc
   - Source:   https://github.com/jspahrsummers/libextobjc.git
   - Versions: 0.4.1, 0.4, 0.3, 0.2.5, 0.2.4, 0.2.3, 0.2.0, 0.1.0 [master repo]
   - Subspecs:
     - libextobjc/UmbrellaHeader (0.4.1)
     - libextobjc/RuntimeExtensions (0.4.1)
     - libextobjc/EXTADT (0.4.1)
     - libextobjc/EXTConcreteProtocol (0.4.1)
     - libextobjc/EXTKeyPathCoding (0.4.1)
     - libextobjc/EXTNil (0.4.1)
     - libextobjc/EXTSafeCategory (0.4.1)
     - libextobjc/EXTScope (0.4.1)
     - libextobjc/EXTSelectorChecking (0.4.1)
     - libextobjc/EXTSynthesize (0.4.1)
     - libextobjc/NSInvocation+EXT (0.4.1)
     - libextobjc/NSMethodSignature+EXT (0.4.1)
```

## 添加 Code Snippets Library

拷贝 [Resource](../Xcode/Resource)下的`@keypath.codesnippet`、`@weakify.codesnippet`、`@strongify.codesnippet`到`~/Library/Developer/Xcode/UserData/CodeSnippets/`.现在输入@就会自动提示了

## Reference

* [Reactive Cocoa Tutorial [1] = 神奇的Macros](http://blog.sunnyxx.com/2014/03/06/rac_1_macros/)
* [@weakify, @strongify](http://www.jianshu.com/p/3d6c4416db5e)
