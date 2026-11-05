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

#let plotting_enabled = false

#let plot_func(f, range, label: "", size: (10, 5)) = align(center)[
  #if plotting_enabled {
    cetz.canvas({
      import cetz.draw: *

      let (x_min, x_max) = range

      plot.plot(
        size: size,
        x-tick-step: 0.5,
        y-tick-step: 5,
        x-min: float(x_min),
        x-max: float(x_max),
        {
          plot.add(
            f,
            domain: (x_min, x_max),
            samples: 100,
            style: (stroke: black + 1.5pt),
            label: label,
          )
        },
      )
    })
  } else {
    ""
  }
]

= Rovnice a nerovnice v reálném oboru
== lineární rovnice
$
  2x + 3 & = 0 \
      2x & = -3 \
       x & = -3/2 \
$

== lineární nerovnice
$
  2x + 3 & >= 0 \
      2x & >= -3 \
       x & >= -3/2 \
       x & in chevron -3/2; +infinity) \
$

== součinový tvar

$
  (x-2)(2x+3) & = 0 \
        (x-2) & = 0 \
         => x & = 2 \
       (2x+3) & = 0 \
         => x & = -3/2 \
            x & in {-3/2, 2}
$

==
$
  (x^3 - x)(2x^2 - 1) & = 0 \
           x(x^2 - 1) & = 0 \
                 => x & = 0 \
                 => x & = -1 \
                 => x & = 1 \
             2x^2 - 1 & = 0 \
                  x^2 & = 1/2 \
                 => x & = 1/sqrt(2) \
                 => x & = -1/sqrt(2) \
                    x & in {0, -1, -1/sqrt(2), 1/sqrt(2), 1}
$

==

$
  (3-x)^2 (x-1)(sqrt(2)-x) & >= 0 \
                   (3-x)^2 & >= forall x in RR \
                       x-1 & >= 0 => x >= 1 \
                 sqrt(2)-x & >= 0 => x <= sqrt(2) \
                      => x & in [1,sqrt(2)] union {3}
$

==

$
    2x-3 & >= (x+1)/2 \
  4x - 6 & >= x+1 \
      3x & >= 7 \
       x & >= 7/3 \
       x & in [7/3, +infinity)
$

== Soustava nerovnic

===
$
  2x + 3 & <= x+1 \
      4x & > 4-x \
         \
       x & <= -2 \
      5x & > 4 \
         \
       x & <= -2 \
       x & > 4/5 \
         \
       x & in (-infinity, -2] inter (4/5, infinity) equiv emptyset
$

===
$
  3x + 1 & > 0 \
     x-1 & < 10 \
         \
       x & > -1/3 \
       x & < 11 \
         \
       x & in (-1/3, +infinity) inter (-infinity, 11) equiv (-1/3, 11)
$

===
$
           (x-2)/(x+6) & >= -2 \
       (x-2)/(x+6) + 2 & >= 0 \
  (x-2 + 2(x+6))/(x+6) & >= 0 \
         (3x+10)/(x+6) & >= 0 \
                       \
                 3x+10 & >= 0 => x in [-10/3, +infinity) \
                   x+6 & >= 0 => x in [-6, +infinity) \
                     x & in [-10/3, +infinity) inter [-6, +infinity) equiv [-10/3, + infinity) \
                       \
                 3x+10 & <= 0 => x in (-infinity, -10/3] \
                   x+6 & <= 0 => x in (-infinity, -6] \
                     x & in (-infinity, -10/3] inter (-infinity, -6] equiv (-infinity, -6] \
                       \
                     x & != -6 \
                     x & in RR without [-6, -10/3) \
$

== Absolutní hodnota
===

$
  |x-5| & = 2 \
    x-5 & = 2 \
   => x & = 7 \
    x-5 & = -2 \
   => x & = 3 \
      x & in {3,7} \
$

=== z toho plyne že: (geometrický význam)
$
  |x-5| & < 2 \
      x & in (3,7) \
$

===

$
                              |x-2|+|2x-8| & = 5 \
                            "nulové body": \
  "lineární funkce na každém intervalu..." \
                              x = 2; x = 4 \
                                         x & in (-infinity, 2): \
                              -x+2 + -2x+8 & = 5 \
                                       -3x & = -5 \
                                         x & = 5/3 \
                                       5/3 & in (-infinity, 2) \
                                           \
                                         x & in (2, 4): \
                               x-2 -2x + 8 & = 5 \
                                        -x & = -1 \
                                         x & = 1 \
                                         1 & in.not (2,4) \
                                           \
                                         x & in (4, +infinity): \
                                x-2 + 2x-8 & = 5 \
                                   3x - 10 & = 5 \
                                         x & = 5 \
$

=== nerovnice s abs. hodnotou

$
  (2x - 4)/(|2-4x|) & >= 1 \
                  x & eq.not 1/2 \
             2x - 4 & >= |2-4x| \
                    \
                  x & in (-infinity, 1/2): \
             2x - 4 & >= 2-4x \
                 6x & >= 6 \
                  x & >= 1 \
                  x & in (-infinity, 1/2) inter [1, +infinity) equiv emptyset \
                    \
                  x & in (1/2, +infinity): \
             2x - 4 & >= -2+4x \
                -2x & >= 2 \
                  x & <= -1 \
                  x & in (1/2, +infinity) inter (-infinity, -1] equiv emptyset \
                    \
                  x & in emptyset \
$

=== trojúhelníková nerovnost
$
              |x+y| & <= |x|+|y| \
  |sum_(n=1)^m x_n| & <= sum_(n=1)^m |x_n|
$

== Lineární rovnice o více neznámých
===
$
           2x - y & = x + 3y - 1 \
  "hledáme" (x,y) & in RR times RR equiv RR^2 \
                x & = 4y - 1 \
                y & = 1/4 x + 1/4 \
                  \
                M & = {(4y-1; y)|y in RR} equiv {(x; 1/4 x + 1/4)|x in RR} \
            (x,y) & in M \
                  & equiv (-1, 0) + y(4,1); y in RR -> "parametrizace přímky"
$

=== obecná rovnice roviny -> parametrické vyjádření

$
       3x + 2y + z & = 5 \
                 M & = {(x,y,z) in RR^3|3x + 2y + z = 5} \
  "parametrizace": \
                   \
                 y & = e in RR \
                 z & = s in RR \
    => 3x + 2e + s & = 5 \
              => x & = (5 - 2e - s)/3 \
                   \
              rho: \
                 x & = 5/3 - (2e)/3 - s/3 \
                 y & = e \
                 z & = s \
                 M & = {(5/3, 0, 0) + e(-2/3,1,0) + s(-1/3, 0, 1)|e,s in RR}
$

== Soustava lineárních rovnic

$
                      -x + 5y & = -12 \
                       x - 4y & = 15 \
                              \
                        0 + y & = 3 \
                              \
                       x - 12 & = 15 \
                            x & = 27 \
                              \
  mat(-1, 5, 12; 1, -4, -15;)
$

$
            (x-1)(y+4) & = (x+3)(y-1) \
            (x-2)(y+2) & = x(y-2) \
                       \
      x y + 4x - y - 4 & = x y -x+3y -3 \
      x y + 2x -2y - 4 & = x y -2x \
                       \
            4x - y - 4 & =-x+3y -3 \
            2x -2y - 4 & =-2x \
                       \
           5x - 4y - 4 & = -3 \
            4x -2y - 4 & = 0 \
                       \
               5x - 4y & = 1 \
                4x -2y & = 4 \
        => mat(
          5, -4, |, 1;
          4, -2, |, 4
        ) \
  equiv mat(
    -3, 0, |, -7;
    4, -2, |, 4
  ) times vec(x, y, 1) \
                     x & = 7/3 \
                2x - y & = 2 \
              14/3 - y & = 2 \
                     y & = 14/3 - 2 \
                     y & = 8/3 \
                 (x,y) & = (7/3, 8/3)
$

=== Gaussova eliminace

$
                  x+2y & = 1 \
                 2x+4y & =4 \
  equiv mat(
    1, 2, |, 1;
    2, 4, |, 4;
  ) times vec(x, y, 1) \
  equiv mat(
    1, 2, |, 1;
    0, 0, |, 2;
  ) times vec(x, y, 1) \
              => (x,y) & in emptyset
$

=== se třemi neznámými

$
    x-2y+z & = 1 \
  -x+3y+2z & = 0 \
   2x-y+5z & =5 \
           \
  equiv mat(
    1, -2, 1, |, 1;
    -1, 3, 2, |, 0;
    2, -1, 5, |, 5;
  )        & times vec(x, y, z, 1) \
  equiv mat(
    1, -2, 1, |, 1;
    0, 1, 3, |, 1;
    2, -1, 5, |, 5;
  )        & times vec(x, y, z, 1) \
  equiv mat(
    1, -2, 1, |, 1;
    0, 1, 3, |, 1;
    0, 3, 3, |, 3;
  )        & times vec(x, y, z, 1) \
  equiv mat(
    1, -2, 1, |, 1;
    0, 1, 3, |, 1;
    0, 0, -6, |, 0;
  )        & times vec(x, y, z, 1) \
  equiv mat(
    1, -2, 0, |, 1;
    0, 1, 0, |, 1;
    0, 0, -6, |, 0;
  )        & times vec(x, y, z, 1) \
  equiv mat(
    1, 0, 0, |, 3;
    0, 1, 0, |, 1;
    0, 0, -6, |, 0;
  )        & times vec(x, y, z, 1) \
   (x,y,z) & = (3,1,0) \
     mat()
$

=== nerovnice type shit

$
  3x + 2y & >= 6 \
     x+2y & <= 4 \
          \
  3x + 2y & = 6 \
     x+2y & = 4 \
          \
  mat(
    1, 2, |, 4;
    3, 2, |, 6;
  )       & times vec(x, y, 1) \
  equiv mat(
    1, 2, |, 4;
    0, -4, |, -6;
  )       & times vec(x, y, 1) \
  equiv mat(
    1, 0, |, 1;
    0, -4, |, -6;
  )       & times vec(x, y, 1) \
        x & = 1 \
        y & = 3/2 \
$
dannou polorovinu určím např. dosazením bodu do nerovnice\
=> výsledek je průnikem obou polorovin\
=> hodí se grafické znázornění\

== Kvadratická rovnice

$
  a x^2 + b x + c & = 0 \
          x_(1,2) & = (-b +- sqrt(b^2 - 4 a c))/(2 a) \
                D & = sqrt(b^2 - 4 a c) \
$

=> vzorec odvozen doplněním na čtverec v normovaném tvaru kvadratické rovnice\
=> řešení $RR$ pro $D >= 0$\
=> pro $D >= 0$ můžeme $a x^2 + b x + c$ rozložit na $a(x-x_1)(x-x_2)$ => vztahy mezi kořeny a koeficienty(Vietovy vztahy)\
=> $x_1 x_2 = c/a$ a $x_1 + x_2 = b/a$\
=> $x_1 x_2 = -p$ a $x_1 + x_2 = q$\
\
\
=> grafem parabola => bod souměrnosti v $-b/(2a)$  a kořeny o $+- sqrt(D)/(2a)$ do stran

=== příklad

$
        3x^2 + 4x + 2 & > 0 \
        3x^2 + 4x + 2 & = 0 \
                    D & = 4^2 - 4*3*2 = 16-24 = -8 \
                    D & < 0 => "neprotíná osu x" \
  "parabola konkávní" & => "nad osou x" \
                    x & in RR \
$

===
$
     |y^2+2y-3| & > 2y + 1 \
  => (y^2+2y-3) & = (y-1)(y+3) \
        "pro" x & in (-infinity, -1): \
       y^2+2y-3 & > 2y + 1 \
       "tbd"... \
        "pro" x & in (-1, 3): \
      -y^2-2y+3 & > 2y + 1 \
       "tbd"... \
        "pro" x & in (3, +infinity): \
       y^2+2y-3 & > 2y + 1 \
       "tbd"... \
$

=> znázorni si to graficky retarde

=== soustava lineární a kvadratické rovnice
$
  x^2 + y^2 & = 25 "(kružnice)" \
     3x - t & = 5 "(přímka)" \
            \
            & => "vyjádříme x a y z přímky, vyřešíme 2 kvad. rovnice pro x a y"
$

#pagebreak()
= Elementární funkce
- zabýváme se zatím jen $f: RR -> RR$
- stanoveno dohodou
  - polynomy $arrow.l$ (1, x) + konečný počet algebraických operací (+,-,\*,/) + skládání funkcí + inverze
  - goniometrické funkce $arrow.l$ ($sin x$), $cos x = sin(x + pi/2)$, $tg x = sin(x)/cos(x)$, $cot = cos(x)/sin(x)$
  - exponenciální $e^x$ => $a^x$, $a != 0; a > 0$
    - inverzní $ln x, log_a(x)$

  -> $1, x, sin x, e^x$ + všechny funkce které vytvoříme konečným počtem 4 algebraických operací, skládáním a inverzí(zúžení def. oboru)

== inverzní funkce k $f(x) = x^2$
$
                D(x^2) & = RR \
                H(x^2) & = chevron 0, +infinity) \
                       \
             f^(-1)(x) & = sqrt(x) \
  "jen kladná část..."
$

- $x^2$ nemá inverzní funkci - *není prostá v $RR$*

$
  f^~(x) = f(x) slash_(chevron 0, +infinity\))\
  => "omezím definiční obor - vytvořím novou funkci"
$

- aplikací funkce na inverzní funkci je identita

$
  f(f^(-1)(x)) & = x \
$

- v opačném případě mi může vyjít něco jiného, pokud nejsem jen v oblasti vzájemné jednoznačnosti
$
  f^(-1)(f(x)) & ="(nemusí)" x \
$

=== mocniny idk
$
  x^(n+1) > x^n "pro" x > 1\
$
$
  x^(n+1) < x^n "pro" x in (0,1)\
$

#pagebreak()
=== inverzní funkce k $sin(x)$

