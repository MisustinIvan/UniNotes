#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "@local/mod:0.1.0": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#show: boilerplate

#title[Lineární algebra - přednáška - Dalibor Šmíd]
= Vektory a matice
vektor $ar(x) = vec(x_1, x_2, ..., x_n) in RR^n$ je uspořádaná n-tice čísel(zatím)

== Lineární kombinace
lineární kombinace vektorů $x,y$ s koeficienty $r,s$
$
  r ar(x) + s ar(y) = r vec(x_1, x_2, ...) + s vec(y_1, y_2, ...)\
$

== Opačný vektor
$
    ar(x) & = vec(x_1, x_2) \
  - ar(x) & = vec(-x_1, -x_2) \
$

== Nulový vektor
$
  ar(0) & = vec(0, 0) \
$

== Matice obecně
Tabulka čísel charakterizující *lineární zobrazení*.

např. $F : RR^2 -> RR^2$
- (1) - prohození os - osová souměrnost podle osy 1. a 3. kvadrantu
$
  F(vec(x_1, x_2)) & = vec(x_2, x_1) = x_2 vec(1, 0) + x_1 vec(0, 1) \
$
- (2) - zrcadlení podle osy x
$
  F(vec(x_1, x_2)) & = vec(x_1, -x_2) = x_1 vec(1, 0) + x_2 vec(0, -1) \
$
- (3) - jeden z 2 kolmých vektorů - otočení o $+90 degree$
$
  F(vec(x_1, x_2)) & = vec(-x_2, x_1) = x_2 vec(-1, 0) + x_1 vec(0, 1) \
$

#pb()
zobrazení obecněji
$
  f(vec(x_1, x_2)) & = vec(a_(11) x_1 + a_(12)x_2, a_(21)x_1 + a_(22)x_2) = x_1 vec(a_(11), a_(12)) + x_2 vec(a_(21), a_(22))\
  &:= mat(a_(11), a_(12); a_(21), a_(22)) vec(x_1, x_2) \
$
=> součin matice a vektoru je lineární kombinace sloupců matice s řádky vektoru


- násobení matice a vektoru má definované pořadí prvků v operaci - stejné pravidlo jako při násobení matic obecně

=== Definice lineárního zobrazení
#definition(title: "Lineární zobrazení")[
  $
    "nechť" F: RR^n -> RR^m\
    "splňuje" forall ar(x);ar(y) in RR^n "a" forall r;s in RR\
    F(r ar(x) + s ar(y)) = r F(ar(x)) + s F(ar(y))\
  $

  a také
  $
    F(ar(0)) = ar(0)\
  $

  $F$ je *lineární zobrazení*
]
$
  F(vec(x_1, x_2, ..., x_n)) & = F(x_1 vec(1, 0, 0, ...) + x_2 vec(0, 1, 0, ...) + ... + x_n vec(0, 0, ..., 1)) \
                             & = x_1 F(ar(e_1)) + x_2 F(ar(e_2)) + ... + x_n F(ar(e_n)) \
$

zobrazení libovolného vektoru spočítám jako lineární kombinaci zobrazení kanonických(bázových) vektorů $ar(e_1), ..., ar(e_n)$ => zobrazení kanonických vektorů mi plně definuje zobrazení

$
  x_1 bold(F(ar(e_1))) + x_2 bold(F(ar(e_2))) + ... + x_n bold(F(ar(e_n))) =: bold(A) ar(x)
$

kde $A$ je matice řádu $m times n$

$
  A = mat(ar(a_1), |, ar(a_2), |, ..., |, ar(a_n))
$

kde $a_n = F(ar(e_n))$

=== Příklady zobrazení která nejsou lineární
Např. 1

$
  F(ar(x)) = ar(x) + ar(b)
$

není lineární protože:
$
  F(r ar(0) + s ar(0)) != r F(ar(0)) + s F(ar(0))
$


#pb()
=== Identitní - jednotková matice
identitní operand při násobení
$
  F(ar(x)) & = ar(x) \
   E ar(x) & = ar(x) \
         E & = mat(1, 0, 0; 0, 1, 0; 0, 0, 1) \
$

=== Nulová matice
$
       F(ar(x)) & = ar(0) \
  bold(O) ar(x) & = ar(0) \
        bold(O) & = mat(0, 0, 0; 0, 0, 0; 0, 0, 0) \
$

== Operace na maticích
=== Sčítání a násobení skalárem
$
  r;s in RR; A;B in RR^(m times n)\
  A + B = "po složkách..."\
  r A = "taky po složkách"
$

=== Transpozice
prohození indexů
$
    A & = mat(a_(11), a_(12); a_(21), a_(22)) \
  A^T & = mat(a_(11), a_(21); a_(12), a_(22)) \
$

$
    A & = (a_(i j))_(i,j = 1,1)^(m,n) \
  A^T & = (a_(j i))_(i,j = 1,1)^(m,n) \
$

#pb()
=== Součin matic
#definition(title: "Maticové násobení")[
  kompozice zobrazení

  $A$ je matice typu $m times n$
  $
    F_A & : RR^n -> RR^m \
    F_A & = A ar(x) \
  $

  $B$ je matice typu $p times m$
  $
    F_B & : RR^m -> RR^p \
    F_B & = B ar(x) \
  $

  pak kompozice
  $
    (F_B compose F_A) (ar(x)) = F_B (F_A (ar(x)))\
  $

  snadno se ověří že $F_B compose F_A$ je také lineární zobrazení

  musí tedy existovat matice typu $p times n$ že $forall ar(x) in RR^n$ platí: $(F_B compose F_A) (ar(x)) = C ar(x)$

  zavedu součin jako takovou operaci, že $F_B F_A = C$

  kde:

  $
     (F_B compose F_A)(ar(e_i)) & = ar(c_i) "     je i-tý sloupec C" \
    (F_B compose F_A) (ar(e_i)) & = F_B (ar(a_i)) \
  $

  a tedy:

  $
    B A equiv C = matcol(B ar(a_1), B ar(a_2), ..., B ar(a_n))
  $

  s tím že z definice:

  $
    C^i_j = ar(a_i) dot.op ar(b^j)
  $

  z toho plyne obecný tvar výsledku:

  $
    A^(m times n) B^(n times p) = mat(
      ar(a_1) ar(b^1), ..., ar(a_1) ar(b^p);
      ..., ..., ...;
      ar(a_m) ar(b^1), ..., ar(a_m) ar(b^p);
    ) = C^(m times p)
  $

  a zjištění že násobení matice a vektoru je jen speciální případ násobení matic, kde vektor je vlastně jen matice typu $n times 1$
]

#pb()
==== Vlastnosti součinu matic jako matematické operace
===== Nekomutativita
$
  A B != B A
$
===== Asociativita
$
  (A B)C = A (B C)
$
===== Vlastnosti transpozice
$
  (A B)^T = B^T A^T
$
===== Vlastnost inverzní matice
$
  A inv(A) = E
$


#pb()
= Nadrovina
- zobecnění pojmu rovniny/přímky...
$ {vec(x_1, x_2)| a_1 x_1 + a_2 x_2 = b} $ přímka v $RR^2$
$ {vec(x_1, x_2, x_3)| a_1 x_1 + a_2 x_2 + a_3 x_3 = b} $ rovina v $RR^3$
#definition(title: [Nadrovina v $RR^n$])[
  $
    {vec(x_1, x_2, ..., x_n)| a_1 x_1 + a_2 x_2 + ... + a_n x_n = b}
  $
  nadrovina v $RR^n$
]

= Vlastnosti maticového násobení
- nekomutativní, ale asociativní - protože lineární zobrazení jsou asociativní

$
  (A B) C) ar(x) = (F_(A B) compose F_c) ar(x) = (F_A compose F_B compose F_c) ar(x) = (F_A compose F_B (F_C ar(x))) = (F_A compose F_(B C))ar(x) = (A (B C)) ar(x)
$

== Vlastnosti transpozice
$
        A B & = C \
    C_(i j) & = sum_(k = 1)^n a_(i k) b_(k j) \
  C^T_(i j) & = C_(j i) \
  C^T_(i j) & = sum_(k = 1)^n a^T_(k i) b^T_(j k) = sum_(k = 1)^n b^T_(j k) a^T_(k i) \
$

Transponovaná matice součinu je součin transponovaných matic v opačném pořadí

$
      C^T & = B^T A^T \
  (A B)^T & = B^T A^T \
$

#claim[$
  forall A, B; A in RR^(m times n); B in RR^(n times p): (A B)^T = B^T A^T
$]

#pb()
= Inverzní matice
- definice
$A in RR^(n times n) "pak" inv(A) in RR^(n times n): A inv(A) = E and inv(A) A = E$

