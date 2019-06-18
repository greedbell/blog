# 杂七杂八

## Gson格式化输出JSON字符串

```
Gson gson = new GsonBuilder().setPrettyPrinting().create();
String jsonOutput = gson.toJson(someObject);
```

### Reference

* [gson](https://github.com/google/gson)
* [Compact Vs. Pretty Printing for JSON Output Format](https://github.com/google/gson/blob/master/UserGuide.md#compact-vs-pretty-printing-for-json-output-format)
* [Gson格式化输出JSON字符串 ](http://liumh.com/2014/07/21/gson-pretty-printing/?utm_source=tuicool&utm_medium=referral)
