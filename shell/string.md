# shell 中字符串处理

## `${}`，`##` 和 `%%` 处理字符串

假设我们定义了一个变量为：
`file=/dir1/dir2/dir3/my.file.txt`
可以用`${ }`分别替换得到不同的值：
* `${file#*/}`：删掉第一个 / 及其左边的字符串：dir1/dir2/dir3/my.file.txt
* `${file##*/}`：删掉最后一个 /  及其左边的字符串：my.file.txt
* `${file#*.}`：删掉第一个 .  及其左边的字符串：file.txt
* `${file##*.}`：删掉最后一个 .  及其左边的字符串：txt
* `${file%/*}`：删掉最后一个  /  及其右边的字符串：/dir1/dir2/dir3
* `${file%%/*}`：删掉第一个 /  及其右边的字符串：(空值)
* `${file%.*}`：删掉最后一个  .  及其右边的字符串：/dir1/dir2/dir3/my.file
* `${file%%.*}`：删掉第一个  .   及其右边的字符串：/dir1/dir2/dir3/my

记忆的方法为：

* `#` 是去掉左边，`*`在左边（键盘上#在 $ 的左边）
* `%` 是去掉右边，`*`在右边（键盘上% 在$ 的右边）
* `*` 是通配符，`#` 中 `*`在左边，% 中`*`在右边，可以不要

单一符号是最小匹配；两个符号是最大匹配

* `${file:0:5}`：提取最左边的 5 个字节：/dir1
* `${file:5:5}`：提取第 5 个字节右边的连续5个字节：/dir2

也可以对变量值里的字符串作替换：
* `${file/dir/path}`：将第一个 dir 替换为 path：/path1/dir2/dir3/my.file.txt
* `${file//dir/path}`：将全部dir 替换为 path：/path1/path2/path3/my.file.txt

利用 ${ } 还可针对不同的变数状态赋值(沒设定、空值、非空值)：
* `${file-my.file.txt}` ：假如 $file 沒有设定，則使用 my.file.txt 作传回值。(空值及非空值時不作处理)
* `${file:-my.file.txt}` ：假如 $file 沒有設定或為空值，則使用 my.file.txt 作傳回值。 (非空值時不作处理)
* `${file+my.file.txt}` ：假如 $file 設為空值或非空值，均使用 my.file.txt 作傳回值。(沒設定時不作处理)
* `${file:+my.file.txt}` ：若 $file 為非空值，則使用 my.file.txt 作傳回值。 (沒設定及空值時不作处理)
* `${file=my.file.txt}` ：若 $file 沒設定，則使用 my.file.txt 作傳回值，同時將 $file 賦值為 my.file.txt 。 (空值及非空值時不作处理)
* `${file:=my.file.txt}` ：若 $file 沒設定或為空值，則使用 my.file.txt 作傳回值，同時將 $file 賦值為 my.file.txt 。 (非空值時不作处理)
* `${file?my.file.txt}` ：若 $file 沒設定，則將 my.file.txt 輸出至 STDERR。 (空值及非空值時不作处理)
* `${file:?my.file.txt}` ：若 $file 没设定或为空值，则将 my.file.txt 输出至 STDERR。 (非空值時不作处理)
* `${#var}` 可计算出变量值的长度：${#file} 可得到 27 ，因为 /dir1/dir2/dir3/my.file.txt 是27个字节

## References

* <http://blog.csdn.net/shmilyringpull/article/details/7631106>
