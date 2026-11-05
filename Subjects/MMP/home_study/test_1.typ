#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "@local/mod:0.1.0": *

#show: boilerplate

= Cvičení 1.
== Úkol 1.
Přepište bod $vec(1, 1)$ z kartézských do polárních souřadnic a zpět.

$
  vec(1, 1)
$

V polárních souřadnicích definujeme polohu bodu pomocí úhlu $phi$ a vzdálenosti $rho$.

$
  rho & = sqrt(1^2 + 1^2) = sqrt(2) \
$

a

$
  phi & = arctan(1/1) = arctan(1) = pi/4 \
$

Nyní zpět

$
  x & = rho cos phi = sqrt(2) sqrt(2)/2 = 2/2 = 1 \
  y & = rho sin phi = sqrt(2) sqrt(2)/2 = 2/2 = 1 \
$

== Úkol 2.
Přepište bod $vec(4, 3, 7)$ do cylindrických a sférických souřadnic.

V cylindrických souřadnicích popíšeme polohu bodu pomocí úhlu $phi$, vzdálenosti od osy z $rho$ a výšky $z$ nad rovinou x-y.
$
  z & = z = 7 \
$

a
$
    r & = sqrt(x^2 + y^2) = sqrt(4^2 + 3^2) = sqrt(25) = 5 \
  phi & = arctan(y/x) = arctan(3/4) \
$

Ve sférických souřadnicích popíšeme polohu bodu pomocí úhlu $theta$ od osy $z$, úhlu $phi$ kolem osy $z$ a vzdálenosti $rho$.

$
    rho & = sqrt(x^2 + y^2 + z^2) = sqrt(4^2 + 3^2 + 7^2) = sqrt(74) \
  theta & = arccos(z/rho) = arccos(7/sqrt(74)) \
    phi & = arctan(y/x) \
$

== Úkol 3.
přeskočíme, triviální

== Úkol 4.
Spočítejte skalární součin vektorů $a = vec(3, 4, -2)$ a $b = vec(1, -1, 0)$, určete úhel mezi těmito vektory a jejich směrové kosiny

$
  a dot.op b = 3 dot.op 1 + 4 dot.op -1 + -2 dot.op 0 = 3 - 4 + 0 = -1\
$

úhel $phi$ mezi vektory:

$
  phi & = arccos((a dot.op b)/(abs(a) dot.op abs(b))) = arccos(-1/(sqrt(9 + 16 + 4) dot.op sqrt(1 + 1))) = arccos(-1/(sqrt(58)))
$

směrové kosiny jsou úhly s osami

pro $ar(a)$
$
  cos alpha & = x_a/abs(a) = 3/sqrt(29) \
  cos alpha & = y_a/abs(a) = 4/sqrt(29) \
  cos alpha & = z_a/abs(a) = -2/sqrt(29) \
$

pro $ar(b)$
$
  cos alpha & = x_b/abs(b) = 1/sqrt(2) \
  cos alpha & = y_b/abs(b) = -1/sqrt(2) \
  cos alpha & = z_b/abs(b) = -/sqrt(2) \
$

== Úkol 5.
Jaký je úhel $phi$ mezi vektory $ar(u) = ar(i) + 2ar(j)$ a $ar(v) = 2ar(j) - 3ar(k)$ kde $ar(i), ar(j), ar(k)$ je báze i guess

$
  phi = arccos((vec(1, 2, 0) dot.op vec(0, 2, -3))/(sqrt(1^2 + 2^2) dot.op sqrt(2^2 + 3^2))) = arccos(4/(sqrt(5) dot.op sqrt(13))) = arccos(4/sqrt(65))
$

== Úkol 6.
== Úkol 7.
#pb()
== Úkol 8.
Určete dráhu pohybujícího se bodu, a stanovte, jaký pohyb popisují parametrické rovnice:

$
  x(t) & = sin(pi/2 t) \
  y(t) & = sin(pi/2 t) \
     t & in RR \
$

tedy
$
arcsin(x) &= pi/2 t\
2/pi arcsin(x) &= t\
arcsin(y) &= pi/2 t\
2/pi arcsin(y) &= t\
2/pi arcsin(x) &= 2/pi arcsin(y)\
x &= y\
$

Je to tedy pohyb po úsečce

