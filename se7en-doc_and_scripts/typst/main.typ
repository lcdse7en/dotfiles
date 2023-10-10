#import "@preview/rubby:0.9.2": get-ruby
#import "@preview/codelst:1.0.0": sourcecode
#import "@preview/tablex:0.0.5": tablex, rowspanx, colspanx
#import "@preview/colorful-boxes:1.2.0": *

#set page(
  paper: "a4",
  margin: (x: 1cm, y: 0.5cm),
)
#set document(
    title: "Hello",
    author: "lcdse7en",

)
// #show: paper.with(
//     title: [Typst],
//     date: [May 17th, 2022],
//     )

#set text(font: ("Linux Libertine", "Noto Serif CJK SC"))
#let ruby = get-ruby(
    size: 0.5em,
    dy: 0pt,
    pos: top,
    alignment: "center",
    delimiter: "|",
    auto-spacing: true,
    )

#show emph: e => {
    set text(font: "Cascadia Code")
    e
    }
= Part 1: Why typst
// #figure(
//     image("./images/001.jpeg"),
//     caption: [nihao],
//     )
#figure(
  image("./src/images/001.jpeg", width: 70%),
  caption: [
    _Glaciers_ form an important part
    of the earth's climate system.
  ],
)
#sourcecode[```typ
#show "ArtosFlow": name => box[
  #box(image( "logo.svg", height: 0.7em,)) #name ] This report is embedded in the ArtosFlow project. ArtosFlow is a
project of the Artos Institute.
```]
#include "./src/part-1/1.typ"

Treat each kanji as a separate word:
#ruby[とう|きょう|こう|ぎょう|だい|がく][東|京|工|業|大|学]
// #ruby[shije][使得|简介]

Hello world _Hello world_

#ruby[shie][shiej]
#sourcecode[```python
import pandas as pd
```]

한국
哦我们解决解决
