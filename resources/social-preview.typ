#set page(
  width: 1280pt,
  height: 640pt,
  margin: 40pt,
  fill: rgb("#0A192F"),
)

#set text(
  font: "Inter",
  fill: white,
)

#grid(
  columns: (300pt, 2pt, 1fr),
  column-gutter: 20pt,
  rows: (560pt,),

  // Logo
  [
    #align(center + horizon)[
      #image("logo.svg", width: 240pt)
    ]
  ],

  // Vertical separator
  [
    #align(center + horizon)[
      #rect(
        width: 2pt,
        height: 380pt,
        radius: 2pt,
        fill: rgb("#D0D7DE"),
      )
    ]
  ],

  // Right column
  [
    #box(
      width: 1fr,
      height: 380pt,
      align(top + left)[
        #v(128pt)

        #text(size: 120pt, weight: "bold")[
          oorexx-
        ]

        #v(-180pt)

        #text(size: 160pt, weight: "extrabold")[
          gnuplot
        ]

        #v(-140pt)
        #rect(
          width: 200pt,
          height: 3pt,
          radius: 2pt,
          fill: rgb("#2EBE4F")
        )

        #v(-20pt)
        #text(size: 32pt, fill: rgb("#D0D7DE"))[
          Native Gnuplot library for #text(fill: rgb("#2EBE4F"))[Open Object Rexx]
        ]
      ]
    )

    #v(1fr)

    #h(1fr)
    #align(right)[
      #text(
        size: 25pt,
        fill: rgb("#D0D7DE")
      )[
        Apache-2.0 #text(fill: rgb("#2EBE4F"))[• ooRexx 5.x]
      ]
      #h(40pt)
    ]
    #v(40pt)
  ],
)