$
            f(x) & = sin(x) \
       f^(-1)(x) & = (f(x) slash_(chevron-pi/2,pi/2 chevron.r))^(-1) := arcsin(x) \
       sin x = y & <=> arcsin y = x \
               x & in chevron-pi/2,pi/2 chevron.r \
               y & in chevron -1,1 chevron.r \
                 \
  sin(arcsin(x)) & = x "je ok pro" x in chevron-1,1 chevron.r \
$
#plot_func(x => calc.sin(calc.asin(x)), (-1, 1), label: "sin(arcsin(x))")\
$
  arcsin(sin(x)) & = x "je ok pro" x in chevron-pi/2,pi/2 chevron.r \
  arcsin(sin(x)) & "je něco jiného" x in RR without chevron-pi/2,pi/2 chevron.r \
  arcsin(sin(x)) & "tbd..." \
$


=== definice $sin x$
- asi taylorův polynom idk
$
  x - (x^3)/(3!) + (x^5)/(5!) - (x^7)/(7!) + (x^9)/(9!)...
$

=== idk, kvalifikované hádání
- Gaussova věta nebo co?
- pro rovnice s celočíselnými koeficienty idk
$
        x^3 + 2x^2 + 2x + 1 & = 0 \
                            \
                     3x - 6 & = 0 \
                    x = 2/1 & = 6/3 \
                            \
                 "čitatelé" & : 1,-1 \
              "jmenovatelé" & : 1 \
  "kandidáti na rac. kořen" & : 1,-1 \
$

- co to kurva je
$
      2x^3 -15x^2 + 31x -12 & = 0 \
                 "čitatelé" & : 1,2,3,4,6,12 \
              "jmenovatelé" & : 1,-1,2,-2 \
  "kandidáti na rac. kořen" & : +-1,+-2,+-3,+-4,+-6,+-12, +-1/2, +-3/2 \
$
=== Gaussova věta
- máme polynom n-tého stupně $a_n x^n + a_(n-1) x^(n-1) ... a_1 x + a_0$
- nechť tento polynom má racionální kořen $p/q$ kde $p,q$ jsou nesoudělná, $p,q in ZZ$\ a $a_0, a_n != 0$
- tvrzení: $p|a_0$ a $q|a_n$ => hledej $p$ mezi děliteli $a_0$ a $q$ mezi děliteli $a_n$
- důkaz:
$
          a_n (p/q)^n + a_(n-1)(p/q)^(n-1) + ... + a_n p/q + a_0 & = 0 \/ *q^n \
       a_n p^n + a_(n-1)p^(n-1)q + ... + a_n p q^(n-1) + a_0 q^n & = 0 \
  a_n p^n = -( a_(n-1)p^(n-1)q + ... + a_n p q^(n-1) + a_0 q^n ) & = 0 \
$

- dokazuje proč $sqrt(2)$ není racionální -> tbd, dokaž
- $root(k, n)$ je buď celé číslo nebo iracionální -> tbd, dokaž
  - hint $x^k - n$ = 0

#image("photo_2026-09-21_16-58-23.jpg")

== Exponenciála a přirozený logaritmus jako inverzní funkce
$
  e := lim_(n->infinity) (1 + 1/n)^n\
  "špatné odhady limity:"\
  lim_(n->infinity) (1 + 1/n)^n = 1 space crossmark space lim_(n->infinity) (1 + 1/n)^n = infinity space crossmark\
  "reálná hodnota:"\
  lim_(n->infinity) (1 + 1/n)^n = 2.7182... space checkmark\
  "aproximace podobná jako pro sinx"\
  lim_(n->infinity) (1 + 1/n)^n = 1 + 1/1 + 1/(2!)+ 1/(3!)+ 1/(4!) ...
$

#pagebreak()
#plot_func(calc.exp, (-2, 2), label: "e^x nebo také exp(x)")

$
  forall x in RR: e^x > 0
$

- $e^x$ je prostá na celém jejím $D(f)$\ -> pro tvorbu inverzní funkce nemusíme uměle omezovat $D(f)$

$
  (e^x)^-1 & := ln(x) "(logaritmus naturalis)" \
    D(e^x) & = RR \
    H(e^x) & = (0, +infinity) \
  D(ln(x)) & = (0, +infinity) \
  H(ln(x)) & = RR \
$

#important(caption: "vlastnosti logaritmu a exponenciály jako inverzních funkcí")[
  $
                forall x in RR: ln(e^x) & = x \
    forall x in (0, +infinity): e^ln(x) & = x \
                                e^x = y & <=> ln y = x "(aplikace inverzní funkce)" \
  $
]

#important(caption: "definice obecné mocniny")[
  $
    y = e^(ln y) & => a^x = e^(ln a^x) = e^(x ln a) \
             a^x & := e^(x ln a) \
  $
]

#important(caption: "definice obecného logaritmu")[
  $
                 log_a y = x & <=> a^x = y \
            a^x = e^(x ln a) & => e^(x ln a) = y \
    => ln(e^(x ln a)) = ln y & => x ln a = ln y \
                        => x & = (ln y)/(ln a) \
                  => log_a y & := (ln y)/(ln a) \
  $
]

#pagebreak()
přednáška...
#image("photo_2026-09-21_17-17-53.jpg")

#pagebreak()
== Cvičení
=== Nalezněte všechny racionální kořeny rovnice
$
  12x^4 + 7x^3 - 64x^2 + 63x - 18 = 0\
  \
  "čitatelé:" 1, 2, 3, 6, 9, 18\
  "jmenovatelé:" plus.minus 1, plus.minus 2, plus.minus 3, plus.minus 4, plus.minus 6, plus.minus 12\
  "kandidáti na racionální kořeny:" plus.minus 1, plus.minus 2, plus.minus 3, plus.minus 6, plus.minus 9, plus.minus 18, plus.minus 1/2, plus.minus 3/2, plus.minus 9/2, plus.minus 1/3, plus.minus 2/3, plus.minus 1/4, plus.minus 3/4, plus.minus 9/4, plus.minus 1/6, plus.minus 1/12\
  \
  12 + 7 -64 + 63 - 18 = 0 => 1 in K\
  2/3 in K\
  -3 in K\
  3/4 in K\
  K = {-3,2/3,3/4,1}\
  12x^4 + 7x^3 - 64x^2 + 63x - 18 = (x+3)(x-2/3)(x-3/4)(x-1)\
$

=== Určete definiční obor $arccotg(cotg(x))$ a $cotg(arccotg(x))$

==== $arccotg(cotg(x))$
#plot_func(x => (calc.cos(x) / calc.sin(x)), (-5, 5))

$
         cotg x & := (cos x)/(sin x) \
     D(cotg(x)) & = D((cos x)/(sin x)) \
     D(cotg(x)) & = RR without {k pi | k in ZZ} \
     arccotg(x) & := (cotg x slash_((0, pi)))^(-1) \
  D(arccotg(x)) & = RR \
  H(arccotg(x)) & = (0, pi) \
$

#pagebreak()
#important[
  $
    forall x in (0, pi) & : arccotg(cotg(x)) = x
  $
]

#plot_func(x => calc.atanh(calc.tanh(x)), (0, calc.pi), label: "arccotg(cotg(x))")

#important[
  $
    forall x in RR without {k pi | k in ZZ} & : arccotg(cotg(x)) equiv x (mod pi) \
  $
]

#plot_func(x => calc.rem-euclid(x, calc.pi), (-5, 5), label: "arccotg(cotg(x))")

==== $cotg(arccotg(x))$
$
                        D(arccotg(x)) = RR & ; H(arccotg(x)) = (0,pi) \
  D(cotg(x)) = RR without {k pi | k in ZZ} & ; H(cotg(x)) = RR \
$
obor hodnot arccotg a definiční obor cotg pasují $& => D(cotg(arccotg(x))) = RR$

#plot_func(x => x, (-2, 2), label: "cotg(arccotg(x))")

a platí: $forall x in RR: cotg(arccotg(x)) = x$

==== ukažte že $forall x in chevron -1,1 chevron.r: space arccos x + arcsin x = pi/2$

#plot_func(calc.cos, (-5, 5), label: "cos x")

$
     arccos x & := (cos x slash_(chevron 0, pi chevron.r))^(-1) \
  D(arccos x) & = H(cos x) = chevron -1, 1 chevron.r \
  H(arccos x) & = D(cos x slash_(chevron 0, pi chevron.r)) = chevron 0, pi chevron.r
$

#plot_func(x => calc.acos(x).rad(), (-1, 1), label: "arccos x")
#pagebreak()

#plot_func(calc.sin, (-5, 5), label: "sin x")
$
     arcsin x & := (sin x slash_(chevron -pi/2, pi/2 chevron.r))^(-1) \
  D(arcsin x) & = H(sin x slash_(chevron -pi/2, pi/2 chevron.r)) = chevron -1, 1 chevron.r \
  H(arcsin x) & = D(sin x slash_(chevron -pi/2, pi/2 chevron.r)) = chevron -pi/2, pi/2 chevron.r \
$

#plot_func(x => calc.asin(x).rad(), (-1, 1), label: "arcsin x")

#pagebreak()
*Důkaz*
$
                      y & = arcsin(x) \
          cos(pi/2 - y) & = sin(y) = x \
              arccos(x) & = pi/2 - y \
  arccos(x) + arcsin(x) & = pi/2 space checkmark \
$

#pagebreak()
==== dokažte že platí: $ln a b = ln a + ln b$

$
           e^(x+y) & = e^x dot.op e^y \
                   \
            ln x y & =^? ln x + ln y \
                   \
                 x & = ln(e^x) \
                 y & = ln(e^y) \
                   \
      ln (e^(x+y)) & = x + y \
      ln (e^(x+y)) & = ln(e^x) + ln(e^y) \
      ln (e^x e^y) & = ln(e^x) + ln(e^y) \
                   \
  "dejme tomu že:" \
               e^x & = a \
               e^y & = b \
          ln (a b) & = ln(a) + ln(b) \
$

==== Upravte
$
  (log_3 243 + log_9 81)/(log_5 25 + log_2 64)\
  = (5 + 2)/(2 + 6)\
  = (7)/(8)\
$

#pagebreak()
= Posloupnosti a důkazy
== Aritmetická posloupnost
=== definice
$
  A : (a_0, a_1, a_2 ...) equiv (a_i)_(i = 0)^infinity\
  exists d in RR: forall i in NN: a_(i+1) - a_i = d\
  a_i = a_0 + d*i\
  S_n = ((a_0 + a_n)n)/2 equiv sum_(i = 0)^(n) a_i\
$

- $d$ je diference
- $d$ může být i $0$ => konstantní posloupnost je také aritmetická

== Geometrická posloupnost
=== definice
$
  A : (a_0, a_1, a_2 ...) equiv (a_i)_(i = 0)^infinity\
  exists q in RR without 0: forall i in NN: a_(i+1)/a_i = q\
  a_i = a_0 * q^i\
$

- podmínka *konvergence* $q < 1$, jinak *divergentní*
=== součet
$
  x^3 - y^3 & = (x-y)(x^2 + 2 x y + y^2) \
    q^3 - 1 & = (q-1)(q^2 +q + 1) \
    q^n - 1 & = (q-1)(q^(n-1) + q^(n-2) + ... + q + 1) \
$

- Součet prvních $n$ prvků geometrické posloupnosti s prvním členem $a_0; a_0 in RR without 0$ a kvocientem $q; q in RR without {0,1}$ je
#important[
  $
    S_n = a_0 (q^n - 1)/(q - 1)\
  $
]

- důkaz:
$
  a_0 + a_0*q + a_0*q^2 + ... + q^(n-1)\
  = a_0 (1 + q + q^2 + ... + q^(n-1))\
  = a_0 (q^n - 1)/(q - 1)\
$

#pagebreak()
=== součet NGŘ
- podmínka *kovergence* $q < 1$
$
  S = lim_(n->infinity) a_0 (q^n - 1)/(q - 1)\
  = a_0 (0 - 1)/(q - 1)\
  = (-a_0)/(q - 1)\
  = a_0/(1 - q)\
$

#pagebreak()
== Matematické důkazy
=== Přímý důkaz
- série implikací
Věta: $A => B$, $(A,B)$ jsou tvrzení\
Důkaz: $A_0 => A_1 => A_2 => ... => B$\

==== např.
$
  "věta:" forall n in NN: 2 divides.not n => 2 divides.not n^2\
  \
  "důkaz:" n in NN, 2 divides.not n => exists k in NN: n = 2k - 1\
  => n^2 = (2k -1)^2 = 4k^2 - 4k + 1 = 2(2k^2 - 2k + 1) - 1\
  "kde" 2(2k^2 - 2k + 1) in NN\
  => exists k in NN : n^2 = 2k - 1 => 2 divides.not n^2 space checkmark\
$

=== Nepřímý důkaz
- založen na ekvivalenci implikace a obměněné implikace
$
  (A => B) <=> (not B => not A)
$

==== např.
$
  "věta:" forall n in NN: 2 divides.not n^2 => 2 divides.not n\
  forall n in NN: A => B\
  \
  "důkaz:" forall n in NN: 2 divides n => 2 divides n^2\
  forall n in NN: not B => not A\
  \
  2 divides n => exists k in NN: n = 2k => n^2 = 4k^2 = 2(2k^2) and 2k^2 in NN\
  => 2 divides 2(2k^2) space checkmark\
  \
  "důsledek:" forall n in NN: 2 divides.not n <=> 2 divides.not n^2\
$

- $A => B$ implikace
- $B => A$ obrácená implikace
- $not B => not A$ obměněná implikace
- $A <=> B equiv (A=>B)and(B=>A)$ ekvivalence

#pagebreak()
=== Důkaz sporem
- založen na následující ekvivalenci
$(A=>B) <=> not(A and not B)$

==== př. 1
$
  &"věta:" sqrt(2) "je iracionální"\
  &"přesněji:" sqrt(2) "je iracionální" <=> exists.not p,q in NN: p/q = sqrt(2)\
  &"ještě přesněji:" sqrt(2) "je iracionální" <=> exists.not p,q in NN: exists.not z in NN: (z divides p and z divides q): (p^2)/(q^2) = 2
