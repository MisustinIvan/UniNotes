#import "@local/mod:0.1.0": *
#show: boilerplate

= Příklady na procvičení
==
=== Zadání
Existuje derivace $f(x) = abs(x)$ v bodě $0$?
=== Řešení
Derivace v bodě existuje jestliže je funkce v bodě spojitá a jestliže se jednostranné derivace rovnají.

$
  abs(x) = cases(
    -x sq & x < 0,
    0 sq & x = 0,
    x sq & x > 0,
  )
$

Tedy derivace zleva:

$
  lim_(x->0_-) f'(x) = lim_(x->0_-) (-x)' = lim_(x->0_-) -1 = -1
$

A derivace zprava:

$
  lim_(x->0_+) f'(x) = lim_(x->0_+) x' = lim_(x->0_+) 1 = 1
$

Derivace zleva a zprava se nerovnají, tedy derivace v bodě $0$ neexistuje.

#pb()
==
=== Zadání
Nechť
$
  f(x) = cases(
    x^2 sq & x <= 1,
    a x + b sq & x > 1,
  )
$

Určete $a,b$ tak, aby funkce měla v bodě $1$ derivaci.

=== Řešení
Musíme zajistit, aby se rovnaly funkční hodnoty a aby se rovnaly oboustranné derivace.

Nejprve oboustranné derivace:
$
  lim_(x->1_-) f'(x) = lim_(x->1_-) (x^2)' = lim_(x->1_-) 2x = 2
$

$
  lim_(x->1_+) f'(x) = lim_(x->1_+) (a x + b)' = lim_(x->1_+) a = a
$

tedy $a = 2$

Zajistíme stejnou funkční hodnotu:

$
  1^2 & = 2 + b \
    b & = -1 \
$

Tedy výsledná funkce je:

$
  f(x) = cases(
    x^2 sq & x <= 1,
    2 x - 1 sq & x > 1,
  )
$

#pb()
==
=== Zadání
Pro $alpha in RR$ uvažujte funkci:

$
  f(x) = cases(
    abs(x)^alpha sin 1/x sq & x != 0,
    0 sq & x = 0
  )
$

Dokažte následující tvrzení:
- $f$ je spojitá v $0$ právě tehdy, když $alpha > 0$
- $f'$ existuje v bodě $0$ právě tehdy, když $alpha > 1$
- $f'$ je spojitá v $0$ právě tehdy, když $alpha > 2$

=== Řešení
==== $f$ je spojitá v $0$ právě tehdy, když $alpha > 0$
===== 1. implikace
Důkaz pomocí větě(jiné formulaci z přednášky - 0-omezenost) o dvou strážnících.

$
  lim_(x->0) abs(x)^alpha sin 1/x & = lim_(x->0) g(x) h(x) \
$

kde $g(x) = abs(x)^alpha$ a $lim_(x->0) abs(x)^alpha = 0$

nalezneme $kappa > 0$ a $C > 0$ tak, že $abs(h(x)) <= C sq forall x in P(0, kappa)$

je zřejmé, že $H(abs(sin(1/x))) = span(0, 1)$, tedy $C = 1$

jelikož toto platí na celém definičním oboru $h(x)$, můžeme $kappa$ zvolit libovoně, např. $kappa = 1$

a tedy
$
  lim_(x->0) abs(x)^alpha sin 1/x = 0 = f(0) space checkmark
$

#pb()
===== 2. implikace
Dokážeme obměnou, tedy že pro $alpha <= 0$ není spojitá. Pro to aplikujeme Heineovu větu. Ta říká, že funkce je v bodě $a$ spojitá, jestliže pro všechny posloupnosti, které k $a$ konvergují, ale nikdy hodnoty $a$ nedosáhnou, musí posloupnost funkčních hodnot konvergovat k funkční hodnotě. Pro důkaz nespojitosti stačí nalézt jednu posloupnost pro kterou toto neplatí.

Uvažujme následující posloupnost:

$
  x_n = {1/(pi/2 + 2 pi n); n in NN}
$

Je zřejmé, že tato posloupnost konverguje k nule, ale nikdy nedosáhne hodnoty $0$.

Spočítáme tedy k čemu konverguje posloupnost funkčních hodnot z tété posloupnosti:
$
    & lim_(n->infinity) abs(1/(pi/2 + 2 pi n))^alpha sin (pi/2 + 2 pi n) \
  = & lim_(n->infinity) abs(1/(pi/2 + 2 pi n))^alpha 1 \
  = & lim_(n->infinity) abs(1/(pi/2 + 2 pi n))^alpha \
$

- pro $alpha = 0$ je limita $1 != 0$ - není spojitá
- pro $alpha < 0$ je limita $+infinity$ - není spojitá

tedy platí původní implikace a funkce je spojitá pro $alpha > 0$

