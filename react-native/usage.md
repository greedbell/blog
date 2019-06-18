# 使用

## props 和 state

props是在父组件中指定，而且一经指定，在被指定的组件的生命周期中则不再改变。 对于需要改变的数据，我们需要使用state。

## Modal

react native 自带的 Modal iOS present 原理：取 Modal 父组件所属的 ViewController present ModalViewController。
