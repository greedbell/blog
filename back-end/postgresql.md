# postgresql

* [官网](https://www.postgresql.org/)

## 使用

登录

```
$ psql --username=<user name> <db name>
```

列出所有数据库名

```
\l
```

切换数据库

```
\c <db name>
```

查看表

```
\d
```

查看表结构

```
\d <table name>
```

sequence

```sql
 create table employ(id serial,name varchar(64),department varchar(128)) ;
```

或者

```sql
CREATE TABLE employ (
      id serial,
      name varchar(64),
      department varchar(64)
) ;

-----------------------------------------------------------------
CREATE SEQUENCE employ_id_seq ;
CREATE TABLE employ (
     id integer NOT NULL DEFAULT nextval('employ_id_seq'),
     name varchar(64),
     department varchar(64)
);

ALTER SEQUENCE employ_id_seq OWNED by employ.id;
```

## Questions

### could not read block 0 in file "base/16385/19378": Input/output error

```sql
# INSERT INTO users (email, name, username) VALUES ('test@test.com', 'test', 'test');
ERROR:  could not read block 0 in file "base/16385/19378": Input/output error
STATEMENT:  INSERT INTO "users" ("email", "name", "username", "projects_limit", "state", "created_by_id", "encrypted_password", "reset_password_token", "reset_password_sent_at", "confirmed_at", "notification_email", "authentication_token", "created_at", "updated_at", "admin", "external", "can_create_group", "can_create_team", "hide_no_ssh_key", "hide_no_password", "theme_id") VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21) RETURNING "id"
```

postgresql 文件问题

解决方法：

```sql
gitlabhq_production=> select oid, relname from pg_class where oid=16385 or oid=19378;
  oid  |   relname    
-------+--------------
 19378 | users_id_seq
(1 row)
```

是 users_id_seq 表的问题，需要从备份恢复或者 设置 zero_damaged_pages 清掉坏数据

如果是root用户

```sql
show zero_damaged_pages;
set zero_damaged_pages = on;
show zero_damaged_pages;
```

如果不是root用户，切换到root用户给 gitlab 用户设置zero_damaged_pages

```sql
su - postgres
psql
alter user gitlab set zero_damaged_pages = on;
```

还是不行，使用新的 SEQUENCE

```sql
CREATE SEQUENCE users_id_1_seq;
ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_1_seq');
ALTER SEQUENCE users_id_1_seq  OWNED by public.users.id;
```

更新 sequence 开始位置

```sql
select id from users;
SELECT setval('users_id_1_seq', 19) FROM users;
select pg_get_serial_sequence('users','id');
```

### reference

* [ERROR: could not read block 4707 of relation 1663/16384/16564: Success](http://stackoverflow.com/questions/6895736/error-could-not-read-block-4707-of-relation-1663-16384-16564-success)
* [Corruption](http://wiki.postgresql.org/wiki/Corruption)