$
$
  "důkaz sporem:"\
  exists m,n in NN: exists.not z in NN: (z divides p and z divides q) and (p^2)/(q^2) = 2\
  => 2q^2 = p^2 => 2 divides p^2 => 2 divides p => exists k in NN: p = 2k\
  => 2q^2 = 4k^2 => q^2 = 2k^2 => 2 divides q^2 => 2 divides q\
  => 2 divides p and 2 divides q => "kontradikce" space crossmark\
  => "původní výrok platí" space checkmark\
$

==== př. 2
$
  "věta:" "let" x_1, x_2 ... x_n in RR : exists i in {1,2 ... n}: x_i >= 1/n (x_1 + x_2 ... + x_n)\
  "důkaz sporem:"\
  x_1, x_2 ... x_n in RR and forall i in {1,2 ... n} x_i < 1/n (x_1 + x_2 ... + x_n)\
  => x_1 < 1/n (x_1 + x_2 ... + x_n)\
  => x_2 < 1/n (x_1 + x_2 ... + x_n)\
  ...\
  => x_n < 1/n (x_1 + x_2 ... + x_n)\
  +\
  => x_1 + x_2 + ... + x_n < n 1/n (x_1 + x_2 ... + x_n)\
  => x_1 + x_2 + ... + x_n < x_1 + x_2 ... + x_n "kontradikce" space crossmark\
  => "původní výrok platí" space checkmark\
$

=== Logická struktura matematických důkazů
- 3 základní struktury
  - přímý
  - nepřímý
  - sporem

- ve složitějším důkazu se předpokládá jakási hierarchie důkazů s těmito strukturami

=== Techniky při tvorbě matematických důkazů
==== Výčet možností
např.
$
  & "věta:" |x + y| <= |x| + |y| "(trojúhelníhová nerovnost)" \
  & "důkaz:" \
  & (1) x >= 0 and y >= 0 => |x| = x and |y| = y => |x+y| = x +y => |x+y| = |x| + |y| space checkmark \
  & (2) x < 0 and y < 0 => |x| = -x and |y| = -y => |x+y| => -(x + y) = -x + -y space checkmark \
  & (3)(a) x >= 0 and y < 0 and |x| > |y| => |x+y| = x+y => x+y <= x-y space checkmark \
  & (3)(b) x >= 0 and y < 0 and |x| < |y| => |x+y| = -(x+y) => -(x+y) <= x-y space checkmark \
  & (4)(a) x < 0 and y >= 0 and |x| > |y| => |x+y| = -(x+y) => -(x+y) <= x-y space checkmark \
  & (4)(b) x < 0 and y >= 0 and |x| < |y| => |x+y| = x+y => x+y <= x-y space checkmark \
  & "dokázáno " forall x,y in RR \
$
==== Matematická indukce
- dokazování výroků závislých na přirozeném čísle - $V(n); v in NN$
např. 1
$
  V(n) equiv 1^2 + 2^2 + ... n^2 = (n(n+1)(2n+1))/6\
  "věta:" forall n in NN: V(n)\
$

- princip indukce - dokážeme: $V(1) and forall n in NN: V(n) => V(n+1)$\ - dominové kostky...
- základní krok: $V(1)$
- indukční krok: $forall n in NN: V(n) => V(n+1)$

$
  V(1) equiv 1^2 = (1(1+1)(2+1))/6 = 1 space checkmark\
  "nechť" n in NN, "předpokládáme" V(n) "platí" "(indukční předpoklad), dokazujeme pro n+1"\
  1^2 + 2^2 + ... n^2 + (n+1)^2 = (n(n+1)(2n+1))/6 + (n+1)^2\
  "zkusím jestli:" (n(n+1)(2n+1))/6 + (n+1)^2 =^? ((n+1)(n+2)(2n+3))/6\
  (n(n+1)(2n+1) + 6(n+1)^2)/6 =^? ((n+1)(n+2)(2n+3))/6\
  n(n+1)(2n+1) + 6(n+1)^2 =^? (n+1)(n+2)(2n+3)\
  n(2n^2 + n + 2n + 1) + 6n^2 + 12n + 6 =^? (n + 1)(2n^2 + 3n + 6n + 6)\
  2n^3 + n^2 + 2n^2 + n + 6n^2 + 12n + 6 =^? 2n^3 + 3n^2 + 6n^2 + 6n + 2n^2 + 3n + 6n + 6\
  0 =^? 0 space checkmark\
$

#pagebreak()
např. 2

$
  &"věta:" "nechť" x_1,x_2 ... x_n in RR "pak" |sum_(i=1)^n x_i| <= sum_(i=1)^n |x_i|\
  &"základní krok 1:" n = 1 => |x_1| <= |x_1| space checkmark\
  &"základní krok 2:" n = 2 => |x_1 + x_2| <= |x_1| + |x_2| space checkmark "(dokázáno předtím, trojúhelníková nerovnost)"\
  &"indukční předpoklad:" n in NN; V(n) "platí"\
  &"indukční krok - dokazuji:" forall n in NN: V(n) => V(n+1)\
  &|bold(x_1 + x_2 + ... + x_n) + x_(n+1)| <= bold(|x_1 + x_2 + ... + x_n|) + |x_(n+1)| <= |x_1| + |x_2| + ... + |x_n| + |x_(n+1)| space checkmark\
$

#pagebreak()
např. 3 - hanojské věže

pro $n=1$ mám $t(n) = 1$, pro $n=2$ mám $t(n) = 3$\
-> přesunu $(n-1)$ kotoučů - trvá $t(n-1)$ tahů\
- přesunu 1 kotouč(největší) a pak potřebuji zase $t(n-1)$ abych přesunul $n-1$ kotoučů na něj.
\
=> $t(n) = 2t(n-1)+1$\
=> $t(3) = 7$\
=> $t(4) = 15$\
=> $t(5) = 31$\
...
\
věta: pro $n$ kotoučů potřebuji $t^n - 1$ tahů(vypozorováno z vzoru nahoře)\
důkaz:\
\
prvotní krok:\
$
  t(1) = 1 = 2^1 - 1 = 1 space checkmark\
$
indukční krok:\
$
  "pro" n in NN: t(n) = t^n - 1\
  T(n+1) = 2t(n) + 1 = 2^(n+1) - 2 + 1 = 2^(n+1) - 1 space checkmark\
$

#pagebreak()
= Analytická geometrie
== Vektor
$
  a^arrow = vec(a_1, a_2, ..., a_n)
$
=== operace s vektory
==== součet
$
  a^arrow = vec(a_1, a_2, ..., a_n);space b^arrow = vec(b_1, b_2, ..., b_n)\
  c^arrow = a^arrow + b^arrow = vec(a_1 + b_1, a_2 + b_2, ..., a_n + b_n)
$
==== násobení skalárem
$
  a^arrow = vec(a_1, a_2, ..., a_n);space k in RR\
  b^arrow = a^arrow dot.op k = vec(k a_1, k a_2, ..., k a_n)\
$

==== násobení -1, opačný vektor
$
  a^arrow = vec(a_1, a_2, ..., a_n)\
  b^arrow = (-1)dot.op a^arrow = -a^arrow = vec(-a_1, -a_2, ..., -a_n)\
$

#pagebreak()
== Parametrické vyjádření přímky
$
  p:\
  x = t u_1 + Q_1\
  y = t u_2 + Q_2\
  t in RR\
  \
  u^arrow = vec(u_1, u_2) "(směrový vektor)"\
  Q^arrow = vec(Q_1, Q_2) "(počáteční bod)"\
  \
  "nebo také"\
  p:
  vec(x, y) = Q^arrow + t u^arrow; t in RR\
$

v n rozměrech
$
  Q^arrow = vec(Q_1, Q_2, ..., Q_n) "(počáteční bod)"\
  u^arrow = vec(u_1, u_2, ..., u_n) "(směrový vektor)"\
  p: X^arrow = Q^arrow + t u^arrow; t in RR\
$

== Křivka v rovině
$
  "jakákoliv křivka se dá popsat pomocí parametru:"\
  (phi(t), psi(t)); t in RR\
  "např. parabola:"\
  (t, t^2); t in RR\
$

#pagebreak()
== Lineární kombinace (základy lineární algebry idk zámo)
libovolný vektor zapíšeme lineární kombinací *lineárně nezávislých*, *nenulových* vektorů
$
  a dot.op u^arrow + b dot.op v^arrow\
$
\
báze n-dimenzionálního vektorového prostoru - $e^arrow = vec(e_1, e_2, ..., e_n)$\
\
každý vektor v tom prostoru jsem schopen zapsat jako lineární kombinaci prvků báze vektorového prostoru\
$
  e_1^arrow = vec(1, 0, ..., 0); space e_2^arrow = vec(0, 1, ..., 0); space ... space e_n^arrow = vec(0, 0, ..., 1) "např..."\
  \
  a^arrow = k_1 dot.op e_1^arrow + k_2 dot.op e_2^arrow + ... + k_n dot.op e_n^arrow\
$

koeficienty = souřadnice vektoru vzhledem k dané bázi\
*$B = {e^arrow_1, e^arrow_2, ... ,e^arrow_n}$*

== Skalární součin
- metrická geometrie - chci měřit idk - zapsaná pomocí souřadnic/vektorů
- základní požadavky měření:
=== Vzdálenost 2 vektorů
$
  "let" u^arrow, v^arrow\
  d_(u v) = |v - u| = |u - v|
$
==== Definujeme délku(normu/magnitudu) n-dimenzionálního vektoru jako unární operaci
$
  "let" u^arrow = vec(u_1, u_2, ..., u_n)\
  |u^arrow| = sqrt(sum_(i=1)^n u_i^2) = sqrt(u^arrow dot.op u^arrow)
$

=== Úhel mezi 2 vektory
přes kosinovou větu - zobecnění pythagorovy věty\
$
  "let" u^arrow; v^arrow\
  phi = arccos((u^arrow dot.op v^arrow)/(|u^arrow||v^arrow|)) = arccos((u^arrow dot.op v^arrow)/(sqrt(u^arrow dot.op u^arrow)sqrt(v^arrow dot.op v^arrow)))
$


#pagebreak()
=== Z toho vypadne skalární součin
#important(caption: "definice")[
  $
    u^arrow dot.op v^arrow = u_1 v_1 + u_2 v_2 + ... + u_n v_n = sum_(i=1)^n u_i v_i
  $
]

#important(caption: "skalární součin je distributivní operace")[
  $
    (u^arrow + v^arrow) dot.op w^arrow = u^arrow dot.op w^arrow + v^arrow dot.op w^arrow\
  $
]

#pagebreak()
== Obecná rovnice přímky v rovině(jinak to ani nejde, chill)
$
             & "let" \
             & Q^arrow "výchozí bod" \
             & u^arrow "směrový vektor" \
     n^arrow & = n^arrow perp(x^arrow - Q^arrow) "normálový vektor" \
  p: x^arrow & = Q^arrow + t u^arrow; t in RR \
$

$
  n^arrow dot.op u^arrow = 0 "(jsou kolmé)"\
  n^arrow dot.op u^arrow = 0 <=> n^arrow perp u^arrow\
$

z toho je obecná rovnice přímky v rovině ve vektorovém tvaru:
$
  n^arrow dot.op (x^arrow - Q^arrow) = 0\
  (n_1, n_2) dot.op ((x - Q_1) - (y - Q_2)) = 0\
  n_1 x + n_2 y + (-n_1 Q_1 - n_2 Q_2) = 0\
  \
  (-n_1 Q_1 - n_2 Q_2) = c\
  n_1 = a\
  n_2 = b\
  \
  => bold(a x + b y + c = 0)\
$

== idk even čím to mám nadepstat, geometrická interpretace skalárního součinu
$
  u^arrow dot.op v^arrow = |u^arrow||v^arrow| cos phi\
  "měním" phi\
  => |u^arrow||v^arrow| = "konst"\
$
$
  u^arrow dot.op v^arrow = 1 & <=> phi = 0(pi) \
  u^arrow dot.op v^arrow = 0 & <=> phi = pi/2(3/2 pi) \
$

pro normalizované vektory si můžeme představit skalární součin jako ortogonální projekci vektoru $v^arrow$ do směru $u^arrow$

#pagebreak()
== Vzdálenost bodu od přímky
$
  "let" A^arrow; space Q^arrow; space n^arrow; space p: n^arrow dot.op (x^arrow - Q^arrow) = 0\
  min{d(A^arrow, x^arrow), x^arrow in p} "(hledaná vzdálenost)"\
$

$
  cos phi = d/(|A^arrow-Q^arrow|)\
  d = |A^arrow-Q^arrow| cos phi\
  "víme: " n^arrow dot.op (A^arrow - Q^arrow) = |n^arrow| |A^arrow - Q^arrow| cos phi\
  d = (|n^arrow dot.op (A^arrow - Q^arrow)|)/(|n^arrow|)\
  d = (|"norm"(n^arrow) dot.op (A^arrow - Q^arrow)|)\
  d = (|a a_1 + b a_2 + c|)/sqrt(a^2 + b^2)\
$

== Obecná rovnice roviny ve 3D
$
  rho: n^arrow dot.op (x^arrow - Q^arrow) = 0; space forall x^arrow in rho\
  equiv a x + b x + c z + d = 0\
$

== Obecná rovnice nadroviny v ND má dimenzi (N-1)D
$
  phi: n^arrow dot.op (x^arrow - Q^arrow) = 0; space forall x^arrow in phi\
$

== Směrnicový tvar rovnice přímky v rovině
$
  p: a x + b y + c = 0; space b != 0\
  b y = -a x -c\
  y = (-a x - c)/b = -a/b x - c/b\
  "let" -a/b = k; space -c/b = q\
$
#important[$y = k x + q$]
$
  tg phi = k "(směrnice)"\
