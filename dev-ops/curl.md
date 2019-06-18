# curl

## 下载文件

* -O 下载文件并以原名保存到当前目录中
* -o 指定下载后文件的名字
* -C 断点续传

eg：
```
$ curl https://progit2.s3.amazonaws.com/zh/2015-12-02-9d8a9/progit-zh.936.pdf -O -C 0
```

## GET 请求

```sh
$ curl example.com/form.cgi?data=xxx
```

## POST 请求

```sh
$ curl -X POST --data "data=xxx" example.com/form.cgi
```

## 其它参数

* `--user-agent`
* `--cookie`
* `--header`
