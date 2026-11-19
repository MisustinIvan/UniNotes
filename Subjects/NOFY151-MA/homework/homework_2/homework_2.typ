#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "@local/mod:0.1.0": *

#show: boilerplate

#align(right)[Ivan Mišustin]
#title("Domácí úkol 2.")

= Zadání:
Nalezněte definiční obor a vyšetřete spojitost funkce $f$. Spočtěte derivaci, resp. jednostranné derivace funkce $f$ ve všech bodech, kde existují.

$
  f(x) = max(x^2 + 2x, 3x)^2
$

= Řešení:
== Definiční obor

Je zřejmé, že $D(f) = RR$, jelikož obě funkce v argumentu funkce $max$ jsou definované na celém oboru $RR$.

== Spojitost funkce

Nejprve si vyřeším intervaly, na kterých bude funkce mít funkční hodnotu kvadrátu prvního argumentu $max$ a na kterých hodnotu kvadrátu druhého.

Nejdříve určím body, kde se funkce rovnají
$
  x^2 + 2x & = 3x \
   x^2 - x & = 0 \
  x(x - 1) & = 0 \
       x_1 & = 0 \
       x_2 & = 1 \
$

Na intervalu $(-infinity, 0)$ bude $x^2 + 2x > 3x$

Na intervalu $(0,1)$ bude $x^2 + 2x < 3x$

Na intervalu $(1, +infinity)$ bude $x^2 + 2x > 3x$

Tedy

$
  f(x) = cases(
    x^4 + 4x^3 + 4x^2 sq & x in (-infinity, 0),
    9x^2 sq & x in span(0, 1),
    x^4 + 4x^3 + 4x^2 sq & x in (1, +infinity),
  )
$

Na jednotlivých intervalech bude funkce spojitá, jelikož je funkční hodnota funkční hodnotou spojité funkce (polynomu).

#pb()
Vyšetřím tedy spojitost v krajních bodech $x = 0$ a $x = 1$.

Spočítám tedy jednostranné limity, funkce je v daném bodě spojitá při jejich rovnosti.

pro $x=0$ je $f(0) = 0$ definována
$
  lim_(x->0_-) f(x) & = lim_(x->0_-) x^4 + 4x^3 + 4x^2 = 0 \
  lim_(x->0_+) f(x) & = lim_(x->0_+) 9x^2 = 0 \
$

jednostranné limity se rovnají funkční hodnotě a $f(x)$ tedy je v bodě $x=0$ spojitá

pro $x=1$ je $f(1) = 9$ definována

$
  lim_(x->1_-) f(x) & = lim_(x->1_-) 9x^2 = 9 \
  lim_(x->1_+) f(x) & = lim_(x->1_+) x^4 + 4x^3 + 4x^2 = 1 + 4 + 4 = 9 \
$

jednostranné limity se rovnají funkční hodnotě a $f(x)$ tedy je v bodě $x=1$ spojitá

#pb()
== Derivace
Na jednotlivých intervalech se bude derivace rovnat derivaci jednotlivých funkcí, vyšetříme krajní body - jestliže jednostranné derivace existují a rovnají se, existuje i vlastní oboustranná derivace.

$
  f(x) = cases(
    x^4 + 4x^3 + 4x^2 sq & x in (-infinity, 0),
    9x^2 sq & x in span(0, 1),
    x^4 + 4x^3 + 4x^2 sq & x in (1, +infinity),
  )
$

pro $x in (-infinity, 0)$

$
  f'(x) & = (x^4 + 4x^3 + 4x^2)' = 4x^3 + 12x^2 + 8x
$

pro $x in (0, 1)$

$
  f'(x) & = (9x^2)' = 18x \
$

pro $x in (1, +infinity)$

$
  f'(x) & = (x^4 + 4x^3 + 4x^2)' = 4x^3 + 12x^2 + 8x
$

pro $x = 0$ spočítáme jednostranné derivace

$
  lim_(x->0_-) f'(x) & = lim_(x->0_-) (x^4 + 4x^3 + 4x^2)' = lim_(x->0_-) 4x^3 + 12x^2 + 8x = 0 \
  lim_(x->0_+) f'(x) & = lim_(x->0_+) (9x^2)' = lim_(x->0_+) 18x = 0 \
$

v $x=0$ tedy existuje vlastní derivace

pro $x = 1$ spočítáme jednostranné derivace

$
  lim_(x->1_-) f'(x) & = lim_(x->1_-) (9x^2)' = lim_(x->1_-) 18x = 18 \
  lim_(x->1_+) f'(x) & = lim_(x->1_+) (x^4 + 4x^3 + 4x^2)' = lim_(x->1_+) 4x^3 + 12x^2 + 8x = 24 \
$

v $x=1$ tedy neexistuje vlastní derivace

Derivace funkce bude tedy:
$
  f'(x) = cases(
    4x^3 + 12x^2 + 8x sq & x in(-infinity, 0),
    0 sq & x = 0,
    18x sq & x in (0,1),
    "neexistuje" sq & x = 1,
    4x^3 + 12x^2 + 8x sq & x in(1, +infinity),
  )
$
