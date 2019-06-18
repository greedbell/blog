# 布局方式

## AutoLayout

自动布局

## Size Classes

各个端取不同的值

## Vary for Trait

特征变量(Trait Variations)

在 Xcode8 中删除了 `size class` 选项，取而代之的是 `Use Trait Variations`

完成不同平台不同布局的使用方法：

选中某个组件 > View as: ****，选择布局需要特殊处理的平台，譬如 iPad > Vary for Trait > 勾上 Width 和 Height > 修改布局 > Done Varying。
