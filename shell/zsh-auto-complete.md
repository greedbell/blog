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

## 自定义命令自动补全

- [Completion System](https://zsh.sourceforge.io/Doc/Release/Completion-System.html)
- [如何编写一个 zsh 补全脚本](http://chuquan.me/2020/11/28/how-to-write-a-zsh-completion-script/)
- [给 zsh 自定义命令添加参数自动补全](https://mazhuang.org/2022/02/12/zsh-completion/)