pak jestliže existuje $inv(A)$ nazýváme $A$ regulární, jinak nazýváme $A$ singulární - týká se jen čtvercových matic

$
  F_(A inv(A)) & = F_A compose F_(A^-1) => "Id" => F_(inv(A)) = F_A^(-1) \
  F_(inv(A) A) & = F_(A^-1) compose F_A => "Id" => F_A^(-1) = F_(inv(A)) \
$

#claim(title: "Jednoznačnost inverzní matice")[$
  "pokud" A,B,C in RR^(n times n) "a" B A = E = A C "pak" B = C
$]

#proof[$
  B = B E = B (A C) = (B A)C = E C = C\
$]

#claim(title: "Inverzní matice součinu")[$
  A, B in RR^(n times n) "jsou regulární, pak" A B "je také regulární"\
  (A B)^(-1) = inv(B) inv(A)\
$]

#proof[$
  A B inv(B) inv(A) = A E inv(A) = A inv(A) = E\
  inv(B) inv(A) A B = inv(B) E B = inv(B) B = E\
$]

-

#claim(title: "Inverzní matice transponované matice")[
  $
    A in RR^(n times n) "je regulární, pak" (A^T)^(-1) = (inv(A))^T = A^(-T)
  $
]

#proof[$
  (inv(A))^T A^T = (A inv(A))^T = E^T = E\
  A^T (inv(A))^T = (inv(A) A)^T = E^T = E\
$]

#pb()
- hledání inverzní matice
jestliže $A B = E$ tedy $A B^i = e_i$

$
  mat(
    1, 3, |, 1, 0;
    1, 4, |, 0, 1
  ) ~ mat(
    1, 0, |, a_(1 1), a_(1 2);
    0, 1, |, a_(2 1), a_(2 2)
  )
$

pak

$
  inv(A) = mat(
    a_(1 1), a_(1 2);
    a_(2 1), a_(2 2)
  )
$

#pb()
= Soustava lineárních rovnic
== Elementární řádkové úpravy
#definition(title: "Elementární řádková úprava")[
  - Prohození dvou řádků
  - Přičtení $r$-násobku řádku do jiného
  - Vynásobení řádku nějakým skalárem $s != 0$
]

=== Elementární matice
- vznikne z jednotkové matice pomocí jedné EŘÚ

$
  mat(1, 0; 0, 1) ~ mat(0, 1; 1, 0)
$

$
  mat(1, 0; 0, 1) ~ mat(1, 4; 0, 1)
$

$
  mat(1, 0; 0, 1) ~ mat(4, 0; 0, 1)
$

- elementární úprava se zapíše jako maticové násobení
- např.

$
  mat(1, 0; -1, 1) mat(1, 3; 1, 4) = mat(1, 3; -1 dot.op 1 + 1, -1 dot.op 3 + 4) = mat(1, 3; 0, 1)
$

- každá čtvercová regulární matice je součinem elementárních matic(nebudeme dokazovat)

#pb()
== Reprezentace SLR
$
  A ar(x) = ar(b)
$

její rozšířená matice je

$
  matcol(A, ar(b))
$

B je elementární matice

$
  B A ar(x) = B ar(b)
$

$ar(x)$ řeší $A ar(x) = ar(b)$ => $ar(x)$ řeší i $matcol(B A, B ar(b))$

Elementární úpravy jsou vratné, tedy když $ar(x)$ řeší $matcol(B A, B ar(b))$ => $ar(x)$ řeší i $matcol(A, ar(b))$

#claim[
  - Elementární řádkové úpravy zachovávají množinu všech řešení soustavy lineárních rovnic
]

#definition[

  matice $A in RR^(m times n)$ je v odstupňovaném tvaru(*row echelon form* - *REF*) pokud:

  - všechny nulové řádky jdou až po nenulových
  - první nenulové prvky(pivoty) nenulových řádků mají rostoucí posloupnost sloupcových indexů


  např.
  $
    mat(
      0, a, *, *;
      0, 0, 0, b;
      0, 0, 0, 0;
      0, 0, 0, 0;
    )
  $

  $A$ je navíc v *redukovaném odstupňovaném tvaru*(*RREF*) pokud ještě platí:
  - pivoty jsou jednotkové
  - v pivotních sloupcích jsou už dál jen nuly

  např.
  $
    mat(
      0, 1, 2, 0, -1, |, 3;
      0, 0, 0, 1, 8, |, 3
    )
  $
]

#pb()
== Gaussova/Gaussova-Jordanova eliminace
#definition(title: "Gaussova-Jordanova eliminace")[
  - algoritmus na převedení regulání matice na RREF/REF podle Magdaleny Dobromily Rettigové

  - (1) najdi první nenulový sloupec, má index $j$
  - (2) prohoď řádky aby $a_(1 j) != 0$
  - (3) přičti $- a_(i j)/(a 1 j)$-násobek prvního řádku k i-tému řádku $forall i > 1$
  - (4) opakuj předchozí 3 kroky s maticí bez prvního řádku dokud to dává smysl
  - (5) přenásob řádky skaláry $1/a_(i j)i$ tak aby byly pivoty jednotkové
  - (6) přičti násobky řádků k předchozím abychom dostali ve všech pivotních sloupcích kromě pivotů nuly
]

#claim[
  Gaussova eliminace funguje $space checkmark$ 😊\
]
#image("15-social-credit-meme-9-629893285.png")
#proof(title: [indukcí podle počtu nenulových řádků v matici])[]

#pb()
= SLR

$
  A in RR^(m times n), ar(b) in R^m\
  A ar(x) = ar(b)\
  matcol(A, ar(b)) ~ "EŘÚ..." ~ matcol(C, ar(b')) "v REF"\
$

+ SLR je *řešitelná* <=> sloupec pravých stran je *nepivotní*
  - nemám něco jako $0 = "konst"$
+ $ar(x_H)$ -> $A ar(x_H) = ar(0) and ar(x_P) : A ar(x_P) = ar(b)$ => $A (ar(x_H) + ar(x_P)) = ar(0) + ar(b) = ar(b)$
  - obecné řešení má tvar: $ar(x_P) + ker A$ kde $ker A = {ar(x_M) | A ar(x_M) = ar(0)}$
  - partikulární řešení mi udává posunutí podprostoru $ker A$ -> tvoří afinní podprostor
+ $ker A$ je uzavřeno na lineární kombinace
  - $A ar(x) = 0 and A ar(y) = 0 => A (r ar(x) + s ar(y)) = ar(0) => r ar(x) + s ar(y) in ker A$
+ $ker A$ je tedy *podprostor*
+ Při řešení SLR pomocí GJE získáváme řešení ve tvaru $ar(x_P) + ker A$
  - homogenní - $mat(1, 0, 1; 0, 1, 1) vec(x_1, x_2, x_3) = vec(0, 0) => ar(x) in span(vec(-1, -1, 1)) = ker A$
  - nehomogenní - $mat(1, 0, 1; 0, 1, 1) vec(x_1, x_2, x_3) = vec(1, 0) => ar(x) = vec(1, 0, 0) + span(vec(-1, -1, 1))$

+ $ker A$ je podprostor, $ar(x_P) + ker A$ nemusí být podprostor - může být tzv. *afinní prostor*
  - resp. $ar(x_P) + ker A$ je podprostor právě v tom případě že $ar(x_P) in ker A$ - což ale nenastane při klasickém řešení SLR...

#cetz.canvas({
  import cetz.draw: *

  let O = (0, 0)
  let P = (0, 2.4)
  let H = (2.4, 1.2)
  let S = (2.4, 3.6)

  // axes
  line((-2.8, 0), (3.6, 0), stroke: (paint: gray.lighten(25%), thickness: 0.6pt), mark: (end: ">"))
  line((0, -1.6), (0, 3.0), stroke: (paint: gray.lighten(25%), thickness: 0.6pt), mark: (end: ">"))

  // ker A
  line((-2.4, -1.2), (3.2, 1.6), stroke: (paint: blue.darken(25%), thickness: 1.1pt))
  // x_P + ker A
  line((-2.4, 1.2), (3.2, 4.0), stroke: (paint: red.darken(20%), thickness: 1.1pt))

  // parallelogram edge
  line(H, S, stroke: (paint: gray.darken(20%), thickness: 0.7pt, dash: "dashed"))

  // vectors
  line(O, P, mark: (end: ">"))
  line(O, H, mark: (end: ">"))
  line(O, S, mark: (end: ">"))

  // line labels
  content((3.2, 1.6), [$"ker" A$], anchor: "west", padding: 0.15)
  content((3.2, 4.0), [$ar(x)_P + "ker" A$], anchor: "west", padding: 0.15)

  // vector labels
  content((rel: (-0.12, 0), to: (0, 1.2)), [$ar(x)_P$], anchor: "east")
  content((rel: (0.1, -0.1), to: (1.2, 0.6)), [$ar(x)_H$], anchor: "north-west")
  content((rel: (0.15, -0.1), to: S), [$ar(x)_P + ar(x)_H$], anchor: "north-west")
})


