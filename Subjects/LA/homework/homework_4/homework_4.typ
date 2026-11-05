#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "@local/mod:0.1.0": *

#show: boilerplate

#set page(
  header: align(right)[Ivan Mišustin],
)

#title[Lineární algebra - domácí úkol č. 4]

*Zadání*

Najděte nějakou bázi a určete dimenzi komplexního vektorového prostoru

$
  W = span(vec(i, 1, 1 + i, -1), vec(1, -1, -1 - i, 1), vec(1, 1, lambda, -1)) <= CC^4
$

v závislosti na $lambda in CC$

*Řešení*

Předpokládáme že $CC^4$ je implicitně vektorový prostor $CC^4$ nad $CC$

kde dim $CC^4 = 4$, a $dim W <= 3$

Mějme následující komplexní matici typu $4 times 3$

$
  M = mat(
    i, 1, 1;
    1, -1, 1;
    1+i, -1-i, lambda;
    -1, 1, -1;
  )
$

Víme, že lineární obal $W <= CC^4$ je ekvivalentní se sloupcovým prostorem matice $M$,

tedy $W = "Im" M$

Vzpomeneme si také na poznatek ze cvičení, že dimenze sloupcového prostoru je rovna počtu pivotních sloupců $M$

Provedeme tedy GE na $M$ a zjistíme počet pivotních sloupců v závislosti na parametru $lambda in CC$.

$
  M = mat(
    i, 1, 1;
    1, -1, 1;
    1+i, -1-i, lambda;
    -1, 1, -1;
  ) ~ mat(
    i, 1, 1;
    1, -1, 1;
    1, -2-i, lambda-1;
    -1, 1, -1;
  ) ~ mat(
    i, 1, 1;
    0, 0, 0;
    0, -1-i, lambda-2;
    -1, 1, -1;
  )\
  ~ mat(
    0, 1+i, 1-i;
    0, 0, 0;
    0, -1-i, lambda-2;
    -1, 1, -1;
  ) ~ mat(
    -1, 1, -1;
    0, -1-i, lambda-2;
    0, 1+i, 1-i;
    0, 0, 0;
  ) ~ mat(
    -1, 1, -1;
    0, -1-i, lambda-2;
    0, 0, -1 - i + lambda;
    0, 0, 0;
  )
$

Vidíme, že první dva sloupce jsou vždy pivotní.

Pro třetí sloupec dostáváme dva případy:
+ $lambda = 1 + i$ - třetí sloupec je nepivotní, tedy $dim W = 2$
+ $lambda != 1 + i$ - třetí sloupec je pivotní, tedy $dim W = 3$

#pb()
Nejprve nalezneme nějakou bázi pro $lambda = 1 + i$, $dim W = 2$, tedy lineárně nezávislou uspořádanou dvojici vektorů ve $W$

Víme, že

$
  G = {vec(i, 1, 1 + i, -1), vec(1, -1, -1 - i, 1), vec(1, 1, 1+i, -1)}
$

generuje $W$ a $dim W = 2$.

Můžeme tedy odebrat jeden z prvků $G$, který lze vyjádřit pomocí lineární kombinace ostatních prvků a dostaneme lineárně nezávislou množinu ve $W$ která $W$ generuje, tedy bázi.

Dosadíme tedy $lambda = 1 + i$ do předchozí upravené matice:

$
  mat(
    -1, 1, -1;
    0, -1-i, -1+i;
    0, 0, 0;
    0, 0, 0;
  )
$

Jestliže si označíme jednotlivé sloupce $v_1, v_2, v_3$ a víme, že elementární řádkové úpravy zachovávají lineární nezávislost a vztahy mezi sloupcovými vektory, kde pivotnost sloupce odpovídá možnosti jeho zapsání lineární kombinací ostatních sloupců, můžeme nepivotní sloupec $v_3$ bezpečně odebrat, dostáváme tedy bázi \ pro $lambda = 1+i$:

$
  B_1 = (vec(i, 1, 1 + i, -1), vec(1, -1, -1 - i, 1))
$

Aplikuji stejnou úvahu na druhý případ pro $lambda != 1 + i$, $dim W = 3$, kdy budou všechny 3 sloupce pivotní, tedy i lineárně nezávislé. Bází budou tedy všechny 3 sloupcové vektory.

$
  B_2 = (vec(i, 1, 1 + i, -1), vec(1, -1, -1 - i, 1), vec(1, 1, lambda, -1))
$
