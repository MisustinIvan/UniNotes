#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "@local/mod:0.1.0": *

#show: boilerplate

#title[Matematická analýza - přednáška - Dušan Pokorný]
= Informace o předmětu
- informace v MS Teams
  - chat, nahrávky, skripta, materiály asi?

- motivační citát:
"Matematika je nejednodušší věda - zvládne ji každý analfabet." - Roger Bacon

#pb()
= Výroky
#definition(title: "Výrok")[
  *výrok*: tvrzení, u kterého můžeme určit pravidvostní hodnotu $in {0,1}$
]

- jsou li $A$ a $B$ výroky, můžeme pomocí tzv. *logickýckých spojek* vytvořit nové výroky

#table(
  columns: 14,
  inset: 3pt,
  align: center,
  table.header(
    [A],
    [B],
    [$not A$],
    [$not(not A)$],
    [$A and B$],
    [$A or B$],
    [$A => B$],
    [$A <=> B$],
    [$not A or B$],
    [$not(A or B)$],
    [$(not A) and (not B)$],
    [$not A => not B$],
    [$not (A => B)$],
    [$A and (not B)$],
  ),
  [1], [1], [0], [1], [1], [1], [1], [1], [1], [0], [0], [1], [0], [0],
  [1], [0], [0], [1], [0], [1], [0], [0], [1], [0], [0], [0], [1], [1],
  [0], [1], [1], [0], [0], [1], [1], [0], [1], [0], [0], [1], [0], [0],
  [0], [0], [1], [0], [0], [0], [1], [1], [0], [1], [1], [1], [0], [0],
)

== Příklad 1.
pokud $x + y > 2$ potom $x > 1$ nebo $y > 1$ pro $x,y in RR$

$
  x+y > 2 & => x>1 or y>1 \
$

=== Přímý důkaz (asi výčtem možností)
$
  A & => B "(předpokládám A = 1, odvodím B)" \
$

2 možnosti pro $x$
$
  x & > 1 => x>1 or y>1 \
  x & <= 1 \
    & => 2 < x + y <= 1 + y => 2 < 1 + y => 1 < y => B \
$

=== Nepřímý důkaz $not B => not A$

$
  not A & = x + y <= 2 \
  not B & = not(x>1 or y>1) = not(x>1) and not(y>1)) \
        & = x<=1 and y<=1 \
$
sečtu nerovnosti $x<=1; y<=1$
$
  x+y <= 2\
$
a mám
$
  x + y <= 2 & => x+y <= 2 space checkmark \
$

#pb()
=== Důkaz sporem
obecná struktura
$not Q => (P and (not P)) => Q$

chceme dokázat $A => B$, budeme předpokládat $not (A => B)$ a najdeme spor

$
  not (A => B) <=> A and (not B)
$

$
  x + y > 2 & and (x <= 1 and y <= 1) \
$

sečtu nerovnosti:
$
  x <= 1 and y <= 1 & => x + y <= 2 \
         x + y <= 2 & = not(x + y > 2) \
$
takže mám:
$
  x + y > 2 and not(x + y > 2)\
$

== Výroky s parametrem

např.
$
  x+y > 2 & => x>1 or y>1 \
$

$x,y$ jsou parametry, na definičním oboru paremetrů(množině) závisí výsledek

tedy:

$
  forall x,y & in RR \
     x+y > 2 & => x>1 or y>1 \
$

== Kvantifikátory
- $forall$ - obecný kvantifikátor - "pro všechna"
- $exists$ - existenční kvantifikátor - "existuje"
- $exists'$ - kvantifikátor jednoznačné existence - "existuje *právě* jeden"

tedy:
$
  forall y in RR: A(x,y)
$

je výrok již parametrizovaný $y$ a závislý na $x$

Výrokům s kvantifikátory budeme(ne nebudeme) říkat *výrokové formule*.

=== Negace výrokových formulí
$
                       not(exists x in XX: phi(x)) & <=> forall x in XX: not phi(x) \
                      not (forall x in XX: phi(x)) & <=> exists x in XX: not phi(x) \
  not(forall x in RR space exists n in NN : n > x) & <=> not forall x in RR : psi(x) <=> exists x in RR : not psi(x) \
                                                   & <=> exists x in RR space forall n in NN : n <= x \
$

#pb()
== Výrokové formule na přirozených číslech a matematická indukce

máme formuli:
$
  n in NN; space A(n)\
$

např.
$
  & n > 7 \
  & n^2 "je prvočíslo"
$

Chceme dokázat platnost $A(n)$ pro $n in NN$ nebo $n in NN and n >= n_0$

#definition(title: "Princip matematické indukce")[
  $(A(n_0) and (forall n in NN: n >= n_0 => (A(n) => A(n+1)))) => (forall n in NN: n >= n_0 => A(n))$
]

=== Příklad 1.
$
  A: forall n & in NN: 6 | 7^n -1 \
$

pro $n = 1$

$
  6 | 7 - 1 space checkmark
$

předpokládám $A(n)$, dokazuji $A(n+1)$

$
  forall (n+1) & in NN: 6 | 7^(n+1) -1 \
  forall (n+1) & in NN: 6 | 7 dot.op 7^n -1 \
  forall (n+1) & in NN: 6 | (6 + 1) dot.op 7^n -1 \
  forall (n+1) & in NN: bold(6) | bold(6) dot.op 7^n + bold(7^n - 1) \
               & space checkmark
$

první část násobím $6$, druhá platí podle předpokladu, výrok tedy platí

#pb()
= Reálná čísla
== Věta o existenci reálných čísel

#theorem[
  Existuje *úplné* *uspořádané* *těleso*. Každá dvě úplná uspořádaná tělesa jsou *isomorfní*.
]

== Operace s reálnými čísly a jejich uspořádání
operace - sčítání a násobení
$
  & a + b \
  & + (a,b) -> c \
  \
  & a dot.op b \
  & dot.op (a,b) -> c \
$

uspořádání
$
  a < b
$

=== Co je to *Těleso*?
Intuitivně - Těleso je "číselný obor kde násobím a sčítám jak jsem zvyklý"?

==== Chtěné vlastnosti

komutativita násobení a sčítání
$
  x + y <=> y + x\
  x dot.op y <=> y dot.op x\
$

asociativita sčítání a násobení
$
  x + (y + z) <=> (y + x) + z\
  x dot.op (y dot.op z) <=> (y dot.op x) dot.op z\
$

distributivita
$
  x(y + z) <=> x y + x z\
$

neutrální prvky pro operace
$
  x + 0 = x\
  x dot.op 1 = x\
$

inverzní prvky
$
  & exists -x in TT: x + (-x) = 0 \
  & exists inv(y) in TT without {0}: y dot.op inv(y) = 1 \
$

#pb()
==== Formální definice Tělesa
#definition[
  - 9 axiomů

  Tělesem nazýváme uspořádanou pětici objektů
  #important[ $(TT, +, dot.op, 0, 1)$ ]
  kde:

  $TT$ je množina

  $+, dot.op$ jsou operacena $TT$

  $0, 1$ jsou prvky $TT$, přičemž $0!=1$

  navíc $forall x,y,z in TT$ jsou splněny následující axiomy

  + komutativita sčítání
    $ x + y = y + x $
  + komutativita násobení
    $ x dot.op y = y dot.op x $
  + asociativita sčítání
    $ x + (y + z) = (y + x) + z $
  + asociativita násobení
    $ x dot.op (y dot.op z) = (y dot.op x) dot.op z $
  + distributivita násobení
    $ x(y + z) = x y + x z $
  + existence identitního prvku pro sčítání
    $ x + 0 = x \ $
  + existence identitního prvku pro násobení
    $ x dot.op 1 = x $
  + existence inverzního prvku pro sčítání
    $ exists -x in TT: x + (-x) = 0 $
  + existence inverzního prvku pro násobení
    $ exists inv(y) in TT without {0}: y dot.op inv(y) = 1 $
]

tuto definici splňuje např. množina $ZZ_2$ s prvky $0,1$ - sčítání a násobení $mod(2)$

definici nesplňují např. $NN$ a $ZZ$

definici splňují $QQ, RR, CC$

=== Co znamená uspořádání?
Intuitivně: "Uspořádané těleso je těleso kde mohu upravovat nerovnosti tak jak jsem zvyklý"

*Tranzitivita* je důležitá chtěná vlastnost

$
  a < b and b < c => a < c;
$

*Linearita*(také úplnost) - mohu porovnat libovolné dva prvky

==== Formální definice uspořádání(úplné, lineární):

#definition[
  Relaci $<$ na množině $M$ nazveme (úplné, lineární) uspořádání, pokud splňuje následující axiomy:
  $
    & forall a,b,c in M: \
    & (1) : space (a<b) or (b<a) or (a=b) bold("(linearita)") \
    & (2) : space ((a<b)and(b<c)) => (a<c) bold("(tranzitivita)") \
    & (3) : space not(a < a) bold("(antireflexivita)") \
  $
]

#pb()
==== Formální definice uspořádaného tělesa
#definition[
  Mějme těleso $(T, +, dot.op, 0, 1)$, pak $(T, +, dot.op, 0, 1, <)$ nazveme uspořádaným tělesem jestliže relace $<$ je uspořádání(úplné, lineární) splňuje na množině $T$ následující axiomy:

  $
    & forall x,y,z in T: \
    & (1): space (a<b) => (a+b < b+c) \
    & (2): space ((c > 0) and (a<b)) => (a dot.op c < b dot.op c) \
  $
]

$CC$ není uspořádané těleso

#proof(title: [sporem])[
  $
    i & < 0 \
    i & > 0 \
  $

  - v každém uspořádaném tělese platí: $0 < 1$

  $
    0 & = 1+(-1) \/ dot.op (-1) \
    0 & = -1 + (-1)^2 \
    1 & = (-1)^2 \
  $

  - to by mělo platit pro libovolné $x$

  $
     0 & = 1+(-1) \/ dot.op x \
    -x & = -1 dot.op x \
  $

  - pokud

  $
    1 < 0 & => (-1)^2 < 0 \
     -1>0 & => (-1)(-1) > 0 "   spor" \
  $

  - zpět nahoru

  $
    i & < 0 => -1 = i^2 => 1<0 \
    i & > 0 => -i > 0 => (-i)^2 > 0 => (-1)^2 i^2 > 0 => 1 dot.op (-1) > 0 => -1 > 0 "   spor" \
  $
]


#pb()
=== Definice úplnosti(supremum, infimum)
#definition[
  Nechť $(T, +, dot.op, 0, 1, <)$ je uspořádané těleso a $M subset.eq T$.

  Říkáme že $a in T$ je:
  - *horní mez(závora)* množiny $M$, pokud $(x in M) => x <= a$
  - *dolní mez(závora)* množiny $M$, pokud $(x in M) => x >= a$
  - *supremum* množiny $M$, pokud $a,b$ jsou horní meze $M$ potom $b >= a$
  - *infimum* množiny $M$, pokud $a,b$ jsou dolní meze $M$ potom $b <= a$

  Říkáme že množina $M$ je:
  - *omezená shora*, pokud má horní mez
  - *omezená zdola*, pokud má dolní mez
  - *omezená*, pokud je omezená shora i zdola

  Uspořádané těleso $(T, +, dot.op, 0, 1, <)$ nazveme *úplné*, pokud každá shora omezená množina $M subset.eq T$ má v supremum $a in T$.
]

== Reálná čísla
Reálná čísla(značíme $RR$) jsou jediné(izomorfismus) úplné uspořádané těleso.
=== Klíčové vlastnosti $RR$
==== Archimédova vlastnost
$
  forall x in RR sq exists n in NN: n > x
$

#proof(title: [sporem])[
  nechť
  $exists x in RR sq forall n in NN: n <= x$

  položme
  $s = sup NN$ -> $s-1$ není horní mez $NN$, tedy existuje $n in NN$, že $s-1<n$ -> $s < n+1 in NN$ -> s není horní mez
]

==== Hustota $QQ$ v $RR$
$
  x,y in RR sq x < y => exists q in QQ: x < q < y
$
==== Vlastnost infima
Každá zdola omezená množina $A subset.eq RR$ má infimum kde:
$
  inf A = - (sup (-A))
$

kde $-A$ je množina $A$ překlopená kolem $0$, resp $f(x) = -x => -A = f(A)$

#pb()
=== Definice $n$-té odmocniny v $RR$
#definition[
  - v $RR$ můžeme definovat $n$-tou odmocninu z $x >= 0 in RR$ -> $root(n, x)$

  $
    root(n, x) = sup {y| y^n < x}
  $
]

např.

