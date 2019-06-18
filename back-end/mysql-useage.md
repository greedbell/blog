# mysql 使用

登录

```shell
$ mysql -uroot  -p
```

列出所有数据库

```SQL
show databases;
```

创建数据库

```SQL
CREATE DATABASE abccs;
```

切换数据库

```SQL
use databasename;
```

查看当前数据库

```SQL
SELECT database();
```

列出所有表

```SQL
show tables;
```

查看表结构

```SQL
desc tablename;
```

创建用户

```SQL
CREATE USER 'username'@'host' IDENTIFIED BY 'password';
CREATE USER 'username'@'%' IDENTIFIED BY 'password';
```

给用户授权

```SQL
GRANT privileges ON databasename.tablename TO 'username'@'host'
GRANT ALL ON *.* TO 'bell'@'%';
```