#pb()
= Hledání vzoru vektoru $ar(v)$ v zobrazení $F_A$
Hledání všech $ar(x)$ pro které $F_A(ar(x)) = ar(v)$ tedy $A ar(x) = ar(v)$
-> množina všech řešení SLR $A ar(x) = ar(v)$

Tedy lineární zobrazení $F_A$ je:
+ *prosté(injekce)* <=> $forall ar(x) in RR^n$ má SLR $A ar(x)$ *nejvýše jedno* řešení
  - tj. $A$ má po převedení na REF všechny sloupce pivotní
+ *na(surjekce)* <=> $forall ar(x) in RR^n$ má SLR $A ar(x)$ *alespoň jedno* řešení
  - tj. $A$ nemá po převedení na REF nulové řádky
+ *bijekce - injekce i surjekce* <=> $forall ar(x) in RR^n$ má SLR $A ar(x)$ *právě jedno* řešení
  - tj. $A$ nemá po převedení na REF nulové řádky a všechny sloupce jsou pivotní
    - $A$ v RREF $= E$

#cetz.canvas({
  import cetz.draw: *

  let r = 0.8
  let sep = 2.0
  let dot-r = 0.055

  let panel(cx, title, dom-ys, cod-ys, pairs) = {
    let dc = (cx, 0)
    let cc = (cx + sep, 0)
    circle(dc, radius: r, stroke: blue.darken(30%), fill: blue.lighten(92%))
    circle(cc, radius: r, stroke: blue.darken(30%), fill: blue.lighten(92%))
    let dpts = dom-ys.map(y => (cx - 0.32, y))
    let cpts = cod-ys.map(y => (cx + sep + 0.32, y))
    for (i, j) in pairs {
      line(dpts.at(i), (dpts.at(i), 94%, cpts.at(j)), mark: (end: ">"))
    }
    for p in dpts { circle(p, radius: dot-r, fill: black, stroke: none) }
    for p in cpts { circle(p, radius: dot-r, fill: black, stroke: none) }
    content((cx + sep / 2, 1.15), title, anchor: "south")
    content((cx, -1.05), [$RR^n$], anchor: "north")
    content((cx + sep, -1.05), [$RR^m$], anchor: "north")
  }

  panel(0, [Injection], (0.45, 0, -0.45), (0.55, 0.18, -0.18, -0.55), ((0, 0), (1, 1), (2, 3)))
  panel(4, [Surjection], (0.5, 0.17, -0.17, -0.5), (0.45, 0, -0.45), ((0, 0), (1, 1), (2, 1), (3, 2)))
  panel(8, [Bijection], (0.45, 0, -0.45), (0.45, 0, -0.45), ((0, 0), (1, 1), (2, 2)))
})

- $F_A(ar(x)) = A ar(x) => matcol(ar(a_1), ar(a_2), ..., ar(a_n))$
  - $matcol(ar(a_1), ar(a_2), ..., ar(a_n)) ar(x) = x_1 ar(a_1) + x_2 ar(a_2) + ... + x_n ar(a_n)$
  - zobrazení $F_A$ je $chevron ar(a_1), ar(a_2), ..., ar(a_n) chevron.r$
    - $I m A = I m F_A$ -> obor hodnot = *obraz zobrazení* - *sloupcový prostor $A$*
    - $I m A^T$ je *řádkový prostor $A$*

#claim[
  - $F_A: RR^n -> RR^n$ je bijektivní <=> $A$ je čtvercová $and exists X : A X = E$
]
#corollary[
  - $F_A$ je bijekce právě pokud $A$ je regulární
]
#proof(title: [1])[
  - $A$ je regulární $=> exists inv(A) : A inv(A) = E and A in RR^(n times n)$
    - $F_A compose F_(inv(A)) = F_E$
    - $F_(inv(A)) compose F_A = F_E$
      -> $F_A$ je bijekce
]
#pb()
- $F_A$ je bijekce a zároveň je lineární => $F_A$ je *izomorfismus*
#proof(title: [2])[
  - $F_A$ je bijekce => soustava $A ar(x) = ar(b)$ má právě jedno řešení
    - $=> A ~^("GE") E$
      - existují elementární matice $B_1, B_2, ... B_k$ => $B_k dot.op ... dot.op B_2 dot.op B_1 dot.op A = E$
      - $Y dot.op A = E$ kde $Y = B_k dot.op ... dot.op B_2 dot.op B_1$
      - jelikož je inverzní matice jednoznačná, tak $A Y = E$ a $Y = inv(A)$
]

#pb()
= Vektorový prostor
== Algebraická struktura
- máme množinu a jednu nebo více operací a "axiomy"
=== Grupa
- množina s jednou operací
- $(G, *)$, kde $*: G times G -> *$ je binární operace
- axiomy pro obecnou grupu
  - *asociativita* $forall a, b,c in G : a * (b * c) = (a * b) * c$
  - *existence neutrálního prvku* $exists e in G : forall a in G: e * a = a$
  - *existence inverzního prvku* $forall a in G exists inv(a) in G : a * inv(a) = e = inv(a) * a$
- *Abelovská grupa*
  - navíc komutativita $forall a,b in G: a * b = b * a$

== Definice vektorového prostoru
#definition[
  Vektorový prostor nad $FF$ je množina $V$ se dvěma operacemi
  + (uzavřené)sčítání $+: V + V -> V$
  + (uzavřené)skalární násobení $dot.op: FF dot.op V -> V$

  kde $FF$ je těleso(pro nás tedy v praxi hlavně $RR$ nebo $CC$)

  Splňující
  + $(V,+)$ je komutativní grupa
  + $forall v in V: 1 dot.op v = v$ - identitní prvek pro skalární násobení
  + $forall v in V, forall r,s in FF: r(s v) = (r s)v$ asociativita
  + $forall v in V, forall r,s in FF: (r+s) v = r v + s v$ distrubutivita
  + $forall u, v in V, forall r in FF: r(u+v) = r u + r v$ distributivita
  + neutrální prvek $V$ značíme $o$ - nulový vektor => $v + o = v$
  + inverzní prvek $in V$ k $v in V$ je $-v$ - $v + (-v) = o$
]

#pb()
== Příklady vektorových prostorů
+ Aritmetický vektorový prostor $RR^n$
  - splňuje axiomy vektorového prostoru - pracujeme po složkách, které jsou $RR$, pro které tyto axiomy také platí
$
  ar(x) = vec(x_1, x_2, ..., x_n) sq ar(o) = vec(0, 0, ..., 0) sq -ar(x) = vec(-x_1, -x_2, ..., -x_n) sq r ar(x) = vec(r x_1, r x_2, ..., r x_n)
$


+ $CC^n$ je totéž jako $FF^n$ (F - field)
+ $FF^(m times n)$
  - množina všech matic typu $(m times n)$ - také pracujeme po složkách, také splňuje definici
+ $X$ množina $F(X,RR)$ - množina všech reálných funkcí definovaných na množině $X$
  - také pracujeme po složkách...

== Podprostor vektorového prostoru
Podprostor vektorového prostoru $V$ nad $FF$ je $W subset.eq V$ nad $FF$, $WW != emptyset$ značíme $W<= V$\
jestliže $forall r,s in FF$ a $forall u,v in WW$ je $r u + s v in WW$ - je uzavřená na lineární kombinace

#claim[
  - Jestliže je $V$ vektorový prostor nad $FF$ a $W$ jeho podprostor, pak $W$ je také vektorový prostor nad $FF$
]
#proof[
  - $V$ je z definice vektorového podprostoru uzavřený pro lineární kombinace, což implikuje i to že je uzavřený pro skalární násobení
]


#pb()
=== Příklad podprostoru

$
  ker A ; M = {v_1, v_2, ..., v_n}, span(M)
$

#claim[
  $
    forall M subset.eq V "(v.p. nad F)": span(M) <= V\
  $
]

#proof[
  součet lineárních kombinací můžu zapsat jako lineární kombinaci...
]

=== Definice
#definition[
  $M subset.eq V$ říkáme že $M$ generuje $V$ jestliže $span(M) = V$
]

==== Příklad 1.
${x, x^3, x^5}$ generuje $P_5^- (x, RR)$ (generuje vektorový prostor všech lichých reálných polynomů stupně nejvýše 5)

==== Příklad 2.
${vec(1, 0), vec(0, 1), vec(1, 1)}$ generuje $RR^2$


