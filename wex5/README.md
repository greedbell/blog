# Wex5

Cordova +

* [WeX5如何使用和扩展本地插件](http://docs.wex5.com/use-and-custom-cordova-plugin/)

## 基础库

WeX5前端依赖的两个基础库：数据感知MVVM和jQuery，其中数据感知MVVM基于 Knockoutjs 改进的。

## 页面框架

WeX5的页面模式支持单页模式（Single-page Application）和多页模式（Multi-page Appliction），默认实现是单页模式。

### 单页应用模式的三大问题

1、针对id冲突，采用xid技术来解决；
2、针对css冲突，采用css局部化技术来解决；
3、针对js冲突，采用js模块化技术来解决；

## requireJS

AMD规范

由 `system/components/justep/window/main.html`
生成的 `Native/linghang/www/x5/UI2/*****/index.w 和 main.w`

```js
window.__justep.__ResourceEngine.initContextPath();
requirejs.config({
baseUrl: window.__justep.__ResourceEngine.contextPath + '/v_5569_nol_zh_CNs_d_m/linghangApp',
paths: {
  /* 解决require.normalizeName与require.toUrl嵌套后不一致的bug   */
  '$model/UI2/v_': window.__justep.__ResourceEngine.contextPath + '/v_5569_nol_zh_CNs_d_m',
  '$model/UI2': window.__justep.__ResourceEngine.contextPath + '/v_5569_nol_zh_CNs_d_m',
  '$model': window.__justep.__ResourceEngine.serverPath,
    'text': window.__justep.__ResourceEngine.contextPath + '/v_5569_nol_zh_CNs_d_m/system/lib/require/text.2.0.10',
    'bind': window.__justep.__ResourceEngine.contextPath + '/v_5569_nol_zh_CNs_d_m/system/lib/bind/bind',
    'jquery': window.__justep.__ResourceEngine.contextPath + '/v_5569_nol_zh_CNs_d_m/system/lib/jquery/jquery-1.11.1.min'
},
map: {
      '*': {
          res: '$model/UI2/system/lib/require/res',
          cordova: '$model/UI2/system/lib/require/cordova',
          w: '$model/UI2/system/lib/require/w',
          css: '$model/UI2/system/lib/require/css'
      }
},
waitSeconds: 300
});
```

## Questions

### 1

```
Gradle sync failed: Project with path ':JustepGetContent' could not be found in project ':CordovaLib'.
```

`settings.gradle` 添加 `include ":JustepGetContent"`
