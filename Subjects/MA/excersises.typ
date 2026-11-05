#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "@local/mod:0.1.0": *

#show: boilerplate

#title[Matematická analýza - cvičení - Václav Vlasák]
= Cvičení 1.
== Příklad 1.

#pb()
== Příklad 2.
$
  abs(x+1) + abs(x-1) & >= 2 \
$
nulové body
$
  x & = -1 \
  x & = 1 \
$
řeším v intervalech:
$
  (-infinity, -1)\
  chevron -1, 1 chevron.r\
  (1, +infinity)\
$
(a)
$
              x & in (-infinity, -1) \
  -x-1 + (-x+1) & >= 2 \
    -x-1 + -x+1 & >= 2 \
            -2x & >= 2 \
             -x & >= 1 \
              x & <= -1 \
              x & in (-infinity, -1) \
$

(b)
$
  x + 1 + 1 -x & >= 2 \
             2 & >= 2 \
             x & in chevron-1,1 chevron.r \
$

(c)
$
  2x & >= 2 \
   x & >= 1 \
   x & in (1, +infinity) \
$

$
  => x & in RR space checkmark \
$

dá se taky řešit trojúhelníkovou nerovností

$
  2 = |x + 1 + -x + 1|
$

== Příklad 3.
$
     ln(x^2 - 2x - 3) & >= 0 \
  => space x^2 -2x -3 & >= 1 \
           x^2 -2x -4 & >= 0 \
                    x & in (-infinity, 1-sqrt(5) chevron.r union chevron 1+sqrt(5), +infinity) space checkmark \
$

#pb()
== Komplexní čísla
=== Základní věta Algebry
#theorem[
  Každý polynom řádu $k$ má v $CC$ právě $k$ kořenů s tím že počítáme vícenásobné kořeny.
]

=== Násobení komplexních čísel
$
  (alpha + beta i)(gamma + delta i) & = alpha gamma - beta delta - i(alpha delta + beta gamma) \
  (alpha + beta i)(gamma + delta i) & = abs(a) dot.op abs(b) (cos (A a + A b) + i sin (A a + A b)) \
$

=== Komplexně sdružené číslo
$
            z & in CC \
            z & = a + b i \
  overline(z) & = a - b i \
$
=== Absolutní hodnota komplexního čísla
$
       z & in CC \
       z & = a + b i \
  abs(z) & = sqrt(a^2 + b^2) \
$
=== Argument komplexního čísla
$
                z & in CC \
                z & = a + b i \
                z & = abs(z)(cos (A z) + i sin (A z)) \
          "kde" A & in "arg" \
           arg(z) & = {...} \
                z & := abs(z) e^(i A z) \
  arg(a dot.op b) & = arg(a) + arg(b) space mod(2pi) \
$

#pb()
== Příklad 4.
Dokažte:
=== (a)
$
  overline(overline(z)) & = z \
                      z & = a + b i \
            overline(z) & = a - b i \
  overline(overline(z)) & = a + b i space checkmark \
$
=== (b)
$
            abs(z) & = abs(overline(z)) \
            abs(z) & = sqrt(a^2 + b^2) \
  abs(overline(z)) & = sqrt(a^2 + (-b)^2) \
            (-b)^2 & = b^2 \
   sqrt(a^2 + b^2) & =sqrt(a^2 + (-b)^2) space checkmark \
$
=== (c)
$
  overline(a dot.op b) & = overline(a) dot.op overline(b) \
  a dot.op b & = abs(a) dot.op abs(b) (cos (A a + A b) + i sin (A a + A b)) \
  overline(a dot.op b) & = abs(a) dot.op abs(b) (cos (A a + A b) - i sin (A a + A b)) \
  overline(a) dot.op overline(b) & = abs(overline(a)) dot.op abs(overline(b)) (cos (A overline(a) + A overline(b)) + i sin(A overline(a) + A overline(b)))\
  cos (A a + A b) - i sin (A a + A b) & = cos (A overline(a) + A overline(b)) + i sin(A overline(a) + A overline(b))\
  cos (A a + A b) & = cos (- (A a + A b)) "cos je sudá funkce"\
  - i sin (A a + A b) & = i sin(- (A a + A b)) "sin je lichá funkce"\
  space checkmark\