#pb()
#definition(title: "Lineární závislost a nezávislost")[
  Nechť $M!=emptyset subset.eq V$ -> $v_1, ..., v_n in M$

  jejich lineární kombinace $sum_(i=1)^k r_i v_i$ je *netriviální*, jestliže $exists r_i != 0$

  + $M$ je *lineárně závislá*, jestliže $exists$ netriviální lineární kombinace prvků $M$, která dává $ar(0) in V$
  + $M$ je *lineárně nezávislá*, jestliže $ar(0)$ dostanu jen a pouze triviální lineární kombinací
]

#claim[
  $V$ je v.p. nad $FF$, $M subset.eq V$, pak:
  + je li $M$ alespoň dvouprvková, pak $M$ je LZ <=> alespoň jeden prvek $in M$ je LK ostatních prvků $in M$
  + $span(M) = V$, $M$ je LZ <=> $exists N subset.eq.not M: span(N) = V$
]

#proof(title: [$plus.minus$])[
  + $M = {v_1, ..., v_n}$, $ar(0) = sum_(i=1)^k r_i v_i => v_1 = -1/r_1 sum_(i=2)^k r_i v_i$
  + $span(M) = V => n = sum_(i=1)^k r_i v_i$, je li $M$ LZ, pak např. $v_k = sum_(i=1)^(k-1) r_i v_i$
    - pak $n = sum_(i=1)^(k-1) r_i v_i + r_k sum_(i=1)^k s_i v_i = sum_(i=1)^(k-1) (r_i + r_k s_i) v_i => span(N) = V$
]

#pb()
== Definice: Báze
#definition[
  $V$ je v.p. nad $FF$, $M subset.eq V$ je bází prostoru $V$ jestliže:
  + $M$ generuje $V$ <=> $span(M) = V$
  + $M$ je lineárně nezávislá
]

=== Příklad 1
${ar(e_1), ..., ar(e_n)}$ je báze prostoru $FF^n$ - *kanonická báze*
=== Příklad 2
${mat(1, 0; 0, 0),mat(0, 1; 0, 0),mat(0, 0; 1, 0),mat(0, 0; 0, 1)}$ je bází prostoru $FF^(2 times 2)$
=== Příklad 3
${1, x, x^2, x^3, ...}$ je báze $P(x, RR)$ - báze nemá konečný počet prvků, prostor $P(x, RR)$ má nekonečnou dimenzi

#claim[
  $M subset.eq V$ je bází $V$ právě když každý prvek $V$ lze vyjádřit jako LK prvků $in M$ *právě jedním* způsobem.
]

#proof(title: "1.")[
  - (1)
  $M$ je bází => $span(M) = V$, pro spor předpokládejme že $exists v in V: v = sum_(i=1)^k r_i v_i = sum_(i=1)^k s_i v_i$ a $exists r_i != s_i$

  z toho plyne

  $ar(0) = sum_(i=1)^k r_i v_i - sum_(i=1)^k s_i v_i = sum_(i=1)^k (r_i - s_i) v_i$ => $bold(forall i in {1, ..., k}: r_i = s_i)$ *spor*!
]
#proof(title: "2.")[
  $span(M) = V$ a $ar(0)$ lze vyjádřit právě jedním způsobem, tedy jediný způsob je triviální LK
]

#pb()
#definition[
  v.p. $V$ nad $FF$ nazýváme *prostor konečné dimenze* jestliže ve $V$ existuje *konečná báze*.
]

#claim[
  je li $V$ v.p. nad $FF$, jsou následující tvrzení ekvivalentní:
  + $V$ je prostor konečné dimenze.
  + ve $V$ existuje konečná množina generátorů - $M: span(M) = V$.
  + z každé, tedy i nekonečné množiny generátorů $V$ lze vybrat konečnou bázi $V$.
]

#proof[
  Stačí vytvořit řetězec implikací

  - 1. => 2. => 3. => 1.
    - 1. => 2. platí z definice
    - 3. => 1. platí z definice
    - 2. => 3. nástin důkazu
      $
        & M subset.eq V: span(M) = V \
        & N("konečná"): span(N) = V \
        & N = {v_1, v_2, ..., v_n} \
        & v_1 = sum r_i v_i, ..., v_n = sum r_i v_i \
        & u in V : u = sum_(i=1)^k s_i v_i \
        & u in V : u = sum_(i=1)^k s_i sum r_(i j) v_(i j) = sum t_(i j) u_(i j) \
      $
]


#pb()
== Konvence
Odteď $B$ báze v.p. konečné dimenze $V$ je chápána jako posloupnost, t.j. *uspořádaná* (konečná) množina

$
  B & = (v_1, v_2, ..., v_n) \
$

Dostávám možnost jednoznačné reprezentace vektoru $v in V$ vzhledem k bázi $B$

$exists$ n-tice $(r_1, ..., r_n)$ tak, že $v = sum_(i=1)^k r_i v_i$

#important(caption: "Reprezentace vektoru vůči bázi jako aritmetický vektor")[$
  [v]^B := vec(r_1, r_2, ..., r_n) in FF^n\
$]

=== Příklad 1.
$
  mat(1, 2; 3, 4); sq B & = (mat(1, 0; 0, 0),mat(0, 1; 0, 0),mat(0, 0; 1, 0),mat(0, 0; 0, 1)) \
                        \
    [mat(1, 2; 3, 4)]^B & = vec(1, 2, 3, 4) \
                        \
  mat(1, 2; 3, 4); sq C & = (mat(0, 1; 0, 0), mat(1, 0; 0, 0),mat(0, 0; 1, 0),mat(0, 0; 0, 1)) \
    [mat(1, 2; 3, 4)]^C & = vec(2, 1, 3, 4) \
$

#pb()
== Lemma - Steinitzovo o výměně
#lemma[
  Nechť $V$ je v.p. nad $F$, $G$ jeho $g$-prvková množina generátorů($span(G) = V$)

  a $N = {n_1, ..., n_n}$ je lineárně nezávislá množina prvků $n V$.

  pak:
  + $n <= g$
  + množinu $G$ lze *vhodně "přeuspořádat"* na $G' = (u_1, u_2, ..., u_g)$ tak, že $(v_1, v_2, ..., v_n, u_(n+1), ..., u_g)$ generuje $V$
]

== Věta - o počtu prvků báze
#theorem[
  Všechny báze v.p. $V$ konečné dimenze mají stejný počet prvků.
]

#proof(title: [pomocí Steinitze])[
  Nechť $B, C$ jsou dvě báze v.p. $V$ konečné dimenze

  $abs(B), abs(C)$ jsou počty prvků množin $B, C$.

  + $B$ LN, $C$ generuje $V$ $=>^"Steinitz" abs(B) <= abs(C)$
  + $C$ LN, $B$ generuje $V$ $=>^"Steinitz" abs(C) <= abs(B)$
  + $=> abs(B) = abs(C)$
]

#corollary[
  Nechť $V$ je v.p. konečné dimenze nad $FF$ a $M <= V$

  + je-li $M$ LN, pak $abs(M) <= dim V$
  + je-li $M$ množinou generátorů $V$, pak $abs(M) >= dim V$

  Navíc, jestli platí $abs(M) = dim V$ pak $M$ je bází $V$
]

== Definice - dimenze
#definition[
  Dimenze v.p. $V$ je buďto počet prvků jeho libovolné báze $B$ nebo $infinity$
]


#pb()
= Důkaz: Steinitzovo lemma
#proof[
  Indukcí:

  + $n = 1$
    - kdyby $g = 0 => G = emptyset -> span(G) = {ar(0)} != V => v_1 != ar(0)$
    - $N = {v_1} => v_1 = sum_(i=1)^g r_i v_i$ kde $G = (v_1, ... v_g)$ aby $r_1 != 0$
      - tedy $u_1 = 1/r_1 (v_1 - sum_(i=2)^g r_i u_i) => span(u_1, ..., u_g) = span(v_1, u_2, ..., u_g)$ - základní krok
    - indukční krok analogicky... - ve skriptech
]

= Důsledek Steinitzova lemmatu
#corollary[
  - $dim V = n, M subset.eq V$, pak
  + $M$ lineárně nezávislá => $abs(M) <= n$
  + $span(M) = V$ => $abs(M) >= n$
  + $abs(M) = n$ => $M$ je báze $V$
]

#proof(title: [*1.*])[
  + $M$ lineárně nezávislá; $N$ báze $V$; $abs(N) = n$
    - Steinitz -> $M$ LN, $N$ množina generátorů
      - $abs(M) <= abs(N) = n$, pokud navíc $abs(M) = n$ podle 2. bodu SL je to báze
]
#proof(title: [*2.*])[
  analogicky
]

#pb()
= Další důsledek SL
#corollary[
  $V$ nad $FF$, $dim V = n$; $W <= V$ , $N$ je báze $W$
  - pak $exists M subset.eq V$; $M >= N$ taková, že $M$ je báze $V$
]