$
  sqrt(3) & = sup {y|y^2 < 3} \
$

#proof(title: [sporem])[
  $
    sqrt(3)^2 < 3 => sqrt(3)^2 = 3-epsilon; sq epsilon > 0 in RR\
  $
  uvažujeme $delta in (0,1)$, potom
  $
    (sqrt(3) + delta)^2 & = sqrt(3)^2 + 2 sqrt(3) delta + delta^2 \
                        & = 3-epsilon + 2 sqrt(3) delta + delta^2 \
                        & <= 3-epsilon + 2 sqrt(3) delta + delta \
                        & = 3-epsilon + delta(2 sqrt(3) + 1) \
  $
  volím $delta$ tak, aby $delta(2 sqrt(3) + 1) < epsilon$ např. $delta = epsilon/(2(2sqrt(3) + 1))$

  tedy

  $
    & <= 3 - epsilon + epsilon/(2(2sqrt(3) + 1)) (2(2sqrt(3) + 1)) \
    & => 3 - epsilon/2 < 3 \
  $

  tedy $sqrt(3)$ nemůže být supremum - spor
]

#pb()
=== Definice $e$ pomocí suprema a důkaz že je iracionální
#definition[
  - $e$ = eulerovo číslo

  klasika:
  $
    e = 1/0! + 1/1! + 1/2! + 1/3! + ...
  $

  definujme $e = sup {2 + 1/2! + 1/3! + ... + 1/k!| k in NN} = {x(k)|k in NN}$

  a tedy $x(k+1) = x(k) + 1/(k+1)!$
]

chceme dokázat že $e in RR without QQ$

#proof(title: [sporem])[
  - předpokládám $e = m/n; sq m,n in NN$ BÚNO $n > 1$

  Volme $l in NN$
  $
    x(n+l) & = x(n) + 1/(n+1)! + 1/(n+2)! + 1/(n+3)! + ... + 1/(n+l)! \
    x(n+l) & = 1/n!(n! dot.op x(n) + 1/(n+1) + 1/((n+1)(n+2)) + ... + 1/((n+1) ... (n+l))) \
           & "odhad zezhora:" \
           & <= 1/n!(N + 1/(n+1) + 1/(n+1)^2 + ... + 1/(n+1)^l) \
           & = 1/n!(N + 1/(n+1) dot.op (1- 1/(n+1)^l)/(1- 1/(n+1))) \
           & = 1/n!(N + 1/(n+1) dot.op (1- 1/(n+1)^l)/n) \
           & "odhad zezhora:" \
           & <= 1/n!(N + 1/n) \
  $

  tedy:
  $
           x(n+l) & <= e <= 1/n!(N + 1/n) \
    x(n) < x(n+l) & <= e <= 1/n!(N + 1/n) \
             N/n! & <= e <= 1/n!(N + 1/n) \/ dot.op n! \
               N! & < m/n n! <= N + 1/n \
               N! & < m (n-1)! <= N + 1/n \
          m(n-1)! & in (N, N+1/n chevron.r subset (N, N+1) sq "spor!"
  $

  a tedy $e in RR without QQ$
]

#pb()
== Množiny a zobrazení
- (pro nás) jsou množiny
  + definované výčtem - ${1,2,3,"letadlo"}$
  + definované formulí - ${x in X: phi(x)}$
    - např. $(0,1) = {x in RR: x > 0 and x < 1}$

- zároveň akceptujeme že $NN, ZZ, QQ, RR, CC$ jsou množiny(bez hlubší definice)

- (ne pro nás) jsou množiny jinak standardně definovány/vymezeny pomocí systemů axiomů -> popeláři matematiky
  - základní teze - *všechno*(asi úplně všechno) jsou množiny
    - např. těleso - $(T, +, dot.op, 0,1, <)$ koncept uspořádané šestice
    - např. uspořádaná dvojice ${a,b}$ -> ${{a},{a,b}} -> (a,b)$
  - jednoduchý příklad na $NN, +, dot.op, <$
    - $0 = emptyset$
    - $1 = {emptyset}$
    - $n + 1 = n union {n}$
    - $2 = 1+1 = 1 union {1} = {emptyset, {emptyset}}$
    - $3 = {emptyset, {emptyset}, {emptyset, {emptyset }}}$
    - velice podobné Church encodingu v lambda kalkulu

=== Zobrazení(funkce)
- intuitivně to je přiřazení prvků jedné množiny prvkům druhé - mapping
$
     f & : X->Y \
  f(x) & =y \
$

- v rámci teorie množin nejdřív definuji kartézský součin - $X times Y$ - množina všech uspořádaných dvojic těchto množin $(x,y); sq x in X and y in Y$
  - funkci/zobrazení dále definuji jako podmnožinu kartézského součinu, identifikuji s jejím grafem $"graf"(f)$
  - platí výrok: $forall x in X forall y,z in Y: (x,y) in "graf"(f) and (x,z) in "graf"(f) => y = z$
  - pak píšeme $f(x) = y$ místo $(x,y) in "graf"(f)$
  - obdobně prostou funkci, inverzní funkci atd...

#figure(
  cetz.canvas({
    import cetz.draw: *

    // Množina X (definiční obor)
    circle((0, 0), radius: (1.3, 1.9), fill: rgb("#eef4ff"), stroke: 1.3pt + rgb("#2563eb"))
    content((0, 2.2), anchor: "south", text(1.2em, weight: "bold", fill: rgb("#1d4ed8"))[$X$])

    // Množina Y (obor hodnot / cílová množina)
    circle((4.8, 0), radius: (1.3, 1.9), fill: rgb("#faf5ff"), stroke: 1.3pt + rgb("#9333ea"))
    content((4.8, 2.2), anchor: "south", text(1.2em, weight: "bold", fill: rgb("#7e22ce"))[$Y$])

    // Prvky v množině X
    circle((0.2, 0.7), radius: 0.07, fill: black, stroke: none)
    content((0.05, 0.7), anchor: "east", [$x$])

    circle((-0.1, -0.5), radius: 0.07, fill: black, stroke: none)
    content((-0.25, -0.5), anchor: "east", [$x'$])

    // Prvky v množině Y
    circle((4.4, 0.7), radius: 0.07, fill: black, stroke: none)
    content((4.6, 0.7), anchor: "west", [$y = f(x)$])

    circle((4.2, -0.5), radius: 0.07, fill: black, stroke: none)
    content((4.4, -0.5), anchor: "west", [$f(x')$])

    circle((4.6, -1.1), radius: 0.06, fill: rgb("#6b7280"), stroke: none)
    content((4.75, -1.1), anchor: "west", text(fill: rgb("#6b7280"))[$z$])

    // Šipky přiřazení (funkce f)
    bezier(
      (0.3, 0.75),
      (4.25, 0.75),
      (1.6, 1.7),
      (3.0, 1.7),
      stroke: 1.2pt + rgb("#1e293b"),
      mark: (end: ">", fill: rgb("#1e293b"), size: 0.25),
    )
    content((2.3, 1.55), anchor: "south", text(1.15em, style: "italic")[$f$])

    bezier(
      (0.0, -0.45),
      (4.05, -0.45),
      (1.5, 0.1),
      (2.8, 0.1),
      stroke: (dash: "dashed", paint: rgb("#64748b"), thickness: 1pt),
      mark: (end: ">", fill: rgb("#64748b"), size: 0.22),
    )
  }),
  caption: [Zobrazení $f: X arrow Y$ jako přiřazení prvků mezi množinami],
)


#pb()
==== Definiční obor
$
  f: RR->RR\
  D(f) = {x in RR | exists y in RR: f(x) = y}
$

==== Obor hodnot
$
  f: RR->RR\
  H(f) = {y in RR | exists x in D(f): f(x) = y}
$

==== Dvě konvence pro zápis typu funkce
specifikuji jen typ argumentu, ne definiční obor, tj. $D(f) subset.eq RR$
$
  f: RR-> RR
$

specifikuji definiční obor přímo, tj. $D(f) = (0,1)$
$
  f: (0,1) -> RR
$

==== Reálné funkce
- reálná funkce jedné reálné proměnné
$
  f:RR ->RR "  kde" D(f) subset.eq RR
$

==== Operátory na množinách
$
  A union B = {x:(x in A) or (x in B)}\
  A inter B = {x:(x in A) and (x in B)}\
  A without B = {x:(x in A) and (x in.not B)}\
$

velké operátory asi, proindexované
$
  {M_alpha: alpha in A} -> union.big_(alpha in A) M_alpha = {x: exists alpha in A: x in M_alpha}
$

#pb()
== Spojitost a limita reálných funkcí
- intuice vs přesnost

- intuice:
  - něco jako nekonečná řada... $1/0! + 1/1! + 1/2! + ...$
  - supremum tak trochu odpovídá limitě

#figure(
  cetz.canvas({
    import cetz.draw: *

    // Coordinate scaling factors
    let sx = 1.3
    let sy = 1.4

    // Values of partial sums s_n = sum_{k=0}^n 1/k!
    let data = (
      (0, 1.0, [$s_0 = 1$]),
      (1, 2.0, [$s_1 = 2$]),
      (2, 2.5, [$s_2 = 2.5$]),
      (3, 2.667, [$s_3 approx 2.67$]),
      (4, 2.708, []),
      (5, 2.717, []),
    )
    let e-val = 2.71828

    // Grid / Axes
    line((-0.4, 0), (5.8 * sx, 0), mark: (end: ">"), stroke: 0.8pt)
    content((5.8 * sx, -0.3), anchor: "north", [$n$])

    line((0, -0.3), (0, 3.3 * sy), mark: (end: ">"), stroke: 0.8pt)
    content((-0.3, 3.3 * sy), anchor: "east", [$s_n$])

    // Asymptote / Supremum line
    line(
      (-0.3, e-val * sy),
      (5.5 * sx, e-val * sy),
      stroke: (paint: rgb("c0392b"), dash: "dashed", thickness: 1pt),
    )
    content(
      (5.5 * sx + 0.15, e-val * sy),
      anchor: "west",
      text(fill: rgb("c0392b"), weight: "bold")[$sup = lim_(n -> oo) s_n = e approx 2.718$],
    )

    // Tick for e on y-axis
    line((-0.08, e-val * sy), (0.08, e-val * sy), stroke: 0.8pt + rgb("c0392b"))
    content((-0.2, e-val * sy), anchor: "east", text(fill: rgb("c0392b"))[$e$])

    // Y-axis integer ticks
    for y in (1, 2, 3) {
      line((-0.08, y * sy), (0.08, y * sy), stroke: 0.6pt)
      content((-0.2, y * sy), anchor: "east", text(fill: luma(60))[$#y$])
    }

    // X-axis ticks
    for (n, _, _) in data {
      line((n * sx, -0.08), (n * sx, 0.08), stroke: 0.6pt)
      content((n * sx, -0.3), anchor: "north", text(fill: luma(60))[$#n$])
    }

    // Vertical drop lines and connecting segments
    for i in range(data.len() - 1) {
      let (n1, v1, _) = data.at(i)
      let (n2, v2, _) = data.at(i + 1)
      line(
        (n1 * sx, v1 * sy),
        (n2 * sx, v2 * sy),
        stroke: (paint: rgb("2980b9").lighten(40%), dash: "dotted", thickness: 0.8pt),
      )
    }

    // Plot points and labels
    for (n, val, lbl) in data {
      // Drop line to x-axis
      line(
        (n * sx, 0),
        (n * sx, val * sy),
        stroke: (paint: luma(180), dash: "densely-dotted", thickness: 0.6pt),
      )

      // Data point
      circle(
        (n * sx, val * sy),
        radius: 0.07,
        fill: rgb("2980b9"),
        stroke: 0.6pt + white,
      )

      // Value annotations for first few points
      if lbl != [] {
        content(
          (n * sx + 0.15, val * sy - 0.2),
          anchor: "north-west",
          text(size: 8pt, fill: rgb("1b4f72"), lbl),
        )
      }
    }
  }),
  caption: [Posloupnost částečných součtů $s_n = sum_(k=0)^n 1/k!$ konvergující k supremu (limitě) $e$.],
)


- spojitost intuitivně znamená že jsem schopen něco nakreslit bez toho aniž bych musel zvednout pero

- extrémní případ nespojitosti - *Dirichletova funkce*

$
  f(x) = cases(
    1 sq x in QQ,
    0 sq x in.not QQ
  )
$

#figure(
  cetz.canvas({
    import cetz.draw: *

    // Coordinate system parameters
    let xmin = -3.0
    let xmax = 3.0
    let ymin = -0.5
    let ymax = 1.6

    // Background grid (light)
    for x in (-2, -1, 1, 2) {
      line((x, ymin + 0.2), (x, ymax - 0.2), stroke: (paint: rgb("e0e0e0"), dash: "dotted", thickness: 0.5pt))
    }
    line((xmin + 0.2, 1), (xmax - 0.2, 1), stroke: (paint: rgb("e0e0e0"), dash: "dotted", thickness: 0.5pt))

    // Axes
    line((xmin - 0.3, 0), (xmax + 0.5, 0), stroke: 0.7pt + rgb("555555"), mark: (end: ">", fill: rgb("555555")))
    line((0, ymin - 0.2), (0, ymax + 0.3), stroke: 0.7pt + rgb("555555"), mark: (end: ">", fill: rgb("555555")))

    // Axis labels
    content((xmax + 0.5, 0), anchor: "west", text(size: 9pt, fill: rgb("333333"), $x$))
    content((0, ymax + 0.35), anchor: "south", text(size: 9pt, fill: rgb("333333"), $y$))

    // Axis tick marks & numbers
    for x in (-2, -1, 1, 2) {
      line((x, -0.06), (x, 0.06), stroke: 0.6pt + rgb("555555"))
      content((x, -0.15), anchor: "north", text(size: 8pt, fill: rgb("666666"), str(x)))
    }
    line((-0.06, 1), (0.06, 1), stroke: 0.6pt + rgb("555555"))
    content((-0.15, 1), anchor: "east", text(size: 8pt, fill: rgb("666666"), [1]))
    content((-0.15, -0.15), anchor: "north-east", text(size: 8pt, fill: rgb("777777"), [0]))

    // Dirichlet function representation (y = 1 for rationals)
    line(
      (xmin, 1),
      (xmax, 1),
      stroke: (paint: rgb("1b4f72"), thickness: 1.5pt, dash: (2pt, 2.5pt)),
    )

    // Dirichlet function representation (y = 0 for irrationals)
    line(
      (xmin, 0),
      (xmax, 0),
      stroke: (paint: rgb("c0392b"), thickness: 1.5pt, dash: (0.8pt, 2pt)),
    )

    // Explanatory annotations
    content(
      (xmax + 0.2, 1),
      anchor: "west",
      text(size: 8.5pt, fill: rgb("1b4f72"), [$y = 1 quad (x in QQ)$]),
    )
    content(
      (xmax + 0.2, -0.3),
      anchor: "west",
      text(size: 8.5pt, fill: rgb("c0392b"), [$y = 0 quad (x in.not QQ)$]),
    )
  }),
  caption: [Schematické znázornění Dirichletovy funkce $f(x)$ (v každém intervalu nabývá nekonečněkrát hodnot $0$ i $1$).],
)

- variace extrémního případu - spojitá jen v jednom bodě

$
  f(x) = cases(
    0 sq & x in QQ,
    abs(x) sq & x in.not QQ
  )
$

#cetz.canvas({
  import cetz.draw: *

  let xmin = -3
  let xmax = 3

  // Axes
  line((xmin, 0), (xmax + 0.4, 0), mark: (end: ">"))
  line((0, -0.4), (0, 3.4), mark: (end: ">"))
  content((xmax + 0.5, -0.25), anchor: "north-east", [$x$])
  content((-0.25, 3.5), anchor: "south-east", [$y$])

  // Irrational branch: y = |x|
  line(
    (xmin, 3),
    (0, 0),
    (xmax, 3),
    stroke: (paint: rgb("1b4f72"), thickness: 1.5pt, dash: (0.8pt, 2pt)),
  )

  // Rational branch: y = 0
  line(
    (xmin, 0),
    (xmax, 0),
    stroke: (paint: rgb("c0392b"), thickness: 1.5pt, dash: (0.8pt, 2pt)),
  )

  // The single point of continuity
  circle((0, 0), radius: 0.07, fill: black, stroke: none)

  // Explanatory annotations
  content(
    (xmax + 0.2, 2.6),
    anchor: "west",
    text(size: 8.5pt, fill: rgb("1b4f72"), [$y = abs(x) quad (x in.not QQ)$]),
  )
  content(
    (xmax + 0.2, 0.3),
    anchor: "west",
    text(size: 8.5pt, fill: rgb("c0392b"), [$y = 0 quad (x in QQ)$]),
  )
})

#pb()
=== Definice okolí bodu
#definition[
  - *okolí bodu* je množina
  $
    c in RR; epsilon in RR^+\
    U(c, epsilon) = (c-epsilon, c+epsilon)\
  $

  - *prstencové okolí* je také množina
  $
    c in RR; epsilon in RR^+\
    P(c, epsilon) = (c-epsilon, c+epsilon) without c\
  $
]

=== Formální definice limity
#definition[
  Nechť $f$ je reálná funkce definována na nějakém prstencovém okolí bodu $a in RR$

  Potom říkáme že:
  - $f$ má v bodě $a$ limitu $L$, pokud platí:
  $
    forall epsilon > 0 space exists delta > 0 space forall x in D_f: 0 < |x-a| < delta => abs(f(x) - L) < epsilon
  $
]

#cetz.canvas({
  import cetz.draw: *

  let a = 4
  let L = 2.5
  let del-val = 1.2
  let eps-val = 0.9
  let x0 = 3.45
  let y0 = L + 1.6 * calc.tanh(0.5 * (x0 - a))

  rect((0, L - eps-val), (8, L + eps-val), fill: blue.lighten(90%), stroke: none)
  rect((a - del-val, 0), (a + del-val, 5), fill: green.lighten(90%), stroke: none)

  line((0, L - eps-val), (8, L - eps-val), stroke: (paint: blue.darken(25%), dash: "dashed"))
  line((0, L + eps-val), (8, L + eps-val), stroke: (paint: blue.darken(25%), dash: "dashed"))
  line((a - del-val, 0), (a - del-val, 5), stroke: (paint: green.darken(35%), dash: "dashed"))
  line((a + del-val, 0), (a + del-val, 5), stroke: (paint: green.darken(35%), dash: "dashed"))

  line((x0, 0), (x0, y0), stroke: (paint: gray, dash: "dashed"))
  line((0, y0), (x0, y0), stroke: (paint: gray, dash: "dashed"))

  line((0, 0), (8, 0), mark: (end: ">"))
  line((0, 0), (0, 5), mark: (end: ">"))
  content((8, 0), anchor: "west", padding: 0.15, $x$)
  content((0, 5), anchor: "south", padding: 0.15, $y$)

  line((a - del-val, 0), (a + del-val, 0), stroke: green.darken(35%) + 2pt)
  line((0, L - eps-val), (0, L + eps-val), stroke: blue.darken(25%) + 2pt)

  let pts = range(0, 151).map(i => {
    let x = 0.2 + i * (7.6 / 150)
    (x, L + 1.6 * calc.tanh(0.5 * (x - a)))
  })
  line(..pts, stroke: black + 1pt)

  circle((x0, y0), radius: 0.06, fill: black)
  circle((a, L), radius: 0.07, fill: white, stroke: black)

  content((a, 0), anchor: "north", padding: 0.15, $a$)
  content((a - del-val, 0), anchor: "north", padding: 0.15, $a - delta$)
  content((a + del-val, 0), anchor: "north", padding: 0.15, $a + delta$)
  content((x0, 0), anchor: "north", padding: 0.15, $x$)
  content((0, L), anchor: "east", padding: 0.15, $L$)
  content((0, L - eps-val), anchor: "east", padding: 0.15, $L - epsilon$)
  content((0, L + eps-val), anchor: "east", padding: 0.15, $L + epsilon$)
})