$
=== (d)
$
  abs(a dot.op b) & = abs(a) dot.op abs(b) \
  abs(abs(a) dot.op abs(b) (cos (A a + A b) + i sin (A a + A b))) & = abs(abs(a) (cos (A a) + i sin (A a))) dot.op abs(abs(b) dot.op abs(abs(b) (cos (A b) + i sin (A b))))\
  cos (A a + A b) + i sin (A a + A b) & = (cos (A a) + i sin (A a)) dot.op (cos (A b) + i sin (A b))\
  e^(i (A a + A b)) & = e^(i A a) dot.op e^(i A b) space checkmark\
$
=== (e)
$
                   e^(i a) dot.op e^(i b) & = e^(i (a+b)) "zde definujeme" e^(i x) = cos(x) + i sin(x) \
                   e^(i a) dot.op e^(i b) & = (cos(a) + i sin(a)) (cos(b) + i sin(b)) \
  (cos(a) + i sin(a)) (cos(b) + i sin(b)) & = cos(a) cos(b) + i cos(a) sin(b) + i sin(a) cos(b) - sin(a) sin(b) \
  (cos(a) + i sin(a)) (cos(b) + i sin(b)) & = cos(a+b) + i sin(a+b) space checkmark \
$
=== (f)
$
  arg(a dot.op b) & = arg(a) + arg(b) space mod(2pi) \
  a dot.op b & = abs(a)dot.op abs(b)(cos (A a + A b) + i sin (A a + A b)) \
  arg(abs(a)dot.op abs(b)(cos (A a + A b) + i sin (A a + A b))) &= A a + A b\
  A a + A b &= A a + A b space checkmark\
$

== Příklad 5.
nalezněte reálnou a imaginární složku:
=== (a)
$
      (1 + i sqrt(3))^3 & = ? \
   arg((1 + i sqrt(3))) & = arctan(1/sqrt(3)) \
   abs((1 + i sqrt(3))) & = sqrt(1^2 + sqrt(3)^2) = sqrt(4) = 2 \
  Re((1 + i sqrt(3))^3) & = 8 dot.op cos(3 arctan(1/sqrt(3))) \
  Im((1 + i sqrt(3))^3) & = 8 dot.op sin(3 arctan(1/sqrt(3))) \
        space checkmark \
$
=== (b)
$
  (2 + i)/(4 - 3i) & = (2 + i)/(4 - 3i) dot.op (4 + 3i)/(4 + 3i) \
                   & = ((2 + i) (4+3i))/(16 + 9) \
                   & = (8 + 6i + 4i -3)/(16 + 9) \
                   & = (5 + 10i)/(25) \
                   & = 1/5 + 2/5 i \
$

== Příklad 6.
nalezněte velikost a argument komplexních čísel
=== (a)
$
  arg(-2 - 2i) & = 5/4 pi space checkmark \
  abs(-2 - 2i) & = sqrt(8) space checkmark \
$
=== (b)
$
       1 + i^123 \
  abs(1 + i^123) & = sqrt(2) space checkmark \
  arg(1 + i^123) & = 7/4 pi space mod(2pi) space checkmark \
$

== Příklad 7.
nalezněte všechna $z in CC$ která splňují:
=== (a)
$
                z^3 + z^2 + 2z -4 & = 0 \
                              z_1 & = 1 \
  (z^3 + z^2 + 2z -4) div (z - 1) & = z^2 + 2z + 4 \
                     z^2 + 2z + 4 & = 0 \
                          z_(2,3) & = (-2 plus.minus sqrt(4 - 16))/2 \
                          z_(2,3) & = (-2 plus.minus sqrt(-12))/2 \
                                z & in {0, -1 plus.minus i sqrt(3)}
$
=== (b)
$
  z^5 - 32 & = 0 \
       z^5 & = 32 \
    abs(z) & = 2 \
  arg(z^5) & = 0 \
    arg(z) & in {2/5 pi dot.op k in ZZ space mod(2pi)} \
    arg(z) & in {0, 2/5, 4/5, 6/5, 8/5} \
