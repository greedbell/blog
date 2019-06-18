# bluebird

如果第三方的那些函数库是符合错误优化的规则的话,可以直接用 `bluebird` 批量转换

* [GitHub](https://github.com/petkaantonov/bluebird)
* [官网](bluebirdjs.com)

## 注意

> As a notable exception in fs, fs.existsAsync doesn't work as expected, because Node's fs.exists doesn't call back with error as first argument. More at #418. One possible workaround is using fs.statAsync.

翻译

> 必须回调函数第一个参数是 error

* <https://github.com/petkaantonov/bluebird/issues/418>
