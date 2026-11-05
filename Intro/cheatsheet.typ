#set text(font: "Iosevka NF")
#set heading(numbering: "(1.1)")

#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot

#let arccotg = math.op("arccotg")
#let cotg = math.op("cotg")
#let arcctg = math.op("arcctg")
#let tg = math.op("tg")
#let arcsin = math.op("arcsin")
#let arccos = math.op("arccos")
#let rem = math.op("rem")
#let sgn = math.op("sgn")
#let dx = math.op("dx")
#let dy = math.op("dy")
#let du = math.op("du")
#let grad = math.op("grad")


#let important(body, caption: "") = align(center)[
  #if caption != "" {
    caption
    linebreak()
    box(stroke: black + 1.5pt, inset: 4pt)[#body]
  } else {
    box(stroke: black + 1.5pt, inset: 4pt)[#body]
  }
]


= Cheatsheet
== Parciální derivace, derivace v prostoru, gradient
=== Parciální derivace
#important(caption: "definice parciální derivace")[$
  (partial f)/(partial x_k) (x_1, x_2 space ... space x_k space ... space x_n) & := lim_(h -> 0) (f(x_1, x_2 space ... space x_k + h space ... space x_n) - f(x_1, x_2 space ... space x_k space ... space x_n))/h\
$]
#important(caption: "symetrie parciální derivace")[$
  (partial^2 f)/(partial x_k partial x_l) & = (partial^2 f)/(partial x_l partial x_k) \
$]
#important(caption: "derivace složené funkce")[$
  x_i (t): RR -> RR\
  (d f)/(d t) = (partial f)/(partial x_1) (d x_1)/(d t) + (partial f)/(partial x_2) (d x_2)/(d t) + ... + (partial f)/(partial x_n) (d x_n)/(d t) = sum_(i=1)^n (partial f)/(partial x_i) (d x_i)/(d t) \
$]
=== Derivace v prostoru
#important(caption: "parametrizace křivky v prostoru")[$
  A: RR -> RR^n\
  A(xi) "kde" xi "je obecný parametr"\
  A(r) "kde" r "je délka od nějakého počátku"\
$]
#important(caption: "tečný vektor")[$
  t^arrow & = lim_(Delta xi -> 0) (A(xi + Delta xi) - A(xi))/(Delta xi) := (d A)/(d xi) \
$]
=== Délka křivky
#important(caption: "délka křivky")[$
  s = integral_(xi_1)^(xi_2) norm(t^arrow) d xi\
$]
#pagebreak()
=== Gradient
#important(caption: "definice gradientu")[$
  "mějme" f: RR^n -> RR\
  "pak" nabla f = vec((partial f)/(partial x_1), (partial f)/(partial x_2), ..., (partial f)/(partial x_n)) "je vektorové pole"
$]
#important(caption: "gradient součtu")[$
  nabla (f + g) = nabla f + nabla g\
$]
#important(caption: "gradient součinu")[$
  nabla (f dot.op g) = (nabla f) g + (nabla g) f\
$]
#important(caption: "gradient kompozice")[$
  nabla (f compose g) = (f' compose g) nabla g\
$]
#important(caption: "gradient složené funkce více proměnných")[$
  nabla (f(g_1, g_2 ... g_n)) = (partial f)/(partial g_1) nabla g_1 + (partial f)/(partial g_2) nabla g_2 ... (partial f)/(partial g_n) nabla g_n = sum_(i=1)^n (partial f)/(partial g_i) nabla g_i\
$]
=== Integrály podél křivky
#important(caption: "integrál změny skalárního pole podél křivky")[$
  "mějme" f: RR^n -> RR " a " A: RR -> RR^n\
  "pak" integral_C nabla f dot.op d r^arrow = f(b) - f(a)\
  "kde" a = A(xi_1); space b = A(xi_2) "jsou krajní body křivky"\
  "jakákoliv křivka z" a "do" b "toto splňuje"\
$]

#important(caption: "integrál skalárního pole podél křivky")[$
  "mějme" f: RR^n -> RR " a " A: RR -> RR^n\
  "pak" integral_C f d s = integral_(xi_1)^(xi_2) (f compose A) norm(t^arrow) d xi\
$]