#proof[
  $N = {v_1, ..., v_n}$  je maximální LN podmnožina(přidám libovolný vektor a není LN) $W$(lemma)

  zvolme $M' = {u_1, ..., u_k}$ báze $V$, aplikujme SL => po vhodném uspořádání $(v_1, ..., v_k, u_(k+1) ', ..., u_n ')$ generuje $V$ => $M$ je báze
]

Tedy můžeme doplnit libovolnou nemaximálně lineárně nezávislou

($M$ je LN a $abs(M) < dim V$) podmnožinu na bázi daného vektorového prostoru

#pb()
= Tvrzení 20 idk
#claim[
  $C = (v_1, ..., v_k)$ je posloupnost vektorů ve $V$

  $D$ je posloupnost která vznikne z $C$ elementární(v tomto případě sloupcovou) úpravou

  Pak
  + $span(C) = span(D)$
  + $C$ LN <=> $D$ LN
  + $C$ je báze $V$ <=> $D$ je báze $V$
]

#proof(title: [*1.*])[
  $
    C & = (v_1, ..., v_k) \
    D & = (v_1 + s v_2, v_2, ..., v_k) \
    v & = r_1 v_1 + r_2 v_2 + ... + r_k v_k = r_1(v_1 + s v_2) + (r_2 - r_1 s) v_2 + ... + r_k v_k \
      & => span(C) <= span(D) \
  $
  - úpravy jsou vratné $=> span(C) >= span(D) => span(C) = span(D)$
]


#proof(title: [*2.*])[
  $
        C & = (v_1, ..., v_k) \
        D & = (v_1 + s v_2, v_2, ..., v_k) \
    ar(0) & = sum_(i=1)^k r_i v_i = r_1 (v_1 + s v_2) + (r_2 - r_1 s) v_2 + sum_(i=3)^k r_i v_i \
          & => r_3 = ... = r_k = 0; r_1 = 0; r_2 = 0 => C "LN"
  $
  - úpravy jsou vratné => $C$ LN => $D$ LN
]

#proof(title: [*3*])[
  kombinace 1. a 2.
]

#pb()
= Hodnost matice
- $ker A = {ar(x) | A ar(x) = ar(0)} <= FF^n; A in FF^(m times n)$ *jádro*
- $"Im" A = span(ar(a_1), ..., ar(a_n)) <= FF^m$ *sloupcový prostor*
- $"Im" A^T$ *řádkový prostor*
- $ker A^T$ *jádro transponované matice*

#claim[
  $R in F^(m times m)$ je regulární, pak
  + $ker (R A)$ = $ker A$
  + $"Im" (R A)^t$ = $"Im" A^T$
]

#proof[
  + První část
    + $A ar(x) = ar(0) => R A ar(x) = ar(0)$
      - -> $ker A <= ker R A$
    + $R A ar(x) = ar(0) => inv(R) R A ar(x) = ar(0)$
      - -> $ker R A <= ker A$
    + => $ker A = ker R A$
  + Druhá část
    + řádky matice $R A$ jsou LK řádků matice $A$(z definice maticového násobení?)
    + $"Im" (R A)^T <= "Im" A^T$ (druhá inkluze jako v 1.)
]

#claim[
  $Q in FF^(n times n)$ regulární, pak

  + $ker (A Q)^T = ker A^T$
  + $"Im" A Q = "Im" A$
]

#proof[
  asi zase zřejmé z definice maticového násobení...
]

#pb()
== Poznámka
$R$ regulární

$sum_(i=1)^n s_i ar(a_i) = ar(0) => sum_(i=1)^n s_i R ar(a_i) = ar(0)$

$A' = matcol(ar(a_1)', ... ar(a_n)') = R A$

=> *EŘÚ zachovávají LN sloupců(dimenzi sloupcového prostoru a indexy LN sloupců) a řádkový prostor*

=> *ESÚ zachovávají LN řádků(dimenzi řádkového prostoru a indexy LN řádků) a sloupcový prostor*

=> maximální LN podmonžina sloupců $A$ odpovídá(<=>) maximální nezávislé podmnožině sloupců $A'$ (stejné indexy)
- speciálně platí pro $A$ matici a $A'$ její *RREF*

=> tedy $dim "Im" A = dim "Im" A'$

#pb()
== Věta - Hodnost matice
#theorem[
  Nechť $A in FF^(m times n)$, pak $dim "Im" A = dim "Im" A^T$
]

#proof[
  $A ~ A'$, $A'$ je v *RREF*

  úpravy zachovávají řádkový prostor, zachovávají dimenzi sloupcového prostoru

  $
    A' = mat(
      1, ..., ..., ...;
      0, 1, ..., ...;
      0, 0, 1, ...;
      0, 0, 0, 0;
    )
  $

  => pivotní sloupce jsou LN, pivotní sloupce generují sloupcový prostor => pivotní sloupce tvoří bázi sloupcového prostoru

  => nenulové řádky tvoří bázi řádkového prostoru

  => počet nenulových řádků je stejný jako počet pivotních sloupců => stejná dimenze prostorů $dim "Im" A' = dim "Im" A'^T and dim "Im" A = dim "Im" A^T$
]

#definition[
  Definuji hodnost jako

  $
    rank A & = dim "Im" A = dim "Im" A^T \
  $
]

#claim[
  Nechť $A in FF^(m times n)$

  + $rank A = rank A^T$
  + $rank (R A) <= rank A$ a pokud $R$ je regulární, pak $rank (R A) = rank(A)$
  + $rank (A Q) <= rank A$ a pokud $Q$ je regulární, pak $rank (A Q) = rank(A)$
]

=> násobením matic se hodnost nezvyšuje

a tedy i $rank (A B) <= min(rank A, rank B)$

#pb()
#theorem[
  Nechť $A in FF^(n times n)$, pak jsou následující podmínky ekvivalentní
  + $A$ je regulární
  + $rank A = n$
  + Množina všech řádků $A$ je LN
  + Množina všech řádků $A$ generuje $FF^n$
  + Posloupnost všech řádků $A$ je bází $FF^n$
  + Množina všech sloupců $A$ je LN
  + Množina všech sloupců $A$ generuje $FF^n$
  + Posloupnost všech sloupců $A$ je bází $FF^n$
  + $"Im" A = FF^n$
  + $ker A = 0$
  + Zobrazení $F_A$ je prosté
  + Zobrazení $F_A$ je na
  + Zobrazení $F_A$ je bijekce
  + $exists X in FF^(n times n): A X = E$
  + $exists X in FF^(n times n): X A = E$
]

#theorem(title: "Věta o dimenzích jádra a obrazu")[
  Nechť $A in FF^(n times n)$, pak $dim ker A + dim "Im" A = n$ tedy $nul A + rank A = n$
]

#proof[
  $A ~ A'$, pak

  + $rank A$ je počet pivotních sloupců
  + $nul A$(*nulita*, starší název defekt) je počet nepivotních sloupců

  tedy součet je počet sloupců...
]

#pb()
== Věta - Frobeniova
#theorem(title: "Frobeniova věta")[
  Nechť $A in FF^(m times n)$ a $ar(b) in FF^m$

  Pak SLR má $A ar(x) = ar(b)$, právě tehdy když $rank(A) = rank(matcol(A, ar(b)))$
]

#proof()[
  $"Im" A <= "Im" matcol(A, ar(b))$
  + $rank(A) = rank(matcol(A, ar(b))) => dim "Im" A = dim "Im" matcol(A, ar(b))$
  + $rank(A) =$
  tbd...
]


#pb()
= Reprezentace vektoru a lineárního zobrazení
$v in V$, $B$ báze V

$
    [v]^B & = vec(r_1, r_2, dots.v, r_n) "reprezentace vzhledem k" FF^n \
        v & = sum_(i=1)^n r_i v_i \
  "kde" B & = (v_1, dots, v_n)
$

máme tedy bijekci

$
  [space]^B dot.op V -> FF^n "je bijektiviní zobrazení"
$

== Definice lineárního zobrazení
#definition(title: "Lineární zobrazení")[
  Nechť $V,W$ jsou v.p. nad $FF$ a $f: V -> W$ jae zobrazení takové, že

  $forall v,u in V$ a $forall r,s in FF$ platí $f(r v + s u) = r f(v) + s f(u)$
]

== Tvrzení
#claim(title: "")[
  Máme $V$ v.p. konečné dimenze nad $FF$, $B$ báze $V$, $u,v in V$, $r,s in FF$, pak

  $[r u + s v]^B = r[u]^B + s[v]^B$
]

