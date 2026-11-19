#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "@local/mod:0.1.0": *

#show: boilerplate

#set page(
  header: align(right)[Ivan Mišustin],
)

#title[Lineární algebra - domácí úkol č. 1]

Pro $n in NN$ určete mocninu matice:

$
  mat(
    1, 1, 0;
    -1, 1, 0;
    0, 0, 1
  )^n
$

Pro libovolnou mocninu $n in NN$ v matici zůstane poslední řádek a sloupec stejný, jelikož jejich nulové prvky jsou vždy výsledkem skalárního součinu ve formě:

$
  vec(0, 0, 1) dot.op vec(a, b, 0) = 0
$
nebo

$
  vec(a, b, 0) dot.op vec(0, 0, 1) = 0
$

a jednotkový prvek v pravém spodním rohu tedy vždy vzniká skalárním součinem ve formě:

$
  vec(0, 0, 1) dot.op vec(0, 0, 1) = 1
$

Z toho mohu tento problém zredukovat na následující jednodušší problém:

$
  A = mat(
    1, 1;
    -1, 1
  ) "a tedy hledám" A^n = mat(
    1, 1;
    -1, 1
  )^n
$

Prvních pár mocnin této matice:

$
  A^2 = mat(
    0, 2;
    -2, 0
  )\
  A^3 = mat(
    -2, 2;
    -2, -2
  )\
  A^4 = mat(
    -4, 0;
    0, -4
  )\
$

Vidím že $A^4$ je $(-4)$-násobkem identitní matice $EE_2$, a tedy každá mocnina která je násobkem $4$ se zapíše následnovně:

$
  "pro" n = 4q\
  A^n = (-4)^q EE_2
$

Z toho tedy plyne že pro libovolnou mocninu $n$ mi záleží hlavně na zbytku po dělení $n$ čtyřmi, kde výsledná matice $A^n$ bude vypadat následovně:

$
    n & = 4q + r "    , kde " r in {0,1,2,3} \
  A^n & = (-4)^q A^r \
$

Nakonec pro původní matici

$
  & mat(
      1, 1, 0;
      -1, 1, 0;
      0, 0, 1
    )^n "   kde " n = 4q + r; space r in {0,1,2,3} \
  & = (-4)^q mat(
      1, 0, 0;
      0, 1, 0;
      0, 0, (-4)^(-q)
    ) "  pro" r = 0 \
  & = (-4)^q mat(
      1, 1, 0;
      -1, 1, 0;
      0, 0, (-4)^(-q)
    ) "  pro" r = 1 \
  & = (-4)^q mat(
      0, 2, 0;
      -2, 0, 0;
      0, 0, (-4)^(-q)
    ) "  pro" r = 2 \
  & = (-4)^q mat(
      -2, 2, 0;
      -2, -2, 0;
      0, 0, (-4)^(-q)
    ) "  pro" r = 3 \
$

#pb()
*Příklad 5*

Nechť $A,B,C$ jsou matice typu $2 times 2$. Určete podmínky, které musí tyto matice splňovat, aby existovala nenulová matice $X$, pro kterou platí:

$
          X & = B(X-C A^T) + (A C^T B^T)^T \
          X & = B(X-C A^T) + B^T^T C^T^T A^T \
          X & = B X - B C A^T + B C A^T \
          X & = B X \
    X - B X & = 0 \
  (E - B) X & = 0 \
$

Triviální řešení je $B = E$, podle zadání ale zřejmě existují i jiná...

Samozřejmě pokud $B^2 = B and B = X$ je také řešení...

Předpokládejme že $B^2 = B$, tj. $B$ je matice projekce. Matice projekce nemůže mít inverzní matici, jelikož existuje nekonečně mnoho vektorů které zobrazí na stejný vektor...

Také, jestliže je existuje $(E-B)^(-1)$, tak je triviální řešení $X=0$

Tedy, pro netriviální řešení musí být $(E-B)$ singulární matice, tedy $det(E-B) = 0$

Z čehož plyne:

$
  det (E-B) = det mat(
    1-a, -b;
    -c, 1-d
  ) = (1-a)(1-d) - (-b dot.op (-c)) = 0
$

a tedy podmínky pro matici $B$

$
      (1-a)(1-d) - b c & = 0 \
   1 -d -a + a d - b c & = 0 \
  1 + a d - b c - a -d & = 0 \
      1 + det B - tr B & = 0 \
$
