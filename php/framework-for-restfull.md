# 适合写 Restfull API 的框架

我是来说反例的，但凡用以下风格实现controller的，实现RESTFul都很不方便

```
class Controller {
    public function actionFoo() {}
    public function actionBar() {}
}
```

因为RESTFul是对HTTP动作(GET/POST/PUT/DELETE/...)敏感的，用这种风格的Controller的框架来实现就不可避免的会出现以下这种代码

```
class Controller {
    public function actionFoo() {
        if (is_get) {
            /* 一坨代码 */
        } else if (is_post) {
            /* 一坨代码 */
        } else if (is_put) {
            /* 一坨代码 */
        } else if (is_delete) {
            /* 一坨代码 */
        }
    }
}
```

最终在 [Slim](https://github.com/slimphp/Slim) 和 [Silex](https://github.com/silexphp/Silex) 选择了 Slim

## Reference

* [php实现restful api有什么框架使用方便？](https://segmentfault.com/q/1010000000500665)
* [Top 12 Best PHP RESTful Micro Frameworks (Pro/Con)](http://www.gajotres.net/best-available-php-restful-micro-frameworks/)
