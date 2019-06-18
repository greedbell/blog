# URL 与 URI 的区别

URI，是uniform resource identifier，统一资源标识符，用来唯一的标识一个资源。而URL是uniform resource locator，统一资源定位器，它是一种具体的URI。

URI实例可以代表绝对的，也可以是相对的，只要它符合URI的语法规则。而URL类则不仅符合语义，还包含了定位该资源的信息，因此它不能是相对的，scheme必须被指定

URI抽象结构：

```
[scheme:]scheme-specific-part[#fragment]
[scheme:][//authority][path][?query][#fragment]
```

authority为[user-info@]host[:port]
