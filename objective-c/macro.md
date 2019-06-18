# 宏

## `#pragma`与`_Pragma`

`#pragma`与`_Pragma`效果一样，但是在宏定义时，`#`会被忽略.eg:

```c
#define MACRO(x) #x
MACRO(example) //结果是example
```

所以在宏里面只能用`_Pragma`

### 用法

```c
_Pragma(“OPT_LEVEL 2”)
```

等价于

```c
#pragma OPT_LEVEL 2
```
