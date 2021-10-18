# Bash 命令自动补全

* [GitHub](https://github.com/scop/bash-completion)


## 安装

***bash-completion@2 只适用于 bash 4.2 及以上版本***

查看 bash 版本
```bash
echo $BASH_VERSION
```

如果版本小于 4.2 安装新版 bash，安装好的 bash 地址 `/usr/local/bin/bash`

```bash
brew install bash
```

安装 bash-completion@2

```bash
brew install bash-completion@2
```

`[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"` 写入 `~/.bash_profile`

```bash
source ~/.bash_profile
```

## 使用

查看默认支持的命令

```bash
$ ls /usr/local/Cellar/bash-completion@2/2.11/share/bash-completion/completions
```

测试

```
sudo f [Tab] [Tab]
```

## 扩展未支持的命令

```bash
mkdir -p ~/.local/share/bash-completion/completions
```

把对应的脚本拷到 `~/.local/share/bash-completion/completions`

### git

```bash
curl -L -o ~/.local/share/bash-completion/completions/git https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
```

### npm

参考 <https://docs.npmjs.com/cli/v7/commands/npm-completion>

```bash
npm completion > ~/.local/share/bash-completion/completions/npm
```

测试

```bash
npm run [tab] [tab]
```

### npx

```bash
curl -L -o ~/.local/share/bash-completion/completions/npx https://gist.githubusercontent.com/gibatronic/44073260ffdcbd122e9520756c8e35a1/raw/b2f9dd613748d56cebd0eb86ee65c0e07024b1ef/complete_npx.sh
```

### yarn

参考 <https://github.com/dsifford/yarn-completion>

```bash
curl -o ~/.local/share/bash-completion/completions/yarn https://raw.githubusercontent.com/dsifford/yarn-completion/master/yarn-completion.bash
```

### docker

```bash
curl -L -o ~/.local/share/bash-completion/completions/docker https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose
```

## References

* [bash-completion](http://blog.fpliu.com/it/software/bash-completion)
