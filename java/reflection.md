# 反射

Java反射机制可以让我们在编译期（Compile Time）之外的运行期（Runtime）获得任何一个类的字节码。包括接口、变量、方法等信息。还可以让我们在运行期实例化对象，通过调用get/set方法获取变量的值。

使用Java反射API的时候可以绕过Java默认的访问控制检查，比如可以直接获取到对象的私有域的值或是调用私有方法。只需要在获取到Constructor、Field和Method类的对象之后，调用setAccessible方法并设为true即可。有了这种机制，就可以很方便的在运行时刻获取到程序的内部状态。

代理模式：代理对象和被代理对象一般实现相同的接口，调用者与代理对象进行交互
动态代理：允许开发人员在运行时刻动态的创建出代理类及其对象。

## Questions

`public final class` `getDeclaredFields()` 获取不到所有 field

## References

* [Java 反射机制](http://wiki.jikexueyuan.com/project/java-reflection/)
* <https://www.zhihu.com/question/47054187>