$
$
  phi and k = 0 & => "vodorovná přímka" \
  phi and k > 0 & => "rostoucí přímka" \
  phi and k < 0 & => "klesající přímka" \
$

- $q$ je bod kde přímka protíná osu y

== Úsekový tvar rovnice přímky v rovině
$
  c != 0\
  x/p+ y/q = 1 "p je průsečík s osou x, q je průsečík s osou y"\
$

#pagebreak()
== Kuželosečky
=== Rovnice kružnice
$
  |x^arrow - S^arrow| = r; space forall x in rho\
$

- nebo také:
$
  "let" r; space S^arrow = vec(m, n) & ; space r, m, n in RR \
                   (x-m)^2 + (y-n)^2 & = r^2 \
$

- tečna kružnice v bodě $x^arrow = vec(x_0, y_0)$
$
  x_0(x-m) + y_0(y-m) = r^2\
$

- pro $x^arrow = vec(0, 0)$
$
  x_0 x + y_0 y = r^2\
$

další kuželosečky si doplň šášulo

=== Rovnice paraboly
$
  & "let" \
  & p: n dot.op (x - Q) = 0; space Q in RR^2; n in RR^2 without 0 "(řídící přímka)" \
  & F in RR^2; space F in.not p "(ohnisko)" \
$

pro parabolu platí:
$
         d_(x F) & = d_(x p) \
         d_(x F) & := norm(x - F) \
         d_(x p) & := abs(n dot.op (x - Q))/norm(n) \
  => norm(x - F) & = abs(n dot.op (x - Q))/norm(n) \
$

odvození obecné rovnice:
$
  norm(x - F) = abs(n dot.op (x - Q))/norm(n)\
  sqrt(n_1^2 + n_2^2) sqrt((x-m)^2 + (y-n)^2) = abs(n dot.op (x - Q))\
  sqrt(n_1^2 + n_2^2) sqrt((x-m)^2 + (y-n)^2) = sqrt((n dot.op vec(x-o, y-p))^2)\
  sqrt(n_1^2 + n_2^2) sqrt((x-m)^2 + (y-n)^2) = sqrt((n_1(x-o) + n_2(y-p))^2)\
  (n_1^2 + n_2^2) ((x-m)^2 + (y-n)^2) = (n_1(x-o) + n_2(y-p))^2\
$

platí pro jakoukoliv obecnou parabolu, pro vrcholový tvar je $n in {vec(plus.minus 1, 0), vec(0, plus.minus 1)}$

#pagebreak()
=== Rovnice elipsy
$
  & "let" \
  & F_1 in RR^2 \
  & F_2 in RR^2 \
  & F_1 != F_2 \
$

pro elipsu platí:
$
                                                      d_(x F_1) + d_(x F_2) & = "konst" \
                                              norm(x - F_1) + norm(x - F_2) & = "konst" \
  sqrt((x_1-F_11)^2 + (x_2-F_12)^2) + sqrt((x_1 - F_21)^2 + (x_2 - F_22)^2) & = "konst" \
$
platí pro jakoukoliv obecnou elipsu, pro vrcholový tvar je $F_11 = F_21 or F_12 = F_22$

např. pro $F_11 = F_21$:
$
  sqrt((x_1-F_11)^2 + (x_2-F_12)^2) + sqrt((x_1 - F_11)^2 + (x_2 - F_22)^2) & = "konst" \
                                               "úpravami se dostaneme k..." \
                                              (x_1-m)^2/b^2 + (x_2-n)^2/a^2 & = 1 \
$

=== Rovnice hyperboly
$
  & "let" \
  & F_1 in RR^2 \
  & F_2 in RR^2 \
  & F_1 != F_2 \
$

pro hyperbolu platí:
$
                                                      d_(x F_1) - d_(x F_2) & = "konst" \
                                              norm(x - F_1) - norm(x - F_2) & = "konst" \
  sqrt((x_1-F_11)^2 + (x_2-F_12)^2) - sqrt((x_1 - F_21)^2 + (x_2 - F_22)^2) & = "konst" \
$

#pagebreak()
== Cvičení
=== příklad 5
stanovte rovnici přímky $p$, která prochází bodem $B[2;3]$ a má od přímky $q: 2x + 5y - 5 = 0$ odchylku $pi/4$\

přímka $q$ má směrnici $k = -5/2$, což znamená že svírá s osou x úhel $arctan(-2/5) = -0.38 "rad"$\

to znamená že potřebuji přímku se směrnicí $k = tan(pi/4 - 0.38) = 0.43$\

$
  p: y = 0.43x + c\
  3 = 0.43*2 + c\
  c = 3 - 0.86 = 2.14\
  p: y = 0.43x + 2.14\
  p: y = tan(pi/4 + arctan(-2/5))x + 3 - 2tan(pi/4 + arctan(-2/5)) space checkmark\
$
=== příklad 7
určete obecnou rovnici roviny je li dáno její parametrické vyjádření:

$
  & rho: \
  & x = t + s \
  & y = t - s \
  & z = 5 + 6t - 4s \
  & t,s in RR without 0 \
$

rovina je definována dvěma směrovými vektory $u = vec(1, 1, 6)$ a $v = vec(1, -1, -4)$

určím si normálový vektor vektorovým součinem

$
  n = u times.o v & = det_v mat(1, 1, 1; 1, 1, 6; 1, -1, -4) \
                  & = vec(2, 10, -2) = vec(1, 5, -1)
$

obecná rovince bude vypadat:
$
  rho: x + 5y - z + c = 0\
$
dosadím libovolný bod, např. počáteční bod $Q = [0,0,5]$, z toho plyne
$
  c = 5
$

a obecná rovnice vypadá normovaném tvaru:
$
  rho: x + 5y - z + 5 = 0 space checkmark\
$

#pagebreak()
=== příklad 8
ověřte že přímky $p: [-1,1,-5] + t vec(1, 1, 2)$ a $q: [1,-2,3] + s vec(1, 3, -1)$ jsou mimoběžky a nalezněte jejich příčku se směrem $vec(1, -2, 3)$

(a) - ověření mimoběžnosti\
(a.1) - ověřím jestli směrové vektory nejsou kolineární\
$vec(1, 1, 2)$ a $vec(1, 3, -1)$ kolineární nejsou => jsou mimoběžky\

jak proboha učím příčku? příčka asi bude přímka která protíná obě mimoběžky, existuje jich ale nekonečné množství

musím určit příčku se specifickým směrovým vektorem => stačí vyřešit soustavu rovnic, vím také, že její směrový vektor bude kolmý na jejich směrové vektory(asi plyne z definice xd)

takže hledám dva body na těchto přímkách, které tato moje přímka protne - pro jednu přímku mi vyjde parametrické řešení, druhá mi dá konkrétní hodnotu => hledám konkrétní hodnoty $t$ a $s$

$
  o: p(t_k) + u_1 vec(1, -2, 3) = q(s_k) + u_2 vec(1, -2, 3)\
$

retardovaný postup, vlastně tvořím rovinu definovanou přímkou a směrovým vektorem příčky a následně hledám průsečík s druhou přímkou\
její normálový vektor bude $n = vec(1, 1, 2) times.o (1,-2,3)$

$
  n & = vec(1, 1, 2) times (1,-2,3) \
  n & = det_v mat(1, 1, 1; 1, 1, 2; 1, -2, 3) = (7, -1, -3) \
$

vytvořím si obecnou rovnici této roviny a najdu hodnotu parametru $s$ pro který bod přímky $q$ v této rovině leží
$
  rho: 7x - y -3z + c = 0\
  "dosadím počáteční bod přímky p"\
  -7 - 1 + 15 + c = 0 => c = -7\
  rho: 7x - y -3z - 7 = 0\
$

nyní nalezení průsečíku:
$
  & rho: 7x - y -3z - 7 = 0 \
  & q: [1,-2,3] + s vec(1, 3, -1) \
  & x = 1 + s \
  & y = -2 + 3s \
  & z = 3 - s \
  & 7(1+s) - (-2+3s) -3(3-s) - 7 = 0 \
  & 7 + 7s + 2 - 3s - 9 + 3s - 7 = 0 \
  & -7 + 7s = 0 \
  & s = 1 \
  & q(1) = vec(2, 1, 2) space crossmark \
$

tohle je špatně, co mi nevychází? možná rovnice roviny?

tbd...

#pagebreak()
= Goniometrie
== ZŠ
- pravoúhlý trojúhelník, definice $sin$, $cos$, $tan$ - omezeny na $alpha in (0, pi/2)$
- podobné trojúhelníky => poměr stran je konstantní
- $cos$ je komplementární funkce k $sin$
- $tg alpha = (sin alpha)/(cos alpha)$
- $cotg alpha = (cos alpha)/(sin alpha)$

== SŠ
- jednotková kružnice
- *orientovaný úhel* - není *jen* úhel
  - proti směru h.r. => $+$
  - po směru h.r. => $-$
  - $alpha' = alpha + k 360 degree; space k in ZZ$
  - $alpha' = alpha + k 2pi; space k in ZZ$
- $360 degree$ pochází ze starověké astronomie - cca počet dnů v roce idk
- oblouková míra - kolikrát se poloměr kružnice vejde do obloukové výseče
  - na celou kružnici se poloměr vejde $2pi$-krát
  - na celou kružnici se průměř vejde $pi$-krát
$
  pi := o/d
$

$pi$ od _perimetros_

$
  360 degree = 2 pi "rad"\
$

$sin alpha$ je $y$-ová souřadnice průsečíku průvodiče s jednotkovou kružnicí\
$cos alpha$ je $x$-ová souřadnice průsečíku průvodiče s jednotkovou kružnicí\
$tg alpha$ je $y$-ová souřadnice průsečíku průvodiče s tečnou jednotkové kružnice kolmé na osu $x$\
$cotg alpha$ je $x$-ová souřadnice průsečíku průvodiče s tečnou jednotkové kružnice kolmé na osu $y$\

=== z pythagorovy věty plyne:
$
  sin^2 alpha + cos^2 alpha = 1\
  forall alpha in RR\
$

=== definiční obory:
$
  D(sin) = RR\
  D(cos) = RR\
  D(tan) = RR without {k pi|k in ZZ}\
$

=== periodičnost:
$
  forall alpha in RR: forall k in ZZ: sin(alpha + 2k pi) = sin(alpha)\
  forall alpha in RR: forall k in ZZ: cos(alpha + 2k pi) = cos(alpha)\
  forall alpha in RR: forall k in ZZ: tg(alpha + k pi) = cos(alpha)\
$

#pagebreak()
=== parita:
$
  sin(-alpha) & = - sin alpha & "je lichá funkce" \
  cos(-alpha) & = cos alpha   &  "je sudá funkce" \
$
=== podobnost $sin$ a $cos$
$
  forall alpha & in RR \
     sin alpha & = cos (pi/2 - alpha) \
     cos alpha & = sin(pi/2 - alpha) \
$

=== grafy
#plot_func(calc.sin, (0, 2 * calc.pi), label: "sin x")
#plot_func(calc.cos, (0, 2 * calc.pi), label: "cos x")
//#plot_func(calc.tan, (-calc.pi / 2, calc.pi / 2), label: "tan x")

#pagebreak()
=== součtové vzorce
pro $sin$
$
    forall alpha, beta & in RR: \
     sin(alpha + beta) & = sin alpha cos beta + cos alpha sin beta \
  "geometrický význam" & arrow.t \
$
pro $cos$
$
  cos(alpha + beta) & = sin((pi/2 - alpha) + (-beta)) \
                    & = sin(pi/2 - alpha)cos(-beta) + cos(pi/2 - alpha)sin(-beta) \
                    & = cos alpha cos beta - sin alpha sin beta \
                    & forall alpha, beta in RR \
$
pro $tg$
$
  tg(alpha + beta) & = sin(alpha + beta)/cos(alpha + beta) \
  & = (sin alpha cos beta + cos alpha sin beta)/(cos alpha cos beta - sin alpha sin beta)\
  & = (sin alpha cos beta + cos alpha sin beta)/(cos alpha cos beta - sin alpha sin beta) dot.op (1/(cos alpha cos beta))/(1/(cos alpha cos beta))\
  & = (tg(alpha) + tg(beta))/(1 - tg(alpha) tg(beta))\
$

dvojité úhly
$
  sin 2 alpha & = sin alpha cos alpha + cos alpha sin alpha \
              & = 2 sin alpha cos alpha
$

$
  cos 2 alpha & = cos alpha cos alpha - sin alpha sin alpha \
              & = cos^2 alpha - sin^2 alpha \
              & = 1 - 2 sin^2 alpha \
              & = 2 cos^2 alpha - 1 \
$

#pagebreak()
poloviční úhly
$
                cos 2 alpha & = 2cos^2 alpha - 1 \
            cos 2 alpha + 1 & = 2cos^2 alpha \
        (cos 2 alpha + 1)/2 & = cos^2 alpha \
  sqrt((cos 2 alpha + 1)/2) & = cos alpha \
                cos alpha/2 & = sqrt((cos alpha + 1)/2) \
$
#important[$
  cos alpha/2 & = sqrt((cos alpha + 1)/2)
$]

$
  cos 2 alpha & = 1 - 2sin^2 alpha \
    sin alpha & = sqrt((1-cos 2 alpha)/2) \
  sin alpha/2 & = sqrt((1-cos alpha)/2) \
$
#important[$
  sin alpha/2 & = sqrt((1-cos alpha)/2)
$]

mocniny
$
  cos^2 x = (1 + cos 2x)/2
$

#pagebreak()
=== identity
$
     sin alpha + beta & = sin alpha cos beta + cos alpha sin beta \
  => sin alpha - beta & = sin alpha cos -beta + cos alpha sin -beta \
  => sin alpha - beta & = sin alpha cos beta - cos alpha sin beta \
$

#important[$
  sin alpha - beta & = sin alpha cos beta - cos alpha sin beta
$]

