# requireJS

* [教程一](http://www.runoob.com/w3cnote/requirejs-tutorial-1.html)
* [教程二](http://www.runoob.com/w3cnote/requirejs-tutorial-2.html)

遵循的是 AMD（异步模块定义）规范,被 require 的必须 define

## 作用

防止 `JS阻塞浏览器渲染`

```
<script type="text/javascript" src="require.js"></script>
        <script type="text/javascript">
            require(["a","b","c"]);
        </script>
```

替换

```
<script type="text/javascript" src="a.js"></script>
<script type="text/javascript" src="b.js"></script>
<script type="text/javascript" src="c.js"></script>
```

## 用法

如果被定义的模块需要依赖其他模块，则define方法必须采用下面的格式。

```js
define(['module1', 'module2'], function(m1, m2) {
   ...
});
```

为了避免像上面代码那样繁琐的写法，RequireJS提供一种更简单的写法。

```js
define(
    function (require) {
        var dep1 = require('dep1'),
            dep2 = require('dep2'),
            dep3 = require('dep3'),
            dep4 = require('dep4'),
            dep5 = require('dep5'),
            dep6 = require('dep6'),
            dep7 = require('dep7'),
            dep8 = require('dep8');

            ...
    }

});
```
