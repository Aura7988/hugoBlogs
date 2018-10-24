---
title: "让Vim每天自动执行命令"
date: 2018-10-24T00:22:13+08:00
lastmod: 2018-10-24T00:22:13+08:00
keywords: ["Vim"]
description: ""
tags: ["Vim"]
categories: ["Vim"]
author: ""

# You can also close(false) or open(true) something for this content.
# P.S. comment can only be closed
# comment: false
# toc: false
# autoCollapseToc: false
# You can also define another contentCopyright. e.g. contentCopyright: "This is another copyright."
# contentCopyright: false
# reward: false
# mathjax: false
---

## 背景

我用 [vim-plug](https://github.com/junegunn/vim-plug) 来管理 Vim 插件，该插件提供了两个命令用来更新它所管理的的插件。为了保持插件最新，一开始我每天手动执行一次更新命令，后来想到应该有什么方法可以让 Vim 每天自动执行这两个命令。
<!--more-->

## 解决方法

在 .vimrc 中添加如下内容：

```vim
au VimEnter * call <SID>OnceADay()

function! <SID>OnceADay()
	let s:vimrc = '/Users/aura/.vimrc'
	let s:vimrcDate = strftime("%Y%m%d", getftime(s:vimrc))
	let s:currDate = strftime("%Y%m%d")
	if s:vimrcDate != s:currDate
		:PlugUpdate | PlugUpgrade "此处放置需要自动执行的命令
		execute "silent !touch" s:vimrc
	endif
endfunction
```

不知道还有没有更好的解决方法？

## 参考

[使用脚本编写 Vim 编辑器](https://www.ibm.com/developerworks/cn/linux/l-vim-script-1/index.html)