$
  sin alpha + beta + sin alpha - beta & = sin alpha cos beta + cos alpha sin beta + sin alpha cos beta - cos alpha sin beta\
  sin alpha + beta + sin alpha - beta & = 2sin alpha cos beta\
  alpha + beta &= x\
  alpha - beta &= y\
$
#important[$
  sin x + sin y = 2sin (x+y)/2 cos (x-y)/2\
$]

=== co je potřeba znát
- goniometrická jednička
- sudost lichost
- periodičnost
- náhrada $sin$ a $cos$
- součtové vzorce

= Trigonometrie
- goniometrie v obecném trojúhelníku

== sinová věta
odvozeno z obecného trojúhelníku přes rovnost vyjádření výšky
#important[$
  a/sin(alpha) = b/sin(beta)\
$]

== kosinová věta
#important[$
  c^2 = a^2 + b^2 - 2a b cos gamma\
$]
pythagorova věta je speciální případ kosinové věty pro $gamma = 90 degree$
#important[$
  c^2 = a^2 + b^2\
$]

pythagorova věta je ekvivalentní s kosinovou větou pro $gamma = 90 degree$
$
  C <=> P
$

#pagebreak()
= Transformace grafů(funkcí i guess)
mám funkci:
$
  f: RR -> RR; y = f(x)\
$

== posunutí v x
substituce za argument $x = x-m$
$
  y = f(x-m)\
$

== posunutí v y
substituce za funkční hodnotu $y = y-n$
$
  y - n = f(x) => y = f(x)+ n\
$
== natažení v x
substituce za argument $x = x/p$
$
  y = f(x/p)\
$

== natažení v y
substituce za funkční hodnotu $y = y/q$
$
  y/q = f(x) => y = q f(x)\n
$

existuje $p$ a $q$ které při jistém zvětšení/zmenšení v poměru $1:1$ pro osy $x, y$ vytvoří vzájemně ekvivalentí grafy

#pagebreak()
= Kombinatorika
== Kombinatorické pravidlo součinu
- počet uspořádaných k-tic, jejichž i-tý člen lze vybrat $n_i$ způsoby je roven $n_1 n_2 n_3 ... n_k$

=== příklad

kolik 4ciferných přirozených čísel lze sestavit z cifer $0-5$

(a) cifry se smí opakovat
$
  5*6*6*6 = 1080\
$
(b) cifry se nesmí opakovat
$
  5*5*4*3 = 300\
$

== Kombinatorické pravidlo součtu
- jsou li $A_1 ... A_n$ konečné disjunktní množiny,\ pak platí $|A_1 union ... union A_n| = |A_1| + ... + |A_n|$

=== příklad

kolik sudých 4ciferných přirozených čísel lze sestavit z cifer $0-5$, přičemž cifry se nesmí opakovat

sudé => končí na $0, 2, 4$

pro $0$
$
  5*4*3 = 60
$

pro $4,2$
$
  4*4*3*2 = 86
$

celkem: $60+86 = 156$

#pagebreak()
== Bez opakování
vybíráme prvky z $A = {a_1, a_2 ... a_n}$ - bereme k-tice

=== Variace
počet uspořádaných k-tic sestavených z prvků množiny $A$, kde se každý prvek vyskytuje v k-tici nejvýše jednou je:
$
  & n(n-1)(n-2)...(n-k+1) \
  & = (n!)/(n-k)!
$

definice plyne z kombinatorického pravidla součinu

=== Permutace
speciální případ variací kde bereme uspořádané n-tice z n-prvkové množiny bez opakování => v n-tici je každý prvek právě jednou
$
  n!
$

=== Kombinace
počet neuspořádaných k-tic z prvků množiny $A$, kde se každý prvek vyskytuje nejvýše jedou je:

$
  (n!)/(k!(n-k)!) = vec(n, k) = vec(n, n-k)
$

=== Příklady
==== příklad 1
V cukrárně mají 6 druhů zákusků, kolika způsoby lze koupit 3 různé druhy zákusků pro 3 kamarády?

$
  V_3(6) = 6!/(6-3)! = 6*5*4 = 120
$

==== příklad 2
V cukrárně mají 6 druhů zákusků, kolika způsoby lze koupit 3 různé druhy zákusků?
$
  C_3(6) = 6!/(3!(6-3)!) = (6*5*4)/6 = 20
$

==== příklad 3
Kolika způsoby lze rozdat 32 karet 4 různým hráčům, tak aby každý dostal 8 karet?
$
              C_8(32) dot.op C_8(24) dot.op C_8(16) dot.op C_8(8) & = \
  vec(32, 8) dot.op vec(24, 8) dot.op vec(16, 8) dot.op vec(8, 8) & = \
                                                                  & = "1 morbilion"
$

#pagebreak()
==== příklad 4
V jisté loterii je každý týden vytaženo 6 různých čísel z 49. Jaká je pravděpodobnost že žádné číslo nebude vytaženo ve dvou po sobě jdoucích týdnech?

$
  P & = "pozitivní případy"/"všechny případy" \
$

množství možností v jednom týdnu

$
  vec(49, 6)
$

$ \ \ $
tj. je pravděpodobnější, že se něco zopakuje, než nezopakuje


==== příklad 5
Kolika způsoby se může 10 osob seřadit před 3 pokladnami tak, aby před každou pokladnou stála minimálně 1 osoba?
$
  10! dot.op (9,2) = 10! dot.op 9 dot.op 8 = 1 "gorilion"
$

#pagebreak()
== S opakováním
=== Variace
Kolika způsoby můžeme vybrat uspořádané k-tice z n-prvkové množiny $A$.
$
  V'_n(k) = n^k
$

=== Permutace
Počet uspořádaných k-tic z množiny $A$ tak, že prvek $a_i$ se v k-tici vyskytuje $k_i$ krát. ${k_1, k_2 ... k_n|k_i in NN_0}$ a $sum_(i=1)^n k^i = k$

$
  P'_k = k!/(k_1 ! dot.op k_2 ! dot.op ... dot.op k_n !) = vec(k, k_1) dot.op vec(k-k_1, k_2) dot.op vec(k-k_1-k_2, k_3) dot.op ... dot.op vec(k_n, k_n)
$

=== Kombinace
Počet neuspořádaných k-tic z množiny $A$.
$
  C'_k(n) = vec(n+k-1, k)
$

=== Příklady
==== příklad 1
V cukrárně mají 6 druhů zákusků, kolika způsoby lze koupit 4 zákusky pro 4 kamarády?
$
  V'_4(6) = 6^4 = 1296\
$
==== příklad 2
V cukrárně mají 6 druhů zákusků, kolika způsoby lze koupit 4 zákusky?
$
  C'_4(6) = vec(9, 4) = 9!/(4!(5!)) = 126
$
==== příklad 3
Kolika způsoby lze rozdělit 10 stejných bonbonů mezi 5 dětí, jestliže:\
(a) některé děti nemusí dostat nic\
neuspořádané 10tice z 5 dětí
$
  C'_10(5) = vec(14, 10) = 14!/(10!(14-10)!) = 1001
$
(b) každé dítě musí dostat alespoň jeden bonbon\
neuspořádané 5tice z 5 dětí
$
  C'_5(5) = vec(9, 5) = 9!/(5!(9-5)!) = 126
$

== Vlastnosti kombinačních čísel
=== Symetrie
$
  vec(n, k) = vec(n, n-k)\
$
=== Součet
$
  vec(n-1, k-1) + vec(n-1, k) = vec(n, k)
$

== Pascalův trojúhelník
#image("./photo_2026-09-23_15-27-09.jpg")

#pagebreak()
== Binomická věta
$
  (a+b)^n = sum_(i=0)^n vec(n, i) a^(n-i)b^i
$

koeficienty $vec(n, i)$ jsou hodnoty Pascalova trojúhelníku v n-tém řádku, $n in ZZ$

#pagebreak()
= Příklady goniometrie
== Příklad 1
Určete velikost tělesové úhlopříčky krychle o straně a

nejprve vyjádřím úhlopříčku spodní stěny:
$
  u_(s s) = sqrt(2) a\
$
z ní vyjádřím v pravoúhlém trojúhelníku pomocí pythagorovy věty tělesovou úhlpříčku
$
  u_t & = sqrt((sqrt(2)a)^2 + a^2) \
  u_t & = sqrt(2a^2 + a^2) \
  u_t & = sqrt(3a^2) \
  u_t & = a sqrt(3) \
$

#pagebreak()
== Příklad 2
Určete velikost $sin 29/6 pi$ a $cos 29/6 pi$

stanovím $alpha = 29/6 pi$\
a vyjádřím si $a' equiv alpha space (mod 2pi)$\

$
  a' & = rem(29/6 pi, 2pi) \
  a' & = rem(29/6 pi, 2pi) \
  a' & = ((29pi)/6)/(2pi) \
  a' & = (29pi)/(12 pi) \
  a' & = (29)/(12) \
  a' & = (5)/(12) 2pi \
  a' & = 5/6 pi \
$

$
  sin alpha & = sin 5/6 pi \
  cos alpha & = cos 5/6 pi \
            \
  sin alpha & = sin 1/6 pi \
  cos alpha & = - cos 1/6 pi \
            \
  sin alpha & = 1/2 \
  cos alpha & = - sqrt(3)/2 \
$

== Příklad 3
Řešte v $RR$ rovnici:
$
  sin x & = - 1/2 \
      x & in {7/6 pi + 2k pi|k in ZZ} union {-1/6 pi + 2k pi|k in ZZ} \
$

#pagebreak()
== Příklad 4
Řešte v $RR$ rovnici:
$
  2 sin (3x + pi) & = -1 \
    sin (3x + pi) & = -1/2 \
          3x + pi & in {7/6 pi + 2k pi|k in ZZ} union {-1/6 pi + 2k pi|k in ZZ} \
                x & in {1/18 pi + 2/3k pi|k in ZZ} union {-7/18 pi + 2/3k pi|k in ZZ} \
$

== Příklad 5
Řešte v $RR$ rovnici:
$
  2 cos^2 x - 7 cos x + 3 & = 0 \
                    cos x & = u \
            2u^2 - 7u + 3 & = 0 \
                  u_(1,2) & = (7 plus.minus sqrt(49 - 4 dot.op 2 dot.op 3))/(4) \
                  u_(1,2) & = (7 plus.minus sqrt(49 - 24))/(4) \
                  u_(1,2) & = (7 plus.minus sqrt(25))/(4) \
                  u_(1,2) & = (7 plus.minus 5)/(4) \
                      u_1 & = (7 + 5)/(4) = 12/4 = 3 \
                      u_2 & = (7 - 5)/(4) = 2/4 = 1/2 \
                          \
                    cos x & = 1/2 \
                          \
                        x & in {1/3 pi + 2 k pi|k in ZZ} U {-1/3 pi + 2 k pi|k in ZZ} \
$

#pagebreak()
== Příklad 6
Řešte v $RR$ rovnici:

$
  sin x + sqrt(3) cos x & = sqrt(2) \
$

převedu na součtový vzorec:
idea je taková, že chci aby se koeficient u $sin x$ rovnal $cos alpha$ a koeficient u $cos x$ rovnal $sin alpha$, tím jednoduše převedu vztah nalevo na součtový vzorec $sin alpha + x$\
v tomto případě vydělím 2, obecně pro koeficienty $a; b$ vydělím $sqrt(a^2 + b^2)$\

$
         1/2 sin x + sqrt(3)/2 cos x & = sqrt(2)/2 \
  cos (pi/3) sin x + sin(pi/3) cos x & = sqrt(2)/2 \
                     sin(x + pi/3) x & = sqrt(2)/2 \
                            x + pi/3 & = pi/4 \
                                   x & = pi/4 - pi/3 \
                                   x & = -pi/12 \
                                   x & in {-pi/12 + 2 k pi|k in ZZ} \
                                     \
                            x + pi/3 & = -pi/4 \
                                   x & = (-7 pi)/12 \
                                   x & in {(-7 pi)/12 + 2 k pi|k in ZZ} \
                                     \
                                   x & in {-pi/12 + 2 k pi|k in ZZ} union {(-7 pi)/12 + 2 k pi|k in ZZ} \
$

#pagebreak()
== Příklad 7
Určete vzdálenost dvou míst, $M$ a $N$, mezi nimiž leží překážka, takže $N$ není z místa $M$ vidět. Byly změřeny vzdálenosti $abs(A M) = 54m$ a $abs(B N) = 60m$, přičemž $A,B,M$ ležív jedné přímce, a $abs(angle.spheric M A N) = 130 degree; space abs(angle.spheric M B N) = 109 degree$\

mrdat tohle

#pagebreak()
= Příklady kombinatorika
== Příklad 1
Šestnáct fotbalových družstev hrálo turnaj systémem každý s každým (každá dvojice sehrála jeden zápas). V celém turnaji padlo 420 gólů. Jaký byl průměrný počet gólů na jeden zápas?

potřebuji spočítat počet všech zápasů - což jsou kombinace bez opakování
$
  C_2(16) = vec(16, 2) = 16!/(2!(16-2)!) = (16 dot.op 15)/2 = 120
$

$
  g_a = 420/120 = 3.5\
$

== Příklad 2
Hodíme třemi stejnými hracími kostkami.\
(a) Jaká je pravděpodobnost, že na všech kostkách padne totéž číslo?\
$
  P & = "pozitivní případy"/"všechny případy" = 6 dot.op 1/6 dot.op 1/6 dot.op 1/6 = 1/36 \
$

(b) Jaká je pravděpodobnost, že na dvou kostkách bude stejné číslo a na třetí jiné?\
$
  P & = "pozitivní případy"/"všechny případy" = 6 dot.op 1/6 dot.op 1/6 dot.op 5/6 dot.op 3 = 5/12 \
$

== Příklad 3
$
  C'_5(5) = vec(9, 5) = (9!)/(5!4!) = 126\
$

