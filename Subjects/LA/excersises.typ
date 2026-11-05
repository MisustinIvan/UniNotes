#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "@local/mod:0.1.0": *

#show: boilerplate

#title[Lineární algebra - cvičení - Dalibor Šmíd]
= Cvičení 1.
=== Násobení matic
=== a
$
  A = mat(1, 1; -1-1); space B = mat(1, 2; 0, -3)
$

=== b
$
  A B = mat(1, -1; -1, 1)
$

=== c
$
  B A = mat(-1, -1; 3, 3)
$

=== d
$
  A^2 = mat(0, 0; 0, 0)
$

=== e
$
  B^2 = mat(1, -4; 0, 9)
$

=== f
$
  B^4 = mat(1, -40; 0, 81)
$

== Transpozice
=== a
$
  B^T = mat(1, 0; 2, -3)
$
=== b
$
  A^T B^T = mat(1, 1; -1, -1) mat(1, 2; 0, -3) = (B A)^T = mat(-1, 3; -1, 3)
$

== Nečtvercové matice
=== a
$
  X = mat(3, 2, -1; 1, 1, 2)\
  Y = mat(1, 0; -1, 1; 1, -1)\
  X Y = mat(0, 3; 2, -1)\
  Y X = mat(3, 2, -1; -2, -1, 3; 2, 1, -3)\
$
=== b
$
  X ar(e_3) = vec(-1, 2)\
  ar(e_2)^T Y = mat(0, 1, 0) Y = mat(-1, 1)\
$

=== c
$
  ar(e_2)^T Y X ar(e_3) = mat(-1, 1) vec(-1, 2) = 3
$

Násobení kanonickým sloupcovým vektorem bere n-tý sloupec z matice, násobení transponovaným kanonickým vektorem bere n-tý řádek.

== 3. úkol

$
  P_(ar(u)) : RR^2 -> RR^2\
  P_(ar(u))(ar(y)) := (ar(u) ar(y))/norm(u)^2 ar(u)\
$

ověříme linearitu, zda-li $P_(ar(u))$ je lineární zobrazení

$
  P_(ar(u))(ar(x) + ar(y)) = (ar(u) (ar(x) + ar(y)))/norm(u)^2 ar(u) = (ar(u) ar(x) + ar(u) ar(y))/norm(u)^2 ar(u)\
  = P_(ar(u))(ar(x)) + P_(ar(u))(ar(y))\
$

#pb()
$P_(ar(u))$ je projekce/průmět argumentu do směru vektoru $ar(u)$

$
  ar(a) dot.op ar(b) & = norm(ar(a)) norm(ar(b)) cos alpha \
  cos alpha & = (ar(a) dot.op ar(b))/(norm(ar(a)) norm(ar(b))) \
  norm(ar(c)) & = norm(ar(a)) cos alpha\
  norm(ar(c)) & = norm(ar(a)) (ar(a) dot.op ar(b))/(norm(ar(a)) norm(ar(b))) = (ar(a) dot.op ar(b))/norm(ar(b))\
  ar(c) &= (ar(a) dot.op ar(b))/norm(ar(b)) ar(b)/norm(ar(b)) = (ar(a) dot.op ar(b))/norm(ar(b))^2 ar(b)\
$

$P_(ar(u))(ar(x)) = 0$ kde $ar(x) perp ar(u)$ je $ar(0)$ protože $ar(u) dot.op ar(x) = 0$

zkusím najít matici tohoto zobrazení - dosadím kanonické vektory

$
  "tbd..."
$

$
  1/(u_1^2 + u_2^2) mat(u_1^2, u_1 u_2; u_1 u_2, u_2^2)
$

matice ortogonální projekce

=== Odvození matice ortogonální projekce $P_arrow(u)$
Cílem je dostat vektor $ar(u)$ přeškálovaný délkou projekce projektovaného vektoru právě na vektor $ar(u)$

Víme že pro délku projekce platí:

$
  "tbd..."
$

== Další zobrazení
$
  P_(ar(u)perp)(ar(x)) := ar(x) - P_(ar(u))(ar(x))
$

projekce do roviny/přímky kolmé na $ar(u)$

$
  Z_(ar(u)perp)(ar(x)) := ar(x) - 2P_(ar(u))(ar(x))
$

osová/rovinná souměrnost
