# 使用 nginx 优化 node.js

* [使用nginx反向代理处理静态页面](http://ourjs.com/detail/nodejs-on-nginx-%E4%BD%BF%E7%94%A8nginx%E5%8F%8D%E5%90%91%E4%BB%A3%E7%90%86%E5%A4%84%E7%90%86%E9%9D%99%E6%80%81%E9%A1%B5%E9%9D%A2)

尽管Node.JS的性能不错，但处理静态事务确实不是他的专长，如：gzip编码，静态文件，HTTP缓存，SSL处理，负载平衡和反向代理及多站点代理等，都可以通过nginx来完成，从而减小node.js的负载，并通过nginx强大的缓存来节省您网站的流量从而提高网站的加载速度。
