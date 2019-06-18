# Emulator

## 安装 HAXM

* [在MAC OS X上使用HAXM加速ANDROID EMULATOR](http://smilejay.com/2013/10/mac-hax-android-emulator/)
* [Intel® Hardware Accelerated Execution Manager](https://software.intel.com/en-us/android/articles/intel-hardware-accelerated-execution-manager)
* [Installation Instructions for Intel® Hardware Accelerated Execution Manager - Mac OS X*](https://software.intel.com/en-us/android/articles/installation-instructions-for-intel-hardware-accelerated-execution-manager-mac-os-x)

1. `Android Studio > Android SDK Manager > Extras > HAXM installer`  install
2. 在 `<sdk install location>/extras/intel/Hardware_Accelerated_Execution_Manager/` 目录下运行 `sudo ./silent_install.sh ` 安装
3. `kextstat | grep intel` 检查是否安装好

Stop:

sudo kextunload -bundle-id com.intel.kext.intelhaxm

Start:

- for Mac OS X 10.9, 10.10, 10.11, and 10.12:

sudo kextload -bundle-id com.intel.kext.intelhaxm

- for Mac OS X 10.8:

sudo kextload /Library/Extensions/intelhaxm.kext/

## 系统崩溃

```text
BSD process name corresponding to current thread: SpringBoard

Mac OS version:
16C67

Kernel version:
Darwin Kernel Version 16.3.0: Thu Nov 17 20:23:58 PST 2016; root:xnu-3789.31.2~1/RELEASE_X86_64
Kernel UUID: 8DF81F81-019F-348E-B47E-40A4484B9E21
Kernel slide:     0x0000000014e00000
Kernel text base: 0xffffff8015000000
__HIB  text base: 0xffffff8014f00000
System model name: MacBookPro11,4 (Mac-06F11FD93F0323C5)

System uptime in nanoseconds: 51166371527
last loaded kext at 4614784064: com.intel.kext.intelhaxm	6.0.1 (addr 0xffffff7f97ffd000, size 126976)
loaded kexts:
com.intel.kext.intelhaxm	6.0.1
com.apple.driver.AudioAUUC	1.70
com.apple.driver.AGPM	110.23.14
com.apple.driver.ApplePlatformEnabler	2.7.0d0
com.apple.driver.X86PlatformShim	1.0.0
com.apple.filesystems.autofs	3.0

```
