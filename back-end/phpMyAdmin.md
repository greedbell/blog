# phpMyAdmin

* [官网](https://www.phpmyadmin.net/)

## 安装

### ubuntu 安装

```sh
sudo apt-get update
sudo apt-get install phpmyadmin
```

选择 `apache2`

### 源码安装

```sh
wget https://files.phpmyadmin.net/phpMyAdmin/4.6.5.2/phpMyAdmin-4.6.5.2-all-languages.zip
unzip phpMyAdmin-4.6.5.2-all-languages.zip
cd phpMyAdmin-4.6.5.2-all-languages
```

### Composer 安装

* [Installing using Composer](https://docs.phpmyadmin.net/en/latest/setup.html#installing-using-composer)

```sh
composer create-project phpmyadmin/phpmyadmin --repository-url=https://www.phpmyadmin.net/packages.json --no-dev
```

### docker 方式安装

* [phpmyadmin/phpmyadmin](https://hub.docker.com/r/phpmyadmin/phpmyadmin/)

下载镜像

```sh
docker pull phpmyadmin/phpmyadmin
```

或者

```sh
docker pull daocloud.io/daocloud/phpmyadmin
```

启动

```sh
docker run --name myadmin -d -e PMA_HOST=localhost -p 8082:80 phpmyadmin/phpmyadmin
```

进入

```sh
docker exec -it myadmin sh
```


## 配置

* 参考 [Manually creating the file](https://docs.phpmyadmin.net/en/latest/setup.html#manually-creating-the-file)
* [Config 翻译](https://docs.phpmyadmin.net/zh_CN/latest/config.html)

```sh
cd phpmyadmin
cp config.sample.inc.php config.inc.php
```

`$cfg['Servers'][$i]`  配置 Mysql 地址

`$cfg['Servers'][$i]['controlhost']` 配置用于存储高级功能表的数据库地址
