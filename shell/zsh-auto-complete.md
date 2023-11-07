# Zsh 命令自动补全

## zsh-autosuggestions

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)

```shell
brew install zsh-autosuggestions
```

拷贝

```shell
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
```

到 `~/.zshrc`

## yarn

- [zsh-yarn-completions](https://github.com/chrisands/zsh-yarn-completions)

下载脚本到本地

```shell
git clone https://github.com/chrisands/zsh-yarn-completions.git ~/.zsh-yarn-completions
```

执行下面脚本，zsh 支持 yarn 自动补全

```shell
(echo; echo 'source $HOME/.zsh-yarn-completions/zsh-yarn-completions.plugin.zsh') >> $HOME/.zshrc
source $HOME/.zshrc
```