zkráceně píšu:

$
  lim_(x->a) f(x) = L
$

#pb()
=== Formální definice spojitosti
#definition[
  Nechť $f$ je reálná funkce definována na nějakém okolí bodu $a in RR$

  Potom říkáme že:
  - $f$ je spojitá v bodě $a$, pokud platí:
  $
    a in D_f and (forall epsilon > 0 space exists delta > 0 space forall x in U(a, delta) => f(x) in U(f(a), epsilon))
  $
]

#cetz.canvas({
  import cetz.draw: *

  let a = 4
  let L = 3
  let d-val = 1.5
  let eps-val = 0.9

  let f(x) = L + 0.7 * calc.sin(1.1 * (x - a))

  rect((0, L - eps-val), (8.5, L + eps-val), fill: blue.lighten(85%), stroke: none)
  rect((a - d-val, 0), (a + d-val, 4.8), fill: green.lighten(85%), stroke: none)

  line((0, L - eps-val), (8.5, L - eps-val), stroke: (dash: "dashed", paint: blue.darken(30%)))
  line((0, L + eps-val), (8.5, L + eps-val), stroke: (dash: "dashed", paint: blue.darken(30%)))
  line((a - d-val, 0), (a - d-val, 4.8), stroke: (dash: "dashed", paint: green.darken(40%)))
  line((a + d-val, 0), (a + d-val, 4.8), stroke: (dash: "dashed", paint: green.darken(40%)))

  line((0, 0), (8.5, 0), mark: (end: ">"))
  line((0, 0), (0, 5.5), mark: (end: ">"))

  let pts = range(81).map(i => {
    let x = 0.3 + 8.2 * i / 80
    (x, f(x))
  })
  line(..pts, stroke: black + 1pt)

  circle((a, L), radius: 0.07, fill: black)

  content((a, 0), anchor: "north", padding: 0.15, $a$)
  content((a - d-val, 0), anchor: "north", padding: 0.15, $a - delta$)
  content((a + d-val, 0), anchor: "north", padding: 0.15, $a + delta$)
  content((0, L), anchor: "east", padding: 0.15, $L$)
  content((0, L - eps-val), anchor: "east", padding: 0.15, $L - epsilon$)
  content((0, L + eps-val), anchor: "east", padding: 0.15, $L + epsilon$)
  content((8.5, f(8.5)), anchor: "west", padding: 0.1, $f$)
})

=== Poznámky a příklady
==== Vztah spojitosti a limity
$f$ je spojitá v bodě $a$ právě tehdy když $a in D_f and lim_(x->a) f(x) = f(a)$
==== Reformulace definice limity

$
  forall epsilon > 0 space exists delta > 0 space forall x in P(a, delta): f(x) in U(L, epsilon)\
  exists c > 0 space forall epsilon > 0 space exists delta > 0 space forall x in P(a, delta): abs(f(x) - L) < C dot.op epsilon\
$


#pb()
==== Jednoznačnost limity
$
  (lim_(x->c) f(x) = A and lim_(x->c) f(x) = B) => (A = B)\
$

#cetz.canvas({
  import cetz.draw: *

  let f(x) = 3.2 + 1.2 * calc.pow(x - 4, 2) / (calc.pow(x - 4, 2) + 2)
  let c-pos = 4
  let a-val = 3.2
  let b-val = 1.6
  let eps-val = 0.5
  let del-val = 0.9
  let x-left = 0.3
  let x-right = 7.3

  rect((x-left, a-val - eps-val), (x-right, a-val + eps-val), fill: blue.lighten(80%), stroke: (
    paint: blue.darken(20%),
    thickness: 0.6pt,
    dash: "dashed",
  ))
  rect((x-left, b-val - eps-val), (x-right, b-val + eps-val), fill: red.lighten(80%), stroke: (
    paint: red.darken(20%),
    thickness: 0.6pt,
    dash: "dashed",
  ))

  line((c-pos - del-val, 0), (c-pos - del-val, 4.9), stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
  line((c-pos + del-val, 0), (c-pos + del-val, 4.9), stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))

  line((0, 0), (8.0, 0), mark: (end: ">"))
  line((0, 0), (0, 5.2), mark: (end: ">"))

  let pts = range(141).map(i => {
    let x = x-left + (x-right - x-left) * i / 140
    (x, f(x))
  })
  line(..pts, stroke: black + 1pt)

  circle((c-pos, a-val), radius: 0.08, fill: white, stroke: black)

  content((c-pos, 0), anchor: "north", padding: 0.15, [$c$])
  content((0, a-val), anchor: "east", padding: 0.15, [$A$])
  content((0, b-val), anchor: "east", padding: 0.15, [$B$])
  content((x-right + 0.15, a-val), anchor: "west", padding: 0.1, [$U(A, epsilon)$])
  content((x-right + 0.15, b-val), anchor: "west", padding: 0.1, [$U(B, epsilon)$])
  content((c-pos, 0.45), anchor: "south", padding: 0.1, [$P(c, delta)$])
  content((x-right - 0.1, f(x-right)), anchor: "south-east", padding: 0.1, [$f$])
})


zvolím búno $epsilon = abs(B-A)/2$

Platí:

$
  exists delta_1 > 0 forall x in P(c, delta_1): f(x) in U(A, epsilon)\
  exists delta_2 > 0 forall x in P(c, delta_2): f(x) in U(B, epsilon)\
$

$delta$ mohu vždy zmenšit - volím $delta = min(delta_1, delta_2) > 0$, potom:


$
  forall x in P(c, delta): f(x) in U(A, epsilon)\
  forall x in P(c, delta): f(x) in U(B, epsilon)\
$

tedy

$
  forall x in P(c, delta): f(x) in U(A, epsilon) union U(B, epsilon)\
$

a

$
  x in emptyset
$

Tedy není možné aby se funkce měla v jednom bodě dvě různé limity

#pb()
==== Jednoduchý argument
$
  f(x) & = a x + b \
$

je spojitá ve všech bodech $RR$

Volme $a in RR$

$
  abs(f(x) - f(a)) = abs(A x + b - A a - b) = abs(A) dot.op abs(x-a)
$

Stačí volit $delta = epsilon$

Obecněji stačí nerovnost

$
  & abs(f(x) - f(a)) <= C abs(x-a) \
  & abs(x-a) < epsilon => abs(f(x) - f(a)) < C epsilon \
$

==== Rovnost na okolí - DŮLEŽITÉ
Pokud $f(x) = g(x)$ na $P(a, xi)$ a $lim_(x->a) f(x) = L$

pak $lim_(x->a) g(x) = L$

#cetz.canvas({
  import cetz.draw: *

  let a-pos = 3
  let L-val = 2.5
  let d-val = 1.3

  let h(t) = 0.55 * calc.sin(2.2 * t)
  let off(t) = if calc.abs(t) > d-val {
    0.3 * (calc.abs(t) - d-val) * (calc.abs(t) - d-val)
  } else {
    0
  }

  let xs = range(121).map(i => 0.8 + 5.4 * i / 120)
  let fpts = xs.map(x => (x, L-val + h(x - a-pos) + off(x - a-pos)))
  let gpts = xs.map(x => (x, L-val + h(x - a-pos) - off(x - a-pos)))

  // punctured neighbourhood P(a, xi)
  rect((a-pos - d-val, 0.6), (a-pos + d-val, 4.4), fill: blue.lighten(88%), stroke: none)

  // axes
  line((0.6, 0.6), (6.6, 0.6), mark: (end: ">"))
  line((0.6, 0.6), (0.6, 4.6), mark: (end: ">"))
  content((6.75, 0.6), [$x$], anchor: "west")
  content((0.6, 4.75), [$y$], anchor: "south")

  // guide lines
  line((0.6, L-val), (6.4, L-val), stroke: (paint: gray, dash: "dashed"))
  line((a-pos, 0.6), (a-pos, L-val), stroke: (paint: gray, dash: "densely-dotted"))
  line((a-pos - d-val, 0.6), (a-pos - d-val, 4.4), stroke: (paint: blue.darken(25%), dash: "dashed"))
  line((a-pos + d-val, 0.6), (a-pos + d-val, 4.4), stroke: (paint: blue.darken(25%), dash: "dashed"))

  // the two functions
  line(..fpts, stroke: (paint: blue.darken(20%), thickness: 1.1pt))
  line(..gpts, stroke: (paint: red.darken(10%), thickness: 1.1pt, dash: "dashed"))

  // common limit point
  circle((a-pos, L-val), radius: 0.08, fill: white, stroke: (paint: black, thickness: 0.9pt))

  // labels
  content((0.6, L-val), [$L$], anchor: "east", padding: 0.15)
  content((a-pos, 0.6), [$a$], anchor: "north", padding: 0.12)
  content((a-pos - d-val, 0.6), [$a - xi$], anchor: "north", padding: 0.12)
  content((a-pos + d-val, 0.6), [$a + xi$], anchor: "north", padding: 0.12)
  content((a-pos, 3.9), [$f = g$], anchor: "south")

  // legend
  line((5.0, 4.1), (5.5, 4.1), stroke: (paint: blue.darken(20%), thickness: 1.1pt))
  content((5.6, 4.1), [$f$], anchor: "west")
  line((5.0, 3.75), (5.5, 3.75), stroke: (paint: red.darken(10%), thickness: 1.1pt, dash: "dashed"))
  content((5.6, 3.75), [$g$], anchor: "west")
})



#pb()
==== Příklad
$
    & lim_(x->a) (x^2 - a^2)/(x-a) \
  = & lim_(x->a) (x-a)(x+a)/(x-a) \
  = & lim_(x->a) (x+a) \
  = & 2a \
$

rovnost na okolí - rovnají se na prstencovém okolí $P(a, xi)$ - limita je stejná

==== Omezenost na okolí
Nechť $lim_(x->a) f(x) = L$, potom platí:
+ $exists c > 0, xi > 0 sq forall x in P(a, xi): abs(f(x)) < c$
+ pokud $L != 0$, pak $exists c > 0, epsilon > 0 sq forall x in P(a, epsilon): 1/abs(f(x)) < c$

#proof[
  1. Vycházíme z definice limity:
  $
    lim_(x->a) f(x) = L <=> forall epsilon > 0 sq exists delta > 0: x in P(a, delta) => f(x) in U(L, epsilon)\
    abs(f(x)) = abs(f(x) - L + L) => abs(f(x)) <= abs(f(x) - L) + abs(L)
  $
  zafixujeme $epsilon = epsilon_0$, z definice limity $exists delta_0 > 0: x in P(a, delta_0) => f(x) in U(L, epsilon_0)$

  a tedy $abs(f(x) - L) < epsilon_0$

  dosadíme
  $
    abs(f(x)) - abs(L) <= abs(f(x) - L) < epsilon_0\
    abs(f(x)) - abs(L) < epsilon_0\
    abs(f(x)) < epsilon_0 + abs(L)\
  $
  stanovíme $epsilon_0 + abs(L) = c$, tedy $exists epsilon_0 => exists c$ pro které dokazovaný výrok platí

  2. Vycházíme z definice limity
  - stanovíme $epsilon_0 = abs(L)/2 > 0$

  $
    abs(L) = abs(L - f(x) + f(x)) & > 0 \
             abs(L - f(x) + f(x)) & <= abs(L - f(x)) + abs(f(x)) \
                           abs(L) & <= abs(L - f(x)) + abs(f(x)) \
           abs(L) - abs(f(x) - L) & <= abs(f(x)) \
               abs(L) - epsilon_0 & <= abs(f(x)) \
                abs(L) - abs(L)/2 & <= abs(f(x)) \
                         abs(L)/2 & <= abs(f(x)) \
  $

  na $P(a, delta)$ platí $abs(f(x)) > abs(L)/2$

  stačí vzít $c = 2/abs(L)$ a za $epsilon$ stanovit nalezené $delta$
]



#pb()
==== *Věta* o aritmetice limit (basic verze)
#theorem[
  Nechť $f, g$ jsou reálné funkce, $a in RR$, $L, K in RR$

  Nechť navíc platí:
  + $lim_(x->a) f(x) = L$
  + $lim_(x->a) g(x) = K$

  Potom platí:
  + $lim_(x->a) f(x) plus.minus g(x) = L plus.minus K = lim_(x->a) f(x) plus.minus lim_(x->a) g(x)$
  + $lim_(x->a) f(x) g(x) = L dot.op K$
  + pokud $K != 0$, pak $lim_(x->a) f(x)/g(x) = L/K$
]

#proof(title: [jen 2 části])[
  volme $epsilon > 0$, potom:

  $
    exists delta_1 > 0 sq forall x in P(a, delta_1): abs(f(x) - L) < epsilon\
    exists delta_2 > 0 sq forall x in P(a, delta_2): abs(g(x) - K) < epsilon\
  $

  $delta$ můžeme zmenšovat jak chceme - volme $delta = min(delta_1, delta_2) > 0$

  potom:

  $
    forall x in P(a, delta): abs(f(x) - L) < epsilon\
    forall x in P(a, delta): abs(g(x) - K) < epsilon\
  $

  - (1.) část

  $
    abs(f(x) + g(x) - (L+K)) = abs(f(x) - L + g(x) - K)
  $

  trojúhelníková nerovnost, odhadnu zhora

  $
    abs(f(x) - L + g(x) - K) <= abs(f(x) - L) + abs(g(x) - K) < epsilon + epsilon = 2 epsilon
  $

  Což je definice limity!

  - (2.) část
  vycházím z pozorování o omezenosti na okolí - víme že:
  $
    exists c > 0, xi > 0 sq forall x in P(a, xi) : f(x) < c
  $

  zvolím $delta = min(delta_1, delta_2, xi)$ potom

  $
    & forall x in P(a, delta) \
    & abs(f(x) dot.op g(x) - L dot.op K) \
    & = abs(f(x) dot.op g(x) - f(x) dot.op K + f(x) dot.op K - L dot.op K) \
  $

  odhadu zhora pomocí trojúhelníkové nerovnosti

  $
    & abs(f(x) dot.op g(x) - f(x) dot.op K + f(x) dot.op K - L dot.op K) \
    & abs(f(x) dot.op g(x) - f(x) dot.op K + f(x) dot.op K - L dot.op K) <= abs(f(x)) dot.op abs(g(x) - K) + abs(K) dot.op abs(f(x) - L) \
    & < C dot.op epsilon + abs(K) epsilon = epsilon(C + abs(K)) = "konst" epsilon \
  $

  - (3.) část - podobně jako (2.) část

]

#pb()
==== Aritmetika spojitosti
Nechť $f, g$ jsou reálné funkce, $a in RR$ a $f, g$ jsou spojité v $a$, potom
+ $f + g$ je spojitá v bodě a
+ $f dot.op g$ je spojitá v bodě a
+ $f/g$ je spojitá v bodě a, je li tam podíl definován

#corollary[
  + Polynomy jsou spojité na $RR$
  + Racionální funkce jsou spojité na $D_f$
]

#pb()
==== Věta o limitě složené funkce
motivace: např. $lim_(x->3) sqrt(1+x^2) =^? lim_(x->10) sqrt(x)$

#theorem[
  Nechť $f,g$ jsou reálné funkce, $A,B,C in RR$

  Nechť navíc
  + $lim_(x->A) f(x) = B$
  + $lim_(x->B) g(x) = C$

  Chceme:
  $
    lim_(x->A) (g compose f)(x) = C\
  $

  Jeden problém - nevíme jestli je $f$ někde na intervalu $P(A, epsilon)$ rovna $B$, což by vadilo, kdyby $g$ nebyla pro $B$ definována...

  Musí tedy platit alespoň jedna z podmínek:
  - (S) - $g$ je spojitá v $B$
  - (P) - $exists xi > 0: forall x in P(A, xi): f(x) != B$

  Potom platí:
  $
    lim_(x->A) (g compose f)(x) = C\
  $
]

#proof[
  - nejprve předpokládejme (S), volme $epsilon > 0$

  $
    exists delta > 0 sq forall x in P(B, delta): g(x) in U(C, epsilon)\
    exists kappa > 0 sq forall y in P(A, kappa): f(y) in U(B, delta)\
  $

  Pokud by  $P(B, delta) = U(B, delta)$, potom dostávám $exists kappa > 0 sq forall x in P(A, kappa): g(f(x)) in U(C, epsilon)$

  -> musím buďto do $P(B, delta)$ přidat bod $B$ - to můžu v případě že je $g$ spojitá v $B$ - (S)

  -> nebo funkce $f$ nenabývá na $P(A, kappa)$ hodnoty $B$ - tedy můžu nahradit $U(B, delta)$ množinou $P(B, delta)$ - (P)
]

==== Spojitost složené funkce
Mějme $f compose g$, pak je li $g(a) = b$ v bodě $a$ spojitá, pak jestliže je $f(b) = c$ v bodě $b$spojitá, pak $f compose g$ je spojitá v bodě $a$.

např. $sqrt(x^3 + x - 1)$ je spojitá na svém definičním oboru

#pb()
==== Věta o dvou strážnících (policajtech 👮)
#theorem[
  Mějme $f,g$ a $lim_(x->a) f(x) = lim_(x->a) g(x) = A$.

  Pak pro funkci $h(x)$, pro kterou $forall x in P(a, xi): f(x) <= h(x) <= g(x)$

  Platí $lim_(x->a) h(x) = A$
]

