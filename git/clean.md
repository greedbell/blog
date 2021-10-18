# git clean

```sh
$  git clean -h
usage: git clean [-d] [-f] [-i] [-n] [-q] [-e <pattern>] [-x | -X] [--] <paths>...

    -q, --quiet           do not print names of files removed
    -n, --dry-run         dry run
    -f, --force           force
    -i, --interactive     interactive cleaning
    -d                    remove whole directories
    -e, --exclude <pattern>
                          add <pattern> to ignore rules
    -x                    remove ignored files, too
    -X                    remove only ignored files
```

## 只删除 git 仓库里修改的内容

```
git clean -fd
```

## 删除 git 仓库里修改的内容和所有 gitignore 的内容

```
git clean -xfd
```