#proof()[
  $
    ar(u) & = sum_(i=1)^n r_i ar(v)_i \
    ar(v) & = sum_(i=1)^n s_i ar(v)_i \
  $
  reprezentace vůči bázi je tedy
  $
    [r u + s v]^B & = [r sum_(i=1)^n r_i ar(v_i) + s sum_(i=1)^n s_i ar(v_i)]^B = [sum_(i=1)^n (r r_i + s s_i)ar(v)_i]^B \
    & = vec(r r_1 + s s_1, r r_2 + s s_2, dots.v, r r_n + s s_n) = r vec(r_1, r_2, dots.v, r_n) + s vec(s_1, s_2, dots.v, s_n) = r [u]^B + s [v]^B
  $
]

#pb()
== Izomorfismus vektorového prostoru
$[space]^B dot.op V -> FF^n$ je bijektivní zobrazení - izomorfismus

=== Příklady
==== Příklad 1.
$
  F_A: FF^n -> FF^m; sq ar(x) |-> A ar(x)\
$

==== Příklad 2.
$
  [space]^B
$
==== Příklad 3.
$
                    & A in FF^(m times n); sq X in FF^(n times p); A X in FF^(m times p) \
  f: FF^(m times n) & -> FF^(n times p) \
                  X & |-> A X \
$

==== Příklad 4.
Prostor $P_k (x, RR)$
$
  g: P_k (x, RR) & -> P_k (x, RR) \
               p & |-> dif/(dif x) p \
$

přiřadí 1. derivaci

#pb()
== Reprezentace lineárního zobrazení
#definition(title: "Reprezentace lineárního zobrazení")[
  Nechť $V,W$ jsou v.p. nad $FF$, $f: V->W$ je lineární zobrazení, $B = (v_1, v_2, dots, v_n)$ je báze $V$ a $C = (w_1, w_2, dots, w_m)$ je báze $W$, pak

  #important[$
    [f]_B^C = matcol([f(v_1)]^C, [f(v_2)]^C, dots, [f(v_n)]^C) in FF^(m times n)
  $]

  nazveme *maticí přechodu* $f$ vůči bázím $B$ a $C$
]

=== Příklady
==== Příklad 1.
Pokud $f: FF^n -> FF^m$

$K_n = (ar(e_1), ar(e_2), dots, ar(e_n))$ kanonická báze ve $FF^n$
$K_m = (ar(e_1), ar(e_2), dots, ar(e_m))$ kanonická báze ve $FF^m$

$
  [f]_(K_n)^(K_m) \
                  & = matcol([f(ar(e)_1)]^(K_m), [f(ar(e)_2)]^(K_m), dots, [f(ar(e)_n)]^(K_m)) \
                  & = matcol([ar(a)_1]^(K_m), [ar(a)_2]^(K_m), dots, [ar(a)_n]^(K_m)) \
  [ar(a)_i]^(K_m) & = ar(a)_i \
$

===== Příklad 2.

$
  g: P_2 (x, RR) & -> P_2 (x, RR) \
               p & |-> (dif p)/(dif x) \
$

$
  B & = (1, x, x^2) "báze" P_2 (x, RR) \
  C & = (1, x) "báze" P_1 (x, RR) \
$

$
  [g]_B^C & = matcol([g(1)]^C, [g(x)]^C, [g(x^2)]^C^2) \
          & = matcol([0]^C, [1]^C, [2x]^C) \
          & = mat(
              0, 1, 0;
              0, 0, 2
            )
$

#pb()
== Tvrzení
#claim(title: "")[
  Nechť $V,W$ jsou v.p. nad $FF$, $f: V->W$ je lineární zobrazení, $B = (v_1, v_2, dots, v_n)$ je báze $V$ a $C = (w_1, w_2, dots, w_m)$ je báze $W$, pak


  $
    [f(v)]^C & = [f]_B^C [v]^B \
  $
]

#proof()[
  $
           v & = sum_(i=1)^n r_i v_i \
    [f(v)]^C & = [sum_(i=1)^n r_i f(v_i)]^C \
             & = sum_(i=1)^n r_i [f(v_i)]^C \
             & = [f]_B^C vec(r_1, r_2, dots.v, r_n) = [f]_B^C [v]^B \
  $
]

=== Příklady
==== Příklad 1.
$
   g(x^2 + 2x + 3) & = 2x + 2 \
  [x^2 + 2x + 3]^B & = vec(3, 2, 1) \
        [2x + 2]^C & = vec(2, 2)
$

zkusíme vynásobit matici

$
       [g]_B^C sq [v]^B & = [g(v)]^C \
  mat(
    0, 1, 0;
    0, 0, 2
  ) dot.op vec(3, 2, 1) & = vec(2, 2) space checkmark
$

#pb()
== Tvrzení
#claim()[
  $f: V -> W$ je izomorfismus, $(v_1, v_2, dots, v_n)$ je posloupnoust prvků $V$.

  Pak:
  + $(v_1, v_2, dots, v_n)$ LN <=> $(f(v_1), f(v_2), dots, f(v_n))$ LN
  + $(v_1, v_2, dots, v_n)$ generuje $V$ <=> $(f(v_1), f(v_2), dots, f(v_n))$ generuje $W$
  + $(v_1, v_2, dots, v_n)$ báze $V$ <=> $(f(v_1), f(v_2), dots, f(v_n))$ báze $W$
]

#proof(title: "jenom nástin")[
  $
    f(sum_(i=1)^n r_i v_i) & = sum_(i=1)^n r_i f(v_i) \
  $

  pak vycházíme z vlastností lineární nezávislosti a bijekce
]

#corollary()[
  $f: V->W$ izomorfismus => $dim V = dim W$
]


#definition()[
  $V,W$, v.p. nad $FF$, $f: V->W$ lineární zobrazení

  $
    & ker f: {v in V | f(v) = ar(0)_w} <= V \
    & "Im" f: {w in W| exists v in V: f(v) = w} <= W \
  $
]

#claim()[
  Lineární zobrazení $f:V -> W$ je izomorfismus(bijektivní a zároveň lineární) právě tehdy když

  $
    ker f = 0 "a" "Im" f = W
  $
]

#proof()[
  Izomorfismus $equiv$ *prosté* a *na*

  + stačí tohle...
    $
      "Im" f = W & => f "je na" \
       ker f = 0 & => f "je prosté" \
    $
  +
    $
      f(v_1) = f(v_2) & => f(v_1 - v_2) = 0 \
            v_1 - v_2 & = 0 "f je prosté" \
    $
]

#pb()
== Tvrzení
#claim()[
  $V,W$ jsou v.p. konečné dimenze, $f: V->W$ je lineární zobrazení, $B$ báze $V$, $C$ báze $W$.

  Pak jsou následující výroky ekvivalentní:
  + $f$ je izomorfismus
  + $[f]_B^C$ je regulární pro *všechny* dvojice bází
  + $[f]_B^C$ je regulární pro *nějakou* dvojici bází
]

#claim()[
  $f: V->W$ je lineární zobrazení, $B = (v_1, dots, v_n)$ báze $V$, $C = (w_1, dots, w_n)$ báze W

  Pak:
  $
     [ker f]^B & = ker [f]_C^B \
    ["Im" f]^C & = "Im" [f]_B^C \
  $
]

#definition(title: "Matice přechodu")[
  $
    & "Id": V->V, V "konečné dimenze", B,C "dvě báze" V \
    & ["Id"]_B^C \
    & = matcol(["Id" v_1]^C, ["Id" v_2]^C, dots, ["Id" v_n]^C) \
    & = matcol([v_1]^C, [v_2]^C, dots, [v_n]^C) \
  $

  kde $["Id"]_B^C$ je matice přechodu od báze $C$ k bázi $B$

  ty indexy jsou přehozený 😠
]

#corollary()[
  $
    [v]^C & = ["Id"]_B^C [v]^B \
  $
]

#pb()
#claim(title: "Reprezentace matice složeného zobrazení")[
  Máme 3 VP konečné dimenze $U ->^h V ->^f W$ a 2 zobrazení,\ $D$ báze $U$, $B$ báze $V$ a $C$ báze $W$.

  Pak platí:

  $
    [f compose h]_D^C = [f]_B^C [g]_D^B
  $
]

#proof()[
  nechť $u in U$

  $
        [(f compose h)(u)]^C & = [f(h(u))]^C = [f]_B^C [h(u)]^B = [f]_B^C [h]_D^B [u]^D \
    => [f]_B^C [h]_D^B [u]^D & = [f compose h]^C_D [u]^D \
          => [f]_B^C [h]_D^B & = [f compose h]^C_D \
  $

  mohu postupně za $u$ dosazovat prvky báze $D$, zjistím že se sloupce matic rovnají...
]