Vypočítejte velikost rychlosti a zrychlení:

$
v_x &= dt(x)(t) = cos(pi/2 t)\
v_y &= dt(y)(t) = cos(pi/2 t)\
v &= sqrt(2cos^2(pi/2 t)) = cos(pi/2 t) sqrt(2)\
$

$
a_x &= dtt(x)(t) = -sin(pi/2 t)\
a_y &= dtt(y)(t) = -sin(pi/2 t)\
a &= sqrt(2sin^2(pi/2 t)) = sin(pi/2 t) sqrt(2)\
$

#pb()
== Úkol 9.
Po jaké křivce se pohybuje bod, jehož parametrické rovnice mají tvar: 

$
x(t) = 3A sin(pi/2 t); sq y(t) = 2A cos(pi/2 t)\
$

upravíme na goniometrickou jednotku, tedy:

$
(x/(3A))^2 &= sin^2(pi/2 t)\
(y/(2A))^2 &= cos^2(pi/2 t)\
(x/(3A))^2 + (y/(2A))^2 &= sin^2(pi/2 t) + cos^2(pi/2 t)\
(x/(3A))^2 + (y/(2A))^2 &= 1\
x^2/(9A^2) + y^2/(4A^2) &= 1\
$

to odpovídá rovnici elipsy s velkou poloosou $3A$ a malou poloosou $2A$

vypočítejte rychlost $ar(v)$ a zrychlení $ar(a)$ a jejich velikosti:

$
ar(v) &= dt(ar(r)) = dt(vec(x,y)) = vec(3A pi/2 cos(pi/2 t), - 2A pi/2 sin(pi/2 t))\
ar(a) &= dt(ar(v)) = dtt(ar(r)) = dtt(vec(x,y)) = vec(-3A pi^2/4 sin(pi/2 t), -2A pi^2/4 cos(pi/2 t))\
$

#pb()
= Cvičení 2.
== Úkol 1.
Určete hmotnost závaží mp, aby byla soustava na obrázku v rovnováze. Jaká je velikost sil $T$ a $P$, když 
hmotnost bodu $m = 10 "kg"$, úhel $alpha = 45 degree$ a úhel $beta = 60 degree$.

#image("./img_1.png")

Rozbor sil:

$
g m &= T cos(alpha) + P cos(beta)\
T sin(alpha) &= P sin(beta)\
P &= g m_p\
T &= P sin(beta)/sin(alpha) = g m_p sin(beta)/sin(alpha)\
$

dořešeno na papíře...

#pb()
== Úkol 2.
Tyč o hmotnosti $m$ je zavěšená na zdi a na tyči jsou umístěná dvě závaží o hmotnostech $m_1$ a $m_2$. 
Určete sílu $T$ působící v laně (úhel $alpha$ známe) a sílu, kterou tyč působí na zeď v bodě $P$. 

#image("./img_2.png")

Rozbor sil:

$
sum F &= 0\
sum M &= 0\
m_1 g L/4 + m_2 g 3/4 L + m g L/2 &= L T sin alpha\
m_1 g 1/4 + m_2 g 3/4 + m g 1/2 &= T sin alpha\
T &= (m_1 g 1/4 + m_2 g 3/4 + m g 1/2)/sin(alpha)\
F_P_x &= T cos alpha = (m_1 g 1/4 + m_2 g 3/4 + m g 1/2) cos(alpha)/sin(alpha) = (m_1 g 1/4 + m_2 g 3/4 + m g 1/2)/tan(alpha)\

F_P_y &= g m_1 + g m_2 + g m - T sin alpha\
F_P_y &= g m_1 + g m_2 + g m - (m_1 g 1/4 + m_2 g 3/4 + m g 1/2)\
F_P_y &= g/4(3m_1 + m_2 + 2 m)\
$

#pb()
== Úkol 3.
Dvě závaží o hmotnostech $m_1$ a $m_2 (m_1 > m_2)$ visí na nehmotném vlákně vedeném přes pevnou 
kladku. Těžší závaží visí ve výšce $d$ nad podložkou. Po uvolnění se začne závaží pohybovat rovnoměrně 
zrychleně, dokud těžší závaží nenarazí na podložku. Určete rychlost $v$, se kterou dojde k nárazu.

#image("./img_3.png")

Rozepíšeme si síly
