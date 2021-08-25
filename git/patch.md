# patch

git 补丁

## 生成补丁

```bash
git diff > example.patch
```

## 打补丁

参数
* -p NUM  忽略几层文件夹
* -E 选项说明如果发现了空文件，那么就删除它
* -R 取消打过的补丁

举例

```bash
# 取消补丁
patch -RE -p0 < example.patch
```


```bash
patch -d ./ < example.patch
```

补丁失败的文件会以.rej结尾

## References

* [补丁(patch)的制作与应用](http://linux-wiki.cn/wiki/zh-hans/%E8%A1%A5%E4%B8%81(patch)%E7%9A%84%E5%88%B6%E4%BD%9C%E4%B8%8E%E5%BA%94%E7%94%A8)