#claim(title: "Transformační formule pro lineární zobrazení")[
  Nechť $f: V -> W$ a $B,B'$ jsou dvě báze ve $V$ a $C,C'$ jsou dvě báze ve $W$.

  Potom:

  $
    [f]_B'^C' = ["Id"]_C^C' [f]_B^C ["Id"]_B'^B
  $

  (prostě to obalím z obou stran věcí co mi přechroustá data z jednoho formátu do druhýho)
]

#proof()[
  $
           f & = "Id"_W compose f compose "Id"_V \
    [f]_B'C' & = ["Id"_W]^C'_C [f]^C_B ["Id"_V]_B'^B \
  $
]

#pb()
= Lineární zobrazení $equiv$ Homomorfismus (v.p.)
- $hom(V, W)$ je množina všech *homomorfismů* z $V$ do $W$
- $V = W$, lineární zobrazení $f: V -> V$ je *endomorfismus*
  - používáme značení $end(V) := hom(V, V)$

- máme li endomorfismus $f: V->V$, $B,B'$ báze $V$, pak
$
  [f]_B'^B & = [id]^B'_B [f]_B^B [id]^B_B' \
        A' & = [id]^B'_B [f]_B^B [id]^B_B' = inv(R) A R \
$

- $A'$ a $A$ nazýváme *podobné* - reprezentují stejné lineární zobrazení v různých bázích

#definition(title: "Šmí")[
  Operátor *šmí* definujeme jako *abstraktní nesmysl*.

  $
    smi ar(x) = a.n.
  $
]

$hom(V, W)$ je *vektorový prostor*
- s operacemi
  - sčítání zobrazení
    - $f,g in hom(V, W) => f + g in hom(V, W)$
    - $(f+g)(x) = f(x) + g(x)$
  - násobení zobrazení skalárem
    - $f in hom(V, W) => r f in hom(V, W)$
    - $(r f)(x) = r f(x)$

- minule - $V$ nad $FF$, $B$ báze $V$
  - $[space]^B: -> V -> FF^n$ je *izomorfismus*(bijektivní homomorfismus)

#pb()
#theorem()[
  Pokud $dim V = n$ a $dim W = m$, pak $dim hom(V, W) = n m$
]

#proof()[
  $B$ je báze $V$, $C$ je báze $W$

  Ukážeme, že $[space]^C_B: hom(V, W) -> FF^(m times n)$ je izomorfismus

  z definice:
  + $[space]_B^C$ je lineární
  + $[space]_B^C$ je bijektivní $[f]^C_B = matcol([f(v_1)]^C, dots)$

  tedy
  $
    matcol([f(r f + s g)]^C, dots) & = matcol([r f(b_1) + s g(b_1)]^C, dots) \
                                   & = matcol(r[f(b_1)]^C + s[g(b_1)]^C, dots) \
                                   & = r matcol([f(b_1)]^C, dots) + s matcol([g(b_1)]^C, dots) \
                                   & = r[f]_B^C + s [g]_B^C \
  $
]

#corollary()[
  $
    dim end(V) = n^2
  $
]

#pb()
#theorem()[
  Dva VP $V,W$ konečné dimenze jsou *izomorfní*\ (existuje mezi nimi izomorfismus $f:V->W$), *právě když* $dim V = dim W$
]

#proof(title: [$=>$])[
  dokázáno minule
]

#proof(title: [$arrow.double.l$])[
  $B$ je báze $V$, $C$ je báze $W$, $abs(B) = abs(C) = n$

  tedy
  $
    g := [space]^B: V->FF^n\
    h := [space]^C: W->FF^n\
  $

  $g,h$ jsou izomorfismy, $inv(g), inv(h)$ jsou také izomorfismy

  $
    inv(g) : FF^n -> V\
    inv(h) : FF^n -> W\
  $

  tedy

  $
    inv(h) compose g : V->W "je také izomorfismus"
  $
]

např.

$
                                   V & = RR^(2 times 2) \
                                   W & = P_3(x,RR) \
                                   B & = (mat(
                                           1, 0;
                                           0, 0
                                         ), mat(
                                           0, 1;
                                           0, 0
                                         ),mat(
                                           0, 0;
                                           1, 0
                                         ),mat(
                                           0, 0;
                                           0, 1
                                         )) \
                                   C & = (1, x, x^2, x^3) \
  (inv(h) compose g) mat(a, b; c, d) & = a + b x + c x^2 + d x^3 \
$

jsou izomorfní

#pb()
#theorem(title: "Zadání homomorfismu hodnotami na bázi")[
  Nechť $V,W$ VP nad $F$, $B = (v_1,dots, v_n)$ báze $V$,
  $(w_1, dots, w_n)$ posloupnost vektorů $W$.

  Pak existuje právě jeden $f in hom(V, W)$, pro který

  $
    f(v_1) = w_1, f(v_2) = w_2 sq dots sq f(v_n) = w_n
  $


]

#proof(title: "Nástin")[
  $
    v in V & => exists! vec(r_1, r_2, dots.v, r_n) in FF^n; sq v = sum_(i=1)^n r_i v_i \
      f(v) & = f(sum_(i=1)^n r_i v_i) := sum_(i=1)^n r_i w_i = sum_(i=1)^n r_i f(v_i)
  $

  ...
]

#theorem(title: "O dimenzi jádra a obrazu homomorfismu")[
  Nechť $V,W$ VP nad $FF$, $dim V = n$, $f in hom(V, W)$

  pak $dim ker f + dim im f = n$
]

#proof(title: [pro $dim W = m$])[
  $B$ báze $V$, $C$ báze $W$, $abs(B) = n; sq abs(C) = m$

  věta o hodnosti a nulitě $dim ker[f]_B^C + dim im[f]_B^C =$ počet sloupců $[f]_B^C = abs(B) = n$

  - $[ker f]^B = ker[f]_B^C$
  - $[im f]^C = im[f]_C^B$

  - $[space]^B: V -> FF^n$ izomorfismus => zachovává dimenzi => $dim[ker f]^B = dim ker f$
  - $[space]^C: W -> FF^m$ izomorfismus => zachovává dimenzi => $dim[im f]^B = dim im f$

  tedy

  $
    dim ker f + dim im f = n
  $
]
#pb()
#claim()[
  $f in end(V)$, pak
  + $f$ je *monomorfismus*(prosté LZ) => $f$ je *epimorfismus*(surjektivní LZ)
  + $f$ je *epimorfismus* => $f$ je *monomorfismus*
  + $f$ je *epimorfismus* nebo *monoformismus* => $f$ je *izomorfmismus*
]

#proof(title: "1.")[
  $f$ mono <=> $ker f = 0$ <=> $dim ker f = 0$

  => $dim im f = n = dim V => im f = V$ => $f$ je epi
]

#pb()
= Determinant $equiv$ _orientovaný_ objem
Chceme multilinearitu, totální antisymetrii

#definition(title: "Determinant")[
  $A in FF^(n times n)$

  $
    det A & = sum_(pi in S_n) sgn(pi) a_(1 pi(1)) a_(2 pi(2)) dots a_(n pi(n))
  $

  kde $S_n$ je množina všech permutací(bijektivních zobrazení) na množině ${1 dots n}$
]

#definition(title: "Permutace")[
  Permutace je bijektivní zobrazení, dají se skládat

  Jeden způsob zápisu je tzv. *dvouřádkový*

  $
    pi equiv mat(
      1, 2, dots, n;
      pi(1), pi(2), dots, pi(n)
    )
  $

  např.:

  $
    pi = mat(
      1, 2, 3;
      2, 1, 3
    ) sq rho = mat(
      1, 2, 3;
      1, 3, 2
    )
  $

  $
    pi compose rho = mat(
      1, 2, 3;
      pi(rho(1)), pi(rho(2)), pi(rho(3))
    ) = mat(
      1, 2, 3;
      2, 3, 1
    )
  $

  skládání *není komutativní* operace:

  $
    rho compose pi = mat(
      1, 2, 3;
      rho(pi(1)), rho(pi(2)), rho(pi(3))
    ) = mat(
      1, 2, 3;
      3, 1, 2
    )
  $

  další způsob zápisu je tzv. *cyklový zápis*(nebo *redukovaný cyklový zápis*), kdy permutaci rozložíme na *nezávislé cykly*

  $
    mat(
      1, 2, 3, 4;
      2, 3, 1, 4
    ) = (1,2,3) (4) in S_4
  $

  $
    mat(
      1, 2, 3, 4, 5, 6, 7, 8;
      8, 3, 5, 6, 2, 4, 7, 1
    ) = (1,8) (2,3,5) (4,6) (7) = (1,8) (2,3,5) (4,6) in S_8
  $

  kde cykly délky 2 nazýváme *transpozice* a cykly délky 1 nazýváme *identita*

  a množina $S_n$ s operací skládání $compose$ tvoří *asociativní grupu*

  kde inverzní permutace je inverzní zobrazení

  např.
  $
    pi = mat(
      1, 2, 3;
      2, 3, 1
    ) sq inv(pi) = mat(
      1, 2, 4;
      3, 1, 2
    )
  $
]

