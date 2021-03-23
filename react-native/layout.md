# 界面布局

## iOS

### RCTShadowView

和 yogaNode 建议映射

### RCTUImanager

把 yoga 计算的布局结果同步到原生界面

RCTUImanager: setNeedsLayout > _layoutAndMount > `[self addUIBlock:[self uiBlockWithLayoutUpdateForRootView:rootView]]` > flushUIBlocksWithCompletion

### RCTUIManagerObserver

渲染生命周期监听

## Android