#cetz.canvas({
  import cetz.draw: *

  let a = 0
  let L = 2
  let eps = 0.5
  let dlt = calc.sqrt(eps / 0.4)
  let xmin = -2.0
  let xmax = 2.0

  let f(x) = L - 0.4 * x * x
  let g(x) = L + 0.4 * x * x
  let h(x) = L + 0.3 * x * x * calc.sin(6 * x)

  let n = 160
  let xs = range(n + 1).map(i => xmin + (xmax - xmin) * i / n)

  rect((-2.4, L - eps), (2.4, L + eps), fill: gray.lighten(92%), stroke: none)
  line((-2.4, L + eps), (2.4, L + eps), stroke: (paint: gray.darken(25%), dash: "dashed"))
  line((-2.4, L - eps), (2.4, L - eps), stroke: (paint: gray.darken(25%), dash: "dashed"))

  line((-dlt, 0), (-dlt, L + eps), stroke: (paint: gray.darken(25%), dash: "dashed"))
  line((dlt, 0), (dlt, L + eps), stroke: (paint: gray.darken(25%), dash: "dashed"))

  line((-2.8, 0), (2.9, 0), mark: (end: ">"))
  line((0, 0), (0, 4.3), mark: (end: ">"))

  line(..xs.map(x => (x, g(x))), stroke: blue.darken(20%))
  line(..xs.map(x => (x, f(x))), stroke: blue.darken(20%))
  line(..xs.map(x => (x, h(x))), stroke: red.darken(20%))

  circle((a, L), radius: 0.06, fill: white, stroke: black)

  content((-2.45, L + eps), [$L + epsilon$], anchor: "east", padding: 0.1)
  content((-2.45, L - eps), [$L - epsilon$], anchor: "east", padding: 0.1)
  content((-2.45, L), [$L$], anchor: "east", padding: 0.1)

  content((2.15, g(xmax)), [$g$], anchor: "west", padding: 0.1)
  content((2.15, f(xmax)), [$f$], anchor: "west", padding: 0.1)
  content((2.15, h(xmax)), [$h$], anchor: "west", padding: 0.1)

  content((-dlt, -0.12), [$a - delta$], anchor: "north", padding: 0.1)
  content((dlt, -0.12), [$a + delta$], anchor: "north", padding: 0.1)
  content((a, -0.12), [$a$], anchor: "north", padding: 0.1)

  content((2.92, 0), [$x$], anchor: "west", padding: 0.05)
  content((0, 4.32), [$y$], anchor: "south", padding: 0.05)
})

#proof[
  Volme $epsilon > 0$.

  $
    forall delta_1 > 0 sq forall x in P(a, delta_1): f(x) in P(L, epsilon)\
    forall delta_2 > 0 sq forall x in P(a, delta_2): g(x) in P(L, epsilon)\
  $

  Volme $delta = min(delta_1, delta_2, xi) > 0$

  Potom $forall x in P(a, delta)$ máme

  $
    f(x) - L <= h(x) - L <= g(x) - L\
  $

  Odtud

  $
    abs(h(x) - L) <= max(abs(f(x) - L), abs(g(x) - L))\
  $

]

#pb()
===== Obdobně
Funkce 0-omezená má limitu 0

$
  lim_(x->a) f(x)g(x) = 0
$

pokud

$
  lim_(x->a) f(x) = 0
$

a existuje

$
  kappa > 0 "a" C > 0\
$

tak že

$
  abs(g(x)) & <= C sq forall x in P(a, kappa) \
$

důkaz pomocí dvou policajtů...

==== Funkce signum
$
  sgn(x) = cases(
    -1 & x < 0,
    0 & x = 0,
    1 & x > 0,
  )
$

#pb()
=== Jednostranné limity a spojitost
==== Definice - jednostranná limita
#definition[
  Nechť $f$ je reálná funkce, $a,L in RR$

  Potom říkáme že:
  + $f$ má limitu L *zleva*, pokud
    $
      forall e > 0 space exists delta > 0 space forall x in P^-(a, delta) : f(x) in U(L, epsilon)
    $
  + $f$ má limitu L *zprava*, pokud
    $
      forall e > 0 space exists delta > 0 space forall x in P^+(a, delta) : f(x) in U(L, epsilon)
    $

  Kde

  $
    P^-(a, delta) & = (a-delta, a) \
    P^+(a, delta) & = (a, a+delta) \
  $
]

===== Zkrácený zápis

+ $lim_(x->a-)$ - limita zleva
+ $lim_(x->a+)$ - limita zprava

==== Definice - jednostranná spojitost
#definition[
  Nechť $f$ je reálná funkce, $a in RR$

  Potom říkáme že:
  + $f$ je spojitá *zleva*, pokud
    $
      forall e > 0 space exists delta > 0 space forall x in U^-(a, delta) : f(x) in U(f(a), epsilon)
    $
  + $f$ je spojitá *zprava*, pokud
    $
      forall e > 0 space exists delta > 0 space forall x in U^+(a, delta) : f(x) in U(f(a), epsilon)
    $

  Kde

  $
    U^-(a, delta) & = (a-delta, a chevron.r \
    U^+(a, delta) & = chevron a, a+delta) \
  $
]

==== Důsledky
===== Ekvivalence s oboustrannou limitou
#corollary[
  $
    lim_(x->a) f(x) = L <=> (lim_(x->a-) f(x) = L) and (lim_(x->a+) f(x) = L)
  $
]

===== Reformulace základních vět
#corollary[
  Pro jednostranné limity platí přirozené reformulace základních vět - *VOLS*, *VLSF*, *V2S*...
]

==== Příklad
$
  f(x) & = sqrt(sin(x^2)) \
$

$sqrt(...)$ je spojitá zprava v $0$ a $sin(x^2)$ je spojitá v $0$ a *nezáporná* kolem $0$

=> dostávám oboustranou spojitost v $0$

#pb()
== Derivace
- *neformálně* - směrnice tečny v bodě - geometrická motivace

#cetz.canvas({
  import cetz.draw: *

  let f(x) = 0.15 * x * x + 0.6
  let df(x) = 0.3 * x
  let a = 1.4
  let b = 3.6
  let fa = f(a)
  let fb = f(b)
  let m-tan = df(a)
  let m-sec = (fb - fa) / (b - a)
  let blue = rgb("#0969da")
  let red = rgb("#cf222e")
  let grey = rgb("#57606a")
  let guide = (paint: gray, dash: "dotted", thickness: 0.6pt)

  // Axes
  line((-0.5, 0), (5.2, 0), mark: (end: ">"), stroke: 0.8pt, name: "xaxis")
  line((0, -0.4), (0, 4.2), mark: (end: ">"), stroke: 0.8pt, name: "yaxis")
  content("xaxis.end", $x$, anchor: "west", padding: 0.12)
  content("yaxis.end", $y$, anchor: "south", padding: 0.12)

  // Guide lines to the axes + labels a, b, f(a), f(b)
  line((a, 0), (a, fa), stroke: guide)
  line((b, 0), (b, fa), stroke: guide)
  line((0, fa), (a, fa), stroke: guide)
  line((0, fb), (b, fb), stroke: guide)
  content((a, 0), $a$, anchor: "north", padding: 0.12)
  content((b, 0), $b$, anchor: "north", padding: 0.12)
  content((0, fa), $f(a)$, anchor: "east", padding: 0.12)
  content((0, fb), $f(b)$, anchor: "east", padding: 0.12)

  // Triangle Δx, Δy
  let tri = (paint: gray.darken(20%), dash: "dashed", thickness: 0.8pt)
  line((a, fa), (b, fa), stroke: tri)
  line((b, fa), (b, fb), stroke: tri)
  content(((a + b) / 2, fa), $Delta x$, anchor: "north", padding: 0.12)
  content((b, (fa + fb) / 2), $Delta y$, anchor: "west", padding: 0.12)

  // Curve (starts at the y-axis)
  let pts = range(91).map(i => {
    let x = 4.2 * i / 90
    (x, f(x))
  })
  line(..pts, stroke: 1.5pt + blue)
  content((4.2, f(4.2)), text(fill: blue, $f$), anchor: "south-east", padding: 0.1)

  // Secant – solid, so it doesn't blend with the dashed triangle
  let sec(x) = fa + m-sec * (x - a)
  line((0.8, sec(0.8)), (4.4, sec(4.4)), stroke: 1pt + grey)
  content((4.4, sec(4.4)), text(fill: grey)[sečna], anchor: "west", padding: 0.1)

  // Tangent – shortened so the label doesn't collide with Δy
  let tan(x) = fa + m-tan * (x - a)
  line((0.3, tan(0.3)), (2.6, tan(2.6)), stroke: 1.2pt + red)
  content((2.6, tan(2.6)), text(fill: red)[tečna], anchor: "west", padding: 0.1)

  // Points A, B
  circle((a, fa), radius: 0.05, fill: black, stroke: none)
  circle((b, fb), radius: 0.05, fill: black, stroke: none)
  content((a, fa), $A$, anchor: "south-east", padding: 0.12)
  content((b, fb), $B$, anchor: "south-east", padding: 0.12)
})

- aproximace - další motivace
$
  f[x_0](x) & = f(x_0) + f'(x_0) (x-x_0) = T_(x_0)^f (x) \
$

- fyzikální - např. okamžitá rychlost...

=== Formální definice
#definition[
  #important(caption: "formální definice derivace funkce v bodě")[$
    f'(x_0) & = lim_(dif x->0) (f(x_0 + dif x) - f(x_0))/(dif x) = lim_(x->x_0) (f(x) - f(x_0))/(x - x_0) \
  $]

  ekvivalentně definujeme jednostranné derivace...

  #important(caption: "formální definice derivace funkce v bodě zprava")[$
    f'_+(x_0) & = lim_(dif x->0^+) (f(x_0 + dif x) - f(x_0))/(dif x) = lim_(x->x_0^+) (f(x) - f(x_0))/(x - x_0) \
  $]

  #important(caption: "formální definice derivace funkce v bodě zleva")[$
    f'_-(x_0) & = lim_(dif x->0^-) (f(x_0 + dif x) - f(x_0))/(dif x) = lim_(x->x_0^-) (f(x) - f(x_0))/(x - x_0) \
  $]

  existují-li limity
]

=== Poznámky, příklady
==== Kromě $x^2 sin(1/x)$ je dobré mít na paměti i:
$
  f(x) = cases(
    x^2 & sq x in QQ,
    0 & sq x in.not QQ
  )
$

==== $x^2 sin(1/x)$
$x^2 sin(1/x)$ má očividně derivaci všude, dodefinováno - derivace v $0 = 0$

#pb()
==== Derivace a jednostranné derivace
Funkce má oboustrannou *vlastní* derivaci právě ve chvíli kdy existují jednostranné derivace a jsou stejné

$
  f'(a) & = L <=> f_+ '(a) = L and f_- '(a) = L \
$

==== Derivace a spojitost
Pokud existuje *vlastní* $f'(a)$, potom je $f(a)$ spojitá

==== Pochybný zápis derivací 😈
rozdíl mezi $(f(x))'$ - derivace konstanty... a $f'(x)$

píšeme ale $(x^2)' = 2x$ - z praktických důvodů...

máme definované:
$
  (x^2)' & = 2x \
  (1/x)' & = - 1/x^2 \
$

nemáme definované, použijeme axiomy...
$
    (e^x)' & = e^x \
  (sin x)' & = cos x \
$

spočítáme
$
   f(x) & = x^2 \
  f'(x) & = lim_(x->a) (f(x) - f(a))/(x - a) = lim_(x->a) (x^2 - a^2)/(x - a) & = x + a = 2a \
$

a
$
   f(x) & = 1/x \
  f'(x) & = lim_(x->a) (1/x - 1/a)(x - a) & = lim_(x->a) ((a-x)/(x a))(x - a) = lim_(x->a) (- 1/(x a)) = 1/a^2 \
$

pro $f(x) = e^x$ využijeme $lim_(x->0) (e^x - 1)/(x) = 1$, $x^a = e^(a + b) = e^a e^b$

$
  f'(a) & = lim_(x->a) (e^x - e^a)/(x - a) = e^a lim_(x->a) (e^(x-a) - 1)/(x-a) = e^a
$

pro $f(x) = sin(x)$ použijeme $lim_(x->0) (sin x)/x = 1$ a součtové vzorce...

#pb()
=== Tečna jako aproximace
zajímá nás tento výraz - jak dobrá je tečna aproximace
$
                     f(x) - T^f_a (x) & = f(x) - (f(a) + f'(a)(x-a)) \
  lim_(x->a) (f(x) - T^f_a (x))/(x-a) & = lim_(x->a) (f(x) - (f(a) + f'(a)(x-a)))/(x-a) \
                                      & = lim_(x->a) (f(x) - f(a))/(x-a) - f'(a) (x-a)/(x-a) \
                                      & = lim_(x->a) f'(a) - f'(a) = 0 \
$