#pb()
#theorem(title: "Rozložení cyklu na transpozice")[
  Každý cyklus lze rozložit na transpozice

  $
    (1,3,7,4) = (1,4) compose (1,7) compose (1,3) = (1,3) compose (3,7) compose (7,4)
  $

  tedy

  $
    (i_1, i_2, dots, i_k) & = (i_1, i_k) compose (i_1, i_(k-1)) compose dots compose (i_1, i_2) \
                          & = (i_1, i_2) compose (i_2, i_3) compose dots compose (i_(k-1), i_k)
  $
]

#definition(title: "Znaménko permutace")[
  Nechť $pi in S_n, pi = pi_1 compose dots compose pi_k$ kde $pi_1, dots, pi_k$ jsou transpozice,

  pak definujeme $sgn(pi) = (-1)^k$
  - kde $sgn(pi) = 1 equiv$ permutace je *sudá*
  - kde $sgn(pi) = -1 equiv$ permutace je *lichá*

  potřebujeme ale dobře definovat $k$
]

#lemma(title: "Korektnost znaménka permutace")[
  $pi in S_n$

  - $pi compose (i,j)$ má $q$ cyklů sudé délky v rozkladu na nezávislé cykly
  - $pi$ má $p$ cyklů sudé délky v rozkladu na nezávislé cykly

  pak $abs(p-q) = 1$
]

#proof[
  $
    pi & = pi_1 compose dots compose pi_k \
    pi & = pi_1 ' compose dots compose pi_l ' \
  $

  kde $pi_1, dots, pi_k, pi_1 ', dots, pi_l '$ jsou transpozice

  parita $pi$ je dána z rozkladu na nezávislé cykly, tedy jsou dány parity $k$ i $l$

  při složení s transpozicí buď přidám jeden nezávislý cyklus sudé délky, nebo spojím/rozdělím existující cyklus, tedy počet cyklů sudé délky se změní vždy o $plus.minus 1$
]

#corollary[
  $sgn(pi) = (-1)^p$ kde $p$ je počet cyklů sudé délky v rozkladu $pi$ na nezávislé cykly
]

#pb()
#claim[
  + $sgn (pi compose rho) = sgn(pi) dp sgn(rho)$
  + $sgn (pi) = sgn(inv(pi))$
]

#proof(title: "1.")[
  $
    pi = pi_1 compose dots compose pi_k; sq rho = rho_1 compose dots compose rho_l\
  $

  $
    pi compose rho = pi_1 compose dots compose pi_k compose rho_1 compose dots compose rho_l => sgn(pi compose rho) = (-1)^(k+l) = (-1)^k (-1)^l = sgn(pi) sgn(rho)
  $
]

#proof(title: "2.")[
  $
    inv(pi) = pi_k compose dots compose pi_1 => sgn(inv(pi)) = (-1)^k = sgn(pi)\
  $
]

#corollary[
  $sgn: S_n -> ZZ_2 = {-1,1}$ je *grupový homomorfismus*
]

== Příklad - výpočet determinantu matice $2 times 2$

$
  det(
    a_11, a_12;
    a_21, a_22
  ) = sgn(id) a_11 a_22 + sgn
  mat(
    1, 2;
    2, 1
  )
  a_12 a_21 = a_11 a_22 - a_12 a_21
$

== Příklad - výpočet determinantu matice $3 times 3$

$
  & det(
      a_11, a_12, a_13;
      a_21, a_22, a_23;
      a_31, a_32, a_33
    ) \
  & = sgn(id)
    a_11 a_22 a_33
    + sgn mat(
      1, 2, 3;
      2, 1, 3
    )
    a_12 a_21 a_33 + sgn mat(
      1, 2, 3;
      1, 3, 2
    ) \
  & a_11 a_23, a_32 + sgn mat(
      1, 2, 3;
      3, 2, 1
    ) a_13 a_22 a_31 + sgn mat(
      1, 2, 3;
      2, 3, 1
    ) a_12 a_23 a_31 + sgn mat(
      1, 2, 3;
      3, 1, 2
    ) a_13 a_21 a_32 \
  & = 1 a_11 a_22 a_33 - 1 a_12 a_21 a_33 - 1 a_11 a_23, a_32 - 1 a_13 a_22 a_31 + 1 a_12 a_23 a_31 + 1 a_13 a_21 a_32 \
$

== Sarrusovo pravidlo

#diagram(
  spacing: (2.2em, 1.8em),
  node-inset: 2pt,

  // Matrix elements a_(i,j) + 2 repeated columns
  ..for r in range(3) {
    for c in range(5) {
      let col = calc.rem(c, 3) + 1
      let style = if c >= 3 { gray } else { black }
      (node((c, r), text(fill: style, $a_(#(r + 1), #col)$), fill: white),)
    }
  },

  // Determinant bars around the first 3 columns
  edge((-0.55, -0.4), (-0.55, 2.4), stroke: 0.7pt),
  edge((2.55, -0.4), (2.55, 2.4), stroke: 0.7pt),

  // Positive diagonals (down-right)
  ..for k in range(3) {
    (
      edge((k - 0.3, -0.3), (k + 2.35, 2.35), "->", stroke: blue + 0.8pt, layer: -1),
      node((k + 2.5, 2.5), text(fill: blue, $+$)),
    )
  },

  // Negative diagonals (up-right)
  ..for k in range(3) {
    (
      edge((k - 0.3, 2.3), (k + 2.35, -0.35), "->", stroke: (paint: red, thickness: 0.8pt, dash: "dashed"), layer: -1),
      node((k + 2.5, -0.5), text(fill: red, $-$)),
    )
  },
)

nepraktické pro velké matice

#pb()

== Vlastnosti determinantu
#theorem[
  Nechť $A in FF^(n times n)$, pak $det A = det A^T$
]

#proof[
  $
      det A & = sum_(pi in S_n) sgn(pi) a_(1, pi(1)) dots a_(n, pi(n)) \
    det A^T & = sum_(rho in S_n) sgn(rho) a_(rho(1), 1) dots a_(rho(n), n) \
  $
  nechť $pi = inv(rho)$, pak

  $
    a_(1, inv(rho)(1)) dots a_(n, inv(rho)(n)) = a_(rho(1), 1) dots a_(rho(n), n)\
  $

  a $sgn(rho) = sgn(pi) = sgn(inv(rho))$

  máme tedy jen jiné pořadí stejných sčítanců
]

#corollary[
  Každé tvrzení o řádcích a determinantu platí i pro sloupce a determinant
]

#claim(title: "Multilinearita")[
  Nechť $ar(a)_1 dots ar(a)_n$ a $ar(a)_i ' in FF^n sq; i in {1, dots, n}$

  *1.*
  $
    det matcol(ar(a)_1, dots, r ar(a)_i + r' ar(a)_i ', dots, ar(a)_n) = r det matcol(ar(a)_1, dots, ar(a)_i, dots, ar(a)_n) + r' det matcol(ar(a)_1, dots, ar(a)_i ', dots, ar(a)_n)
  $

  *2.*
  $
    det matcol(ar(a)_rho(1), dots, ar(a)_rho(n)) = sgn(rho) det matcol(ar(a)_1, dots, ar(a)_n)
  $
]

#proof[
  $
    det matcol(ar(a)_1, dots, r ar(a)_i + r' ar(a)_i ', dots, ar(a)_n) &= sum_(pi in S_n) sgn(pi) a_(pi(1),1) a_(pi(2),2) dots (r a_(pi(i), i) + r' a_(pi(i), i) ') dots a_(pi(n),n)\
    & r sum_(pi in S_n) sgn(pi) a_(pi(1),1) a_(pi(2),2) dots a_(pi(i), i) dots a_(pi(n),n)\
    + &r' sum_(pi in S_n) sgn(pi) a_(pi(1),1) a_(pi(2),2) dots a_(pi(i), i) ' dots a_(pi(n),n)
  $
]

#pb()
#corollary(title: "ESÚ/EŘÚ mají na determinant efekt:")[
  + Přičtení sloupce/řádku do sloupce/řádku determinant nemění
  + Prohození sloupce/řádku obrací znaménko
  + Násobení sloupce/řádku násobí determinant
]

#claim(title: "Determinant a regularita")[
  Matice je regulární právě tehdy když je determinant nenulový
]

#proof[
  Pomocí EŘÚ se dostanu do RREF, to mi determinant nemůže vynulovat. Pak je determinant součinem prvků na diagonále krát nějaká konstanta.

  Jestliže je matice regulární, jsou prvky na diagonále nenulové.
]
