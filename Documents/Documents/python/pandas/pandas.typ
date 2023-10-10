//********************************************
// Author      : se7enlcd                    *
// E-mail      : 2353442022@qq.com           *
// Create_Time : 2023-10-08 20:12            *
// Description :                             *
//********************************************

#import "@preview/rubby:0.9.2": get-ruby
#import "@preview/codelst:1.0.0": sourcecode
#import "@preview/tablex:0.0.5": tablex, rowspanx, colspanx

#set page(paper: "a4", margin: (x: 1cm, y: 0.5cm))
#set document(title: "Hello", author: "lcdse7en")
#set text(font: ("Linux Libertine", "Noto Serif CJK SC"))
#show emph: e => {
  set text(font: "Cascadia Code")
  e
}
#let ruby = get-ruby(
  size: 0.5em,
  dy: 0pt,
  pos: top,
  alignment: "center",
  delimiter: "|",
  auto-spacing: true,
)

#let amazed(term, color: purple) = {
  text(color, box[✨ #term ✨])
}
You are #amazed[beautiful]! I am #amazed(color: purple)[amazed]! nihao showem
#typst.app(www.baidu.com)