Tečna aproximuje funkci lépe než lineárně, platí i obráceně

pokud $L(x) = alpha(x-a) + beta$ aproximuje funkci lépe než lineárně, je tečna

chceme tedy, aby $L(a) = f(a) => beta = f(a)$

$
  0 = lim_(x->a) (f(x) - L(x))/(x-a) = lim_(x->a) (f(x) - (alpha(x-a) + f(a)))/(x-a) = lim_(x->a) (f(x) - f(a))/(x-a) - alpha => alpha = f'(a)
$

tedy
$
  L(x) & = f'(a)(x-a) + f(a) \
$

=== Aritmetika derivací intuitivně
==== Součet
$
  (f + g)'(a) &= f'(a) + g'(a)\
  lim_(x->a) ((f+g)(x) - (T_a^f (x) + T_a^g (x)))/(x-a) &= lim_(x->a) ((f(x) - T_a^f (x))/(x-a) + (g(x) - T_a^g (x))/(x-a)) =^"VOAL" 0\
$
$
  T_a^f (x) + T_a^g (x) & = f(a) + f'(a)(x-a) + g(a) + g'(a)(x-a) = f(a) + g(a) + (f'(a) + g'(a))(x-a) \
$
==== Součin
$
    & lim_(x->a) (f(x) g(x) - T_a^f (x) dot.op T_a^g (x))/(x-a) \
  = & lim_(x-a) (f(x) g(x) - f(x) T_a^g (x) + f(x) T_a^g (x) - T_a^f (x) dot.op T_a^g (x))/(x-a) \
  = & lim_(x-a) f(x) dot.op (g(x) - T_a^g (x))/(x-a) + T_a^g (x) dot.op (f(x) - T_a^f (x))/(x-a) =^"VOAL" 0 \
$

tedy

$
  0 = &lim_(x->a) (f(x) dot.op g(x) - (f(a) + f'(a)(x-a))(g(a) + g'(a)(x-a)))/(x-a)\
  =^"VOAL" &lim_(x->a) (f(x) g(x) - (f(a)g(a) + (f'(a)g(a) + f(a) g'(a))(x-a)))/(x-a) - lim_(x->a) f'(a) g'(a) ((x-a)^2)/(x-a)\
$

odtud:

$
            T_a^(f g) & = f(a)g(a) + (f'(a)g(a) + f(a)g'(a))(x-a) \
  (f(x) dot.op g(x))' & = f'(a)g(a) + f(a)g'(a) \
$

#pb()
=== Věta - Aritmetika derivací
#theorem[
  Nechť $f, g$ jsou reálné funkce, $a in RR$ a nechť existují $f'(a), g'(a)$.

  Potom
  + $(f+g)'(a) = f'(a) + g'(a)$
  + $(f dot.op g)'(a) = f'(a)g(a) + f(a)g'(a)$
  + $(f/g)'(a); g'(a) != 0 = (f'(a)g(a) - f(a)g'(a))/(g(a)^2)$
]

První dva vzorce máme odvozené, třetí necháme na později.

=== Derivace složené funkce
Mějme $f,g$ reálné funkce, $a in RR$, existují $(f' compose g)(a), g'(a)$.

Potom nás zajímá

$
  (f compose g)'(a) = ?
$

Máme

$
                     T_a^g (x) & = g(a) + g'(x-a) \
                  T_g(a)^f (x) & = (f compose g)(a) + (f' compose g)(x-a) \
  (T_g(a)^f compose T_a^g) (x) & = (f compose g)(a) + (f' compose g)(a) (g(a) + g'(a)(x-a) - g(a)) \
  (T_g(a)^f compose T_a^g) (x) & = (f compose g)(a) + (f' compose g)(a) (g'(a)(x-a)) \
  (T_g(a)^f compose T_a^g) (x) & = (f compose g)(a) + (f compose g)'(a) (x-a) \
$

Potřebujeme

$
  lim_(x->a) ((f compose g)(x) - (T_g(a)^f compose T_a^g)(x))/(x-a) & = 0 \
$

Aproximace tečnou jinak

pro
$
  phi(x) = (h(x) - T_a^h (x))/(x-a)
$

platí
$
  lim_(x->a) phi(x) & = 0 \
$

mějme
$
  accent(phi, ~) (x) = cases(
    phi(x) & space x != a space inter D_phi,
    0 & space x = a
  )
$

#pb()
tedy $accent(phi, ~)$ je spojitá v bodě $a$

a tedy
$
  h(x) - T_a^h (x) & = accent(phi, ~)(x)(x-a) \
$
jde k nule rychleji než lineárně - násobím dvě věci co jdou lineárně k nule - alternativní formulace lepší než lineární aproximace

zapíšeme si toto pro vnější funkci:

$
  & lim_(x->a) ((f compose g)(x) - (T_g(a)^f compose T_a^g)(x))/(x-a) \
  = & lim_(x->a) ((f compose g)(x) - (T_g(a)^f compose g)(x) + (T_g(a)^f compose g)(x) - (T_g(a)^f compose T_a^g)(x))/(x-a)\
  = & lim_(x->a) ((f compose g)(x) - (T_g(a)^f compose g)(x))/(x-a) + ((T_g(a)^f compose g)(x) - (T_g(a)^f compose T_a^g)(x))/(x-a)\
$

Víme, že
$
  f(y) - T^f_g(a)(y) = psi(y)(y-g(a))
$

$psi$ je spojitá v $g(a)$ a $psi(g(a)) = 0$

Tedy
$
  = & lim_(x->a) ((psi compose g)(x) dot.op (g(x) - g(a)))/(x-a) + ((f compose g)(a) dot.op (g(x) - T_a^g (x)))/(x-a) \
  = & lim_(x->a) (psi compose g)(x) dot.op lim_(x->a) (g(x) - g(a))/(x-a) + (f' compose g)(a) lim_(x->a) (g(x) - T_a^g (x))/(x-a)\
  =^"VOLSF S" & 0 dot.op g'(a) + (f' compose g)(a) dot.op 0\
  = & 0\
$

A tedy $T^f_g(a) compose T^g_a$ je tečna k $f compose g$ a tedy $(f' compose g)(a) dot.op g'(a)$ je derivace

Jenom zápis kde si dodefinujeme $psi$ abychom mohli rozšířit

$
  lim_(x->a) ((f compose g)(x) - (f compose g)(a))/(x-a)
$

na
$
  lim_(x->a) ((f compose g)(x) - (f compose g)(a))/(g(x)-g(a)) dot.op (g(x)-g(a))/(x-a)
$

#theorem[
  Nechť, $f, g$ jsou reálné funkce, $a in RR$, existuje $(f' compose g)(a), g'(a)$, pak existuje

  $
    (f compose g)'(a) = (f' compose g)(a) dot.op g'(a)
  $
]

#pb()
=== Derivace podílu
$
  (1/x)' & = - 1/x^2 \
$

a tedy podle věty o derivaci složené funkce

$
  (1/f(x))' & = - 1/f(x)^2 dot.op f'(x) = - (f'(x))/f(x)^2 \
$

a konečně

$
  (f/g)' & = (f dot.op 1/g)' = f' dot.op 1/g + f dot op (1/g)' = f' dot.op 1/g + f dot op - (g')/g^2 = (f'g - f g')/g^2
$

#important(caption: "derivace podílu")[$
  (f'g - f g')/g^2
$]

==== Příklad
$
  tan(x)' = (sin(x)/cos(x))' = (cos^2(x) + sin^2(x))/(cos^2(x)) = 1/(cos^2(x))
$

#pb()
=== Derivace inverzní funkce
==== Intuitivně
geometricky pro např. exponenciálu

#cetz.canvas({
  import cetz.draw: *

  let a = 0.7
  let ya = calc.exp(a)
  let m = calc.exp(a)
  let s = 1 / m
  let dash-stroke = (paint: gray, dash: "dashed", thickness: 0.5pt)

  // axes
  line((-2.2, 0), (5.3, 0), mark: (end: ">"))
  line((0, -2.2), (0, 5.3), mark: (end: ">"))
  content((5.3, 0), [$x$], anchor: "west", padding: 0.1)
  content((0, 5.3), [$y$], anchor: "south", padding: 0.1)

  // y = x
  line((-2.1, -2.1), (5.1, 5.1), stroke: (paint: gray, dash: "dashed"))
  content((4.5, 4.5), [$y = x$], anchor: "south-east", padding: 0.12)

  // exp curve
  let pe = range(0, 37).map(i => {
    let x = -2 + 3.6 * i / 36
    (x, calc.exp(x))
  })
  line(..pe, stroke: blue.darken(30%))
  content((1.3, calc.exp(1.3)), [$y = e^x$], anchor: "south-east", padding: 0.15)

  // ln curve
  let pl = range(0, 37).map(i => {
    let t = 0.18 + 4.8 * i / 36
    (t, calc.ln(t))
  })
  line(..pl, stroke: red.darken(30%))
  content((3.0, calc.ln(3.0)), [$y = ln x$], anchor: "north-west", padding: 0.15)

  // helper lines showing the mirror relation
  line((a, 0), (a, ya), stroke: dash-stroke)
  line((0, ya), (a, ya), stroke: dash-stroke)
  line((ya, 0), (ya, a), stroke: dash-stroke)
  line((0, a), (ya, a), stroke: dash-stroke)

  // tangent on exp at P
  let P = (a, ya)
  line((a - 0.9, ya - m * 0.9), (a + 0.9, ya + m * 0.9), stroke: blue.darken(30%), name: "t1")
  circle(P, radius: 0.06, fill: blue.darken(30%), stroke: none)
  content((rel: (-0.12, 0.12), to: P), [$P$], anchor: "south-east", padding: 0.05)
  content("t1.end", [$m = e^(x_0)$], anchor: "south-west", padding: 0.12)

  // tangent on ln at Q (mirror image)
  let Q = (ya, a)
  line((ya - 1.8, a - s * 1.8), (ya + 1.8, a + s * 1.8), stroke: red.darken(30%), name: "t2")
  circle(Q, radius: 0.06, fill: red.darken(30%), stroke: none)
  content((rel: (0.12, -0.12), to: Q), [$Q$], anchor: "north-west", padding: 0.05)
  content("t2.end", [$1/m$], anchor: "north-west", padding: 0.12)

  // axis markers
  content((a, -0.15), [$x_0$], anchor: "north", padding: 0.05)
  content((-0.15, ya), [$e^(x_0)$], anchor: "east", padding: 0.05)
})

$
           T^f_a (x) & = f(a) + f'(a)(x-a) \
                   y & = f(a) + f'(a)(x-a) \
  (y - f(a))/(f'(a)) & = x-a = x - inv(f)(f(a)) \
                   x & = inv(f)(f(a)) + 1/(f'(a))(y-f(a)) = T^(inv(f))_f(a) (x) \
$

dostávám derivaci jako lineární člen tečny

$
  (inv(f))'(f(a)) & = 1/(f'(a)) \
$

Vezměme si
$
   x & = inv(f)(f(x)) \
  x' & = (inv(f)(f(x)))' \
   1 & = (inv(f)(f(x)))' \
   1 & = f^(-1)'(f(x))f'(x) \
$

Tedy
#important[$
  f^(-1)'(f(x)) & = 1/(f'(x)) \
$]

A navíc
$
   x & = f(inv(f)(x)) \
  x' & = (f(inv(f)(x)))' \
   1 & = f'(inv(f)(x)) f^(-1)'(x) \
$

Tedy
#important[$
  f^(-1)'(x) & = 1/(f'(inv(f)(x)))
$]

==== Příklady
===== 1.
$
       f(x) & = e^x \
  inv(f)(x) & = ln x \
    (ln x)' & = 1/e^(ln x) = 1/x \
$


===== 2.
$
         f(x) & = tan x \
    inv(f)(x) & = arctan x \
  (arctan x)' & = 1/(1/cos^2 arctan x) = cos^2 arctan x = \
      tan^2 x & = (sin^2 x)/(cos^2 x) = (1 - cos^2 x)/(cos^2 x) = 1/(cos^2 x) - 1 \
      cos^2 x & 1/(1 + tan^2 x) \
$
tedy
$
  (arctan x)' & = 1/(1 + tan^2 arctan x) = 1/(1 + x^2) \
$

==== Poznámky
$
  (inv(f))' = 1/(f'(inv(f)(x)))
$

pokud by $f^(-1)'$ v $f(a)$ existovala, potom $inv(f)$ je spojitá v $f(a)$

zároveň očekáváme $f'(a) != 0$

