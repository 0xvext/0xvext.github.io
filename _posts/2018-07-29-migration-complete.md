---
title: 'Migration Complete'
date: '2018-07-29 01:24:00'
tags: jekyll githubpages availability
---

Well, that took longer than planned.

After some issues with self-hosting the blog via [Ghost](https://ghost.org) software, I decided to migrate to static content using [Jekyll](https://jekyllrb.com) and [Github Pages](https://pages.github.com). I ran into some challenges along the way, partially a result of learning new platforms, some quirks with the documentation for Jekyll, and partially due to some other priorities I had to focus on.

All that is sorted, finally, and the page is back up, and if I say so myself, better than ever. I still have some tweaks to apply style-wise, and I need to fix some older "perma" links that weren't so permanent, after all.

This is my first new post since the migration, so I am still learning the workflow. I will likely write up my overall experience with the migration and the use, once I feel a bit more comfortable and have an idea of the ins and outs.

To do:
* Fix old permalinks
* Fix formatting issues on a blog post or two
* Optimize workflow
* Write up thoughts on the overall experience.

Below are tests of various markdown 

---


# H1 header

## H2 header

### H3 header

#### H4 header

##### H5 header

###### H6 header

`command`

```
Block of code
Multiline supported
```

~~~ ruby
First line in code of a named language
Second line
Third line
~~~

---
^ Inserts a horizontal rule

1. Ordered list item 1
	1. Sub item
2. Ordered list item 2

3. Same ordered list

Paragraph

1. New ordered list (after another para)

* Unordered list item 1
* Unordered list item 2

Term
: Definition for term


| Header1 | Header2 | Header3 |
|:--------|:-------:|--------:|
| cell1   | cell2   | cell3   |
| cell4   | cell5   | cell6   |
|----
| cell1   | cell2   | cell3   |
| cell4   | cell5   | cell6   |
|=====
| Foot1   | Foot2   | Foot3

A [link](http://example.com) to a page.

A [link][examplecom] to a page.

[examplecom]: http://example.com

A link to the [example site].

[example site]: http://example.com

An image: ![gras](img/image.jpg)

This is a text with a footnote[^1].

[^1]: And here is the definition.

This is an HTML example.

*[HTML]: Hyper Text Markup Language

This is *red*{: style="color: red"}.

**bold** or *italics* or **_both_** or ~~strikethrough~~. 

