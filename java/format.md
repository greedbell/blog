# Format

* java.text.Format

子类

* DateFormat 日期
* MessageFormat 消息
* NumberFormat 数字

方法

* format(Object obj, StringBuffer toAppendTo, FieldPosition pos)
* formatToCharacterIterator(Object obj)
* parseObject(String source, ParsePosition pos)

## FieldPosition

### NumberFormat

`_FIELD` 常量

* FRACTION_FIELD 分数域
* INTEGER_FIELD 整数域

`Format.Field` 常量

* CURRENCY 货币
* DECIMAL_SEPARATOR 小数点

## ParsePosition

解析过程中跟踪当前位置

## NumberFormat

数字格式化

* getPercentInstance 百分比
* getCurrencyInstance 货币

## DateFormat

日期时间格式化

* getDateInstance
* getTimeInstance
* getDateTimeInstance
