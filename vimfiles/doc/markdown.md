
<style>
    html {
        scroll-behavior: smooth;
    }
    .toc {
        float: right;
        position: sticky;
        top: 10px;
        padding: 0px 5px;
        background-color: var(--background-color);
        border: 1px solid var(--border-color);
        border-radius: 3px;
    }
    .table-of-contents {
        visibility: hidden;
        opacity: 0;
        transition-duration: 0.5s;
        position: absolute;
        right: 0px;
        width: max-content;
        padding: 10px 10px 0px 0px;
        background-color: var(--color-bg-primary);
        border: 1px solid var(--color-border-primary);
        border-radius: 3px;
    }
    .toc:hover .table-of-contents {
        visibility: visible;
        opacity: 1;
    }
</style>
<div class="toc">
目录

[toc]
</div>

`#` 或次行任意数量 `=`
#       一级标题
`##` 或次行任意数量 `-`
##      二级标题
`###`
###     三级标题
`####`
####    四级标题
`#####`
#####   五级标题
`######`
######  六级标题

两个及以上 ` ` 或单个 `\` 或单个 `<br>` 换行  
空白行分段

三个及以上 `-` 或 `*` 或 `_`

---

行内 `*` 或 `_` 包围 *斜体*  
行内 `**` 或 `__` 包围 **粗体**  
行内 `***` 或 `___` 包围 ***粗斜体***  
行内 `~~` 包围 ~~删除线~~  
行内数量匹配的`` ` ``包围 `行内代码`  

缩进

    一般代码块

行间三个及以上数量匹配的`` ` ``或 `~` 包围
``` c++
围栏代码块
支持语法高亮
#pragma once
```

行内 `$` 包围行内公式 $E=mc^{2}$

行间 `$$` 包围行间公式
$$
E=mc^{2}
$$

`>`
>   块引用
>>  可以嵌套
>>  +   其它元素

`1.`
1.  有序列表
    1.  可以嵌套
        >   其它元素

`+` 或 `-` 或 `*`
+   无序列表
    +   可以嵌套
        >   其它元素

`+ [x]` 或 `-[x]` 或 `* [x]`
+ [x]   已完成

`+ [ ]` 或 `-[ ]` 或 `* [ ]`
+ [ ]   未完成

```
term
: definition
```

术语
: 定义

表格

    |   |   | ...
    |---|---| ...
    |   |   | ...
     ... ...  ...

|`:-`|`:-:`|`-:`|
|:-----|:----:|-----:|
|左对齐|中对齐|右对齐|

`href`
https://github.com/vanMiaow

`<href>`
<https://github.com/vanMiaow>

`[a](href)`
[链接](https://github.com/vanMiaow)

`[a](href title)`
[带标题的链接](https://github.com/vanMiaow "标题")

    [a][ref]
    [ref]: href

[引用链接][ref]

[ref]: https://github.com/vanMiaow

    [a][ref-title]
    [ref-title]: href title

[带标题的引用链接][ref-title]

[ref-title]: https://github.com/vanMiaow "标题"

    ![alt](src)
    ![alt](src title)
    ![alt][ref]
    ![alt][ref-title]

[![vanMiaow](https://avatars.githubusercontent.com/u/16370370 "图片用法同链接，可以作为链接使用，标题优先级高于链接")][ref-title]

    <img src= alt= title= width= height= />

<img src="https://avatars.githubusercontent.com/u/16370370" title="也可通过html标签插入图片并设置大小" width="10%" />

    [^1]
    [^1]: footnote

脚注参考:point_down:[^1]
[^1]: 脚注:point_up:

