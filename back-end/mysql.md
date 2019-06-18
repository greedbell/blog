# mysql

文档地址 ：<http://dev.mysql.com/doc/refman/5.7/en/>


<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [mysql](#mysql)
  * [mac 安装 mysql](#mac-安装-mysql)
    * [rpm 包方式安装](#rpm-包方式安装)
  * [使用](#使用)
  * [存储引擎](#存储引擎)
  * [服务器连接排序规则](#服务器连接排序规则)
  * [数据库数据类型](#数据库数据类型)
  * [Char Varchar text](#char-varchar-text)
  * [外键](#外键)
  * [FLOAT DOUBLE DECIMAL](#float-double-decimal)
  * [NULL VS ''](#null-vs)
  * [连接查询](#连接查询)
    * [on VS where](#on-vs-where)
    * [笛卡尔积(交叉连接)](#笛卡尔积交叉连接)
    * [内连接 INNER JOIN](#内连接-inner-join)
    * [外连接](#外连接)
      * [左外连接 LEFT [OUTER] JOIN](#左外连接-left-outer-join)
      * [右外连接 RIGHT [OUTER] JOIN](#右外连接-right-outer-join)
      * [完全外连接 FULL [OUTER] JOIN](#完全外连接-full-outer-join)
      * [自连接](#自连接)
  * [DATETIME VS TIMESTAMP](#datetime-vs-timestamp)
  * [sql子查询](#sql子查询)
    * [用于替代表达式的子查询](#用于替代表达式的子查询)
    * [使用子查询原则](#使用子查询原则)
  * [and or not](#and-or-not)
  * [性能优化](#性能优化)
  * [Questions](#questions)
    * [Tag latest not found in repository mysql](#tag-latest-not-found-in-repository-mysql)

<!-- tocstop -->

## mac 安装 mysql

### rpm 包方式安装

* [Installing MySQL on Linux Using the MySQL Yum Repository](http://dev.mysql.com/doc/refman/5.7/en/linux-installation-yum-repo.html)

1. [Download MySQL Yum Repository](http://dev.mysql.com/downloads/repo/yum/)下载rpm包 [mysql57-community-release-el6-9.noarch.rpm](http://dev.mysql.com/get/mysql57-community-release-el6-9.noarch.rpm)

2. 安装

```shell
rpm -Uvh mysql57-community-release-el6-9.noarch.rpm
```

3. 查看可以装的列表

```sh
yum repolist all | grep mysql
yum repolist enabled | grep mysql
```

4. 安装

```sh
yum install mysql-community-server
```

## 使用

启动 mysql

```sh
sudo service mysqld start
```

停止 mysql

```sh
sudo service mysqld stop
```

第一次启动的时候会生成 root 用户和默认密码

```sh
grep 'temporary password' /var/log/mysqld.log
```

查看默认 root 密码。

登录 root 用户

```sh
mysql -uroot -p
```

设置新 root 密码

```sh
ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass4!';
```

允许mysql远程访问

1. 修改 bind-address

`/etc/mysql/mysql.conf.d/mysqld.cnf` 的 `bind-address` 改成系统IP

2. 修改数据库

```mysql
mysql -u root –p
mysql>use mysql;
mysql>update user set host = '%' where user = 'root';
mysql>select host, user from user;
```

## 存储引擎

* MyISAM管理非事务表。它提供高速存储和检索，以及全文搜索能力。MyISAM在所有MySQL配置里被支持，它是默认的存储引擎，除非你配置MySQL默认使用另外一个引擎。
* InnoDB和BDB存储引擎提供事务安全表。BDB被包含在为支持它的操作系统发布的MySQL-Max二进制分发版里。InnoDB也默认被包括在所 有MySQL 5.1二进制分发版里，你可以按照喜好通过配置MySQL来允许或禁止任一引擎。
* [MySQL存储引擎InnoDB与Myisam的六大区别 ](https://my.oschina.net/junn/blog/183341)

## 服务器连接排序规则

* [Connection Character Sets and Collations](http://dev.mysql.com/doc/refman/5.5/en/charset-connection.html)

* utf8_unicode_ci和utf8_general_ci对中、英文来说没有实质的差别。
* utf8_general_ci 校对速度快，但准确度稍差。
* utf8_unicode_ci 准确度高，但校对速度稍慢。
* 如果你的应用有德语、法语或者俄语，请一定使用utf8_unicode_ci。一般用utf8_general_ci就够了，到现在也没发现问题。。。

* 采用 utf8 编码的 MySQL 无法保存占位是4个字节的 Emoji 表情,需要用 utf8mb4

为安全起见，推荐用 utf8mb4_unicode_ci

## 数据库数据类型

* [Data Types](http://dev.mysql.com/doc/refman/5.7/en/data-types.html)

## Char Varchar text

参考 [MySQL之char、varchar和text的设计](http://www.cnblogs.com/billyxp/p/3548540.html)

1. char（n）和varchar（n）中括号中n代表字符的个数，并不代表字节个数，所以当使用了中文的时候(UTF8)意味着可以插入m个中文，但是实际会占用m*3个字节。
2. 同时char和varchar最大的区别就在于char不管实际value都会占用n个字符的空间，而varchar只会占用实际字符应该占用的空间+1，并且实际空间+1<=n。
3. 超过char和varchar的n设置后，字符串会被截断。
4. char的上限为255字节，varchar的上限65535字节，text的上限为65535。
5. char在存储的时候会截断尾部的空格，varchar和text不会。
6. varchar会使用1-3个字节来存储长度，text不会。

总体来说：

1. char，存定长，速度快，存在空间浪费的可能，会处理尾部空格，上限255。
2. varchar，存变长，速度慢，不存在空间浪费，不处理尾部空格，上限65535，但是有存储长度实际65532最大可用。
3. text，存变长大数据，速度慢，不存在空间浪费，不处理尾部空格，上限65535，会用额外空间存放数据长度，顾可以全部使用65535。

## 外键

思考 [大家设计数据库时使用外键吗？](https://www.zhihu.com/question/19600081)

* 主键：是唯一标识一条记录，不能有重复的，不允许为空，用来保证数据完整性
* 外键：是另一表的主键, 外键可以有重复的, 可以是空值，用来和其他表建立联系用的。所以说，如果谈到了外键，一定是至少涉及到两张表。

ON DELETE

* RESTRICT(限制)：如果你想删除的那个主表，它的下面有对应从表的记录，此主表将无法删除。
* CASCADE（级联）：如果主表的记录删掉，则从表中相关联的记录都将被删掉。
* SET NULL：将外键设置为空。
* NO ACTION：什么都不做。

## FLOAT DOUBLE DECIMAL

* [float、double(浮点数)区别还有和decimal(定点数)的比较](http://www.cnblogs.com/itcomputer/articles/4716024.html)

MySQL浮点型和定点型可以用类型名称后加（M，D）来表示，M表示该值的总共长度，D表示小数点后面的长度，M和D又称为精度和标度，FLOAT和DOUBLE在不指定精度时，默认会按照实际的精度来显示，而DECIMAL在不指定精度时，默认整数为10，小数为0。

* float:浮点型，含字节数为4，32bit，数值范围为-3.4E38~3.4E38（7个有效位）. 格式是：1位符号位 8位表示指数 23位表示尾数
* double:双精度实型，含字节数为8，64bit数值范围-1.7E308~1.7E308（15个有效位）. 格式是：1位符号位 11位表示指数 52位表示尾数
* decimal:数字型，128bit，不存在精度损失，常用于涉及货币或其他精度敏感的数据。（28个有效位）M:1～65, D:0～30

double 和 float 的区别是double精度高，有效数字16位，float精度7位。但double消耗内存是float 的两倍，double的运算速度比float慢得多

## NULL VS ''

空值不一定为空

* TimesTamp 当前时间
* auto_increment属性的列 会插入一个正整数序列

空值不一定等于空字符

## 连接查询

* [详解SQL Server连接（内连接、外连接、交叉连接） ](http://blog.csdn.net/jiuqiyuliang/article/details/10474221)
* [W3school](http://www.w3school.com.cn/sql/sql_join.asp)

在没有 ON 的情况下 交叉连接 与 内连接是一样的，有 ON 的时候就是 内连接，无 ON 就是 交叉连接。

`table1 CROSS JOIN table2` = `table1 JOIN table2` = `table1, table2` = `table1 INNER JOIN table2`

### on VS where

* on条件是在生成临时表时使用的条件，它不管on中的条件是否为真，都会返回临时表的记录。
* where条件是在临时表生成好后，再对临时表进行过滤的条件。

### 笛卡尔积(交叉连接)

* 加条件只能用where,不能用on
* 不带WHERE条件子句，它将会返回被连接的两个表的笛卡尔积，返回结果的行数等于两个表行数的乘积
* 有where子句，往往会先生成两个表行数乘积的数据表，然后才根据where条件从中选择。

```SQL
SELECT * FROM table1 CROSS JOIN table2   
SELECT * FROM table1 JOIN table2   
SELECT * FROM table1,table2
```

### 内连接 INNER JOIN

只列出匹配的记录。

使用比较运算符（包括=、>、<、<>、>=、<=、!>和!<）进行表间的比较操作

```SQL
select * from TableA a inner join TableB b on a.b_id = b.id
```

### 外连接

#### 左外连接 LEFT [OUTER] JOIN

左表列出全部，右表只列出匹配的记录。

```SQL
select * from TableA a left join TableB b on a.id = b.id
```

#### 右外连接 RIGHT [OUTER] JOIN

右表列出全部，左表只列出匹配的记录。

```SQL
select * from TableA a right join TableB b on a.id = b.id
```

#### 完全外连接 FULL [OUTER] JOIN

完全外连接包含full join左右两表中所有的行，如果右表中某行在左表中没有匹配，则结果中对应行右表的部分全部为空(NULL)，如果左表中某行在右表中没有匹配，则结果中对应行左表的部分全部为空(NULL)。

```SQL
select * from TableA a full join TableB b on a.id = b.id
```

#### 自连接

参与连接的表都是同一张表。(通过给表取别名虚拟出两张表)

## DATETIME VS TIMESTAMP

* DATETIME 范围为1000-01-01 00:00:00 ~ 9999-12-31 23:59:59，
* TIMESTAMP 范围为1970-01-01 08:00:01到2038-01-19 11:14:07。
* TIMESTAMP类型在默认情况下，insert、update 数据时，TIMESTAMP列会自动以当前时间（CURRENT_TIMESTAMP）填充/更新。
* TIMESTAMP比较受时区timezone的影响以及MYSQL版本和服务器的SQL MODE的影响

## sql子查询

嵌套SELECT语句

* [SQL 子查询](http://wiki.jikexueyuan.com/project/sql/sub-queries.html)
* [mysql查询语句select-子查询 ](http://blog.csdn.net/jesseyoung/article/details/40108781)

### 用于替代表达式的子查询

参考 [用于替代表达式的子查询](https://msdn.microsoft.com/zh-cn/library/ms189623(v=sql.105).aspx)

在 Transact-SQL 中，除了在 ORDER BY 列表中以外，在 SELECT、UPDATE、INSERT 和 DELETE 语句中任何能够使用表达式的地方都可以用子查询替代。

以下示例说明如何使用此增强功能。此查询找出所有山地车产品的价格、平均价格以及两者之间的差价。

```SQL
USE AdventureWorks2008R2;
GO
SELECT Name, ListPrice,
(SELECT AVG(ListPrice) FROM Production.Product) AS Average,
    ListPrice - (SELECT AVG(ListPrice) FROM Production.Product)
    AS Difference
FROM Production.Product
WHERE ProductSubcategoryID = 1;
```

### 使用子查询原则

1. 一个子查询必须放在圆括号中。
2. 将子查询放在比较条件的右边以增加可读性。
子查询不包含 ORDER BY 子句。对一个 SELECT 语句只能用一个 ORDER BY 子句，并且如果指定了它就必须放在主 SELECT 语句的最后。
3. 在子查询中可以使用两种比较条件：单行运算符(>, =, >=, <, <>, <=) 和多行运算符(IN, ANY, ALL)。

## and or not

sql语句中not and or的执行优先级从高到低依次为:not,and,or

```SQL
select * from table where a=1 and b=2 or c=3 and d=4;
```

==

```SQL
select * from table where (a=1 and b=2) or (c=3 and d=4);
```

参考

* [13.3.1 Operator Precedence](https://dev.mysql.com/doc/refman/5.7/en/operator-precedence.html)
* [SQL OR AND 优先级问题](https://my.oschina.net/ruibo/blog/205852)

## 性能优化

* 尽量用inner join.避免 LEFT JOIN 和 NULL.
* 尽量避免子查询，而用join

参考

* [Mysql Join语法解析与性能分析](http://www.cnblogs.com/BeginMan/p/3754322.html)
* [五种提高 SQL 性能的方法](https://www.microsoft.com/china/MSDN/library/data/sqlserver/FiveWaystoRevupYourSQLPerformanCE.mspx?mfr=true)
* [从一个MySQL left join优化的例子加深对查询计划的理解](http://luxuryzh.iteye.com/blog/1976004)
* [SQL Joins Vs SQL Subqueries (Performance)?](http://stackoverflow.com/questions/3856164/sql-joins-vs-sql-subqueries-performance)

## Questions

### Tag latest not found in repository mysql
