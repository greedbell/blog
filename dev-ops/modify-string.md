# Mac 批量修改字符串

## 列出所有.m文件

```shell
$ find ./ -name *.m
```

## vi中批量替换

```shell
:g#sourceString#s##targetString#g
```

## sed命令下批量替换文件内容  

格式: sed "s/查找字段/替换字段/g"

```shell
$ sed -i "" "s/sourceString/targetString/g" test.m
```

* `-i`: 直接修改原文

## 批量替换

```shell
#bin/sh
target_files=`find ./ -name *.m`
for target_file in ${target_files}
do
    echo ${target_file}
    sed -i "" "s/sourceString/targetString/g" ${target_file}
done
```
