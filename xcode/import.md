# import

* `#include <something>` 用于 lib 或 framework
* `#include "something"` 用于引入的代码

## Header Search Paths

## 添加 lib 或 framework

依赖的 Lib 和 Framework 需要添加到

`Target > Build Phase > Link Binary With Libraries` = `Target > General > Linked Frameworks and Libraries`

自定义的 Framework 需要添加到

`Target > Build Phase > Embed Framework` = `Target > General > Embedded Binaries`