#pagebreak()
= Komplexní čísla
$
  NN & = {1,2,3,4,5,6 ...} \
  ZZ & = {... -2,-1, 0, 1, 2 ...} \
  QQ & = {p/q; space p in ZZ; space q in NN} \
  RR & -> "axiomaticky - axiom o supremu - nejsou díry na číselné ose" \
     & -> "konstrukce" z space QQ "- Dedekindovy řezy - Jarník dif. počet 1" \
$
$
  sqrt(-1) & = ? \
  sqrt(-1) & = x \
   x in RR & => x^2 >= 0 \
           & => x in.not RR \
           & => x = i \
$

$
  C := {a + b i; space a,b in RR; space i^2 = -1}
$

začlenění $CC$ do reálné matematiky je motivováno řešením polynomiálních rovnic...

základní věta algebry:

$
  a_n x^n + a_(n-1) x^(n-1) + ... + a_1 x + a_0 & = 0 \
                                            a_i & in CC \
                                              x & in CC \
                                       a_n, a_0 & != 0 \
$

$exists$ právě $n$ komplexních kořenů(s násobností)

mimo jiné existují rovnice s reálnými kořeny které jsou však vypočítatelné jen odmocněním záporných čísel...

== Sčítání

$
          p & = a + b i \
          q & = c + d i \
            \
  r = p + q & = (a+c) + (b+d)i \
          r & in CC
$

$
          p & = a + b i \
          q & = c + d i \
            \
  r = p - q & = (a-c) + (b-d)i \
          r & in CC
$

$CC$ je množina uzavřená na sčítání a odčítání

#pagebreak()
== Násobení
potřebujeme distributivitu

$
  (1+2i)(2+3i) & = 2 + 3i + 4i + 6i^2 = -4 + 7i \
$

obecně

$
  (a + b i)(c + d i) & = a c + a d i + b c i - b d = (a c - b d) + (a d + b c)i
$

== Rozdělení na složky
$
  z & = a + b i \
  a & = Re z \
  b & = Im z \
$

== Číslo komplexně sdružené
při součtu
$
                z & = a + b i \
      overline(z) & = a - b i \
  z + overline(z) & = 2a = 2Re z \
$

při součinu
$
                     z & = a + b i \
           overline(z) & = a - b i \
  z dot.op overline(z) & = a^2 + b^2 \
$

#important(caption: "rozdíl čtverců(známe) a součet čtverců - nový")[$
  a^2 - b^2 & = (a+b)(a-b) \
  a^2 + b^2 & = (a+b i)(a-b i) \
$]

použití:
$
       x^2 + 4 & = 0 \
  (x+2i)(x-2i) & = 0 \
$

další důsledek:
#important[$
  z dot.op overline(z) = abs(z)^2
$]

#pagebreak()
== Dělení komplexních čísel
převedeme na násobení - rozšířím zlomek vhodným číslem, aby ve jmenovateli nebylo komplexní číslo

$
  (1+i)/(2+i) & = (1+i)/(2+i) dot.op (2-i)/(2-i) \
              & = ((1+i)(2-i))/(4+1) = (2 - i + 2i + 1)/5 \
              & = (3 + i)/5 = 3/5 + 1/5 i space checkmark \
$

== Násobení $i$
násobení buďto $a$ nebo $b i$ číslem $i$ je ekvivalentní s rotací o $pi/2$ proti směru hodinových ručiček.

z toho plyne že ->
$
    i & = i \
  i^2 & = -1 \
  i^3 & = -i \
  i^4 & = 1 \
  i^5 & = i \
  i^6 & = -1 \
  i^7 & = -i \
  i^8 & = 1 \
  i^9 & = i \
  ...
$

== Uspořádání
V $CC$ nelze definovat uspořádání, které zachovává všechna pravidla která známe z $RR$

důkaz sporem:

pokud by bylo možné definovat uspořádání ... tak by čísla $i$ a $0$ musela splňovat jedu ze $3$ podmínek:

(1) - $i > 0 => i dot.op i > 0 dot.op i => -1 > 0 space crossmark$\
(2) - $i = 0 space crossmark$\
(3) - $i < 0 => i dot.op i > 0 dot.op i => -1 > 0 space crossmark$\


#pagebreak()
== Polární(goniometrický) tvar $z$
$
    z & = a + b i \
  phi & = arctan(a/b) \
    z & = |z|(cos phi + i sin phi) \
    z & = sqrt(a^2 + b^2)(cos phi + i sin phi) \
$

=== Násobení 2 komplexních čísel v polárním(goniometrickém) tvaru
$
  z_1 &= a + b i\
  z_2 &= c + d i\
  \
  z_1 &= |z_1|(cos alpha + i sin alpha)\
  z_2 &= |z_2|(cos beta + i sin beta)\
  \
  z_1 dot.op z_2 &= |z_1|(cos alpha + i sin alpha) dot.op |z_2|(cos beta + i sin beta)\
  &= |z_1 dot.op z_2|(cos alpha cos beta + i cos alpha sin beta + i sin alpha cos beta - sin alpha sin beta)\
  &= |z_1 dot.op z_2|(cos alpha cos beta - sin alpha sin beta + i (cos alpha sin beta + sin alpha cos beta))\
$

#important[$
  |z_1 dot.op z_2|(cos alpha + beta + i sin alpha + beta)
$]

=> násobení je otočení o úhel který má číslo kterým násobíme(+ natažení o jeho délku)


=== Umocnění
#important[$
  z^2 = |z|^2 (cos 2alpha + i sin 2alpha)
$]

#important(caption: "obecně")[$
  z^n = |z|^n (cos n alpha + i sin n alpha)
$]

#important(caption: "Moivrevova věta")[$
  (cos alpha + i sin alpha)^n = (cos n alpha + i sin n alpha)
$]

== Řešení speciálních poly. rovnic
=== Kvadratická rovnice
$
  a x^2 + b x + c & = 0 \
                  \
                D & = b^2 - 4 a c \
                  \
            D > 0 & => "má 2 řešení v " RR \
            D = 0 & => "má 1 dvojité řešení v " RR \
            D < 0 & => "má 2 řešení v " CC " která jsou komplexně sdružená" \
                  \
            D < 0 & => x_(1,2) = -b/(2a) plus.minus i sqrt(abs(D))/(2a)
$

#pagebreak()
=== Binomická rovnice
$
  x^n & = a \
$
má vždy přesně $n$ jednonásobných komplexních kořenů

zapíšu rovnici v goniometrickém tvaru

$
    abs(x)^n (cos phi + i sin phi)^n & = a \
  abs(x)^n (cos n phi + i sin n phi) & = abs(a)(cos alpha + i sin alpha) \
                            abs(x)^n & = abs(a) \
                               n phi & equiv alpha (mod 2pi) \
                               n phi & = alpha + 2k pi \
                                     \
                              abs(x) & = root(n, abs(a)) \
                                 psi & = alpha/n + (2k pi)/n
$

==== např.
$
     x^4 & = 1 \
     x^4 & = 1(cos 0 + i sin 0) \
   alpha & = 0 \
  abs(1) & = 1 \
         \
       x & = abs(x)(cos phi + i sin phi) = root(4, 1)(cos (0 + (2 k pi)/4) + i sin (0 + (2 k pi)/4)); k in {0,1,2,3}
$

== Eulerův vztah

#important[$
  e^(i phi) = cos phi + i sin phi\
$]

potřebujeme definovat komplexní exponenciálu...

použijeme taylorův rozvoj

$
  e^x & = 1 + x + x^2/(2!) + x^3/(3!) + x^4/(4!) + ...
$

je základně definována v $RR$, ale můžeme přirozeně rozšířit do $CC$, pak ještě musíme dokázat že $forall z in CC: e^z in CC$
\
podobně můžeme rozšířit i $sin$ a $cos$ do oboru $CC$\

$
  sin x & = x - x^3/(3!) + x^5/(5!) - x^7/(7!) ... \
  cos x & = 1 - x^2/(2!) + x^4/(4!) - x^6/(6!) ... \
$

dosazením $i x$ do taylorovy řady pro $e^x$ dostanu řady pro $cos$ a $sin$...

a dále:

$
  e^(3 + 2i) & = e^3 dot.op e^(2i) = e^3(cos 2 + i sin 2)
$

#pagebreak()
a dále nádherný vztah:
#important[$
  e^pi + 1 = 0
$]


dále:

$
  e^(i x) + e^(-i x) & = 2 cos x \
                     & => cos x = (e^(i x) + e^(-i x))/2 \
                     & => sin x = (e^(i x) - e^(-i x))/(2i) \
$

symetrie s hyperbolickými funkcemi

$
  cosh x = (e^x + e^(-x))/2\
$

#pagebreak()
= Diferenciální počet
== Lineární aproximace
$$
== Pravidla pro derivace
=== Obecná
==== Součet
$
  (g + h)' & := g' + h' \
$
==== Násobení konstantou
$
  (k f(x))' & := k f'(x) \
$
==== Součin(Leibnitzovo pravidlo)
$
  (f g)' & := f'g + f g' \
$
==== Kompozice
$
                  (f compose g)' & := (f' compose g) dot.op g' \
                                 \
                               z & = z(y); space y = y(x) \
                               z & = z(x) = z(y(x)) \
                     (d z)/(d x) & = (d z)/(d y) dot.op (d y)/(d x) \
  (d z)/(d y) dot.op (d y)/(d x) & equiv (z' compose y) dot.op y'
$
==== Podíl
vychází z pravidla pro derivaci násobku a kompozice
$
  (f/g)' &:= (f dot.op 1/g)' => (f dot.op 1/g)' = f' dot.op 1/g + f dot.op (1/g)'\
  &= f'/g + f dot.op (1/g)' = f'/g - f dot.op g^(-2) dot.op g = f'/g - (f g')/(g^2) = (f'g - f g')/(g^2) space checkmark\
$
#important(caption: "pravidlo podílu")[$
  (f/g)' & := (f'g - f g')/g^2 \
$]

==== Inverzní funkce
$
   f^(-1)'(x) & := 1/(f'(f^(-1)(x))) \
  (d x)/(d y) & := 1/((d y)/(d x))
$


#pagebreak()
=== Konkrétní
==== Konstantní funkce
$
  k' & := 0 \
$
==== Mocninná funkce
$
  (x^n)' & := n x^(n-1) \
$

==== Sinus
$
  sin' & := cos \
$

z definice pro malé $epsilon$
$
  sin epsilon & =^. epsilon \
  cos epsilon & =^. 1 \
     (sin x)' & =^. (sin(x + epsilon) - sin x)/epsilon = (sin x cos epsilon + cos x sin epsilon - sin x)/epsilon \
              & =^. (sin x + epsilon cos x - sin x)/epsilon \
              & =^. (epsilon cos x)/epsilon \
              & =^. cos x \
$
==== Kosinus
$
  cos' & := -sin \
$

==== Exponenciála
$
  e^x' & := e^x \
  a^x' & := a^x ln a \
$

==== Přirozený logaritmus
z pravidla pro derivaci inverzní funkce

$
     ln'(x) & := 1/x \
            \
  exp(ln x) & = x \
     ln'(x) & = 1/(exp'(ln x)) = 1/(exp(ln x)) = 1/x \
$

#pagebreak()
= Vektory a matice (lineární algebra intro)
motivace - chceme složitější struktury - skupiny čísel
- sloupec čísel
$
  a = mat(a^1; a^2; a^3; ...; a^n)
$
- řádek čísel
$
  a = mat(a_1, a_2, a_3, ..., a_n)
$
- matice
$
  a = mat(a^1_1, a^2_1, ..., a^n_n; a^1_2, a^2_2, ..., a^n_n; ..., ..., ..., a^n_n)
$

== Jednoduché operace
=== součet/rozdíl
$
  a & = mat(a^1; a^2; a^3; ...; a^n); space a & = mat(b^1; b^2; b^3; ...; b^n) \
$

=== násobení
==== řádek a sloupec
$
           a & = mat(a^1; a^2; a^3; ...; a^n); space b = mat(b_1, b_2, b_3, ..., b_n) \
  a dot.op b & = a^1 b_1 + a^2 b_2 + ... + a^n b_n \
             \
  a dot.op b & = sum_(i=1)^n a^i b_i equiv a_i b^i
$

#important(caption: "sčítací konvence - zápis místo sumy")[$
  sum_(i=1)^n a^i b_i equiv a_i b^i
$]

#pagebreak()
==== matice a sloupec
výsledek je sloupec

$
           M & = mat(A^1_1, A^2_1, ...; A^1_2, A^2_2, ...; ..., ..., ...); space a = mat(a^1; a^2; a^3; ...; a^n); \
  M dot.op a & = mat(A_1^i a_i; A_2^i a_i; A_3^i a_i; ...; A_n^i a_i)
$
==== řádek a matice
výsledek je řádek
$
           M & = mat(A^1_1, A^2_1, ...; A^1_2, A^2_2, ...; ..., ..., ...); space a = mat(a_1, a_2, a_3, ..., a_n); \
  M dot.op a & = mat(a^i A^1_i, a^i A^2_i, a^i A^3_i, ..., a^i A^n_i) \
$

==== matice a matice
výsledek je matice
$
  M &= mat(A^1_1, A^2_1, ...; A^1_2, A^2_2, ...; ..., ..., ...); space N &= mat(B^1_1, B^2_1, ...; B^1_2, B^2_2, ...; ..., ..., ...)\
  \
  M dot.op N &= mat(A^i_1 B^1_i, A^i_1 B^2_i, ...; A^i_2 B^1_i, A^i_2 B^2_i, ...; ..., ..., ...)
$

#pagebreak()
==== tenzorový součin(spíše vnější součin - outer product)
vnější součin dvou vektorů je speciální případ tenzorového součinu\
$"řádek" times.o "sloupec" = "matice"$\

asi kartézský součin řádku a sloupce

