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

默认支持的命令有

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

### git

```bash
cd /usr/local/etc/bash_completion.d
curl -L -O https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
source ~/.bash_profile
```

### docker

```bash
cd /usr/local/etc/bash_completion.d
curl -L -O https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose
source ~/.bash_profile
```

## References

* [bash-completion](http://blog.fpliu.com/it/software/bash-completion)
