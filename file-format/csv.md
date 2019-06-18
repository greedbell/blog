# CSV

Example

| Year | Make | Model | Description | Price |
| :------ | :------ | :------ | :------ | :------ |
| 1997 | Ford | E350 | "ac, abs, moon" | 3000.00 |
| 1999 | Chevy | Venture "Extended Edition" | | 4900.00 |
| 1999 | Chevy | Venture "Extended Edition, Very Large" |  | 5000.00 |
| 1996 | Jeep | Grand Cherokee | MUST SELL! <br> air, moon roof, loaded | 4799.00 |

转成 CSV

```CSV
Year,Make,Model,Description,Price
1997,Ford,E350,"ac, abs, moon",3000.00
1999,Chevy,"Venture ""Extended Edition""","",4900.00
1999,Chevy,"Venture ""Extended Edition, Very Large""",,5000.00
1996,Jeep,Grand Cherokee,"MUST SELL!
air, moon roof, loaded",4799.00
```

## References

* [wikipedia](https://en.wikipedia.org/wiki/Comma-separated_values)
* [IETF 标准](https://tools.ietf.org/html/rfc4180)
