# Atom

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

* [Atom](#atom)
	* [Markdown](#markdown)
		* [默认 Markdown](#默认-markdown)
			* [预览](#预览)
			* [代码段](#代码段)
			* [相关资料](#相关资料)
		* [markdown-preview-enhanced](#markdown-preview-enhancedhttpsgithubcomshd101wyymarkdown-preview-enhanced)
	* [插件](#插件)
	* [设置 socks 代理](#设置-socks-代理)

<!-- /code_chunk_output -->

## Markdown

### 默认 Markdown

#### 预览

```
ctrl-shift-M
```

#### 代码段

`alt-shift-S`查看支持的所有代码段

`img`,`table`,`b`,`i`,`s`，`l`,`code`

#### 相关资料

* <https://segmentfault.com/a/1190000003043577>

### [markdown-preview-enhanced](https://github.com/shd101wyy/markdown-preview-enhanced)

更好的 markdown 插件

## 插件

安装插件

```sh
apm install markdown-preview-enhanced --verbose
```

* graphViz-preview-plus: 支持 graphViz 预览
* language-dot: 支持 dot 语言
* pretty-json: JSON 格式化
* atom-beautify: shell 格式化

## 设置 socks 代理

* 参考 <https://github.com/atom/apm#behind-a-firewall>

```sh
apm config set strict-ssl false
apm config set http-proxy socks5://127.0.0.1:1087
apm config set https-proxy socks5://127.0.0.1:1087

apm config set http-proxy http://127.0.0.1:1087
apm config set https-proxy https://127.0.0.1:1087

http_proxy = socks5://127.0.0.1:1086
https_proxy = socks5://127.0.0.1:1086
```
