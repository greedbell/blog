# gets 获取输入

## Ruby中gets和gets.chomp()

gets和gets.chomp()都表示读入用户的输入并用于输出，但两者还是有所不同，其中gets是得到的内容后，在输出时后面接着换行；而gets.chmop()得到的内容输出时后面不带空格和换行。

例如：

```ruby
print "How old are you? " # input 29yrs
age = gets.chomp()
print "How tall are you? " # input 168cm
height = gets.chomp()
print "How much do you weigh? " # input 62kg
weight = gets
puts "So, you're #{age} old, #{height} tall and #{weight} heavy."
```

运行结果：

```ruby
So, you're 29yrs old, 168cm tall and 62kg
 heavy.
```

## GetoptLong