$
  u times.o v & = u dot.op v^T \
            u & =vec(u_1, u_2, ..., u_n); space v=vec(v_1, v_2, ..., v_n) \
  u times.o v & = vec(u_1, u_2, ..., u_n) dot.op vec(v_1, v_2, ..., v_n)^T \
              & = vec(u_1, u_2, ..., u_n) dot.op mat(v_1, v_2, ..., v_n) \
              & = mat(
                  u_1 v_1, u_1 v_2, ..., u_1 v_n;
                  u_2 v_1, u_2 v_2, ..., u_2 v_n;
                  ..., ... ..., ..., ...;
                  u_n v_1, u_n v_2, ..., u_n v_n;
                ) \
$

#pagebreak()
==== transpozice
- značíme horním indexem $M^T$
- mění řádek na sloupeček a sloupeček na řádek
=> prohazuje index z jednoho místa na druhé
- matice převádí na matice - překlopí přes diagonálu
$
  M &= mat(A^1_1, A^2_1, ...; A^1_2, A^2_2, ...; ..., ..., ...); M^T &= mat(A^1_1, A^1_2, ...; A^2_1, A^2_2, ...; ..., ..., ...)\
$

umožňuje násobení sloupečku a sloupečku, nebo řádku a řádku => *skalární součin*

$
  a dot.op b & = a^T dot.op b \
$

== Aplikace
=== Komponenty vektorů
geometrické vektory
$
  a^arrow; space b^arrow\
  a^arrow + b^arrow, space k a^arrow\
$

zvolíme bázi vektorového prostoru(lineárně nezávislé vektory) - $B = {e_1, e_2, ... ,e_n}$ - každý vektor lze napsat jako lineární kombinaci vektorů složek báze
$
  a^arrow & = a_1 e_1 + a_2 e_2 + ... a_n b_n \
$
v tom daném prostoru definuji vektor jako(vzhledem k dané bázi $B$)
$
  vec(a_1, a_2, ..., a_n)
$
pokud báze není explicitně stanovená předpokládáme ortogonální jednotkovou bázi(kartézskou asi)
$
  B = {vec(1, 0, 0, ..., 0), vec(0, 1, 0, ..., 0) ... vec(0, 0, 0, ..., 1)}
$
=== Matice $equiv$ Lineární operátor
$
  M^(<->) dot.op a^arrow = b^arrow
$

- $M^(<->)$ znamená že $M$ je operátor
- *lineární* operátor znamená(linearita):
$
  M^(<->) dot.op (k dot.op a^arrow) = k dot.op (M^(<->) dot.op a^arrow); space k = "konst"\
  M^(<->) -> M space "přiřadíme operátoru matici"\
$

#pagebreak()
==== např. rotace ve 2D
zvolím si kartézskou bázi
$
              b^arrow & = R^(<->)_(Delta phi) a^arrow \
              a^arrow & = mat(a^1; a^2) = a_1 e_1 + a_2 e_2 \
              b^arrow & = mat(b^1; b^2) = b_1 e_1 + b_2 e_2 \
  R^(<->)_(Delta phi) & = mat(cos phi, -sin phi; cos phi, cos phi) \
$

kombinace rotací
$
  R^(<->)_(phi + psi) = R^(<->)_(phi) dot.op R^(<->)_(psi)
$
užitečné např. ve 3D, kde např. rotace v několika osách vzniká kombinací rotací v jednotlivých osách

=== Řešení soustavy lineárních rovnic
$
                                  -2x + 3y & = 1 \
                                  -4x + 2y & = 0 \
                                           \
  equiv mat(-2, 3; -4, 2) dot.op vec(x, y) & = (1,0) \
                        equiv AA dot.op XX & = RR \
                                     => XX & = RR dot.op AA^(-1) \
$

$AA^(-1)$ je inverzní matice k $AA$, později...

=== Maticová Algebra
i guess sčítání, násobení, plus vlastnosti:
- komutativita a asociativita sčítání
$
  AA; space BB; space CC\
  AA + BB = BB + AA\
  (AA + BB) + CC = AA + (BB + CC)\
$
- distributivita násobení
$
  AA; space BB; space CC\
  AA dot.op (BB + CC) = AA dot.op BB + AA dot.op CC\
$
- násobení není komutativní pro *všechny* matice
$
  AA; space BB\
  AA dot.op BB!= BB dot.op AA
$
=> definuje se tzv. *komutátor* - rozdíl obrácených operací
$
  AA; space BB\
  [AA, BB] = AA dot.op BB - BB dot.op AA
$
=> dále se definuje se tzv. *antikomutátor*
$
  AA; space BB\
  {AA, BB} "nebo" [AA, BB]_+ = AA dot.op BB + BB dot.op AA
$

== Inverzní matice
$
  AA dot.op AA^(-1) = 1 = AA^(-1) dot.op AA
$

$1$ je identitní matice(neutrální prvek pro násobení)
$
  1 "nebo" E = mat(1, ..., ...; ..., 1, ...; ..., ..., 1)
$

pro diagonální matice(mající prvky pouze na diagonále) je inverze triviální - každý prvek nahradíme jeho obrácenou hodnotoou

- regulární matice $AA <=> exists AA^1$
- singulární matice $AA <=> exists.not AA^1$

inverzní operátor by měl dělat opak
$
  M^(<->) -> M^(<-> -1)\
$

=== Determinant matice
- určí jestli je matice regulární nebo singulární
$
  det MM = 0 => "singulární"\
  det MM !e= 0 => "regulární"\
$

$
  det mat(a) &= a\
  det mat(a, b; c, d) &= a d - b c\
  det mat(a, b, c; d, e, f; g, h, i) &= a det mat(e, f; h, i) - b det mat(d, f; g, i) + c det mat(d, e; g, h)\
  det MM &= sum_(P(sigma)) sgn(sigma) product_n MM^n_(sigma_n) space "kde " sigma "je permutace indexů"
$

#important(caption: "Leibnitzův vzorec pro determinant")[$
  det MM & = sum_(P(sigma)) sgn(sigma) product_n MM^n_(sigma_n)
$]

vlastnosti
$
  det (AA dot.op BB) \= det AA dot.op det BB\
  det AA^(-1) \= 1/(det AA)\
$

#pagebreak()
=== Stopa matice(trace)
- značí se $tr(MM)$ - trace

$
  tr(MM) & = sum_n MM^n_n \
$

vlastnost stopy

$
  tr(MM dot.op NN dot.op OO) = tr(OO dot.op MM dot.op NN)
$
=> zůstává invariantní pro cyklickou rotaci násobených matic = > změnu jejich absolutního pořadí bez změny relativního...

důkaz:
$
  tr(AA dot.op BB ... YY dot.op ZZ) = sum_(a,b,c...z)AA^a_b BB^b_c ... YY^y_z ZZ^z_a = sum_(a,b,c...z) ZZ^z_a AA^a_b BB^b_c ... YY^y_z
$


#pagebreak()
= Integrální počet
Integrál reprezentuje spojitou sumu přes nekonečně mnoho nekonečně malých hodnot...

#important(caption: "definice")[$
  integral_a^b f(x) dx := lim_(N->infinity) sum_i^N f(x_i) dx space + "chyba řádu" dx; space dx = (b-a)/N; x_i = a + dx dot.op i\
$]

== Příklady
=== Příklad 1.
$
                  f(x) & = 1 \
  integral_a^b f(x) dx & = sum_i^N 1 dx space = N dot.op dx = b-a \
$
=== Příklad 2.
$
                            f(x) & = x \
            integral_a^b f(x) dx & = sum_i^N x_i dx space \
  = sum_i^N (a + i dot.op dx) dx & = a(b-a) + dx^2 sum_i^N i \
                                 & = a(b-a) + ((b-a)/N)^2 dot.op (N(N-1))/2 \
                                 & = a(b-a) + ((b-a)/N)^2 \
                                 & = ((b+a)(b-a))/2 \
$

#pagebreak()
== Motivace
dráha $s(t) -> v(t) = (d s)/(d t)(t)$ (rychlost)

=> chceme opačný proces k derivování, počítání plochy pod grafem, idk

$s(t) = integral_0^t v(t) d t$

- práce vykonána silovým polem - křivkový integrál nebo jak se to jmenuje
$
  W = integral_C F^arrow (r) d r = integral_a^b F(r(t)) dot.op (d r(t))/(d t) d t space "výsledek skalár"\
$


== Newtonův vzorec pro určitý integrál
- vyjadřuje plochu pod grafem funkce od $a$ do $b$
  - musím najít primitivní funkci k $f'(x) = integral f'(x) dx$ (obecný/neučitý integrál)
#important(caption: "Newtonův vzorec")[$
  integral_a^b f'(x) = f(b) - f(a)\
$]

- primitivní funkce není jednoznačná, existuje nekonečné množství funkcí které mi dají stejnou derivaci - píšu $integral f'(x) dx = f(x) + c$

#important(caption: "zkrácený zápis")[$
  [f]_a^b = f(b) - f(a)\
$]

- neurčitý integrál
$
  f(x) & = integral_0^x f'(x) = f(x) - f(0) \
$
- a pak:
$
  integral_a^b f'(x) & = f(b) - f(0) - (f(a) - f(0)) \
  integral_a^b f'(x) & = f(b) - f(a) \
$
- což znamená, že vždy hledám neurčitý integrál, z něj pak dostanu určitý jednoduše

#pagebreak()
== Integrační pravidla/metody
=== Obecná pravidla
==== Pravidlo 1 - součet
$
  integral f + g dx = integral f dx + integral g dx\
$
==== Pravidlo 2 - součet oblastí
$
  integral_a^b f dx = integral_a^c f dx + integral_c^b f dx\
$
==== Pravidlo 3 - konstanta $dot.op$ funkce
$
  integral k f dx = k integral f dx\
$
=== Pravidlo 4 - složená funkce
- řeším substitucí a dělením derivací vnitřní funkce
- i.e. převedu na integrál přes jinou proměnou
$
  integral f compose g dx & -> integral f du \
                       dx & = dx/du du \
                        g & = u \
                    du/dx & = g' \
                       dx & = du/(g') \
                          \
            integral f du & := integral f compose g dot.op g' dx \
$
- lze i opačně, udělám si z nesložené funkce funkci složenou - tbd...
$
  integral f dx = integral f compose u dx/du du
$

==== např. 1
$
          & integral x/(1 + x^2) dx \
  1 + x^2 & = u \
       du & = 2x dx \
       dx & = du/(2x) \
          & = integral x/u du/(2x) \
          & = integral 1/(2u) du \
          & = 1/2 integral 1/u du \
          & = 1/2 ln u + c \
          & = 1/2 ln (1 + x^2) + c \
$

#pagebreak()
=== Konkrétní pravidla
==== Pravidlo 1 - mocnina
- n nemusí být celé číslo
$
  integral x^n dx = (x^(n+1))/(n+1) + c\
$
===== např. 1
$
  integral_1^2 1/(x^2) dx = integral_1^2 x^(-2) dx = [x^(-1) dot.op -1]_1^2 = -1/2 + 1 = 1/2
$
===== např. 2
$
  integral_0^1 sqrt(x) dx = integral_0^1 x^(-1/2) dx = [x^(1/2)]_1^2 = -1/2 + 1 = 1/2
$
==== Pravidlo 2 - $sin$, $cos$, $tg$ a $cotg$
$
   integral sin x dx & = -cos x \
   integral cos x dx & = sin x \
    integral tg x dx & = -log cos x \
  integral cotg x dx & = log sin x \
$

==== např.
$
  integral_0^pi sin x dx = [-cos x]_0^pi = 1 -(-1) = 2\
$

==== Pravidlo 3 - exponenciála a obecná exponenciála
$
  integral e^x dx = e^x\
$

$
  integral a^x dx = (a^x)/(ln a)\
$
==== Pravidlo 4 - obrácená hodnota
$
  integral 1/x dx = ln |x|\
$
===== pozor! - záleží na přesné definici integrálu který počítáme - jestli počítáme plochu se znamínkem
$
  integral_(-1)^2 1/x dx = [ln |x|]_(-1)^2 = ln 2 - 0\
$
==== Pravidlo 4(obecné...) - součin - per partes i guess
$
  integral (f g)' dx & = integral f' g dx + integral f g' dx \
                 f g & = integral f' g dx + integral f g' dx \
  integral f' g dx + & = f g - integral f g' dx \
$
===== např. 1
$
  integral 2x ln x dx & = x^2 ln x - integral 2x ln(x) dx' \
                      & = x^2 ln x - integral x^2 1/x dx \
                      & = x^2 ln x - integral x dx \
                      & = x^2 ln x - (x^2)/2 \
$
===== např. 2
$
  integral ln x dx & = integral 1 dot.op ln x dx \
                   & = x ln x - x \
$
#important(caption: "integrál ln x")[$
  integral ln x dx = x ln x - x\
$]
===== např. 3
$
    integral cos^2 x dx & = sin x cos x - integral sin x (-sin x) dx \
                        & = sin x cos x - integral (1 - cos^2 x) dx \
                        & = sin x cos x + x - integral -cos^2 x) dx \
    integral cos^2 x dx & = sin x cos x + x - integral -cos^2 x dx \
  2 integral cos^2 x dx & = sin x cos x + x \
    integral cos^2 x dx & = 1/2 (sin x cos x + x) + c \
$

#pagebreak()
= Geometrie prostoru, souřadnice
== Euklidovský prostor
rovnoběžnost, měření vzdáleností, úhlů, nějaké axiomy

== Lineární/Vektorový prostor
jen sčítání a násobení i guess - slabší struktura

rozdíl mezi body a vektory...

-> kombinace prostorů i guess - prostor bodů a prostro směrů

== Affiní prostor
mám body a směry - obecnější než euklidovský prostor
- nemůžu měřit úhly asi
- přidáme skalární součin a můžu měřit úhly
- nemá počátek?
- zavedení barycentrického ss?

== $EE^2$
kulová geometrie - nemůžu asi úplně měřit směry
- možná by dávalo smysl měřit pro minimální vzdálenost ne?

- i guess definice zakřivení prostoru - konstantní pro $EE^2$?

== Fázový prostor
- prostor poloh a rychlostí(nebo hybností, idk) asi

#pagebreak()
== Skalární součin
$
  V times V -> RR\
  equiv V^2 -> RR "(asi)"\
