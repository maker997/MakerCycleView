# MakerCycleView
很容易修改的无限轮播

![cycle](http://7xtc4k.com1.z0.glb.clouddn.com/cycle.gif)

> 使用

1. MakerCycleView轮播的视图传一个图片的数组
2. 添加MakerCycleView 并设置 frame

<!---more--->

> 控件的层级关系

![cycleVie](http://7xtc4k.com1.z0.glb.clouddn.com/cycleView.png)

>实现思路

1. 选择 scrollView 还是 CollectionView呢?
    
    CollectionView系统给实现了复用机制,不用担心性能问题.
    scrollView 要考虑复用机制,实现起来更麻烦.所以选择CollectionView
    
2. 怎么实现无限循环呢?
   
   思路一: CollectionView 把数据源放大到一万倍,让它一直滚啊滚.(不浪费么?)
   思路二: CollectionView 滚动到数据源的最后一张图片的时候,让其悄悄滚动的初始位置.
   
   对比:思路二不浪费,但是肯定会有卡顿感.思路一:用户应该不会没事儿一直盯着看它,看它是否能滚到头,CollectionView实现了复用机制,不会太浪费太多内存就采用这个方式吧.
   
>写代码

 1. 自定义 MakerCycleView  并创建CollectionView 和 pageControl
 2. 自定义 CollectionViewCell 添加 imageView 和 label
 3. 设置 CollectionView 属性显示.
 4. 监听数组的赋值![progress1](http://7xtc4k.com1.z0.glb.clouddn.com/progress1.png)


