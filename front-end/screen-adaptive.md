# 屏幕自适应

## 框架

* [Bootstrap](https://github.com/twbs/bootstrap)

## pc端

## 移动端

### ideal viewport 的效果

```html
<meta name="viewport" content="width=device-width, initial-scale=1">
```

### 等比缩放

```js
<script>(function(){var w=window.screen.width,s=w/750,u=navigator.userAgent,m='<meta name="viewport" content="width=750,';if(/android (\d+\.\d+)/i.test(u)){if(parseFloat(RegExp.$1>2.3)){m+="minimum-scale = "+s+", maximum-scale = "+s+","}}else{m+="user-scalable=no,"}m+='target-densitydpi=device-dpi">';document.write(m)}());</script>
```

不设置viewport,在head里面用js生成,在安卓内流里面会有一些问题

### 根据设备设不同的字体

使用自定义字体,font-face,然后js判断机型

### rem

用的少,用rem是比较好，但是比较麻烦，如果不根据屏幕尺寸来调节html的font-size，这对rem没啥用,rem一般要配合@media用

### 相关资料

* [移动端高清、多屏适配方案](http://www.html-js.com/article/Mobile-terminal-H5-mobile-terminal-HD-multi-screen-adaptation-scheme%203041)
* [web app变革之rem](http://isux.tencent.com/web-app-rem.html)
* [移动前端开发之viewport的深入理解](http://www.cnblogs.com/2050/p/3877280.html)
* [响应式网页设计](http://isux.tencent.com/responsive-web-design.html)
* [手机淘宝的flexible设计与实现](http://www.html-js.com/article/2402)
* [移动端自适应方案](http://f2e.souche.com/blog/yi-dong-duan-zi-gua-ying-fang-an/)
