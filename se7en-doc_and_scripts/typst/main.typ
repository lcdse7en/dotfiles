#import "@preview/rubby:0.9.2": get-ruby
#import "@preview/codelst:1.0.0": sourcecode
#import "@preview/tbl:0.0.4"

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
#show: tbl.template.with(box: true, tab: "|")

#show emph: e => {
    set text(font: "Cascadia Code")
    e
    }
= Part 1: Why typst
// #figure(
//     image("./images/001.jpeg"),
//     caption: [nihao],
//     )
#sourcecode[```typ
#show "ArtosFlow": name => box[
  #box(image( "logo.svg", height: 0.7em,)) #name ] This report is embedded in the ArtosFlow project. ArtosFlow is a
project of the Artos Institute.
```]
#include "./documents/part-1/1.typ"

Treat each kanji as a separate word:
#ruby[とう|きょう|こう|ぎょう|だい|がく][東|京|工|業|大|学]
// #ruby[shije][使得|简介]

Hello world _Hello world_

owme
shide
```tbl
      R | L
      R |  N.
software|version
_
     AFL|2.39b
_
    Mutt|1.8.0
_
    Ruby|1.8.7.374
    _
TeX Live|2015
```
```{=typst}
#set par(justify: true)

== Background
In the case of glaciers, fluid dynamics principles can be used to understand how the movement and behavior of the ice is influenced by factors such as temperature, pressure, and the presence of other fluids (such as water).
```
nihao
smweo

#ruby[shie][shiej]
#sourcecode[```python
import pandas as pd
```]

한국
wome
shide
shide



shao
