# 运维

* [Linux命令大全](http://man.linuxde.net/)

## profile .bash_profile .bashrc 区别

/etc/profile:此文件为系统的每个用户设置环境信息,当用户第一次登录时,该文件被执行.
并从/etc/profile.d目录的配置文件中搜集shell的设置.

~/.bash_profile:每个用户都可使用该文件输入专用于自己使用的shell信息,当用户登录时,该
文件仅仅执行一次!默认情况下,他设置一些环境变量,执行用户的.bashrc文件.

~/.bashrc:该文件包含专用于你的bash shell的bash信息,当登录时以及每次打开新的shell时,该
该文件被读取.

~/.bash_logout:当每次退出系统(退出bash shell)时,执行该文件.

另外,/etc/profile中设定的变量(全局)的可以作用于任何用户,而~/.bashrc等中设定的变量(局部)只能继承/etc/profile中的变量,他们是\"父子\"关系.

## .bash_profile 与 .bashrc 的区别

* `.bash_profile` login shells
* `.bashrc` non-login shells

### login shell 与 non-login shell 的区别

1. 当你直接在机器login界面登陆、使用ssh登陆或者su切换用户登陆时，.bash_profile 会被调用来初始化shell环境

Note：.bash_profile文件默认调用.bashrc文件
.bash_profile中有如下内容
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

2. 当你不登陆系统而使用ssh直接在远端执行命令，.bashrc 会被调用
3. 当你已经登陆系统后，每打开一个新的Terminal时，.bashrc 都会被再次调用。
