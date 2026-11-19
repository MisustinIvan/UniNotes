#import "@local/mod:0.1.0": *
#show: boilerplate

#align(right)[Ivan Mišustin]
#title("Domácí úkol 6.")

*Zadání*

Označme $B$ posloupnost $(1, cos 2x, cos 4x)$ funkcí v prostoru $F(RR, RR)$ a $W := span(B)$
její lineární obal. Ukažte, že $B$ je báze $W$ a že funkce $sin^4 x$ leží ve $W$. Určete souřadnice $[sin^4 x]^B$.

*Řešení*

Nejprve ověříme lineární nezávislost $B$ nutností triviální LK pro nulový prvek.

$
  alpha cos 4x + beta cos 2x + gamma = 0 \
$

Jelikož by netriviální LK měla existovat $forall x in RR$ nezávisle na $x$, stačí mi na třech konkrétních hodnotách ukázat že taková LK neexistuje.

nechť $x = 0$
$
  alpha cos 0 + beta cos 0 + gamma = 0 \
  alpha + beta + gamma = 0 \
$

nechť $x = pi/4$
$
  alpha cos pi + beta cos pi/2 + gamma = 0 \
  -alpha + gamma = 0 \
$

nechť $x = pi/2$
$
  alpha - beta + gamma = 0 \
$

Dostávám SLR:

$
  alpha + beta + gamma = 0 \
  -alpha + gamma = 0 \
  alpha - beta + gamma = 0 \
  \
  => mat(
    1, 1, 1;
    -1, 0, 1;
    1, -1, 1;
  ) ~ mat(
    0, 1, 2;
    -1, 0, 1;
    0, -1, 2;
  ) ~ mat(
    0, 1, 2;
    -1, 0, 1;
    0, 0, 4;
  ) ~ mat(
    0, 1, 2;
    -1, 0, 1;
    0, 0, 1;
  ) ~ mat(
    0, 1, 0;
    -1, 0, 0;
    0, 0, 1;
  ) ~ mat(
    1, 0, 0;
    0, 1, 0;
    0, 0, 1;
  )
$

a tedy

$
  alpha = beta = gamma = 0
$

posloupnost $B$ je LN a tvoří bázi $W$

#pb()
Pokusíme se vyjádřit $sin^4 x$ jako LK prvků báze a získat reprezentaci $[sin^4 x]^B$.

$
  sin^4 x & = (1 - cos^2 x)^2 \
  sin^4 x & = 1 - 2 cos^2 x + cos^4 x \
  sin^4 x & = 1 - 2 cos^2 x + (cos^2 x)^2 \
  sin^4 x & = 1 - (2 (1 + cos 2x)/2) + ((1 + cos 2x)/2)^2 \
  sin^4 x & = - cos 2x + ((1 + cos 2x)/2)^2 \
  sin^4 x & = - cos 2x + (1 + 2cos 2x + cos^2 2x)/4 \
  sin^4 x & = - cos 2x + 1/4 + 1/2cos 2x + 1/4 cos^2 2x \
  sin^4 x & = - cos 2x + 1/4 + 1/2cos 2x + 1/4 (1 + cos 4x)/2 \
  sin^4 x & = - 1/2cos 2x + 1/4 + 1/8 + 1/8 cos 4x \
  sin^4 x & = - 1/2cos 2x + 3/8 + 1/8 cos 4x \
$

tedy reprezentace $sin^4 x$ vzhledem k bázi $B$ je aritmetický vektor $[sin^4 x]^B = vec(3/8, -1/2, 1/8)$
