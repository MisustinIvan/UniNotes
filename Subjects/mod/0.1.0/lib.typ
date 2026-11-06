#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot

#let boilerplate(body) = {
  set text(font: "Iosevka NF")
  set heading(numbering: "(1.1)")
  body
}

// spacing
#let sq = math.space.quad
#let pb = pagebreak

// weird functions
#let sgn = math.op("sgn")
#let rem = math.op("rem")
#let erf = math.op("erf")
#let argmax = math.op("argmax")

// differentials
#let dx = math.op("dx")
#let dy = math.op("dy")
#let du = math.op("du")

// trig functions
#let tg = math.op("tg")
#let arcctg = math.op("arcctg")
#let cotg = math.op("cotg")
#let arccotg = math.op("arccotg")

// hyperbolic functions and their inverses
#let cotgh = math.op("cotgh")
#let argsinh = math.op("argsinh")
#let arcsinh = math.op("arcsinh")
#let argcosh = math.op("argcosh")
#let arccosh = math.op("arccosh")
#let argtanh = math.op("argtanh")
#let arctanh = math.op("arctanh")
#let argcotgh = math.op("argcotgh")
#let arccotgh = math.op("arccotgh")

// vectors and derivatives
#let ar(body) = math.arrow(body)
#let dt(body) = math.accent(body, math.dot)
#let dtt(body) = math.accent(body, math.dot.double)
#let grad = math.op("grad")

// linear algebra
#let rank = math.op("rank")
#let nul = math.op("nul")
#let inv(body) = $body^(-1)$
#let span(..args) = $lr(chevron.l #args.pos().join($,$) chevron.r)$

// Matrix given by columns, separated by vertical lines.
// Usage: $matcol((1, 2), (3, 4))$
#let matcol(..cols, delim: "(", stroke: 0.5pt) = {
  let c = cols.pos()
  math.mat(
    c,
    delim: delim,
    augment: if c.len() > 1 {
      (vline: range(1, c.len()), stroke: stroke)
    } else {
      none
    },
  )
}

// Usage:
// #important($ nabla dot vb(B) = 0 $, caption: [Gauss's Law for Magnetism]) <gauss-mag>
// See @gauss-mag.
#let important(
  caption: none,
  border-color: rgb("d97706"),
  bg-color: rgb("fffbeb"),
  body,
) = {
  figure(
    block(
      width: auto,
      stroke: 1.5pt + border-color,
      fill: bg-color,
      inset: (x: 12pt, y: 10pt),
      radius: 4pt,
      breakable: false,
      align(center, body),
    ),
    caption: caption,
    kind: "equation",
    supplement: [Rov.],
  )
}

#let thm-counter = counter("theorem")
#let def-counter = counter("definition")

#let env-block(
  title: none,
  prefix: "",
  cnt: none,
  body,
  border-color: luma(80),
  bg-color: luma(250),
) = {
  block(
    width: 100%,
    stroke: (left: 3pt + border-color),
    fill: bg-color,
    inset: (x: 10pt, y: 10pt),
    outset: (left: 0pt),
    radius: (right: 3pt),
    breakable: true,
    [
      #if cnt != none {
        cnt.step()
      }
      #text(weight: "bold", fill: border-color)[
        #prefix
        #if cnt != none [ #context cnt.display() ]
        #if title != none [ (#title) ]
      ]
      #v(3pt)
      #body
    ],
  )
}

#let definition(title: none, body) = env-block(
  title: title,
  prefix: "Definice",
  cnt: def-counter,
  body,
  border-color: rgb("1d4ed8"),
  bg-color: rgb("eff6ff"),
)

#let theorem(title: none, body) = env-block(
  title: title,
  prefix: "Věta",
  cnt: thm-counter,
  body,
  border-color: rgb("047857"),
  bg-color: rgb("ecfdf5"),
)

// claim, lemma and corollary share the theorem counter
#let claim(title: none, body) = env-block(
  title: title,
  prefix: "Tvrzení",
  cnt: thm-counter,
  body,
  border-color: rgb("0e7490"),
  bg-color: rgb("ecfeff"),
)

#let lemma(title: none, body) = env-block(
  title: title,
  prefix: "Lemma",
  cnt: thm-counter,
  body,
  border-color: rgb("6d28d9"),
  bg-color: rgb("f5f3ff"),
)

#let corollary(title: none, body) = env-block(
  title: title,
  prefix: "Důsledek",
  cnt: thm-counter,
  body,
  border-color: rgb("4d7c0f"),
  bg-color: rgb("f7fee7"),
)

#let proof(title: none, body) = {
  block(
    width: 100%,
    stroke: (left: 1.5pt + luma(160)),
    inset: (left: 10pt, y: 4pt),
    breakable: true,
    [
      #text(style: "italic", fill: luma(70))[
        Důkaz#if title != none [ (#title)]:
      ]
      #v(2pt)
      #body
      #align(right)[#v(-0.5em)QED $square.big$]
    ],
  )
}
