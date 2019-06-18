# Q&A


## 1

"0"就是true
js里面是前面一个值不为"" false null undefined 0 就取前面一个，否则取后面一个.
if (a || b)
是先得到 a || b的值 ，然后再将这个值强制转换成 bool 然后去进行if的运算

b ? b : "3" 简写成 b || "3"

## 2

js里面基本上所有类型都是对象
除了几个特殊的null，undefined，NaN
只要是对象都可以有方法函数

a && a.func()

## 3

async是es7的
es6是generator，但是有了async基本上不会用generator，generator比起async还是差了很多

## 生成唯一 ID

[如何用JavaScript生成一个GUID/UUID](https://github.com/simongong/js-stackoverflow-highest-votes/blob/master/questions1-10/how-to-create-a-UUID-in-javascript.md)

```js
function generateUUID(){
    var d = new Date().getTime();
    var uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        var r = (d + Math.random()*16)%16 | 0;
        d = Math.floor(d/16);
        return (c=='x' ? r : (r&0x7|0x8)).toString(16);
    });
    return uuid;
};
```

[node-uuid](https://github.com/broofa/node-uuid)

## 遍历修改 object array

参考 [Array.prototype.map()](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/map)

```
var yourArray = [ {
    'id':1,
    'name':'john'
},{
    'id':2,
    'name':'jane'
}........,{
    'id':2000,
    'name':'zack'
}];

var newArray = yourArray.map( function( el ){
                                return el.name;
                               });
```

## array or object to string

```
var string = JSON.stringify(object)
```

## string to array or object

```
var object = JSON.parse(string)
```

## string to int

```
<script>  
 var   str='1250' ;
 alert( Number(str) );  //得到1250

 alert(parseInt(str));  //得到1250

var str1='00100';

 alert( Number(str1) );  //得到100

 alert(parseInt(str1));  //得到64
```

发现parseInt方法在format'00'开头的数字时会当作2进制转10进制的方法进行转换，所以建议string转int最好用Number方法
