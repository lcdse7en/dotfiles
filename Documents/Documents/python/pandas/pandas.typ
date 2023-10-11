//********************************************
// Author      : se7enlcd                    *
// E-mail      : 2353442022@qq.com           *
// Create_Time : 2023-10-08 20:12            *
// Description :                             *
//********************************************
#import "template.typ": *
#import "@preview/rubby:0.9.2": get-ruby
#import "@preview/codelst:1.0.0": sourcecode
#import "@preview/tablex:0.0.5": tablex, rowspanx, colspanx

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "pandas",
  authors: (
    (name: "Author: lcdse7en", email: "Email: 2353442022@qq.com"),
    (name: "lcdse7en", email: "2353442022@qq.com"),
  ),
  // Insert your abstract after the colon, wrapped in brackets.
  // Example: `abstract: [This is my abstract...]`
  abstract: lorem(59),
  date: "October 11, 2023",
)

// #set page(paper: "a4", margin: (x: 1cm, y: 0.5cm))
// #set document(title: "Hello", author: "lcdse7en")
// #set text(font: ("Linux Libertine", "Noto Serif CJK SC"))
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
// #typst.app(www.baidu.com)
= 沃尔玛
= shie
#link("www.baidu.com")
