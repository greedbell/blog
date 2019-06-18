# 崩溃

* [OS X：如果您的电脑自动重新启动或显示“电脑因出现问题而重新启动”](https://support.apple.com/zh-cn/HT200553)
* [使用 Apple Hardware Test](https://support.apple.com/zh-cn/HT201257)
* [了解内核崩溃并调试](https://developer.apple.com/library/content/technotes/tn2063/_index.html)
* [MemTest for Mac OS X Tests your RAM](http://osxdaily.com/2011/05/03/memtest-mac-ram-test/)

## 目录

* 内核崩溃日志目录: `/Library/Logs/DiagnosticReports`

### .kext 文件目录

* /Library/Extensions
* /System/Library/Extensions

### .plist 文件目录

* /System/Library/LaunchAgents
* /System/Library/LaunchDaemons

### App 文件存储路径

* ~/Library/Preferences/
* ~/Library/Application\ Support/

## 内核崩溃

### com.intel.kext.intelhaxm

查看正在运行的内核任务

```sh
kextstat | grep intelhaxm
```

结束任务

```sh
sudo kextunload -bundle-id com.intel.kext.intelhaxm
```

启动任务

```sh
sudo kextload -bundle-id com.intel.kext.intelhaxm
```

关闭自启动

```sh
sudo launchctl unload -w com.intel.haxm.plist
```

查看是不已经关闭自启动成功

```sh
launchctl list | grep com.intel
```

## other crash

```sh
com.apple.driver.AppleXsanScheme
com.apple.driver.usb.cdc
com.apple.iokit.IOBluetoothUSBDFU
com.apple.filesystems.smbfs
com.apple.driver.AudioAUUC

com.apple.filesystems.smbfs	3.1.1
com.apple.driver.AudioAUUC	1.70

com.apple.iokit.IOBluetoothUSBDFU	5.0.3f1
com.apple.driver.ApplePlatformEnabler	2.7.0d0
com.apple.driver.AGPM	110.23.14
com.apple.driver.X86PlatformShim	1.0.0
com.apple.filesystems.autofs	3.0


System uptime in nanoseconds: 10193133459234
last loaded kext at 4610079125: com.apple.driver.AudioAUUC	1.70 (addr 0xffffff7f8c965000, size 32768)
last unloaded kext at 685885412310: com.apple.driver.AppleFileSystemDriver	3.0.1 (addr 0xffffff7f8d3ff000, size 8192)
loaded kexts:
com.apple.driver.ApplePlatformEnabler	2.7.0d0
com.apple.driver.AGPM	110.23.14
com.apple.driver.X86PlatformShim	1.0.0
com.apple.filesystems.autofs	3.0
com.apple.driver.AppleOSXWatchdog	1

```

### 关闭 Rootless

http://www.jianshu.com/p/22b89f19afd6

关闭 Rootless。重启按住 Command+R，进入恢复模式，打开Terminal。

```sh
csrutil disable
```

### 禁用 AudioAUUC

```sh
kextstat | grep AudioAUUC
sudo kextunload -bundle-id com.apple.driver.AudioAUUC
# Or
sudo kextunload /System/Library/Extensions/AudioAUUC.kext
kextstat | grep AudioAUUC
sudo mv /System/Library/Extensions/AudioAUUC.kext /System/Library/Extensions/AudioAUUC.disabled
```

恢复

```sh
sudo mv /System/Library/Extensions/AudioAUUC.disabled /System/Library/Extensions/AudioAUUC.kext
```

### 禁用 IOBluetoothUSBDFU

```sh
kextstat | grep IOBluetoothUSBDFU
sudo kextunload -bundle-id com.apple.iokit.IOBluetoothUSBDFU
# OR
sudo kextunload /System/Library/Extensions/IOBluetoothFamily.kext/Contents/PlugIns/IOBluetoothUSBDFU.kext
kextstat | grep IOBluetoothUSBDFU
```

恢复

```sh
sudo mv /System/Library/Extensions/IOBluetoothFamily.kext/Contents/PlugIns/IOBluetoothUSBDFU.disabled /System/Library/Extensions/IOBluetoothFamily.kext/Contents/PlugIns/IOBluetoothUSBDFU.kext
```

### 禁用 autofs

```sh
kextstat | grep autofs
sudo kextunload -bundle-id com.apple.filesystems.autofs
# OR
sudo kextunload /System/Library/Extensions/autofs.kext
kextstat | grep autofs
sudo mv /System/Library/Extensions/autofs.kext /System/Library/Extensions/autofs.disabled
```

* 参考 [autofs crash ](https://discussions.apple.com/thread/1961409?tstart=0)

```sh
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.autofsd.plist
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.automountd.plist
sudo mv /System/Library/Extensions/autofs.kext /System/Library/Extensions/autofs.disabled

Reboot the system and autofs is completely disabled and the crashes go away. To turn it back on:

sudo mv /System/Library/Extensions/autofs.disabled /System/Library/Extensions/autofs.kext
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.autofsd.plist
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.automountd.plist
```

恢复

```sh
sudo mv /System/Library/Extensions/autofs.disabled /System/Library/Extensions/autofs.kext
```

### 禁用 com.apple.iokit.IOBluetoothUSBDFU

```sh
kextstat | grep IOBluetoothUSBDFU
sudo kextunload -bundle-id com.apple.iokit.IOBluetoothUSBDFU
sudo mv /System/Library/Extensions/IOBluetoothFamily.kext/Contents/PlugIns/IOBluetoothUSBDFU.kext /System/Library/Extensions/IOBluetoothFamily.kext/Contents/PlugIns/IOBluetoothUSBDFU.disabled
```

恢复

```sh
sudo mv /System/Library/Extensions/IOBluetoothFamily.kext/Contents/PlugIns/IOBluetoothUSBDFU.disabled /System/Library/Extensions/IOBluetoothFamily.kext/Contents/PlugIns/IOBluetoothUSBDFU.kext
```

### 禁用 com.apple.driver.usb.cdc

```sh
kextstat | grep usb
sudo kextunload -bundle-id com.apple.driver.usb.cdc

```

### 禁用 com.apple.driver.AGPM

* <http://www.memacx.com/thread-4502-1-1.html>

```sh
kextstat | grep AGPM
sudo kextunload -bundle-id com.apple.driver.AGPM
sudo mv /System/Library/Extensions/AppleGraphicsPowerManagement.kext /System/Library/Extensions/AppleGraphicsPowerManagement.disabled
```

恢复

```sh
sudo mv /System/Library/Extensions/AppleGraphicsPowerManagement.disabled /System/Library/Extensions/AppleGraphicsPowerManagement.kext
```

### 禁用 com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport

```sh
kextstat | grep BroadcomBluetoothHostControllerUSBTransport
sudo kextunload -bundle-id com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport
sudo mv /System/Library/Extensions/IOBluetoothFamily.kext/Contents/PlugIns/BroadcomBluetoothHostControllerUSBTransport.kext /System/Library/Extensions/IOBluetoothFamily.kext/Contents/PlugIns/BroadcomBluetoothHostControllerUSBTransport.disabled
```

恢复

```sh
sudo mv /System/Library/Extensions/IOBluetoothFamily.kext/Contents/PlugIns/BroadcomBluetoothHostControllerUSBTransport.disabled /System/Library/Extensions/IOBluetoothFamily.kext/Contents/PlugIns/BroadcomBluetoothHostControllerUSBTransport.kext
```

### 禁用 com.apple.iokit.IOBluetoothSerialManager

```sh
kextstat | grep IOBluetoothSerialManager
sudo kextunload -bundle-id com.apple.iokit.IOBluetoothSerialManager
sudo mv /System/Library/Extensions/IOBluetoothFamily.kext/Contents/PlugIns/IOBluetoothSerialManager.kext /System/Library/Extensions/IOBluetoothFamily.kext/Contents/PlugIns/IOBluetoothSerialManager.disabled
```

恢复

```sh
sudo mv /System/Library/Extensions/IOBluetoothFamily.kext/Contents/PlugIns/IOBluetoothSerialManager.disabled /System/Library/Extensions/IOBluetoothFamily.kext/Contents/PlugIns/IOBluetoothSerialManager.kext
sudo kextload  -bundle-id com.apple.iokit.IOBluetoothSerialManager
```

### 禁用 com.apple.iokit.IOUserEthernet

```sh
kextstat | grep IOUserEthernet
sudo kextunload -bundle-id com.apple.iokit.IOUserEthernet
sudo mv /System/Library/Extensions/IOUserEthernet.kext /System/Library/Extensions/IOUserEthernet.disabled
```

恢复

```sh
sudo mv /System/Library/Extensions/IOUserEthernet.disabled /System/Library/Extensions/IOUserEthernet.kext
sudo kextload  -bundle-id com.apple.iokit.IOUserEthernet
```

### 禁用 com.apple.iokit.IOBluetoothHostControllerTransport

```sh
kextstat | grep IOBluetoothHostControllerTransport
sudo kextunload -bundle-id com.apple.iokit.IOBluetoothSerialManager
sudo mv /System/Library/Extensions/IOBluetoothFamily.kext/Contents/PlugIns/IOBluetoothHostControllerTransport.kext /System/Library/Extensions/IOBluetoothFamily.kext/Contents/PlugIns/IOBluetoothHostControllerTransport.disabled
```

恢复

```sh
sudo mv /System/Library/Extensions/IOBluetoothFamily.kext/Contents/PlugIns/IOBluetoothHostControllerTransport.disabled /System/Library/Extensions/IOBluetoothFamily.kext/Contents/PlugIns/IOBluetoothHostControllerTransport.kext
sudo kextload  -bundle-id com.apple.iokit.IOBluetoothSerialManager
```

### 禁用 com.apple.iokit.IOBluetoothFamily

```sh
kextstat | grep IOBluetoothFamily
sudo kextunload -bundle-id com.apple.iokit.IOBluetoothFamily
sudo mv /System/Library/Extensions/IOBluetoothFamily.kext /System/Library/Extensions/IOBluetoothFamily.disabled
```

恢复

```sh
sudo mv /System/Library/Extensions/IOBluetoothFamily.disabled /System/Library/Extensions/IOBluetoothFamily.kext
sudo kextload  -bundle-id com.apple.iokit.IOBluetoothFamily
```

### 禁用 com.apple.driver.ApplePlatformEnabler

```sh
kextstat | grep ApplePlatformEnabler
sudo kextunload -bundle-id com.apple.driver.ApplePlatformEnabler
sudo mv /System/Library/Extensions/ApplePlatformEnabler.kext /System/Library/Extensions/ApplePlatformEnabler.disabled
```

恢复

```sh
sudo mv /System/Library/Extensions/ApplePlatformEnabler.disabled /System/Library/Extensions/ApplePlatformEnabler.kext
sudo kextload  -bundle-id com.apple.driver.ApplePlatformEnabler
```

### Other

```sh
[snelson aws_starter_sdk (master)]$ sudo kextunload -p -b com.apple.driver.AppleUSBFTDI
[snelson aws_starter_sdk (master)]$ sudo kextutil -b com.apple.driver.AppleUSBFTDI -p AppleUSBEFTDI-6010-1
[snelson aws_starter_sdk (master)]$ sudo kextload -b com.apple.driver.AppleUSBFTDI
[snelson aws_starter_sdk (master)]$ ls /dev/tty.*

System uptime in nanoseconds: 11145782605426
last loaded kext at 2655395433341: com.apple.driver.usb.cdc	5.0.0 (addr 0xffffff7f8f5af000, size 28672)
last unloaded kext at 2808914619657: com.apple.driver.usb.cdc	5.0.0 (addr 0xffffff7f8f5af000, size 28672)
loaded kexts:
com.apple.driver.ApplePlatformEnabler	2.7.0d0
com.apple.driver.AGPM	110.23.14
com.apple.driver.X86PlatformShim	1.0.0
com.apple.driver.AppleOSXWatchdog	1
com.apple.driver.AppleGraphicsDevicePolicy	3.13.79
com.apple.driver.AppleHDA	278.56
com.apple.driver.AppleUpstreamUserClient	3.6.4
com.apple.driver.pmtelemetry	1
com.apple.iokit.IOUserEthernet	1.0.1
com.apple.iokit.IOBluetoothSerialManager	5.0.3f1
```

System uptime in nanoseconds: 37955192413998
last loaded kext at 35396533846006: com.apple.iokit.IOBluetoothUSBDFU	5.0.3f1 (addr 0xffffff7fa19b6000, size 12288)
last unloaded kext at 35867481225897: com.apple.driver.usb.cdc	5.0.0 (addr 0xffffff7fa19af000, size 28672)
