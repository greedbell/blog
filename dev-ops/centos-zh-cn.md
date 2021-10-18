# Centos 安装支持中文

### 安装中文语言包

```
sudo apt-get install  language-pack-zh-han*
```

### 修改配置文件

```
vim /etc/default/locale
```

将原始内容注释掉或删掉，替换为如下内容：

```
LANG="zh_CN.UTF-8"
LANGUAGE="zh_CN:zh"
LC_NUMERIC="zh_CN"
LC_TIME="zh_CN"
LC_MONETARY="zh_CN"
LC_PAPER="zh_CN"
LC_NAME="zh_CN"
LC_ADDRESS="zh_CN"
LC_TELEPHONE="zh_CN"
LC_MEASUREMENT="zh_CN"
LC_IDENTIFICATION="zh_CN"
LC_ALL="zh_CN.UTF-8"
```

### 修改环境文件(环境变量(当前用户))

```
vim /etc/environment
```

不修改原有内容,直接在原内容下面新开一行加入下列内容：


```
LANG="zh_CN.UTF-8"
LANGUAGE="zh_CN:zh"
LC_NUMERIC="zh_CN"
LC_TIME="zh_CN"
LC_MONETARY="zh_CN"
LC_PAPER="zh_CN"
LC_NAME="zh_CN"
LC_ADDRESS="zh_CN"
LC_TELEPHONE="zh_CN"
LC_MEASUREMENT="zh_CN"
LC_IDENTIFICATION="zh_CN"
LC_ALL="zh_CN.UTF-8"
```

### 修改环境文件(环境变量(所有用户)):

```
vim /etc/profile
```

不修改原有内容,直接在原内容下面新开一行加入下列内容：

```

LANG="zh_CN.UTF-8"
```

### Docker

```
apt-get install -y locales
sed -ie 's/# zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/g' /etc/locale.gen
locale-gen
```

看看当前启用的本地支持

```
locale -a
```

### 添加fonts

```
apt-get install -y --no-install-recommends fonts-wqy-microhei
apt-get install -y --no-install-recommends ttf-wqy-zenhei
```

查看字体是否生效

```
fc-list
```


### 重启

```
reboot
```

## References

* [Ubuntu命令方式安装中文语言包](https://www.cnblogs.com/MineLSG/p/12663378.html)