$

== Příklad 8.
Dokažte:
=== (a)
$
  (A <=> B) & = (B => A) and (A => B) \
$
=== (b)
$
  not(A and B) & = not A or not B \
$
=== (c)
$
  not(A or B) & = not A and not B \
$
=== (d)
$
  not(A => B) & = A and not B \
$

důkaz podle pravdivostních tabulek

== De Morganovy zákony
$
  not(A and B) & = not A or not B \
   not(A or B) & = not A and not B \
$

== Negace výroků s kvantifikátory
$
  not(forall x: V(x)) & = exists x : not V(x) \
  not(exists x: V(x)) & = forall x : not V(x) \
$

== Příklad 9.
Napište negaci výroku:
$
  V = forall x in RR space exists y in RR space forall z in RR: x < y => x < y + z\
  not V = exists x in RR space forall y in RR space exists z in RR: x < y and x >= y + z\
$
původní výrok je pravdivý

== Příklad 10.
Dokažte že pro včechna $n in NN$ platí:
=== a
$
  1 + 2 + ... + n & = (n(n+1))/2 \
$

dokážeme pro $n = 1$

$
  1 & = (1(2))/2 space checkmark \
$

nyní indukce:
předpoklad:
$
  1 + 2 + ... + n & = (n(n+1))/2 \
$

dokazuji pro $n+1$

$
  1 + 2 + ... + n + n+1 & = ((n+1)(n+2))/2 \
          n(n+1) + 2n+2 & = (n+1)(n+2) \
         n^2 + n + 2n+2 & = n^2 + 2n + n + 2 \
                      0 & = 0 space checkmark \
$

=== b
$
  1^2 + 2^2 + 3^2 + ... + n^2 & = (n(n+1)(2n+1))/6
$

dokážu pro $n = 1$
$
  1 & = (1 dot.op 2 dot.op 3)/6 \
$

indukční předpoklad:
$
  1^2 + 2^2 + 3^2 + ... + n^2 & = (n(n+1)(2n+1))/6
$

dokazuji pro $n + 1$
$
  1^2 + 2^2 + 3^2 + ... + n^2 + (n+1)^2 & = ((n+1)(n+2)(2n+3))/6 \
             (n(n+1)(2n+1))/6 + (n+1)^2 & = ((n+1)(n+2)(2n+3))/6 \
                n(n+1)(2n+1) + 6(n+1)^2 & = (n+1)(n+2)(2n+3) \
  n(2n^2 + n + 2n +1) + 6(n^2 + 2n + 1) & = (n+1)(2n^2 + 3n + 4n + 6) \
  2n^3 + n^2 + 2n^2 +n + 6n^2 + 12n + 6 & = 2n^3 + 3n^2 + 4n^2 + 6n + 2n^2 + 3n + 4n + 6 \
                  2n^3 + 9n^2 + 13n + 6 & = 2n^3 + 9n^2 + 13n + 6 \
                                      0 & = 0 space checkmark \
$
=== c
$
  1^3 + 2^3 + 3^3 + ... + n^3 & = (1 + 2 + 3 + ... + n)^2 \
$

dokážu pro $n = 1$

$
  1 & = 1 \
$

indukční předpoklad:
$
  1^3 + 2^3 + 3^3 + ... + n^3 & = (1 + 2 + 3 + ... + n)^2 \
$

dokazuji pro $n+1$

$
  1^3 + 2^3 + 3^3 + ... + n^3 + (n+1)^3 & = (1 + 2 + 3 + ... + n + n+1)^2 \
      (1 + 2 + 3 + ... + n)^2 + (n+1)^3 & = (1 + 2 + 3 + ... + n + n+1)^2 \
               ((n(n+1))/2)^2 + (n+1)^3 & = (((n+1)(n+2))/2)^2 \
               (n^2(n+1)^2)/4 + (n+1)^3 & = ((n+1)^2(n+2)^2)/4 \
                  n^2(n+1)^2 + 4(n+1)^3 & = (n+1)^2(n+2)^2 \
                           n^2 + 4(n+1) & = (n+2)^2 \
                            n^2 + 4n +4 & = n^2 + 4n + 4 \
                                      0 & = 0 space checkmark \
