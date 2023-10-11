//********************************************
// Author      : se7enlcd                    *
// E-mail      : 2353442022@qq.com           *
// Create_Time : 2023-10-11 12:58            *
// Description :                             *
//********************************************

// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(
  title: "",
  abstract: [],
  authors: (),
  date: none,
  body,
) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(paper: "a4", margin: (x: 1cm, y: 1cm), numbering: "1", number-align: center)
  set text(font: "Linux Libertine", lang: "en")
  // set text(font: "SauceCodePro Nerd Font Mono", lang: "en")

  // Title row.
  align(center)[
    #block(text(weight: 700, 1.75em, title))
    #v(1em, weak: true)
    #date
  ]

  // Author information.
  pad(
    top: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center)[
        #author.name \
        #author.email
      ]),
    ),
  )

  // Abstract.
  pad(
    x: 2em,
    top: 1em,
    bottom: 1.1em,
    align(center)[
      #heading(
        outlined: false,
        numbering: none,
        // text(0.85em, smallcaps[Abstract]),
        text(0.85em, smallcaps[摘要]),
      )
      #abstract
    ],
  )

  // Main body.
  set par(justify: true, leading: 0.52em)

  body
}