==== Věta o derivaci inverzní funkce (*lokální*!!!)
#theorem[
  Nechť $f$ je reálná funkce, $a in RR$ a $f$ je prostá => existuje $inv(f)$ inverzní funkce

  pokud $f'(a)$ existuje je $f'(a) != 0$ a navíc $inv(f)$ je spojitá v $f(a)$

  potom existuje $inv(f)(f(a))$ a platí $f^(-1)'(f(a)) = 1/(f'(a))$
]

#proof[
  $
    & lim_(x->f(a)) (inv(f)(x) - inv(f)(f(a)))/(x - f(a)) = lim_(x->f(a)) (inv(f)(x) - a)/(x - f(a)) \
    = & lim_(x->f(a)) (inv(f)(x) - a)/(f(inv(f)(x)) - f(a)) \
    = & lim_(y->a) (y-a)/(f(y) - f(a)) \
    "VOLSF(P) - "inv(f) "je prostá" & lim_(x->f(a)) inv(f)(x) = inv(f)(f(a)) = a \
    "tedy" = & lim_(y->a) (y-a)/(f(y) - f(a)) = 1/(f'(a)) \
  $
]

==== Derivace jako funkce
Často používané značení

$f'$ je funkce: $f': x |-> f'(x)$ kde $|->$ je přiřazení

==== Derivace inverzní funkce "globálně"
#cetz.canvas({
  import cetz.draw: *

  // ---- Left: f(x) = e^x and f'(x) = e^x ----
  let f1(x) = calc.exp(x)
  let pts1 = range(81)
    .map(i => {
      let x = -2 + 3.7 * i / 80
      (x, 0.5 * f1(x))
    })
    .filter(p => p.at(1) <= 2.6)
  line(..pts1, stroke: blue.darken(20%))
  line(..pts1, stroke: red.darken(10%), dash: "dashed")

  line((-2.3, 0), (1.9, 0), mark: (end: ">"), name: "ax1")
  line((0, -0.3), (0, 2.8), mark: (end: ">"), name: "ay1")
  content("ax1.end", [$x$], anchor: "west", padding: 0.1)
  content("ay1.end", [$y$], anchor: "south", padding: 0.1)

  line((0.2, -0.7), (0.6, -0.7), stroke: blue.darken(20%))
  content((0.65, -0.7), text(size: 8pt, fill: blue.darken(20%))[$f(x) = e^x$], anchor: "west", padding: 0.05)
  line((0.2, -1.1), (0.6, -1.1), stroke: red.darken(10%), dash: "dashed")
  content((0.65, -1.1), text(size: 8pt, fill: red.darken(10%))[$f'(x) = e^x$], anchor: "west", padding: 0.05)

  // ---- Right: f(x) = tan x and f'(x) = 1/cos^2 x ----
  group({
    set-origin((5.5, 0))
    let g(x) = calc.tan(x)
    let dg(x) = 1 / calc.pow(calc.cos(x), 2)

    let pts2 = range(151)
      .map(i => {
        let x = -1.5 + 3.0 * i / 150
        (x, 0.4 * g(x))
      })
      .filter(p => calc.abs(p.at(1)) <= 2.6)
    line(..pts2, stroke: blue.darken(20%))

    let pts3 = range(151)
      .map(i => {
        let x = -1.5 + 3.0 * i / 150
        (x, 0.4 * dg(x))
      })
      .filter(p => p.at(1) <= 2.6)
    line(..pts3, stroke: red.darken(10%), dash: "dashed")

    line((-1.7, 0), (1.7, 0), mark: (end: ">"), name: "ax2")
    line((0, -0.3), (0, 2.8), mark: (end: ">"), name: "ay2")
    content("ax2.end", [$x$], anchor: "west", padding: 0.1)
    content("ay2.end", [$y$], anchor: "south", padding: 0.1)

    line((1.571, -0.3), (1.571, 2.8), stroke: gray, dash: "dashed")
    line((-1.571, -0.3), (-1.571, 2.8), stroke: gray, dash: "dashed")

    line((0.2, -0.7), (0.6, -0.7), stroke: blue.darken(20%))
    content((0.65, -0.7), text(size: 8pt, fill: blue.darken(20%))[$f(x) = tan x$], anchor: "west", padding: 0.05)
    line((0.2, -1.1), (0.6, -1.1), stroke: red.darken(10%), dash: "dashed")
    content((0.65, -1.1), text(size: 8pt, fill: red.darken(10%))[$f'(x) = 1/cos^2 x$], anchor: "west", padding: 0.05)
  })
})

stačí $f' > 0$

Nechť $f: (alpha, beta) -> RR$ a $f' > 0$ na $(alpha, beta)$ nebo $f' < 0$ na $(alpha, beta)$

Potom $f: (alpha, beta) ->^"na" (gamma, delta)$, $f$ je prostá na $(alpha, beta)$ a $inv(f)$ je spojitá na $(gamma, delta)$

Pak můžu všude na $(gamma, delta)$ použít lokální verzi derivace inverzní funkce a dostanu $f^(-1)'(x) = 1/(f'(inv(f)(x))); sq x in (gamma, delta)$

#proof(title: [náznak])[
  $f' > 0$ znamená $f$ je rostoucí $x > y => f(x) > f(y)$

  tedy $f$ je prostá a zároveň $inv(f)$ je spojitá

  atd... atd...
]

#pb()
==== Goniometrické a hyperbolické funkce a jejich inverze
- máme např. $sin$, $sin' = cos$
- nebo $cos$, $cos' = -sin$
- a tedy splňuje např. homogenní diferenciální rovnici druhého řádu - $y'' = -y$
- dále máme $sin^2 x + cos^2 x = 1$

- mějme např $cos x$ jako derivaci $sin x$ na intervalu $(-pi/2, pi/2)$, kde je kladná

tedy $arcsin(x) = sin^(-1)(x)$ je definována na intervalu $(-1,1)$ a platí

$
  arcsin(x)' = 1/(sin'(arcsin(x))) = 1/(cos(arcsin(x))) "  kde" cos x = sqrt(1-sin^2 x)\
  "tedy" arcsin(x)' = 1/sqrt(1-sin^2 arcsin x) = 1/sqrt(1-x^2)
$

- pro $arccos, arctan, arccotg$ postupuji analogicky

- hyperbolické funkce
$
  sinh x & = (e^x - e^(-x))/2 \
  cosh x & = (e^x + e^(-x))/2 \
   sinh' & = cosh \
   cosh' & = sinh \
$

- splňují homogenní diferenciální rovnici druhého řádu $y'' = y$

$
  cosh^2 x - sinh^2 x = (e^x + e^(-x))/2 - (e^x - e^(-x))/2 = (e^(2x) + 2 + e^(-2x) - (e^(2x) - 2 + e^(-2x)))/4 = 4/4 = 1
$

inverzní funkce

$
  argsinh & = sinh^(-1) \
  argcosh & = cosh^(-1) \
$

a jejich derivace

$
    argsinh' & = 1/(sinh' argsinh) = 1/(cosh argsinh) \
  "kde" cosh & = sqrt(1 + sinh^2) \
      "tedy" & = 1/sqrt(1 + sinh^2 argsinh) = 1/sqrt(1 + x^2) \
$

- analogicky pro $argcosh, argtanh, argcotgh$

kde $tanh = sinh/cosh$ a $cotgh = cosh/sinh$

#pb()
==== Derivace vyšších řádů
Nechť $f$ je reálná funkce, $a in RR$

Druhou derivaci $f$ v $a$ definujeme limitou

$
  f''(a) & = lim_(x->a) (f'(x) - f'(a))/(x-a) \
$

Má-li limita smysl

Obecně pro $n in NN$ definujeme rekurentně derivaci řádu $n$ v bodě $a$ jako

#definition(title: "Derivace n-tého řádu")[$
  f^(n)(a) = lim_(x->a) (f^(n-1)(x) - f^(n-1)(a))/(x-a) = f^(n-1)'
$]

A značíme $f = f^0$

==== Leibnitzův vzorec
binomická věta strikes again!!!
#definition(title: "Leibnitzův vzorec")[$
  (f dot.op g)^(n) = sum_(k=0)^n binom(n, k) f^(k) g^(n-k)
$]

==== Předbíháme letní semestr - parciální derivace
$
  f: RR^n -> RR; sq "např." f: RR^3 -> RR
$

Derivuji podle jedné proměnné

#definition(title: "Parciální derivace")[$
  (partial f)/(partial x)(x, y, z) = lim_(t->0) (f(x + t, y, z) - f(x, y, z))/t
$]

např.

$
  (partial)/(partial x) (x^2 + y^2 + z^2) = 2x + 0 + 0\
$

pozor na rozdílné značení:
- $dif/(dif x)$ je *normální derivace*(derivace funkce jedné proměnné $x$)
- $partial/(partial x)$ je *parciální derivace* podle proměnné $x$

#pb()
== Primitivní funkce - neurčitý integrál
- limity - teoretický koncept
- derivace - praktický koncept
ať to znamená co to znamená
- neurčitý integrál - úloha(asi docela důležitá)
  - hledáme funkci jestliže máme zadanou její derivaci(opačný proces...)
  - při počítání určitých integrálů
  - při řešení diferenciálních rovnic

$
  y' & = f \
$
např.
$
  y' & = x^2 \
   y & = x^3/3 +c \
$

nebo
$
  x y' + y = x^2\
  (x y)' = x^2\
  x y = x^3/3\
  y = x^2/3 + c\
$

nebo
$
      x y' - y & = x^2 \
  y'/x - y/x^2 & = 1 \
        (y/x)' & = 1 \
           y/x & = x \
             y & = x^2 + c \
$

obecně
#important[$
  y' + a(x) y & = b(x) \
$]

#pb()
=== Definice neurčitého integrálu
#definition(title: "Neurčitý integrál, primitivní funkce")[
  Nechť $f$ je reálná funkce definovaná na *otevřeném intervalu* $I$.

  Říkáme, že reálná funkce $F$ definovaná na $I$ je *primitivní* funkce k $f$,\ jestliže $F' = f$.

  *Neurčitý integrál* je množina všech primitivních funkcí $F$ k $f$ na $I$.
]
==== Poznámky a příklady
===== Značení
- Primitivní funkce -> *PF*
- Neurčitý integrál -> $integral f$ nebo $integral f(x) dif x$

- je li $F$ *PF* k $f$ na $I$, potom:
  $
    integral f & = {F + C| C in RR} \
  $
===== Rovnost až na konstantu
Zápis - rovnost až na konstantu $eqc$

$
                   M & eqc f -> M = {f + c | c in RR} \
  integral x^2 dif x & eqc x^3/3 \
$

===== Spojitost a primitivní funkce
- *PF* je *vždy spojitá* na $I$, protože má na $I$ v každém bodě vlastní derivaci
- *každá* $f$ spojitá na $I$ má primitivní funkci

===== Výpočet PF/$integral$

====== pasivní mobové 😁

Tabulkové integrály:
$
  integral sin x dif x & eqc -cos x \
    integral x^2 dif x & eqc x^3/3 \
    integral x^n dif x & eqc x^(n+1)/(n+1) \
$

integrál součtu
$
              integral f + g & eqc integral f + integral g \
  integral sin x + x^2 dif x & eqc integral sin x dif x + integral x^2 dif x eqc -cos x + x^3/3 \
$

====== neutrální mobové 😩
$
  (f g)' & = f'g + f g' -> integral f'g + f g' = integral f'g + integral f g' => #important([$integral f'g = f g - integral f g'$]) \
  (f compose g)' & = f'compose g dot.op g' -> #important([$integral f' compose g dot.op g = f compose g$])
$

např. mám složenou funkci a derivaci vnitřní funkce(řešíme pomocí substituce...)
$
  integral (sin (log x))/x dif x = integral 1/x sin(log x) = -cos(log x)
$

např. *per partes*
$
  integral x cos(x) dif x = x sin x - integral sin x dif x eqc x sin x + cos x\
$

====== hostile mobové 😭
např.

$
  integral sqrt(1 + x^2) dif x & = \
$

vím, že
$
  cosh^2 x - sinh^2 x & = 1 \
             cosh^2 x & = 1 + sinh^2 x \
            (sinh x)' & = cosh x \
$

$
  & = integral sqrt(1 + sinh^2 t) cosh t dif t \
  & = integral sqrt(cosh^2 t) cosh t dif t \
  & = integral cosh^2 t dif t \
  & = integral ((e^t + e^(-t))/2)^2 dif t \
  & = integral 1/4 e^(2t) + 1 + 1/4 e^(-2t) dif t \
  & eqc H(t) \
  & eqc H(argsinh x) \