$

#pb()
= Cvičení 2.
== Příklad 1.
Dokažte $forall n in NN$:
=== a.
$
  (1+x)^n & >= 1 + n x; space x >= -1 \
$

pro $n=1$

$
  1 + x >= 1 + x space checkmark\
$

nyní indukcí pro $n+1$
$
  "tbd..."
$

=== b.
$
  (a+b)^n = sum_(k=0)^n vec(n, k) a^k b^(n-k)\
$

pro $n=1$

$
  a+b = a+b space checkmark\
$

nyní indukcí pro $n+1$

$
  (a+b)^n (a+b) & = sum_(k=0)^(n+1) vec(n+1, k) a^k b^(n+1-k) \
  (a+b) sum_(k=0)^n vec(n, k) a^k b^(n-k) & = sum_(k=0)^(n+1) vec(n+1, k) a^k b^(n+1-k) \
  a sum_(k=0)^n vec(n, k) a^k b^(n-k) + b sum_(k=0)^n vec(n, k) a^k b^(n-k) & = sum_(k=0)^(n+1) vec(n+1, k) a^k b^(n+1-k) \
  sum_(k=0)^n vec(n, k) a^(k+1) b^(n-k) + sum_(k=0)^n vec(n, k) a^k b^(n+1-k) & = sum_(k=0)^(n+1) vec(n+1, k) a^k b^(n+1-k) \
  l &= k +1\
  sum_(l=1)^(n+1) vec(n, l-1) a^(l) b^(n-l+1) + sum_(l=0)^l vec(n, l) a^l b^(n+1-l) & = sum_(k=0)^(n+1) vec(n+1, k) a^k b^(n+1-k) \
  sum_(l=1)^(n+1) vec(n, l-1) a^(l) b^(n-l+1) + sum_(l=0)^n vec(n, l) a^l b^(n+1-l) & = sum_(k=0)^(n+1) vec(n+1, k) a^k b^(n+1-k) \
  vec(n, 0) b^(n+1) + sum_(l=1)^(n) (vec(n, l-1) + vec(n, l)) a^l b^(n-l+1) + vec(n, n) a^(n+1) & = sum_(k=0)^(n+1) vec(n+1, k) a^k b^(n+1-k) \
  vec(n, 0) b^(n+1) + sum_(l=1)^(n) vec(n+1, l) a^l b^(n-l+1) + vec(n, n) a^(n+1) & = sum_(k=0)^(n+1) vec(n+1, k) a^k b^(n+1-k) \
  b^(n+1) + sum_(l=1)^(n) vec(n+1, l) a^l b^(n-l+1) + a^(n+1) & = sum_(k=0)^(n+1) vec(n+1, k) a^k b^(n+1-k) \
  vec(n+1, 0) a^0 b^(n+1-0) + sum_(l=1)^(n) vec(n+1, l) a^l b^(n-l+1) + vec(n+1, n+1) a^(n+1) b^((n+1) - (n+1)) & = sum_(k=0)^(n+1) vec(n+1, k) a^k b^(n+1-k) \
  sum_(l=0)^(n+1) vec(n+1, l) a^l b^(n-l+1) & = sum_(k=0)^(n+1) vec(n+1, k) a^k b^(n+1-k) \
  sum_(k=0)^(n+1) vec(n+1, k) a^k b^(n-k+1) & = sum_(k=0)^(n+1) vec(n+1, k) a^k b^(n+1-k) space checkmark\
$

== Zobrazení množin
máme funkci/zobrazení
$
  f : X -> Y; space A subset X, B subset Y\
  f(A) = {y in Y: exists a in A: f(a) = y} = {f(a); a in A}\
$

a

$
  inv(f)(B) = {x in X; j(x) in B}
$

zobrazení množniny $X$ na $Y$ přes $f$

== Příklad 2.
=== a.
Dokažte že platí:
$
  A subset.eq inv(f)(f(A)) "  pro " f: X -> Y " a " A subset.eq X\
$

