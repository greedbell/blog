# phabricator

code review 工具

* [官网](https://www.phacility.com/)

## 安装

* [官方方式安装](https://secure.phabricator.com/book/phabricator/article/installation_guide/)
* [hachque/phabricator](https://hub.docker.com/r/hachque/phabricator/)
* [yesnault/docker-phabricator](https://hub.docker.com/r/yesnault/docker-phabricator/)

## 配置

### 设置域名

```
docker exec -it phabricator /opt/phabricator/bin/config set phabricator.base-uri <DOMAIN>
```

### 配置邮箱

`Config > config > Mail`
`Config > config > PHPMailer`

以 QQ 企业邮箱为例

```
docker exec -it phabricator /opt/phabricator/bin/config set phpmailer.smtp-host 'smtp.exmail.qq.com'
docker exec -it phabricator /opt/phabricator/bin/config set phpmailer.smtp-port 465
docker exec -it phabricator /opt/phabricator/bin/config set phpmailer.smtp-protocol ssl
docker exec -it phabricator /opt/phabricator/bin/config set phpmailer.smtp-user <EMAIL>
docker exec -it phabricator /opt/phabricator/bin/config set phpmailer.smtp-password <PASSWORD>

docker exec -it phabricator /opt/phabricator/bin/phd restart
```

### 设置时区

`;date.timezone` 改成 `date.timezone = Asia/Shanghai`

`Config > Config > Core` value 值设为 `phabricator.timezone`

```
docker exec -it phabricator /opt/phabricator/bin/phd restart
```

## 使用

### 添加仓库

`Diffusion > Import an Existing External Repository > Create a New Hosted Repository : Continue > `

### 删除仓库

```
docker exec -it phabricator /opt/phabricator/bin/remove destroy rCTWANFANTIAN
```
