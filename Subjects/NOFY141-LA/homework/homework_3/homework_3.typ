#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "@local/mod:0.1.0": *

#show: boilerplate

#set page(
  header: align(right)[Ivan Mišustin],
)

#title[Lineární algebra - domácí úkol č. 3]

Hledáme $ker A$ ve formě lineárního obalu množiny vektorů, kde

$
  A = mat(
    5, 0, 2, 1, 0;
    3, 1, 2, 1, 1;
    1, 2, 2, 1, 2;
    2, -1, 0, 0, 1
  )
$

$ker A$ je řešením homogenní soustavy lineárních rovnic s maticí $A$ jako koeficienty, provedu tedy Gaussovu eliminaci a získám množinu řešení $M subset RR^5$

$
  mat(
    5, 0, 2, 1, 0;
    3, 1, 2, 1, 1;
    1, 2, 2, 1, 2;
    2, -1, 0, 0, 1
  ) ~ mat(
    1, 2, 2, 1, 2;
    5, 0, 2, 1, 0;
    3, 1, 2, 1, 1;
    2, -1, 0, 0, 1
  ) ~ mat(
    1, 2, 2, 1, 2;
    0, -10, -8, -4, -10;
    0, -5, -4, -2, -6;
    0, -5, -4, -2, -3;
  )
  ~ mat(
    1, 2, 2, 1, 2;
    0, -10, -8, -4, -10;
    0, -5, -4, -2, -6;
    0, 0, 0, 0, 3;
  )\ ~ mat(
    1, 2, 2, 1, 2;
    0, -10, -8, -4, -10;
    0, 0, 0, 0, -1;
    0, 0, 0, 0, 3;
  ) ~ mat(
    1, 2, 2, 1, 2;
    0, -10, -8, -4, -10;
    0, 0, 0, 0, -1;
    0, 0, 0, 0, 0;
  )
  ~ mat(
    1, 2, 2, 1, 2;
    0, 5, 4, 2, 5;
    0, 0, 0, 0, -1;
    0, 0, 0, 0, 0;
  ) ~ mat(
    1, 2, 2, 1, 2;
    0, 5, 4, 2, 0;
    0, 0, 0, 0, -1;
    0, 0, 0, 0, 0;
  )\ ~ mat(
    1, 2, 2, 1, 0;
    0, 5, 4, 2, 0;
    0, 0, 0, 0, -1;
    0, 0, 0, 0, 0;
  )
  ~ mat(
    1, 2-5/2, 0, 0, 0;
    0, 5, 4, 2, 0;
    0, 0, 0, 0, -1;
    0, 0, 0, 0, 0;
  )
  ~ mat(
    1, -1/2, 0, 0, 0;
    0, 5, 4, 2, 0;
    0, 0, 0, 0, -1;
    0, 0, 0, 0, 0;
  )
$

Pro neznámé ve tvaru $vec(x_1, x_2, x_3, x_4, x_5)$ si parametrizuji $x_3, x_4$ parametry $r,s in RR$:

$
  x_1 & = 1/2 x_2 = -(4r + 2s)/10 \
  x_2 & = -(4r + 2s)/5 \
  x_3 & = r \
  x_4 & = s \
  x_5 & = 0 \
$

Tento výsledek můžu zapsat jako lineární obal dvou vektorů

$
  ker A = span(vec(-2/5, -4/5, 1, 0, 0), vec(-1/5, -2/5, 0, 1, 0)) = span(vec(-2, -4, 5, 0, 0), vec(-1, -2, 0, 5, 0))
$