Fixuji $a in A$, chci $a in inv(j)(j(A))$

tedy $j(a) in j(A)$

=== b.
$
  f(inv(f)(B)) subset.eq B "  pro " f: X -> Y " a " B subset.eq Y\
$

#pb()
== Supremum a infimum
$
  chevron 0, 1 chevron.r "má maximum " = 1 " a minimum " = 0\
  ( 0, 1 ) "nemá maximum ani minimum"\
$

horní závorou množiny $M$ nazýváme hodnotu, pro kterou $forall m in MM: m <= z$

dolní závorou množiny $M$ nazýváme hodnotu, pro kterou $forall m in MM: m >= z$

#theorem[
  Je li $M subset RR$ množina omezená shora, je $S in RR$ $sup M = S$ - platí pro něj:

  - (1) - horní závora
  $forall x in M: x <= S$
  - (2) - minimalita
  $forall S' < S: exists x in M: x > S'$
]

#pb()
== Příklad 4.
U následujících množin nalezněte $min, max, inf, sup$(pokud existují)

=== a.
$
  M & = (0, 1 chevron.r \
$

hledám $inf M$
$
  & "odhadnu " 0, "ověřím podle definice" \
  & forall x in M: x >= 0 space checkmark " platí z definice intervalu" M = {x in RR: x > 0 and x <=1} \
  & "nyní dokazuji:" \
  & forall S' > 0: exists x in M: x < S' \
  & "zafixuji " S' > 0 \
  & "pro" S' > 1 => forall x in M: x < S' space checkmark \
  & "pro" S' in (0, 1 chevron \
  & "hledám " x in M: x < S' \
  & "definuji" x = (S')/2 => x < S' and x in M space checkmark \
$

hledám $sup M$
$
  & "odhadnu" 1, "ověřím podle definice" \
  & forall x in M: x <= 1 space checkmark " platí z definice intervalu" M = {x in RR: x>0 and x <=1} \
  & "nyní dokazuji:" \
  & forall S' < 1: exists x in M: x > S' \
  & "zafixuji " S' < 1 \
  & "pro " S' <= 0 => forall x in M: x > S' space checkmark \
  & "pro " S' in (0, 1 chevron \
  & "hledám " x in M: x > S' \
  & "definuji " x = S' + (1-S')/2 : x > S' and x in M space checkmark \
$

nebo stačí říct že zprava uzavřený interval má maximum, a to maximum je i jeho supremum z definice...

$max M = 1$ z definice intervalu

hledám $min M$

pokud má množina minimum, je toto minimum i její infimum - ověřím zda infimum leží v množině $M$

$
  inf M = 0\
  0 in.not M\
$

minimum tedy neexistuje

#pb()
=== b.
$
  M & = chevron 0, +infinity) \
$

hledám $sup M$

jakožto množina otevřená zprava $M$ nemá maximum

$sup M = +infinity$ z definice intervalu

jakožto množina omezená zleva má minimum $min M = 0$ rovno infimu $inf M = min M = 0$

#pb()
=== c.
$
  M & = {m/(m+n); m,n in NN} \
$

#pb()
=== d.
$
  M & = {n^2 - n^2; m,n in NN} \
    & min M = "neex" \
    & max M = "neex" \
    & inf M = "neex" \
    & sup M = "neex" \
$

= Cvičení 3.
- (1)
Domácí úkol:
$
  & m, n in NN_0 \
  & lim_(x->0) (root(3, 1 + m x + 2x^2) - root(3, 1 + x +x^2))/x^n \
$


- (2)
$A, B "omezené"\ A, B subset RR\ $

Dokázat:

(a)
$
  inf(-A) = - sup(A)
$

(b)
$
  sup(A + B) = sup(A) + sup(B)
$

#claim[
  - $s = sup(A) <=>$
    - $forall x in A: x < s$
    - $forall y < s space exists x in A: x > y$
]

(a)

$
        s & = sup(A) \
  x in -A & => -x in A \
$

== Důležitý Vzorec

#important[$
  a-b = (a^k - b^k)/(a^(k-1) b^0 + a^(k-2)b^1 + ... + a^0 b^(k-1))
$]