$

#pb()
ještě pomocí per partes
$
  & integral sqrt(1 + x^2) dif x \
  = & integral 1 dot.op sqrt(1 + x^2) dif x \
  g & = sqrt(1 + x^2) \
  g' & = x/sqrt(1 + x^2) \
  f' & = 1 \
  f & = x \
  = & x sqrt(1 + x^2) - integral x^2/sqrt(1 + x^2) dif x \
  = & x sqrt(1 + x^2) - integral (1 + x^2 - 1)/sqrt(1 + x^2) dif x \
  = & x sqrt(1 + x^2) - integral (1 + x^2)/sqrt(1 + x^2) dif x + integral (1)/sqrt(1 + x^2) dif x \
  = & x sqrt(1 + x^2) - integral sqrt(1 + x^2) dif x + integral (1)/sqrt(1 + x^2) dif x \
  integral sqrt(1 + x^2) dif x eqc & x sqrt(1 + x^2) - integral sqrt(1 + x^2) dif x + integral (1)/sqrt(1 + x^2) dif x \
  2 integral sqrt(1 + x^2) dif x eqc & x sqrt(1 + x^2) + integral (1)/sqrt(1 + x^2) dif x \
  2 integral sqrt(1 + x^2) dif x eqc & x sqrt(1 + x^2) + argsinh x \
  integral sqrt(1 + x^2) dif x eqc & x/2 sqrt(1 + x^2) + 1/2 argsinh x space checkmark\
$

#pb()
=== Metoda per partes
#theorem(title: "Per partes pro neurčitý integrál")[
  Nechť $f,g$ jsou reálné funkce definované na intervalu $I = (a,b)$.

  Nechť navíc existují vlastní derivace $f',g'$ na intervalu $I = (a,b)$

  Potom platí

  #important[$
    integral f'g & = f g - integral f g' \
  $]

  má-li integrál napravo smysl.
]

#proof[
  Nechť $H eqc integral f g'$, potom

  $
    (f g - H)' = f'g + f g' - f g' = f'g\
  $
]

=== Metoda substituce
#theorem(title: "O substituci pro neurčitý integrál")[
  Nechť $f, phi$ jsou reálné funkce, kde $f: (a,b) -> RR$ a $phi: (alpha, beta) -> (a,b)$\ (tedy $f compose phi$ má smysl)

  *1. Věta o substituci*

  Nechť $f'$ existuje na $(a,b)$ a $phi'$ existuje na $(alpha, beta)$

  Potom

  #important[$
    integral phi' f' compose phi eqc f compose phi\
  $]

  *2. Věta o substituci*

  Nechť $phi'$ existuje na $(alpha, beta)$ a navíc $phi' > 0$ nebo $phi' < 0$ na $(alpha, beta)$\ (jen roste nebo jen klesá a je nenulová - *existuje inverze*)

  Nechť navíc $phi: (alpha,beta) ->^"na" (a,b)$

  Nechť dále $H$ je PF k $f' compose phi$ na $(alpha, beta)$

  Potom

  #important[$
    integral f eqc H compose inv(phi)\
  $]
]

#pb()
#proof(title: "1.")[
  $
    (f compose phi)' = phi' f' compose phi\
  $
]

#proof(title: "2.")[
  $
    (H compose inv(phi))' & = (H' compose inv(phi)) dp (inv(phi))' \
                          & = (phi' dp f compose phi) compose inv(phi) dp 1/(phi' compose inv(phi)) \
                          & = (phi' compose inv(phi)) dp (f compose phi compose inv(phi)) dp (1/(phi' compose inv(phi))) \
                          & = (1) dp (f compose phi compose inv(phi)) dp 1 \
                          & = f compose 1 \
                          & = f
  $
]

#pb()
==== Příklad 1.
$
  integral cos(log(x))/x dif x = integral 1/x cos(log(x)) dif x eqc sin(log(x))\
$
nebo

$
  integral cos(log(x))/x & = \
                       t & = log(x) \
                   dif t & = 1/x dif x \
                   dif x & = x dif t \
                         & = integral cos(t)/x x dif t \
                         & = integral cos t dif t \
                         & = sin t \
                         & = sin(log x) \
$

==== Příklad 2.
$
  integral sqrt(1 + x^2) dif x & = \
                             x & = sinh t \
                         dif x & = cosh x dif t \
                               & = integral sqrt(1 + sinh^2(t)) cosh t dif t \
                               & = integral cosh^2 t dif t \
                               & eqc H(t) \
                               & = H(argsinh x) \
$

#pb()

=== Lepení funkcí
- Primitivní funkce je *vždy spojitá*
- *Každá spojitá* funkce má primitivní funkci

např.

Primitivní funkce musí existovat vždy, integrand je definován a spojitý na $RR$
$
  integral e^abs(x) dif x
$
tedy
$
  e^abs(x) & = cases(
               e^x sq & x > 0,
               e^(-x) sq & x < 0,
             )
$

- na $(0, infinity)$
$
  integral e^abs(x) dif x & eqc e^x \
$
- na $(-infinity, 0)$
$
  integral e^abs(x) dif x & = \
                        t & = -x \
                    dif t & = - dif x \
                          & = - integral e^t dif t \
                          & eqc - e^t \
                          & = - e^(-x) \
$

slepíme si tyto dvě funkce

$
  integral e^abs(x) dif x & = cases(
                              e^x sq & x >= 0,
                              -e^(-x) + 2 sq & x < 0
                            )
$

zkusíme zderivovat na intervalech

$
  (cases(
      e^x sq & x >= 0,
      -e^(-x) + 2 sq & x < 0
    ))' & = cases(
            e^x sq & x >= 0,
            e^x sq & x < 0
          ) = e^x \
$

Nazvěme $G(x)$ PF k $e^abs(x)$ na $RR$

potom $G(x) = e^x + C$ pro $x in (0, infinity)$ pro nějaké $C$

potom $G(x) = -e^(-x) + D$ pro $x in (-infinity, 0)$ pro nějaké $D$

tedy $G = F + E$ na $RR without {0}$ (ale i v $0$) pro nějaké $E$

#pb()
#claim(title: "Lepení primitivních funkcí")[
  Nechť $f$ je reálná funkce, $a<b<c$.

  Nechť také $F_1$ je PF k $f$ na $(a,b)$.

  Nechť také $F_2$ je PF k $f$ na $(b,c)$.

  Předpokládejme navíc, že $f$ je spojitá na $(a,c)$,\ tedy má primitivní funkci na $(a,c)$

  Potom existují jednostranné limity $L_1 = lim_(x->b_-) F_1(x)$ a $L_2 = lim_(x->b_+) F_2(x)$

  a platí, že

  $
    F(x) & = cases(
             F_1(x) - L_1 sq & x in (a,b),
             F_2(x) - L_2 sq & x in (b,c),
             0 sq & x = 0,
           )
  $

  #cetz.canvas({
    import cetz.draw: *

    // Define coordinate bounds and points
    let a = 1.0
    let b = 5.0
    let c = 9.0
    let L1 = 3.5
    let L2 = 1.8

    // Draw coordinate axes
    set-style(stroke: (thickness: 0.8pt, paint: luma(100)))
    line((0.2, 0), (9.8, 0), mark: (end: "stealth"))
    line((0.5, -0.5), (0.5, 5.5), mark: (end: "stealth"))

    content((9.9, 0), [$x$], anchor: "west")
    content((0.5, 5.6), [$y$], anchor: "south")

    // Vertical dashed domain boundary lines
    set-style(stroke: (dash: "densely-dashed", thickness: 0.6pt, paint: luma(160)))
    line((a, 0), (a, 4.5))
    line((b, 0), (b, 4.5))
    line((c, 0), (c, 4.5))

    // Domain tick labels
    content((a, -0.35), [$a$])
    content((b, -0.35), [$b$])
    content((c, -0.35), [$c$])

    // --- Original unshifted primitives F_1(x) and F_2(x) (dashed / lighter) ---
    // F1 segment: curve from (a, 1.2) to (b, L1)
    bezier((a, 1.2), (b, L1), (2.2, 1.5), (3.8, 3.2), stroke: (
      paint: blue.lighten(50%),
      thickness: 1.2pt,
      dash: "dotted",
    ))
    // F2 segment: curve from (b, L2) to (c, 4.2)
    bezier((b, L2), (c, 4.2), (6.2, 1.9), (7.8, 3.0), stroke: (
      paint: olive.lighten(40%),
      thickness: 1.2pt,
      dash: "dotted",
    ))

    // Limit value markers on the b-line
    circle((b, L1), radius: 2.2pt, stroke: blue.lighten(30%), fill: white)
    content((b - 0.15, L1 + 0.3), [$L_1$], anchor: "south-east")

    circle((b, L2), radius: 2.2pt, stroke: olive, fill: white)
    content((b + 0.15, L2 - 0.3), [$L_2$], anchor: "north-west")

    // Vertical shift translation vectors (arrows showing normalization by -L_1 and -L_2)
    line((3.2, 2.7), (3.2, 2.7 - L1), mark: (end: "stealth"), stroke: (paint: gray, thickness: 0.7pt))
    content((3.3, 2.7 - L1 / 2), [$-L_1$], anchor: "west")

    line((7.2, 2.5), (7.2, 2.5 - L2), mark: (end: "stealth"), stroke: (paint: gray, thickness: 0.7pt))
    content((7.3, 2.5 - L2 / 2), [$-L_2$], anchor: "west")

    // --- Glued Primitive F(x) = continuous curve (solid, bold) ---
    // Shifted F1: y -> y - L1, terminates at (b, 0)
    bezier((a, 1.2 - L1), (b, 0), (2.2, 1.5 - L1), (3.8, 3.2 - L1), stroke: (paint: blue, thickness: 2pt))
    // Shifted F2: y -> y - L2, starts from (b, 0)
    bezier((b, 0), (c, 4.2 - L2), (6.2, 1.9 - L2), (7.8, 3.0 - L2), stroke: (paint: blue, thickness: 2pt))

    // Open boundary points at x = a and x = c
    circle((a, 1.2 - L1), radius: 2.5pt, stroke: blue, fill: white)
    circle((c, 4.2 - L2), radius: 2.5pt, stroke: blue, fill: white)

    // Glued point at x = b (continuous junction F(b) = 0)
    circle((b, 0), radius: 3pt, stroke: blue, fill: blue)
    content((b + 0.25, 0.45), [$F(b) = 0$], anchor: "south-west")

    // Curve labels
    content((2.2, 1.8), [$F_1(x)$], anchor: "south-east")
    content((8.0, 3.7), [$F_2(x)$], anchor: "south-west")
    content((4.3, -1.5), [$F(x) = F_1(x) - L_1$], anchor: "north")
    content((8.8, 1.6), [$F(x) = F_2(x) - L_2$], anchor: "north-west")
  })

]

#pb()
=== Metoda parciálních zlomků
Zajímá nás integrace racionálních funkcí. Chceme je rozložit na něco s čím umíme pracovat.

Jde o funkce následujícího typu - podíl polynomů

$
  R(x) & = P(x)/Q(x) \
$

Požadujeme
- aby $P,Q$ byly nesoudělné (jinak podělím)
- aby $deg(P) < deg(Q)$ (jinak podělím)
- umím rozložit $Q$ => $Q(x) = (x-alpha_1)^(n_1) dp (x-alpha_2)^(n_2) dots (x^2 + p_1 x + q_1)^(m_1) dots (x^2 + p_l x + q_l)^(m_l)$
  - kde komplexní kořeny mají tvar $(x^2 + p_i x + q_i)^(m_i) = (x- beta_i)^(m_i) dp (x- avg(beta_i))^(m_i)$
  - předpokládám koeficient $1$ u nejvyšší mocniny

Máme následující algoritmus:

$
  P(x)/(S(x)(x-alpha)^n) - (P(alpha)/S(alpha))/(x-alpha^n) = (P(x) - P(alpha)/S(alpha) S(x) )/(S(x) (x-alpha)^n)\
$

pak
$
  P(x) - P(alpha)/S(alpha) S(x) & = T^~(x) \
                 T^~(alpha) = 0 \
$
tedy
$
  T^~ & = (x-alpha)T(x) \
$

pak
$
  (P(x) - P(alpha)/S(alpha) S(x) )/(S(x) (x-alpha)^n) = (T(x) (x- alpha))/(S(x)(x-alpha)^n) = T(x)/(S(x)(x-alpha)^(n-1))
$

pokračuji dále a dále, odsekávám funkce typu

$
  C/(x-a)^k\
$

a tedy

$
  deg T <= max(deg P, deg S) - 1\
$
