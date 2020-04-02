# Mac 生成 sha256sum

## 生成毫秒时间戳

mac 下的 date 无法生成毫秒时间戳，所以需要安装 gdate

```sh
brew install coreutils
```

生成毫秒

```sh
expr $(gdate +%s%N) / 1000000
```

## 生成 HMAC SHA256

```sh
MESSAGE=$(expr $(gdate +%s%N) / 1000000)
SECRET="secret"

echo -n $MESSAGE | openssl dgst -sha256 -hmac $SECRET -binary | base64
```


## References

* [Examples of creating base64 hashes using HMAC SHA256 in different languages](https://www.jokecamp.com/blog/examples-of-creating-base64-hashes-using-hmac-sha256-in-different-languages/#shell)