$qed$

==== $f'$ existuje v bodě $0$ právě tehdy, když $alpha > 1$
Spojitost neimplikuje existenci derivace...

Oboustranná derivace existuje jestliže je funkce na okolí bodu definována a jestliže se jednostranné derivace rovnají.

Naše zkoumaná funkce je definována všude, ověříme tedy jen rovnost jednostranných derivací.

===== První implikace $a > 1 => f'(0)$ existuje

#pb()
==
=== Zadání
Vypočtěte $f'(x)$ všude kde existuje pro $f(x) = (2x)/(1- x^2)$
=== Řešení

$
  ((2x)/(1- x^2))' & = ((2x)' (1-x^2) - (2x) (1-x^2)')/(1-x^2)^2 \
                   & = (2 (1-x^2) - (2x) (-2x))/(1-x^2)^2 \
                   & = (2-2x^2 + 4x^2)/(1-x^2)^2 \
                   & = (2(x^2 + 1))/(1-x^2)^2 \
$

Tato derivace existuje pro $x in RR without {-1,1}$

==
=== Zadání
Vypočtěte $f'(x)$ všude kde existuje pro $f(x) = tan x$

=== Řešení
$
  (tan x)' & = (sin(x)/cos(x))' \
           & = (sin(x)'cos(x) - sin(x) cos'(x))/(cos^2(x)) \
           & = (cos^2(x) + sin^2(x))/(cos^2(x)) \
           & = 1/(cos^2(x)) \
$

Tato derivace existuje pro $x in RR without {pi/2 + k pi | k in ZZ}$

#pb()
==
=== Zadání
Najděte $f'(x)$ všude kde existuje pro $f(x) = tan^2 x$
=== Řešení
$
  (tan^2 x)' & = ((sin^2 x)/(cos^2 x))' \
             & = ((sin^2 x)' cos^2 x - sin^2 x (cos^2 x)')/(cos^4 x) \
             & = (2 sin x cos^3 x + 2 cos x sin^3 x)/(cos^4 x) \
             & = (2 sin x cos x (cos^2 x + sin^2 x))/(cos^4 x) \
             & = (2 sin x cos x)/(cos^4 x) \
             & = (2 sin x)/(cos^3 x) \
$

Tato derivace existuje pro $x in RR without {pi/2 + k pi | k in ZZ}$

#pb()
==
=== Zadání
Vypočtěte $f'(x)$ pro všude kde existuje pro $f(x) = ln(ln(sin x))$
=== Řešení
Ověříme definiční obor:

$
  ln(ln(sin x)) => ln(sin x) > 0 => sin x > e^0 => sin x > 1 => x in emptyset
$

Derivace nikde neexistuje.


#pb()
==
=== Zadání
Spočítejte $f'(x)$ všude kde existuje pro $f(x) = 2^tan(1/x)$
=== Řešení
$
  (2^tan(1/x))' & = (e^(ln 2 tan(1/x)))' \
                & = e^(ln 2 tan(1/x)) (ln 2 tan(1/x))' \
                & = ln 2 dp e^(ln 2 tan(1/x)) (tan(1/x))' \
                & = - ln 2 dp e^(ln 2 tan(1/x)) 1/(cos^2 1/x) 1/x^2 \
                & = - ln 2 dp 2^tan(1/x) 1/(cos^2 1/x) 1/x^2 \
                & = - ln 2 dp 2^tan(1/x) 1/x^2/(cos^2 1/x) \
                & = -(ln 2 dp 2^tan(1/x) dp sec^2(1/x))/x^2
$

Tato derivace existuje pro $x in RR without ({0} union {1/(pi/2 + k pi) | k in ZZ})$

#pb()
==
=== Zadání
Spočítejte $f'(x)$ všude kde existuje pro $f(x) = arctan x$
=== Řešení
$
  arctan(x)' & = 1/(1 + x^2) \
$

Tato derivace existuje všude na $RR$

#pb()
==
=== Zadání
Spočítejte $f'(x)$ všude kde exituje pro $f(x) = arctan((1+x)/(1-x))$
=== Řešení
$
  arctan((1+x)/(1-x))' & = 1/(1 + ((1+x)/(1-x))^2) dp ((1+x)/(1-x))' \
                       & = 1/(1 + ((1+x)/(1-x))^2) dp ((1+x)' (1-x) - (1+x) (1-x)')/(1-x)^2 \
                       & = 1/(1 + ((1+x)/(1-x))^2) dp ((1-x) + (1+x))/(1-x)^2 \
                       & = 1/(1 + ((1+x)/(1-x))^2) dp (2)/(1-x)^2 \
                       & = 2/((1-x)^2 + (1+x)^2) \
                       & = 2/(1 - 2x + x^2 + 1 + 2x + x^2) \
                       & = 2/(1 + x^2 + 1 + x^2) \
                       & = 2/(2 + 2 x^2) \
                       & = 1/(1 + x^2) \
