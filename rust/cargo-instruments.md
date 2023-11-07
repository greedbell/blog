# cargo-instruments

- [cargo-instruments](https://github.com/cmyr/cargo-instruments) 内存分析工具

安装 `cargo-instruments` 命令

```shell
brew install cargo-instruments
```

查看支持的分析

```shell
% cargo instruments --list-templates
Xcode Instruments templates:

built-in            abbrev
--------------------------
Activity Monitor
Allocations         (alloc)
Animation Hitches
App Launch
CPU Counters
CPU Profiler
Core Data
Core ML
File Activity       (io)
Game Memory
Game Performance
Leaks
Logging
Metal System Trace
Network
SceneKit
Swift Concurrency
SwiftUI
System Trace        (sys)
Tailspin
Time Profiler       (time)
Zombies

custom
--------------------------
```

分析内存

```shell
cd <rust project>
cargo instruments -t alloc --release
```

分析内存

```shell
cd <rust project>
cargo instruments -t alloc
```

方法执行时长分析

```shell
cd <rust project>
cargo instruments -t time --release
```

## Issures

### Failed instruments errored: Run issues were detected (trace is still ready to be viewed):

原因：

以 Rosetta 兼容模式安装的 rustup 打的包不能用于 instruments

解决该法：

在非 Rosetta 兼容模式环境重新安装 rustup，再重新运行 `cargo instruments -t Allocations`