$
symetrický
$
  a^arrow dot.op b^arrow = b^arrow dot.op a^arrow
$
lineární v obou argumentech
$
  k a^arrow dot.op b^arrow = a^arrow dot.op k b^arrow\
$
distributivita
$
  c^arrow (a^arrow + b^arrow) = c^arrow dot.op a^arrow + c^arrow dot.op b^arrow\
$
nedegenerovanost
$
  a^arrow dot.op a^arrow & >= 0 space forall a != 0 \
  a^arrow dot.op a^arrow & = 0 => a = 0 \
$
== Velikost vektoru
$
  norm(a^arrow) & = sqrt(a^arrow dot.op a^arrow) \
$

== Úhly mezi vektory
$
  a^arrow dot.op b^arrow = norm(a^arrow) norm(b^arrow) cos alpha
$
=== Definice kolmosti
$
  a^arrow perp b^arrow => a^arrow dot.op b^arrow = 0
$
== Projekce na $o^arrow$
$
  norm(o^arrow) = 1
$

rozložím $a^arrow$ na osu $o^arrow$ na $a_perp$ a $a_parallel$

dodělat definici $a_perp$ a $a_parallel$ tbd...

#pagebreak()
== Vektorový součin
- jen pro $3D$

$
              V times V & -> V \
  equiv RR^3 times RR^3 & -> RR^3 " (asi?)" \
                v^arrow & = a^arrow times b^arrow \
                v^arrow & perp a^arrow, b^arrow \
          norm(v^arrow) & = norm(a^arrow) norm(b^arrow) sin alpha \
          norm(v^arrow) & = S_(a b) \
  a^arrow times b^arrow & != a^arrow times b^arrow \
  a^arrow times b^arrow & = - b^arrow times a^arrow \
$
orientace $v^arrow$ podle pravidla pravé ruky

není asociativní
$
  (a^arrow times b^arrow) times c^arrow != a^arrow times (b^arrow times c^arrow)\
$

== Smíšený součin
$
  (a^arrow times b^arrow) dot.op c^arrow = "objem rovnoběžnostěnu(orientovaný)"\
  (a^arrow times b^arrow) dot.op c^arrow = (b^arrow times c^arrow) dot.op a^arrow = (c^arrow times a^arrow) dot.op b^arrow\
  (a^arrow times b^arrow) dot.op c^arrow = det mat(
    a_1, a_2, a_3;
    b_1, b_2, b_3;
    c_1, c_2, c_3
  )
$

== Vyjádření operací pomocí souřadnic
- souřadnice samozřejmě vzhledem k bázi $B = {e_1, e_2, e_3}$ pro $3D$...
- *ortonormální*(ortogonální a jednotková) báze je ideální $1-1$ mapping

- vzhledem k ortonormální bázi je vektorový součin:
$
  vec(a_1, a_2, a_3) dot.op vec(b_1, b_2, b_3) = a_1 b_1 + a_2 b_2 + a_3 b_3...
$

- pokud mám jinou bázi, dostanu ve vzorečku tzv *metrické koeficienty*
\
- vektorový součin pro ortonormální bázi:
$
  vec(a_1, a_2, a_3) times vec(b_1, b_2, b_3) = det_v mat(
    e_1, e_2, e_3;
    a_1, a_2, a_3;
    b_1, b_2, b_3;
  )
$

#pagebreak()
== Definice $3D$ prostoru $EE^3$
- afiní prostor
$
  B - A & = v^arrow \
  A - B & = -v^arrow \
$

- definujeme počátek $PP$, nejlépe $PP = [0,0,0]$
- bod definujeme průvodičem:
$
  r^arrow & = A - PP \
        A & = PP + r^arrow \
$

z toho vychází globální rovnoběžnost

- přidám skalární součin a dostanu úhly mezi směry a vzdálenosti
$
  d_(A B) & = norm(B - A) \
$

- souřadnice bodů - potřebuju počátek a bázi
- kartézské souřadnice - $PP = 0$ a báze je ortonormální
- pak:
$
  A = P + r^arrow & = P + r_1 e_1 + r_2 e_2 + r_3 e_3 \
                  & = P + x e_1 + y e_2 + z e_3 \
$

- bod $A$ (vzhledem k počátku a bázi)
$
  A = [x,y,z]
$

#pagebreak()
== Křivočaré souřadnice
- Sedmý kruh pekla
#image("./photo_2026-09-25_14-14-41.jpg")

#pagebreak()
== Polární souřadnice v $2D$
- asi dává smysl
#image("./photo_2026-09-25_14-18-25.jpg")

- asi dává smysl když chci otáčet bod v $2D$, tak si ho hodím do polárních souřadnic, otočím a převedu zpátky do kartézských souřadnic -> asi se hodí mít operátor co třeba převádí bod z jedné soustavy souřadnic do druhé, a jeho inverzní operátor který převádí zpět...

$
              [x_1,y_1] dot.op PP^(<->) & = [rho, phi] \
  [rho, phi + epsilon] dot.op PP^(-<->) & = [x_1,y_1] \
$

#pagebreak()
== Cylindrické souřadnice
$
  [x,y,z] dot.op CC^(<->) & = [rho, phi, z] \
$

== Sférické souřadnice
$
  [x,y,z] dot.op CC^(<->) & = [r, theta, phi] \
$

pokládám složky konstantě:
$
      r & = "konst" => "kulová plocha" \
  theta & = "konst" => "kužel" \
    phi & = "konst" => "rovina" \
$

$
    x & = r sin theta cos phi \
    y & = r sin theta sin phi \
    z & = r cos theta \
  rho & = r sin theta \
$

jsou ortogonální? jak to? co to znamená?

#pagebreak()
= Derivování v prostoru, gradient, parciální derivace
== Funkce více proměnných
$
  (partial f)/(partial x_k) (x_1, x_2 ... x_k ... x_p) & = d/(d x_k) (bold(x_1), bold(x_2) ... x_k ... bold(x_p)) \
                                                   & "bold znamená že vnímám jako konstantu" \
$

např.
$
                         f(x,y) & = x y^2 + x^2 \
            (partial f)/(partial x) & = y^2 dot.op 1 + 2x = y^2 + 2x \
            (partial f)/(partial y) & = 2y x + 1 \
  (partial^2 f)/(partial x partial x) & = 0 + 2 = 2 \
  (partial^2 f)/(partial y partial y) & = 2x \
  (partial^2 f)/(partial y partial x) & = 2y \
  (partial^2 f)/(partial x partial y) & = 2y \
$

platí že pro každou *rozumnou*(ať to znamená co to znamená) funkci:
$
  (partial^2 f)/(partial y partial x) = (partial^2 f)/(partial x partial y)
$
obecně:
$
  (partial^2 f)/(partial x_k partial x_l) = (partial^2 f)/(partial x_l partial y_l)
$

=== Pravidlo pro derivaci složené funkce
$
  f(x,y,z)\
  x(t)\
  y(t)\
  z(t)\
$

zajímá mě $F(t) = f(x(t), y(t), z(t))$

$
  (d F)/(d t) &= (partial f)/(partial x)(x,y,z)(d x)/(d t) + (partial f)/(partial y)(x,y,z)(d y)/(d t) + (partial f)/(partial z)(x,y,z)(d z)/(d t)\
  (d F)/(d t) &= sum_k (partial f)/(partial x_k) (d x_k)/(d t)
$

#pagebreak()
např:
$
       f(x,y) & = x y^2 + x^2 \
         x(t) & = 1/t \
         y(t) & = sqrt(t) \
         F(t) & = f(x(t),y(t)) = 1/t sqrt(t)^2 + 1/t^2 \
  (d F)/(d t) & = (partial f)/(partial x) (d x)/(d t) + (partial f)/(partial y) (d y)/(d t) \
  (d F)/(d t) & = (y^2 + 2x) (-1/t^2) + (2x y) (1/2 1/sqrt(t)) \
  (d F)/(d t) & = (t + 2/t) (-1/t^2) + (2 1/t sqrt(t)) (1/2 1/sqrt(t)) \
  (d F)/(d t) & = (t + 2/t) (-1/t^2) + (2 sqrt(t))/t (1/(2sqrt(t))) \
  (d F)/(d t) & = -1/t -2/t^3 + 1/t \
  (d F)/(d t) & = -2/t^3 space checkmark \
$

#pagebreak()
== Derivace v prostoru
=== Parametrizovaná křivka
$
  A: R -> E^3\
  A(xi) "nebo" A(s) "kde s je délka"\
  "obecný parametr" xi\
$

- zavedeme si např. kartézský systém $x,y,z$

$
  x(xi) & = x(A(xi)) \
  y(xi) & = y(A(xi)) \
  z(xi) & = z(A(xi)) \
$

- např. přímka

$
      A & = P + xi a^arrow \
  x(xi) & = x_0 + xi a^x \
  y(xi) & = y_0 + xi a^y \
  z(xi) & = z_0 + xi a^z \
$

- např. kružnice(nenatočená, v rovině)

$
  x & = x_0 + rho cos xi \
  x & = y_0 + rho sin xi \
  z & = z_0 \
$

#pagebreak()
==== Tečný vektor $t^arrow$
- zase lineární aproximace?
$
             Delta A & = A(xi + Delta xi) - A(xi) \
             t^arrow & = (Delta A)/(Delta xi) \
             t^arrow & = (A(xi + Delta xi) - A(xi))/(Delta xi) + "malá chyba :)))" \
  (d A^arrow)/(d xi) & = lim_(Delta xi -> 0) (A(xi + Delta xi) - A(xi))/(Delta xi) "   z definice derivace" \
             t^arrow & = (d A^arrow)/(d xi)
$

- lineární aproximace
$
  A(xi + Delta xi) & = A(xi) + (d A^arrow)/(d xi) + "chyba řádu " xi \
$

- v souřadnicích:
$
   A(xi) & = P + x(xi)e^arrow_x + y(xi)e^arrow_y + z(xi)e^arrow_z \
  A(xi)' & = t(xi)^arrow = (d x)/(d xi)e^arrow_x + (d y)/(d xi)e^arrow_y + (d z)/(d xi)e^arrow_z \
     t^x & = (d x)/(d xi) \
     t^y & = (d y)/(d xi) \
     t^z & = (d z)/(d xi) \
$

$
  V^arrow (t) & = (d A^arrow)/(d t) \
          v^x & = (d x)/(d xi) \
          v^y & = (d y)/(d xi) \
          v^z & = (d z)/(d xi) \
$


==== Délka křivky
- to asi bude integrál ne ;)
$
                          s & = sum_(k=0)^(n-1) Delta s_n \
                  Delta s_n & = abs(Delta A^arrow_k) \
            Delta A^arrow_k & = abs(t^arrow Delta xi) = Delta xi abs(t^arrow) \
  sum_(k=0)^(n-1) Delta s_n & = integral_(xi_1)^(xi_2) abs(t^arrow) Delta xi \
$

#pagebreak()
==== Dráhový integrál
máme nějakou veličinu definovanou pro každý bod v prostoru
$
  f : EE^3 -> RR; f(A); f(x,y,z) equiv f(A)\
$

- pak na křivce:
$
  f(A(xi)) & = f(x(xi), y(xi), z(xi)) \
$

- pak derivace této veličiny podél křivky:
- přesně tohle je složená funkce - derivujeme jak jsme si nadefinovali již dříve!
$
  (d f)/(d xi) &= (partial f)/(partial x)(dx)/(d xi) + (partial f)/(partial y) (d y)/(d xi) + (partial f)/(partial z) (d z)/(d xi) = (nabla^arrow f) dot.op t^arrow\
  \
  \
  \
  nabla^arrow f &= (partial f)/(partial x)e^arrow_x + (partial f)/(partial y)e^arrow_y + (partial f)/(partial z)e^arrow_z\
  t^arrow &= (d x)/(d xi)e^arrow_x + (d y)/(d xi)e^arrow_y + (d z)/(d xi)e^arrow_z\
$

*gradient funkce* $nabla^arrow f$, nebo také $grad f$ je vektor, jehož složky jsou parciální derivace té funkce!

#important(caption: "definice gradientu")[$
  nabla^arrow f = vec((partial f)/(partial x_1), (partial f)/(partial x_2), ...)
$]

rozdělím derivaci na dvě informace - informace o funkci, a informace o křivce!

==== Vlastnosti gradientu
- gradient udává směr nejvyššího růstu

- tečný vektor křivky udává jakým směrem jdu - kombinace gradientu a tečného vektoru mi říká jak se bude měnit podél křivky daná veličina

$
  f(A_0 + Delta A^arrow) & = f(A_0) + (nabla^arrow f) dot.op t^arrow dot.op partial xi + " chyba " Delta xi^2 \
                         & = f(A_0) + (nabla^arrow f) dot.op Delta A^arrow + " chyba " Delta xi^2 \
$

#important[$
  nabla^arrow (f + g) = nabla^arrow f + nabla^arrow g\
$]

#important[$
  nabla^arrow (f dot.op g) = (nabla^arrow f)g + f(nabla^arrow g)\
$]

#important[$
  nabla^arrow (f compose g) = f'compose g dot.op nabla^arrow g\
$]

#important[$
  nabla^arrow (f(g_1, g_2, g_3, ...)) = (partial F)/(partial h_1) (nabla^arrow h_1) + (partial F)/(partial h_2) (nabla^arrow h_2) + (partial F)/(partial h_3) (nabla^arrow h_3) + ...\
$]

#pagebreak()
kartézské souřadnice $x,y,z$:
#important[$
        nabla^arrow x & = e^x \
  (partial x)/(partial x) & = 1 \
  (partial x)/(partial y) & = 0 \
  (partial x)/(partial z) & = 0 \
        nabla^arrow y & = e^y \
        nabla^arrow z & = e^z \
$]

#important(caption: "Newtonův vzorec part 2, electric boogaloo")[$
  integral_z^k nabla^arrow f dot.op d s^arrow & = f(k) - f(z) \
$]
