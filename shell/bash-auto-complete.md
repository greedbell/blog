# Bash 命令自动补全

* [GitHub](https://github.com/scop/bash-completion)

## 安装

```bash
brew install bash-completion
```

`[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"` 写入 `~/.bas_profile`

```bash
source ~/.bas_profile
```

## 使用

查看默认支持的命令

```bash
$ ls /usr/local/etc/bash_completion.d/
abook			bzip2			cvsps
...
```

测试
```
sudo f [Tab] [Tab]
```

## 扩展未支持的命令

把对应的脚本拷到 `/usr/local/etc/bash_completion.d` 再重新打开终端

### git

```bash
curl -L -o /usr/local/etc/bash_completion.d/git https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
```

### npm

```bash
npm completion > /usr/local/etc/bash_completion.d/npm
```

### npx

```bash
curl -L -o /usr/local/etc/bash_completion.d/npx https://gist.githubusercontent.com/gibatronic/44073260ffdcbd122e9520756c8e35a1/raw/b2f9dd613748d56cebd0eb86ee65c0e07024b1ef/complete_npx.sh
```

### docker

```bash
curl -L -o /usr/local/etc/bash_completion.d/docker https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose
```

## References

* [bash-completion](http://blog.fpliu.com/it/software/bash-completion)