$

Tato derivace existuje na $RR without {1}$.

#pb()
==
=== Zadání
Vypočtěte $f'(x)$ všude kde existuje pro $f(x) = sqrt(1 - e^(-x^2))$
=== Řešení
Vyšetříme definiční obor:

$
  sqrt(1 - e^(-x^2)) => 1 - e^(-x^2) >= 0 => 1 >= e^(-x^2) => ln(1) >= -x^2 => 0 >= -x^2 => x in RR
$

Funkce je definována všude na $RR$

Derivace tedy je:

$
  sqrt(1 - e^(-x^2))' & = ((1- e^(-x^2))^(1/2))' \
                      & = 1/2(1- e^(-x^2))^(-1/2) dp (1- e^(-x^2))' \
                      & = 1/(2 sqrt(1- e^(-x^2))) dp (1- e^(-x^2))' \
                      & = 1/(2 sqrt(1- e^(-x^2))) dp (- e^(-x^2) dp (-x^2)') \
                      & = 1/(2 sqrt(1- e^(-x^2))) dp (- e^(-x^2) dp (-2x)) \
                      & = (2 x e^(-x^2))/(2 sqrt(1- e^(-x^2))) \
                      & = (x e^(-x^2))/(sqrt(1- e^(-x^2))) \
$

Tato derivace existuje na $RR without {0}$

Spočítáme jednostranné derivace v $0$

$
  lim_(x->0) (f(x) - f(0))/x & = lim_(x->0) f(x)/x \
                             & = lim_(x->0) sqrt(1- e^(-x^2))/x \
                             & = lim_(x->0) sqrt((1- e^(-x^2))/x^2) \
                             & = lim_(x->0) sqrt((1- e^(-x^2))/x^2) \
                             & = lim_(x->0) - sqrt((e^(-x^2) - 1)/(-x^2)) \
$

#pb()
==
=== Zadání
Spočtěte $f^((10))$ pro $f(x) = sqrt(x)$
=== Řešení
$
  sqrt(x)^((10)) & = (x^(1/2))^((10)) = (1/2 x^(-1/2))^((9)) = c x^(-19/2) \
         "kde" c & = 1/2 dp (-1/2) dp (-3/2) dp (-5/2) dp (-7/2) dp (-9/2) dp (-11/2) dp (-13/2) dp (-15/2) dp (-17/2) \
                 & = - (3 dp 5 dp dots dp 15 dp 17)/2^10 \
                 & = - (34 459 425)/2^10 \
$

#pb()
==
=== Zadání
Spočtěte $f^((13))$ pro $f(x) = (x^4 + 3x) sin x$
=== Řešení
Použijeme Leibnizovo pravidlo pro n-tou derivaci součinu:
$
  ((x^4 + 3x) sin x)^((13)) & = sum_(k=0)^13 binom(13, k) (x^4 + 3x)^((k)) sin^((13-k)) x \
  & = sum_(k=0)^4 binom(13, k) (x^4 + 3x)^((k)) sin^((13-k)) x \
  & = binom(13, 0) (x^4 + 3x)^((0)) sin^((13)) x + binom(13, 1) (x^4 + 3x)^((1)) sin^((12)) x +\ & binom(13, 2) (x^4 + 3x)^((2)) sin^((11)) x + binom(13, 3) (x^4 + 3x)^((3)) sin^((10)) x + binom(13, 4) (x^4 + 3x)^((4)) sin^((9)) x\
  & = 1 (x^4 + 3x) cos x + 13 (4x^3 + 3) sin x + 78 (12x^2) (-cos x) + 286 (24x) (-sin x) + 715 (24) cos x\
  & = (x^4 + 3x) cos x + 13 (4x^3 + 3) sin x - 78 (12x^2) cos x - 286 (24x) sin x + 715 (24) cos x\
  & = (x^4 + 3x) cos x + (52x^3 + 39) sin x - 936x^2 cos x - 6864x sin x + 17160 cos x\
  & = (x^4 + 3x - 936x^2 + 17160) cos x + (52x^3 + 39 - 6864x) sin x \
  & = (x^4 - 936x^2 + 3x + 17160) cos x + (52x^3 - 6864x + 39) sin x \
$

#pb()
==
=== Zadání
=== Řešení

#pb()
= Vzorový test
==
=== Zadání
Spočítejte
$
  integral (log x dp sin (log x))/x dif x
$
=== Řešení
$
   integral (log x dp sin (log x))/x dif x & = \
                                           \
                             "substituce:" \
                                         t & = log x \
                                     dif t & = 1/x dif x \
                                     dif x & = x dif t \
                                           \
         integral (t dp sin (t))/x x dif t & = \
               integral t dp sin (t) dif t & = \
                                           \
                             "per partes:" \
                                         f & = t \
                                        f' & = 1 \
                                        g' & = sin(t) \
                                         g & = -cos(t) \
                                           \
  -t cos(t) - integral 1 (- cos (t)) dif t & = \
        -t cos(t) + integral cos (t) dif t & eqc \
                       -t cos(t) + sin (t) & = \
     -log(x) dp cos(log(x)) + sin (log(x)) \
$

#pb()
==
=== Zadání
Spočtěte derivaci(včetně jednostranných derivací) funkce
$
  sqrt(sin^2 x + x^2 + tan^2 x)
$
všude, kde existuje
=== Řešení
Nejprve definiční obor:
$
  D(sqrt(sin^2 x + x^2 + tan^2 x)) = RR without {pi/2 + k pi | k in ZZ}
$

$
  sqrt(sin^2 x + x^2 + tan^2 x)' & = ((sin^2 x + x^2 + tan^2 x)^(1/2))' \
  & = 1/2 (sin^2 x + x^2 + tan^2 x)^(-1/2) dp (sin^2 x + x^2 + tan^2 x)' \
  & = 1/(2 sqrt(sin^2 x + x^2 + tan^2 x)) dp (2 sin(x) dp cos(x) + 2x + 2 tan(x) dp 1/(cos^2 x)) \
  & = (2 sin(x) dp cos(x) + 2x + 2 tan(x) dp 1/(cos^2 x))/(2 sqrt(sin^2 x + x^2 + tan^2 x)) \
  & = (sin(x) dp cos(x) + x + tan(x) dp 1/(cos^2 x))/(sqrt(sin^2 x + x^2 + tan^2 x)) \
  & = (sin(x) dp cos(x) + x + tan(x) dp sec^2 x)/(sqrt(sin^2 x + x^2 + tan^2 x)) \
$

Tato derivace je definována pro $x in RR without({pi/2 + k pi| k in ZZ} union {0})$

Nemá smysl se zabývat derivacemi v bodech kde funkce samotná není definována, zkoumáme tedy jen bod $0$

Platí $f(0) = 0$, zkoumáme tedy:

$
  lim_(x->0) sqrt(sin^2 x + x^2 + tan^2 x)/x & = lim_(x->0) sgn(x) dp sqrt((sin^2 x)/x^2 + 1 + (tan^2 x)/x^2)
$

Známe známé limity $lim_(x->0) sin(x)/x = lim_(x->0) tan(x)/x = 1$

Limita vnitřní funkce tedy je

$
  lim_(x->0) (sin^2 x)/x^2 + 1 + (tan^2 x)/x^2 & = lim_(x->0) (sin^2 x)/x^2 + lim_(x->0) 1 + lim_(x->0) (tan^2 x)/x^2 \
                                               & =^"VLSF - P, VOAL" 1^2 + 1 + 1^2 = 3 \
$

a limita vnější funkce:

$
  lim_(x->3) sqrt(x) =^"VLSF - S" sqrt(3)
$

#pb()

Jednostranné derivace tedy jsou:

$
  lim_(x->0_-) sqrt(sin^2 x + x^2 + tan^2 x)/x & = lim_(x->0_-) sgn(x) dp sqrt(3) \
                                               & =^"VOAL" -sqrt(3) \
$

a

$
  lim_(x->0_+) sqrt(sin^2 x + x^2 + tan^2 x)/x & = lim_(x->0_+) sgn(x) dp sqrt(3) \
                                               & =^"VOAL" sqrt(3) \
$

Jednostranné derivace se nerovnají, oboustranná derivace tedy neexistuje

#pb()
==
=== Zadání
Spočtěte
$
  lim_(x->0) (1 + tan(sin(x)))^(1/sin(3x))
$

=== Řešení
$
  lim_(x->0) (1 + tan(sin(x)))^(1/sin(3x)) & = lim_(x->0) e^(ln(1 + tan(sin(x)))/sin(3x)) \
  & lim_(x->0) = e^(ln(1 + tan(sin(x)))/tan(sin(x)) dp tan(sin(x))/sin(x) dp sin(x)/x dp (3x)/sin(3x) dp 1/3) \
$

Spočítám každého činitele zvlášť:

$
  lim_(x->0) ln(1 + tan(sin(x)))/tan(sin(x)) & =^"VLSF - P" 1
$

$
  lim_(x->0) tan(sin(x))/(sin(x)) & =^"VLSF - P" 1
$

$
  lim_(x->0) sin(x)/x & =^"známá limita" 1
$

$
  lim_(x->0) (3x)/(sin(3x)) =^"VLSF - P, VOAL" 1
$

tedy:

$
  lim_(x->0) (1 + tan(sin(x)))^(1/sin(3x)) & = lim_(x->0) e^(ln(1 + tan(sin(x)))/sin(3x)) \
  & =^"VOAL" lim_(x->0) e^(1 dp 1 dp 1 dp 1 dp 1/3) = lim_(x->0) e^(1/3) = e^(1/3) \
$

#pb()
= Ukázky zkouškových příkladů
==
=== Zadání
=== Řešení

#pb()
==
=== Zadání
Uvažujme funkci:

$
  f(x) = (e^x -1)/(e^x + 1)
$
Dokažte že funkce je lichá a prostá na $RR$.
=== Řešení
Pro lichost musíme dokázat:
$
  f(-x) = -f(x)
$

tedy

$
  (e^(-x) -1)/(e^(-x) + 1) & = (e^(-x) -1)/(e^(-x) + 1) e^x/e^x \
                           & = (e^(-x + x) - e^x)/(e^(-x + x) + e^x) \
                           & = (e^(0) - e^x)/(e^(0) + e^x) \
                           & = (1 - e^x)/(1 + e^x) \
                           & = - (e^x - 1)/(e^x + 1) space checkmark \
                       qed
$

Pro prostotu musíme dokázat:
$
  f(x_1) & = f(x_2) & => x_1 & = x_2 \
$

tedy
$
             (e^(x_1) -1)/(e^(x_1) + 1) & = (e^(x_2) -1)/(e^(x_2) + 1) \
          (e^(x_1) -1) dp (e^(x_2) + 1) & = (e^(x_2) -1) dp (e^(x_1) + 1) \
  e^(x_1 + x_2) + e^(x_1) - e^(x_2) - 1 & = e^(x_2 + x_1) + e^(x_2) - e^(x_1) -1 \
                  e^(x_1) - e^(x_2) - 1 & = e^(x_2) - e^(x_1) -1 \
                      e^(x_1) - e^(x_2) & = e^(x_2) - e^(x_1) \
                              2 e^(x_1) & = 2 e^(x_2) \
                                e^(x_1) & = e^(x_2) \
                            ln(e^(x_1)) & = ln(e^(x_2)) \
                                    x_1 & = x_2 space checkmark \
                                    qed
$

#pb()
= Clanker dokument - od Jana
== Příklad 1
=== Zadání
$ integral (ln x dot cos(ln x))/x dif x $
=== Řešení
$
  integral (ln x dot cos(ln x))/x dif x & = \
                                        \
                                        & "substituce" \
                                      t & = ln(x) \
                                  dif t & = 1/x dif x \
                                  dif x & = x dif t \
                                        \
    = integral (t dot cos(t))/x x dif t & = \
          integral (t dot cos(t)) dif t & = \
                                        \
                                        & "per partes" \
                                      f & = t \
                                     f' & = 1 \
                                     g' & = cos(t) \
                                      g & = sin(t) \
                                        \
      t sin t - integral 1 sin(t) dif t & = \
        t sin t - integral sin(t) dif t & eqc \
                       t sin t + cos(t) & eqc \
         ln(x) sin (ln(x)) + cos(ln(x)) & sq x in (0,+infinity) \
$

#pb()
== Příklad 2
=== Zadání
$ integral x^3 e^(x^2) dif x $
=== Řešení
$
          integral x^3 e^(x^2) dif x & = \
                                     \
                                     & "substituce" \
                                   t & = x^2 \
                               dif t & = 2x dif x \
                               dif x & = 1/(2x) dif t \
                                     \
     integral t x e^(t) 1/(2x) dif t & = \
          1/2 integral t e^(t) dif t & = \
                                     \
                                     & "per partes" \
                                   f & = t \
                                  f' & = 1 \
                                  g' & = e^t \
                                   g & = e^t \
                                     \
  1/2 (t e^t - integral 1 e^t dif t) & = \
  1/2 t e^t - 1/2 integral e^t dif t & = \
                 1/2 t e^t - 1/2 e^t & = \
       1/2 x^2 e^(x^2) - 1/2 e^(x^2) & = \
               1/2 e^(x^2) (x^2 - 1) & sq x in RR \
$

#pb()
== Příklad 3
=== Zadání
$ integral (arctan x)/(1+x^2) dif x $
=== Řešení
$
   integral (arctan x)/(1+x^2) dif x & = \
                                     \
                                     & "substituce" \
                                   t & = arctan x \
                               dif t & = 1/(1+x^2) dif x \
                               dif x & = (1+x^2) dif t \
                                     \
  integral (t)/(1+x^2) (1+x^2) dif t & = \
                  integral (t) dif t & eqc \
                               t^2/2 & eqc \
                      (arctan^2 x)/2 & sq x in RR \
$

#pb()
== Příklad 4
=== Zadání
$ integral sin x cos x e^(sin x) dif x $
=== Řešení
$
   integral sin x cos x e^(sin x) dif x & = \
                                        \
                                        & "substituce" \
                                      t & = sin x \
                                  dif t & = cos x dif x \
                                  dif x & = 1/cos(x) dif t \
                                        \
  integral t cos x e^(t) 1/cos(x) dif t & = \
                 integral t e^(t) dif t & = \
                                        \
                                        & "per partes" \
                                      f & = t \
                                     f' & = 1 \
                                      g & = e^t \
                                     g' & = e^t \
                                        \
           t e^t - integral e^(t) dif t & eqc \
                          t e^t - e^(t) & eqc \
                            e^t (t - 1) & eqc \
                  e^sin(x) (sin(x) - 1) & sq x in RR \
$

#pb()
== Příklad 5
=== Zadání
$ integral x ln^2 x dif x $
=== Řešení
$
                                 integral x ln^2 x dif x & = \
                                                         & "per partes" \
                                                      f' & = x \
                                                       f & = x^2/2 \
                                                       g & = ln^2 x \
                                                      g' & = 2/x ln x \
                                                         \
            x^2/2 ln^2 x - integral x^2/2 2/x ln x dif x & = \
                    x^2/2 ln^2 x - integral x ln x dif x & = \
                                                         & "per partes" \
                                                      f' & = x \
                                                       f & = x^2/2 \
                                                       g & = ln x \
                                                      g' & = 1/x \
                                                         \
  x^2/2 ln^2 x - (x^2/2 ln x - integral x^2/2 1/x dif x) & = \
        x^2/2 ln^2 x - x^2/2 ln x + 1/2 integral x dif x & eqc \
                       x^2/2 ln^2 x - x^2/2 ln x + x^2/4 & sq x in (0,+infinity) \
$

#pb()
== Příklad 6
=== Zadání
$ integral e^(2x) sin(e^x) dif x $
=== Řešení
$
      integral e^(2x) sin(e^x) dif x & = \
                                     & "substituce" \
                                   t & = e^x \
                               dif t & = e^x dif x \
                               dif x & = e^(-x) dif t \
                                     \
     integral e^x e^x sin(e^x) dif x & = \
  integral e^x t sin(t) e^(-x) dif t & = \
             integral t sin(t) dif t & = \
                                     & "per partes" \
                                   f & = t \
                                  f' & = 1 \
                                  g' & = sin(t) \
                                   g & = -cos(t) \
                                     \
  - t cos(t) + integral cos(t) dif t & eqc \
                 - t cos(t) + sin(t) & eqc \
           - e^x cos(e^x) + sin(e^x) & sq x in RR \
$

#pb()
== Příklad 7
=== Zadání
$ integral (ln(ln x))/x dif x $
=== Řešení
$
  integral (ln(ln x))/x dif x & = \
                              & "substituce" \
                            t & = ln(x) \
                        dif t & = 1/x dif x \
                        dif x & = x dif t \
                              \
   integral (ln(t))/x x dif t & = \
         integral ln(t) dif t & eqc \
                  t ln(t) - t & eqc \
      ln(x) ln(ln(x)) - ln(x) & eqc \
         ln(x)(ln(ln(x)) - 1) & sq x in (0, +infinity) \
$

#pb()
== Příklad 8
=== Zadání
$ integral x arctan x dif x $
=== Řešení
$
                                                               integral x arctan x dif x & = \
                                                                                         & "per partes" \
                                                                                      f' & = x \
                                                                                       f & = x^2/2 \
                                                                                       g & = arctan(x) \
                                                                                      g' & = 1/(1+x^2) \
                                                                                         \
                                         x^2/2 arctan x - integral x^2/x 1/(1+x^2) dif x & = \
                                         x^2/2 arctan x - 1/2 integral x^2/(1+x^2) dif x & = \
                               x^2/2 arctan x - 1/2 integral (x^2 + 1 - 1)/(1+x^2) dif x & = \
                     x^2/2 arctan x - 1/2 integral (x^2 + 1)/(1 + x^2) - 1/(1+x^2) dif x & = \
  x^2/2 arctan x - 1/2 integral (x^2 + 1)/(1 + x^2) dif x - 1/2 integral 1/(1+x^2) dif x & eqc \
                                  x^2/2 arctan x - 1/2 x + 1/2 integral arctan'(x) dif x & eqc \
                                                   x^2/2 arctan x - 1/2 x + 1/2 arctan x & = \
                                                            (x^2 + 1)/2 arctan x - 1/2 x & sq x in RR \
$

#pb()
== Příklad 9
=== Zadání
$ integral cos x dot ln(sin x) dif x $
=== Řešení
$
           integral cos x dot ln(sin x) dif x & = \
                                              & "substituce" \
                                            t & = sin(x) \
                                        dif t & = - cos(x) dif x \
                                        dif x & = - 1/cos(x) dif t \
                                              \
  integral cos x dot ln(t) (- 1/cos(x)) dif t & = \
                       - integral ln(t) dif t & eqc \
                              - (t ln(t) - t) & eqc \
                                  t - t ln(t) & eqc \
                   sin(x) - sin(x) ln(sin(x)) & eqc \
                      sin(x) (1 - ln(sin(x))) & sq x in (2 k pi, (2 k + 1)pi); sq k in ZZ \
$

#pb()
== Příklad 10
=== Zadání
$ integral e^(sqrt(x)) dif x $
=== Řešení
$
      integral e^(sqrt(x)) dif x & = \
                                 & "substituce" \
                               t & = sqrt(x) \
                           dif t & = 1/(2 sqrt(x)) dif x \
                           dif x & = 2 sqrt(x) dif t \
                                 \
    integral e^t 2 sqrt(x) dif t & = \
          integral e^t 2 t dif t & = \
          2 integral t e^t dif t & = \
                                 & "per partes" \
                               f & = t \
                              f' & = 1 \
                              g' & = e^t \
                               g & = e^t \
                                 \
  2 (t e^t - integral e^t dif t) & eqc \
                 2 (t e^t - e^t) & eqc \
                   2 e^t (t - 1) & eqc \
       2 e^sqrt(x) (sqrt(x) - 1) & sq x in chevron 0, +infinity) \
