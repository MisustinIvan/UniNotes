#import "@local/mod:0.1.0": *
#show: boilerplate

#align(right)[Ivan Mišustin]
#title("Domácí úkol 7.")

*Zadání*

V prostoru $V := P_2(x, RR)$ uvažujme endomorfismus $f$, který polynomu $p(x)$ přiřadí polynom $(x + 1) dif/(dif x) p(x) − p(x)$. Určete jeho hodnost, nulitu, jádro a obraz.

*Řešení*

Uvažujme v prostoru $V$ následující bázi $B = (x^2, x, 1)$. Reprezentace daného polynomu vůči této bázi bude tedy aritmetický vektor. Pro jednotlivé operace na vektoru polynomu vzhledem k této bázi zapíšeme následující matice:

+ Matice násobení $(x+1)$
  - Je nutno podotknout, že tato matice vrací správnou hodnotu jen pro polynomy se stupněm 1 a níže, což je ale v pořádku, jelikož derivace snižuje stupeň polynomu o 1.
  $
    dmat(
      1, 1, 0;
      0, 1, 1;
      0, 0, 1
    )
  $
+ Matice derivace
  $
    dmat(
      0, 0, 0;
      2, 0, 0;
      0, 1, 0
    )
  $

Zkoumaný endomorfismus $f$ tedy zapíšeme následovně:

$
  [f]^B_B & = dmat(
              1, 1, 0;
              0, 1, 1;
              0, 0, 1
            )
            dmat(
              0, 0, 0;
              2, 0, 0;
              0, 1, 0
            ) - dmat(
              1, 0, 0;
              0, 1, 0;
              0, 0, 1
            ) \
          & = dmat(
              2, 0, 0;
              2, 1, 0;
              0, 1, 0
            ) - dmat(
              1, 0, 0;
              0, 1, 0;
              0, 0, 1
            ) \
          & = dmat(
              1, 0, 0;
              2, 0, 0;
              0, 1, -1
            ) \
$

#pb()
Nyní vyšetříme hodnost a nulitu.

Z věty o dimenzi jádra a obrazu víme, že $rank [f]^B_B + nul [f]^B_B = dim V$.

Víme také, že hodnost odpovídá počtu pivotních sloupců po Gaussově eliminaci. Vidíme, že matice

$
  [f]_B^B = dmat(
    1, 0, 0;
    2, 0, 0;
    0, 1, -1
  ) ~ dmat(
    1, 0, 0;
    0, 0, 0;
    0, 1, -1
  ) ~ dmat(
    1, 0, 0;
    0, 1, -1;
    0, 0, 0
  )
$

má dva pivotní sloupce, její hodnost je tedy $2$.

Jelikož $dim V = 3$, je $nul [f]_B^B = dim V - rank [f]_B^B = 3-2 = 1$

Nyní nalezneme jádro matice:

$
  [f]^B_B ~ dmat(
    1, 0, 0;
    0, 1, -1;
    0, 0, 0
  ) => ker [f]_B^B = span(vec(0, 1, 1))
$

Vyjádřeno jako množina polynomů:

$
  ker f = {a(x + 1) | a in RR}
$

Víme, že indexy pivotních sloupců po gausově eliminaci odpovídají indexům lineárně nezávislých sloupců původní matice generujících sloupcový prostor. Obraz tedy bude:

$
  [f]^B_B ~ dmat(
    1, 0, 0;
    0, 1, -1;
    0, 0, 0
  ) => im [f]_B^B = span(vec(1, 2, 0), vec(0, 0, 1))
$

Vyjádřeno jako množina polynomů:
$
  im f = {a(x^2 + 2x) + b | a,b in RR}
$
