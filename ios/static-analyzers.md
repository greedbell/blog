# Swift Objective-C 静态代码分析工具

## Clang Static Analyzer

* <http://clang-analyzer.llvm.org/>

Xcode 内置的 Analyze 工具

## Faux Pas

* <http://fauxpasapp.com/>

第三方收费静态代码分析工具，已经很久没更新

## OCLint

* <http://oclint.org/>

开源老牌 OC 静态代码分析工具

支持输出 [PMD](https://pmd.github.io/) 格式报告，容易集成到 CI

## Infer

* <https://fbinfer.com/>

FaceBook 出的开源静态代码分析工具，支持 Java, C, C++, and Objective-C

## 总结

* Clang Static Analyzer和xcode集成度更高、更好用，支持命令行形式，并且能够用于持续集成。oc 可用的检查器简直是少之又少，只有16条
* OCLint有更多的检查规则和定制，和很多工具集成，也同样可用于持续集成。
* Infer效率高，规模大，几分钟能扫描数千行代码；支持增量及非增量分析；分解分析，整合输出结果。infer能将代码分解，小范围分析后再将结果整合在一起，兼顾分析的深度和速度。


## References

* [Static analyzers for Swift and Objective-C](https://blog.hackerbay.io/static-analyzers-for-swift-and-objective-c-5adb53c848e8)
* [List of tools for static code analysis](https://en.wikipedia.org/wiki/List_of_tools_for_static_code_analysis#Objective-C.2C_Objective-C.2B.2B)
* [iOS开发：几种静态扫描工具的使用与对比](https://www.jianshu.com/p/b81a9f5bcf34)
