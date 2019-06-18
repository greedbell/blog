# stat 查看文件信息

## 查看信息

## 查看简单信息

```shell
$ stat <FILE>
```

## 查看详细信息

```shell
$ stat -x <FILE>
```

## 查看最后修改(Modify)时间

```shell
$ stat -t %D-%T <FILE> |awk '{print $10}'
```
