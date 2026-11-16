#import "@local/mod:0.1.0": *
#show: boilerplate

#align(right)[Ivan Mišustin]
#title("Domácí úkol 5.")

*Zadání*

Pro které hodnoty $a_1, . . . , a_n in RR$ je následující matice regulární?

$
  mat(
    0, 1, 1, dots, 1;
    1, a_1, 0, dots, 0;
    1, 0, a_2, dots.down, dots.v;
    dots.v, dots.v, dots.down, dots.down, 0;
    1, 0, dots, 0, a_n;
  )
$

*Řešení*

Matice typu $n times n$, která má v REF $n$ pivotních sloupců je regulární. Naše zkoumaná matice je prakticky v transponovaném REF, kromě prvního řádku. Je zřejmé, že sloupce na indexech $2 dots n+1$ jsou lineárně nezávislé, jestliže je maximálně jedno $a_i = 0$ (jestliže by bylo více $a_i = 0$, byly by tyto sloupce totožné a nebyly by lineárně nezávislé).

Dále je zřejmé, že v případě kde všechna $a_i != 0$ můžeme provádět Gaussovu eliminaci postupným přičítáním $-1/a_i$ násobku $i+1$-tého řádku k prvnímu řádku a dostaneme na indexech $2 dots n+1$ nuly. Na indexu $(1,1)$ bude tedy hodnota $- sum_(i=1)^n 1/a_i$. Matice bude v tomto případě regulární jestliže budou všechny sloupce pivotní, tedy $sum_(i=1)^n 1/a_i != 0$.

$
  mat(
    - sum_(i=1)^n 1/a_i, 1-a_1/a_1, 1-a_2/a_2, dots, 1-a_n/a_n;
    1, a_1, 0, dots, 0;
    1, 0, a_2, dots.down, dots.v;
    dots.v, dots.v, dots.down, dots.down, 0;
    1, 0, dots, 0, a_n;
  )
$

Pro případ kdy bude právě jedno $a_i = 0$, bude $i+1$-tý řádek matice vypadat následovně: $mat(1, 0, dots, 0)$. Uvažujme úpravu, kdy $-1$-násobek tohoto řádku přičteme ke všem řádkům na indexech $j != 1;i+1$. Dostaneme řádky s nulovými prvky kromě indexu $j$.

např. pro $a_2 = 0$
$
  mat(
    0, 1, 1, dots, 1;
    1-1, a_1, 0, dots, 0;
    1, 0, 0, dots.down, dots.v;
    dots.v, dots.v, dots.down, dots.down, 0;
    1-1, 0, dots, 0, a_n;
  )
$

Následně provedeme úpravu analogickou předchozímu případu, přičítáme k prvnímu řádku $-1/a_k$-násobky řádků s nenulovým $a_k$. Dostaneme řádek, který bude mít na pozici $i+1$ hodnotu $1$, všude jinde nuly.\

$
  mat(
    0, 1-a_1/a_1, 1, dots, 1-a_n/a_n;
    0, a_1, 0, dots, 0;
    1, 0, 0, dots.down, dots.v;
    dots.v, dots.v, dots.down, dots.down, 0;
    0, 0, dots, 0, a_n;
  )
$

Vhodným přeuspořádáním řádků v matici se dostaneme na REF, tedy matice je regulární.

$
  mat(
    1, 0, 0, dots, 0;
    0, a_1, 0, dots, 0;
    0, 0, 1, dots.down, dots.v;
    dots.v, dots.v, dots.down, dots.down, 0;
    0, 0, dots, 0, a_n;
  )
$

*Shrnutí*

Matice je regulární v následujících případech:
+ $a_i != 0 forall i in {1 dots n} and sum_(i=1)^n 1/a_i != 0$
+ právě jedno $a_i = 0$
