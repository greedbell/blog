# File Provider

为其它 App 访问你的 App 内的文档提供服务

* File Provider Extension： 使其它 App 访问你的 App 内的文档。
* File Provider UI Extension： 将一些自定义的操作添加到浏览器的上下文菜单中

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

* [File Provider](#file-provider)
	* [Files](#files)
	* [为其它 App 提供访问你的 App 文档的能力](#为其它-app-提供访问你的-app-文档的能力)
		* [File Provider 兼容多个版本](#file-provider-兼容多个版本)
			* [iOS 11](#ios-11)
			* [iOS 10 and earlier](#ios-10-and-earlier)
		* [使用](#使用)
			* [Info.plist](#infoplist)
	* [App 访问其它 App 的文档](#app-访问其它-app-的文档)
		* [UIDocumentPickerViewController](#uidocumentpickerviewcontroller)
			* [Document Picker Modes](#document-picker-modes)
	* [References](#references)

<!-- /code_chunk_output -->

## Files

Files 是 iOS 11 出的功能，替代了 iOS 10 中 iCloud Drive，除了界面上的不同，Files 可以管理更多的文件。

大体来看 Files 中的文件可以分为三类：

* iPad 应用内本地文件夹。在左侧点击「我的 iPad」，就会显示本地应用的文件。例如 Byword 自带的 「welcome.md」文件被默认保存在「iPad」文件夹中，在 Files 就会显示出来。
* 第三方云盘服务，例如 Dropbox，Google Drive 也可以在 Files 中打开。
* 第三类则是各类应用，例如 PDF Expert，Quip。

## 为其它 App 提供访问你的 App 文档的能力

### File Provider 兼容多个版本

#### iOS 11

提供 `NSFileProviderItem` `NSFileProviderEnumerator` 来处理用户操作(for example, delete, rename, and move)

#### iOS 10 and earlier

### 使用

#### Info.plist

* NSExtensionFileProviderSupportsEnumeration: YES： Files 中显示 App，NO 不显示


## App 访问其它 App 的文档

可访问 File App、iCloud driver 等。

其他的应用程序可以使用 UIDocumentBrowserViewController 类或者 UIDocumentPickerViewController 类，访问存储的文档。这两个类提供了一个标准的用户界面（即和系统的 File App 相同的那个界面），用于浏览文件，或者与文件进行交互（增删改查）。但是呢，我们也可以使用 FileProviderUI 框架将一些自定义的操作添加到浏览器的上下文菜单中

## 使用

* UIDocumentBrowserViewController: 只适用于 iOS11 及以上
* UIDocumentPickerViewController: 适用于所有版本，在 iOS 11 及以上效果和 UIDocumentBrowserViewController 一致。

### UIDocumentPickerViewController

使用 UIDocumentPickerViewController 需要先开启 App 的 iCloud 功能。

#### Document Picker Modes

* UIDocumentPickerModeImport：导入
* UIDocumentPickerModeOpen：打开
* UIDocumentPickerModeExportToService：导出
* UIDocumentPickerModeMoveToService：直接访问

## References

* [File Provider](https://developer.apple.com/documentation/fileprovider) iOS 11 Files
* [FileProviderUI](https://developer.apple.com/documentation/fileproviderui)
* [Creating File Providers for Multiple Versions of iOS](https://developer.apple.com/documentation/fileprovider/creating_file_providers_for_multiple_versions_of_ios)
