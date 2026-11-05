#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "@local/mod:0.1.0": *

#show: boilerplate

= Úvod do praktické fyziky - příklady doma
== Seminář 2.
=== Příklad 1.
Proud v měřeném obvodu se pohybuje v rozmezí $0-3 A$. Potřebuji ho změřit s maximální chybou $plus.minus 10 m A$. Jaká je minimální podmínka na třídu přesnosti ampérmetru, který potřebujeme?

Absolutní nejistota měření je vyjádřená jako:
$
  u_B & = (P R)/sqrt(3) 10^(-2) \
$

a tedy

$
  (u_B sqrt(3))/(R dot.op 10^(-2)) & = P \
                                 P & = (0.01 dot.op sqrt(3))/(3 dot.op 10^(-2)) eq.dot 0.57 = 0.5 \
$

Potřebujeme ampérmetr s minimální třídou přesnosti $0.5$.
