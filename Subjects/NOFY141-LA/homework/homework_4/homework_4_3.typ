#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "@local/mod:0.1.0": *

#show: boilerplate

Označme $e_i$ i-tý prvek kanonické báze vektorového prostoru $RR^n$ a uvažujme
podprostor:

$
  W = span(e_1 − e_2, e_2 − e_3, e_3 − e_4, . . ., e_(n−1) − e_n, e_n − e_1) = span(A)
$

Najděte nějakou jeho bázi obsahující (oba) vektory $e_2 − e_n$ a $e_1 − e_(n−1)$. Podrobně zdůvodněte,
proč se jedná o bázi.

Označíme si vektory

$
  ar(a) = e_2 − e_n = vec(0, 1, ..., 0, -1); sq
  ar(b) = e_1 − e_(n−1) = vec(1, 0, ..., -1, 0)
$

Nejprve se ujistíme, zda tyto vektory vůbec patří do podprostoru $W$.

Je zřejmé, že

$
  ar(a) = sum_(i=2)^(n-1) (e_i - e_(i+1))\
$

a

$
  ar(b) = sum_(i=1)^(n-2) (e_i - e_(i+1))\
$

a tedy jsou prvky podprostoru $W$.

Hledáme tedy bázi podprostoru $W$ obsahující tyto dva vektory.

Zapíšeme si množinu generátorů $W$(argumenty $span(A)$) do matice jako sloupcové vektory:

$
  mat(
    1, 0, 0, dots, 0, 0, -1;
    -1, 1, 0, dots, 0, 0, 0;
    0, -1, 1, dots, 0, 0, 0;
    dots.v, dots.v, dots.v, dots.down, dots.v, dots.v, dots.v;
    0, 0, 0, ..., -1, 1, 0;
    0, 0, 0, ..., 0, -1, 1;
  ) => mat(
    1, 0, 0, dots, 0, 0, ;
    -1, 1, 0, dots, 0, 0;
    0, -1, 1, dots, 0, 0;
    dots.v, dots.v, dots.v, dots.down, dots.v, dots.v;
    0, 0, 0, ..., -1, 1;
    0, 0, 0, ..., 0, -1;
  )
$

Vidíme, že matice je v transponovaném *REF* a má $n-1$ pivotních sloupců, kde poslední sloupec je nepivotní, lze jej tedy vyjádřit jako *LK* předchozích sloupců. $A_n = - sum_(i=1)^(n-1) A_i$.

Pivotní sloupce této matice tedy tvoří jednu z bází $W$. Zkusíme tedy nahradit dva sloupce této matice sloupcovými vektory $ar(a)$ a $ar(b)$, aby byl zachován počet pivotních sloupců. Vidíme, že $ar(b)$ má první nenulový prvek na indexu $1$ a $ar(a)$ na indexu $2$. Nahradíme tedy první dva sloupce těmito vektory.
#pb()

Dostáváme tedy matici:

$
  mat(
    1, 0, 0, dots, 0, 0;
    0, 1, 0, dots, 0, 0;
    0, 0, 1, dots, 0, 0;
    dots.v, dots.v, dots.v, dots.down, dots.v, dots.v;
    -1, 0, 0, ..., -1, 1;
    0, -1, 0, ..., 0, -1;
  )
$

která má $n-1$ pivotních sloupců, jsou tedy všechny *LN* a tvoří bázi $W$.

Báze $W$ je tedy:

$
  B = (e_1 − e_(n−1), e_2 − e_n, e_3 - e_4, ..., e_(n-1) - e_n)
$
