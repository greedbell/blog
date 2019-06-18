# Other

## `block _property`

直接用私有变量有个需要特别注意的地方，在 block 里直接写 `_property` 相当于 `self->_property`，虽然没写 self，但是暗含了对 self 的retain，容易造成循环引用。要记得用 weakSelf/strongSelf 大法。
