---
title: How to resize images in Ghost
date: '2017-08-22 01:23:25'
tags: ghost
---

The current version of Ghost does not support image resizing, so the workaround for now is to use HTML tags with some CSS crammed in:

`<img alt="Image Description" src="/content/images/my-image.png" style="width: 300px; height:300px">`

Not a best practice, but since it is only height and width there shouldn't be any major problems as a result.

Solution originally from https://www.wdiaz.org/how-to-resize-images-on-ghost/. Thanks to [wdiaz](https://www.wdiaz.org/).

And for including the above code inline, the backtick (\`) is used, per the [Ghost Markdown guide](https://help.ghost.org/hc/en-us/articles/224410728-Markdown-Guide).