$

#pb()
== Příklad 11
=== Zadání
$ integral x^3 cos(x^2) dif x $
=== Řešení
$
               integral x^3 cos(x^2) dif x & = \
                                           & "substituce" \
                                         t & = x^2 \
                                     dif t & = 2x dif x \
                                     dif x & = 1/(2x) dif t \
                                           \
          integral t x cos(t) 1/(2x) dif t & = \
               1/2 integral t cos(t) dif t & = \
                                           & "per partes" \
                                         f & = t \
                                        f' & = 1 \
                                        g' & = cos(t) \
                                         g & = sin(t) \
                                           \
  1/2 (t sin(t) - integral 1 sin(t) dif t) & = \
   1/2 (-t sin(t) + integral sin(t) dif t) & = \
                   1/2 (t sin(t) + cos(t)) & = \
             1/2 (x^2 sin(x^2) + cos(x^2)) & sq x in RR \
$

#pb()
== Příklad 12
=== Zadání
$ integral ln(1+x^2) dif x $
=== Řešení
$
                                          integral ln(1+x^2) dif x & = \
                                                                   & "per partes" \
                                                                f' & =1 \
                                                                 f & =x \
                                                                 g & = ln(1 + x^2) \
                                                                g' & = (2x)/(1 + x^2) \
                                                                   \
                         x ln(1 + x^2) - integral (2x^2)/(1 + x^2) & = \
                x ln(1 + x^2) - 2 integral (x^2 + 1 - 1)/(1 + x^2) & = \
   x ln(1 + x^2) - 2 (integral 1 dif x - integral 1/(1+x^2) dif x) & = \
  x ln(1 + x^2) - 2 (integral 1 dif x - integral arctan'(x) dif x) & eqc \
                                 x ln(1 + x^2) - 2 (x - arctan(x)) & = \
                                  x ln(1 + x^2) - 2 x + 2arctan(x) & sq x in RR \
$

#pb()
== Příklad 13
=== Zadání
$ integral tg x dot ln(cos x) dif x $
=== Řešení
$
              integral tg x dot ln(cos x) dif x & = \
     integral sin(x)/cos(x) dot ln(cos x) dif x & = \
                                                & "substituce" \
                                              t & = cos(x) \
                                          dif t & = -sin(x) dif x \
                                          dif x & = -1/sin(x) dif t \
                                                \
  integral sin(x)/t dot ln(t) (-1/sin(x)) dif t & = \
                 - integral 1/t dot ln(t) dif t & = \
                                                & "per partes" \
                                             f' & = 1/t \
                                              f & = ln(t) \
                                              g & = ln(t) \
                                             g' & = 1/t \
                                                \
             ln^2(t) - integral ln(t) 1/t dif t & = integral 1/t dot ln(t) dif t \
                                        ln^2(t) & = 2 integral 1/t dot ln(t) dif t \
                                    1/2 ln^2(t) & = integral 1/t dot ln(t) dif t \
                                  1/2 ln^2(t) = & \
                               1/2 ln^2(cos(x)) & = sq (-pi/2 +k pi, pi/2 + k pi) sq k in ZZ \
$

#pb()
== Příklad 14
=== Zadání
$ integral x/(cos^2 x) dif x $
=== Řešení
$
  integral x/(cos^2 x) dif x & = \
  & "per partes" \
  f' & = 1/(cos^2 x) \
  f & = tan(x) \
  g & = x \
  g' & = 1 \
  \
  x tan(x) - integral tan x dif x & = \
  x tan(x) - integral sin(x)/cos(x) dif x & = \
  & "substituce" \
  t & = cos(x) \
  dif t & = -sin(x) dif x \
  dif x & = -1/sin(x) dif t \
  x tan(x) + integral sin(x)/t 1/sin(x) dif t & = \
  x tan(x) + integral 1/t dif t & eqc \
  x tan(x) + ln abs(t) & eqc \
  x tan(x) + ln abs(cos(x)) & sq x in RR without ({pi/2 + k pi} union (pi/2 + l pi, pi/2 + (l+1)pi)) k,l in ZZ \
  x tan(x) + ln abs(cos(x)) & sq x in (-pi/2 + k pi, pi/2 + k pi) k in ZZ \
$

#pb()
== Příklad 15
=== Zadání
$ integral e^(-x) sin x dif x $
=== Řešení
$
                                integral e^(-x) sin x dif x & = \
                                                            & "per partes" \
                                                         f' & = e^(-x) \
                                                          f & = -e^(-x) \
                                                          g & = sin(x) \
                                                         g' & = -cos(x) \
                                                            \
              -e^(-x) sin(x) - integral e^(-x) cos(x) dif x & = \
                                                            & "per partes" \
                                                         f' & = e^(-x) \
                                                          f & = -e^(-x) \
                                                          g & = cos(x) \
                                                         g' & = -sin(x) \
                                                            \
  -e^(-x) sin(x) - (-e^(-x) cos(x) - integral e^(-x) sin x) & = integral e^(-x) sin x dif x \
      -e^(-x) sin(x) -e^(-x) cos(x) - integral e^(-x) sin x & = integral e^(-x) sin x dif x \
                              -e^(-x) sin(x) -e^(-x) cos(x) & = 2 integral e^(-x) sin x dif x \
                                integral e^(-x) sin x dif x & = -e^(-x) 1/2 (sin(x) + cos(x)) sq x in RR \
$

#pb()
== Příklad 16
=== Zadání
$ integral (ln^2 x + 1)/(x (ln^2 x - 4)) dif x $
=== Řešení
$
  integral (ln^2 x + 1)/(x (ln^2 x - 4)) dif x & = \
                                               & "substituce" \
                                             t & = ln(x) \
                                         dif t & = 1/x dif x \
                                         dif x & = x dif t \
                                               \
      integral (t^2 + 1)/(x (t^2 - 4)) x dif t & = \
            integral (t^2 + 1)/(t^2 - 4) dif t & = \
         integral (t^2 + 1)/((t+2)(t-2)) dif t & = \
                                               & "parciální zlomky" \
                        (t^2 + 1)/((t+2)(t-2)) & = A/(t+2) + B/(t-2) \
                                     (t^2 + 1) & = A(t-2) + B(t+2) \
                                "nechť" t = -2 \
                                     (2^2 + 1) & = A(-2-2) \
                                             5 & = -4 A \
                                             A & = -5/4 \
                                 "nechť" t = 2 \
                                     (2^2 + 1) & = B(2+2) \
                                     5/4 & = B \
$
$
         integral (t^2 + 1)/((t+2)(t-2)) dif t & = \
         integral 5/(4(t+2)) - 5/(4(t-2)) dif t & = \
         5/4 integral 1/(t+2) - 1/(t-2) dif t & = \
         5/4 integral 1/(t+2) dif t - 5/4 integral 1/(t-2) dif t & = \
& "substituce"\
t+2 &= k\
dif t = dif k
t-2 &= n\
dif t &= dif n\
         5/4 integral 1/k dif k  - 5/4 integral 1/n dif n & = \
         5/4 ln abs(t+2)  - 5/4 ln abs(t-2) & eqc \
         5/4 ln abs(ln(x) + 2)  - 5/4 ln abs(ln(x) - 2) & eqc \
         5/4 (ln abs(ln(x) + 2)  -  ln abs(ln(x) - 2)) & eqc \
         ln x + 5/4 ln abs((ln(x) + 2)/(ln(x) - 2)) \
$

#pb()
== Příklad 17
=== Zadání
$ integral (e^(2x) + 1)/(e^(2x) - 3 e^x + 2) dif x $
=== Řešení

#pb()
== Příklad 18
=== Zadání
$ integral 1/(sin x (2 + cos x)) dif x $
=== Řešení

#pb()
== Příklad 19
=== Zadání
$ integral (sqrt(x) + 1)/(x (sqrt(x) - 2)) dif x $
=== Řešení

#pb()
== Příklad 20
=== Zadání
$ integral (e^(3x) + 2 e^x)/(e^(2x) + 2 e^x + 5) dif x $
=== Řešení
