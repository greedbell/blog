# Rust

## rustup

安装 rustup

```shell
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

卸载 rustup

```shell
rustup self uninstall
```

## cargo

cargo 配置

```shell
vim ~/.cargo/config
```

```text
[source.crates-io]
registry = "https://github.com/rust-lang/crates.io-index"
replace-with = 'tuna'

[source.tuna]
registry = "https://mirrors.tuna.tsinghua.edu.cn/git/crates.io-index.git"

[source.ustc]
registry = "https://mirrors.ustc.edu.cn/crates.io-index"

[source.rsproxy]
registry = "https://rsproxy.cn/crates.io-index"

[net]
git-fetch-with-cli = true

[env]
RUST_MIN_STACK="8388608"
```
