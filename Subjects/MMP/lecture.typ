#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "@local/mod:0.1.0": *

#show: boilerplate

#title[Mechanika a molekulová fyzika - přednáška - František Chmelík]
= Úvod do mechaniky
- Zabývá se mechanickým pohybem, změnami velikosti a tvaru těles.
- Axiomatická - např. kinematické veličiny mají vektorovou povahu, Newtonovy zákony...

== Rozdělení
- Kinematika
- popis pohybu bez popisu jeho příčiny
- Dynamika
- zkoumání příčin pohybu

- další rozdělení
- tuhé těleso
- hydromechanika - kapaliny, plyny

- další rozložení - podle aproximace reálného tělesa
- hmotný bod
- soustava hmotných bodů
- tuhé těleso
- kontinua - pohyb i deformace, ale bere látku jako spojité prostředí

- ještě další rozdělení - podle f. zákonů
- klasická mechanika
- relativistická mechanika
- speciální
- obecná
- kvantová mechanika


#pb()
= Klasická mechanika
== Absolutní prostor a souřadnicové systémy
- homogení, izotropní, nezávislý na tělesech v něm. Máme v něm Euklidovskou metriku na měření vzdáleností.

Zavádíme souřadnicovou soustavu vzhledem k nějakému vztažnému tělesu - klasicky zavádíme pravotočivý kartézský systém.

Pak definuji polohu těles jak polohový vektor vzhledem k vztažnému tělesu/počátku souřadnicového systému.

$
  ar(r_a) & = vec(x_a, y_a, z_a) \
$

samotná skalární vzdálenost je pak:
$
  abs(ar(r_a)) & = sqrt(x_a^2 + y_a^2 + z_a^2) \
$

mohu také samozřejmě používat jiné SS
- cylindrické souřadnice
- sférické souřadnice

#important[
  převody mezi nimi a jejich detailnější popis byly probrány na cvičení...
]

== Čas
Klasická mechanika vidí jen jako absolutní veličinu, která udává průběh událostí, dobu trvání etc...

== Látka vs Pole
== Oblast zájmu klasické mechaniky
Normální délky, normální rychlosti, normální hmotnosti a gravitační působení...

#pb()
== Kinematika hmotného bodu
- popis pohybu

#image("./photo_2026-09-30_10-03-12.jpg", width: 20em)

$
  ar(r) & = ar(r) (t) \
$

průměrná rychlost:
$
  accent(v, -) & = (s_2-s_1)/(t_2 - t_1) \
$
okamžitá rychlost jako derivace polohy:
$
  ar(v) & = (d ar(r))/(d t) = dt(ar(r)) \
$
rychlost jako vektor:
$
  ar(v) & = vec(v_x, v_y, v_z) = vec(dt(r_x), dt(r_y), dt(r_z))
$

nebo jinak:
$
    dif ar(r) & = d s dot.op tau_0 \
  norm(tau_0) & = 1 \
            v & = (d s)/(d t) \
  ar(tau_0) v & = (d s ar(tau_0))/(d t) \
            v & = (d ar(r))/(d t) \
$

#pb()
nebo zase jinak:
$
            ar(r) & = x ar(i) + y ar(j) + z ar(k) \
  (d ar(r))/(d t) & = (d x)/(d t) ar(i) + (d y)/(d t) ar(j) + (d z)/(d t) ar(k) \
                  & = v_x ar(i) + v_y ar(j) + v_z ar(k) \
$

velikost rychlosti:
$
  v & = norm(ar(v)) \
$

úhly s osami - *směrové kosiny*

$
  cos alpha & = v_x/v \
   cos beta & = v_y/v \
  cos gamma & = v_z/v \
$

*zrychlení*
- prostě 2. derivace polohy bro

$
  ar(a) = dtt(ar(x))\
$

tečné vs normálové zrychlení
- tečné zrychlení mění velikost rychlosti
- normálové zrychlení mění její směr

$
          ar(a) & = ar(a_t) + ar(a_n) \
        ar(a_t) & = (ar(a) dot.op ar(v))/(norm(ar(v))) dot.op ar(v)/norm(ar(v)) \
        ar(a_n) & = ar(a) - ar(a_t) \
  norm(ar(a_n)) & = v^2/R \
         "kde " & R " je poloměr oskulační kružnice ať to je co to je"
$

#pb()
= Klasifikace pohybů
(přímočarý, křivočarý) $times$ (rovnoměrný, zrychlený)

== Rovnoměrný přímočarý pohyb
$
  x & = x(t) \
  x & = v t + x_0 \
$

== Přímočarý rovnoměrně zrychlený
$
  a & = "konst" \
  x & = 1/2 a t^2 + v_0 t + s_0 \
  v & = a t + v_0 \
  a & = a \
$

== Lineární harmonický pohyb - po přímce
časová závislost polohy je dána goniometrickou funkcí $sin$ nebo $cos$

klasický harmonický oscilátor

$
  x(t) & = A sin(omega t + phi) + x_0 \
  v(t) & = A omega cos(omega t + phi) \
  a(t) & = - A omega^2 sin(omega t + phi) = bold(-omega^2 (x-x_0)) \
$

#important(caption: "nový vzorec!")[$
  a(t) & = -omega^2 (x(t)-x_0)
$]

== Rovnoměrný pohyb po kružnici
$
    x(t) & = R cos(omega t + phi) + x_0 \
    y(t) & = R sin(omega t + phi) + y_0 \
         \
  v_x(t) & = - R omega sin(omega t + phi) \
  v_y(t) & = R omega cos(omega t + phi) \
       v & = omega R \
         \
  a_x(t) & = - R omega^2 cos(omega t + phi) \
  a_y(t) & = - R omega^2 sin(omega t + phi) \
       a & = omega^2 R \
$

== Rovnoměrný pohyb po šroubovici
$
  x(t) & = R cos(omega t + phi) + x_0 \
  y(t) & = R sin(omega t + phi) + y_0 \
  z(t) & = k t + z_0 \
$

== Nerovnoměrný pohyb po kružnici
$
  phi(t) & : RR -> RR \
       x & = R cos phi(t) \
       y & = R sin phi(t) \
$

$
    ar(omega) & = (d ar(phi))/(d t) \
  ar(epsilon) & = (d^2 ar(phi))/(d t) = (d ar(omega))/(d t) \
$

i guess?
$
  ar(v) & = ar(omega) times ar(r) \
$

zrychlení je součet normálového a tečného zrychlení

$
  ar(a) = d/(d t) (ar(omega) times ar(r)) = (d ar(omega))/(d t) times ar(r) + ar(omega) times (d ar(r))/(d t) = ar(epsilon) times ar(r) + ar(omega) times ar(v) = ar(a_t) + ar(a_n)\
$

== Otáčivý souřadnicový systém
mám 2 souřadnicové systémy $S$ a $S'$ které se překrývají, jeden se otáčí kolem osy $z$ druhého s konstantní úhlovou rychlostí. V otáčivém systému mám vektor $r$\

$
   (d ar(r))/(d t) & = ar(v) = ar(omega) times ar(r) \
  (d' ar(r))/(d t) & = 0 \
$
derivace se liší o faktor:
$
  (d ar(r))/(d t) - (d' ar(r))/(d t) & = ar(omega) times ar(r) \
$

obecně $ar(B)$
$
  (d ar(B))/(d t) - (d' ar(B))/(d t) & = ar(omega) times ar(B) \
$

= Dynamika hmotného bodu
Sílu si zavádíme jako příčinu pohybu. Síla má statický(deformační) nebo dynamický(měnící pohybový stav těles/hmotných bodů) účinek.
#image("./photo_2026-10-01_14-12-00.jpg")

- Síla je vektor. super.
- Síla působící na hmotný bod je vektor vázaný na bod.

#pb()
== Tření
Statické vs dynamické(kinetické)

Koeficient statického tření je výrazně vyšší než koeficient kinetického tření.

smykové tření:
$
  F_t = mu F_n\
$

== Moment síly
$
    abs(M) & = F r sin alpha \
  => ar(M) & = ar(r) times ar(F) \
$

Vektor $ar(M)$ je z definice kolmý na rovinu definovanou vektory $ar(r)$ a $ar(F)$, je tedy *totožný s osou rotace*.

= Newtonovy zákony
Klasická(Newtonovská) mechanika je založena na třech zákonech.
== Zákon setrvačnosti
Každé těleso setrvává ve stavu klidu nebo rovnoměrného přímočarého pohybu, není-li vnějšími silami nuceno tento stav změnit.

yap yap yap yap

Bude existovat soustava souřadná, kde se těleso jeví jako v klidu a další soustavy kde se těleso jeví v rovnoměrném přímočarém pohybu. Takové soustavy nazýváme inerciálními vztažnými soustavami.

== Zákon síly
Klasikaaa

$
  ar(a) & = ar(F)/m \
$

$
  ar(p) & = m ar(v) \
$

$
  ar(F) & = (d ar(p))/(d t) \
$

setrvačná hmotnost:
$
        F & = m_1 a_1 \
        F & = m_2 a_2 \
  m_1/m_2 & = a_2/a_1 \
$

== Zákon akce a reakce
Pokud těleso 1 působí na těleso 2 silou, působí také těleso 2 na těleso 1 stejně velkou silou opačného směru.
$
  F_(1,2) & = - F_(2,1\)
$

Tyto síly nemůžeme sčítat, jelikož působí na rozdílná tělesa. Tyto síly také spolu vznikají a zanikají.

== Tíha tělesa
Tíha tělesa je síla kterou tělesa podléhají v gravitačním poli Země.
$
  ar(G) & = m ar(g) \
$

Kde $ar(g)$ je *tíhové zrychlení* - vektor mířící přibližně do středu Země.

$
  m_1/m_2 & = G_1/G_2 \
$

#pb()
= Zákon síly znovu

Pohybová rovnice:
$
  ar(F) & = m ar(a) = m (d^2 ar(r))/(d t^2) \
  m a_x & = m (d^2 x)/(d t^2) = F_x \
  m a_y & = m (d^2 y)/(d t^2) = F_y \
  m a_z & = m (d^2 z)/(d t^2) = F_z \
$

Jsou to očividně *diferenciální rovnice druhého řádu*, dobrý no

Pro obecné řešení potřebuji stanovit *počáteční podmínky*, v tomto případě počáteční polohu a počáteční rychlost.


= Silové působení při relativním pohybu
- Mějme soustavu $S$ a $S'$ která se vůči $S$ pohybuje přímočaře
- tedy $ar(r) = ar(r') + ar(R)$

- z toho plyne
$
  ar(v) & = (d ar(r))/(d t) = (d ar(r'))/(d t) + (d ar(R))/(d t) \
  ar(v) & = ar(v') + ar(u) \
$

kde $ar(u)$ je tzv. *unášivá rychlost* - rychlost soustavy $S'$ vůči $S$

a kde $ar(v)$ je tzv. *absolutní rychlost* a $ar(v')$ je *relativní rychlost*

a také:

$
  ar(a) = ar(a') + ar(a_u)
$

a kde $ar(a)$ je tzv. *absolutní zrychlení* a $ar(a')$ je *relativní zrychlení*

#pb()
== Pro interciální $S'$
$S'$ je inerciální pokud $ar(u) = "konst"$

Transformace souřadnic je tedy Galileova Transformace:
$
  ar(r) = ar(r') + ar(u) t\
$

Derivace zrychlení

$
  (d^2 ar(r))/(d t^2) & = (d^2 ar(r'))/(d t^2) \
$

a tedy:

$
  m ar(a) = m ar(a') = ar(F)\
$

Z toho plyne že Newtonovy zákony jsou vůči galileově transformaci *invariantní*.

== Pro neinerciální $S'$
$S'$ je neinerciální pokud $ar(v_u) != "konst"$ a tedy $ar(a_u) != 0$

$
     ar(a) & = ar(a') + ar(a_u) \
    ar(a') & = ar(a) - ar(a_u) \
  m ar(a') & = m ar(a) - m ar(a_u) \
    ar(F') & = ar(F) + ar(F^*) \
$

kde $ar(F^*) = -m ar(a_u)$ je síla *zdánlivá* nebo také síla *setrvačná*

Vidíme že Newtonovy zákony *neplatí* v neinerciální vztažné soustavě.

=== Příklad 1.
Mějme vozík na kterém je závaží na pružině

Vozík zrychluje se zrychlením $ar(a)$ a tím pádem na pružinu působí síla $m ar(a)$ v inerciální soustavě(pohled zvenčí), což dává smysl...

V soustavě spojené s vozíkem pozorujeme zdánlivou sílu $-m ar(a)$ - pružina se natáhne nebo smrští

#pb()
=== Příklad 2. - v otáčivé soustavě
Mějme soustavu(neinerciální) otáčející se kolem počátku jiné soustavy(inerciální):

Popíšeme zdánlivou sílu/zrychlení(odstředivé):

$S'$ rotuje kolem počátku $S$, tedy $O equiv O'$

$
  ar(v) & = ar(omega) times ar(r) \
  ar(r) & = ar(r') \
  ar(v) & = ar(v') + ar(u) = ar(v') + ar(omega) times ar(r) \
  (d ar(r))/(d t) & = (d 'r)/(d t) + ar(omega) times ar(r) \
  (d ar(v'))/(d t) & = (d 'v')/(d t) + ar(omega) times ar(v') \
  (d ar(v'))/(d t) & = ar(a') + ar(omega) times ar(v') \
  ar(a') & = (d ar(v'))/(d t) - ar(omega) times ar(v') \
  ar(v') & = ar(v) - ar(omega) times ar(r) \
  ar(a') & = d/(d t) (ar(v) - ar(omega) times ar(r)) - ar(omega) times ar(v') \
  ar(a') & = (d ar(v))/(d t) - ar(epsilon) times ar(r)- ar(omega) times ar(v) - ar(omega) times ar(v') \
  ar(F') &= m ar(a') - m(ar(epsilon) times ar(r)) - m ar(a) times (ar(omega) times ar(r)) - 2m ar(omega) times ar(v')\
$

máme tedy 3 zdánlivé síly:

(1)
$
  ar(F^*) = -m ar(epsilon) times ar(r) = - m ar(a_u)\
$

je li úhlová rychlost, tato síla vymizí

(2)
$
  ar(F_o) = -m ar(omega) times (ar(omega) times ar(r))\
$

toto je *odstředivá síla*

(3)
$
  ar(F_c) = - 2m (ar(omega) times ar(v'))
$
toto je *Coriolisova síla* kde $ar(F_c) = 0$ pokud $ar(omega) parallel ar(v')$

#pb()
= Odvozené mechanické veličiny
Práce, energie, hybnost, impulz, moment hybnosti
- zkoumám účinek síly dle dráhy a dle času

== Dráhový účinek síly
$
                                 m ar(a) & = m (d ar(v))/(d t) = ar(F) \/ dot.op d ar(r) \
        m (d ar(r))/(d t) dot.op d ar(v) & = ar(F) d ar(r) \
                  m ar(v) dot.op d ar(v) & = ar(F) d ar(r) \
                                   ar(v) & = v ar(tau_0) \
                    ar(v) dot.op d ar(v) & = v ar(tau_0) dot.op d(v ar(tau_0)) \
                          d(v ar(tau_0)) & = d v ar(tau_0) + v d ar(tau_0) \
                    ar(v) dot.op d ar(v) & = v d v + v^2 ar(tau_0) dot.op d ar(tau_0) \
  bold(m v d v & = ar(F) dot.op d ar(r)) \
$

Integruji idk

mějme $ar(r_1); ar(v_1)$ a $ar(r_2); ar(v_2)$

$
  integral_ar(v_1)^ar(v_2) m v d v & = [1/2 m v^2]_(v_1)^(v_2) = integral_ar(r_1)^ar(r_2) ar(F) dot.op d ar(r) \
     1/2 m (v_2)^2 - 1/2 m (v_1)^2 & = A_(1,2) \
                 E_(k 1) - E_(k 2) & = A_(1,2) = W_(1,2) \
$

A tedy

$
  E_(k 1) - E_(k 2) & = A_(1,2) = integral_ar(r_1)^ar(r_2) ar(F) dot.op d ar(r) \
                d a & = ar(F) d ar(r) \
                d a & = ar(F) ar(tau_0) d s \
                d a & = F d s cos alpha \
$

Z čehož plyne fakt že práci koná jen *tečná* složka síly.

#pb()
== Silová(vektorová) pole
- např. tíhové pole - uvažujeme $ar(G) = m ar(g) = "konst"$

#figure(
  cetz.canvas(length: 1.1cm, {
    import cetz.draw: *

    // Standard right-handed physics orientation:
    // x: right (+u)
    // y: top (+v)
    // z: outwards from page (projected down-left at 225 deg: -u, -v)
    let proj(x, y, z) = (
      x - 0.55 * z,
      y - 0.40 * z,
    )

    let o = proj(0, 0, 0)
    let p1 = proj(1.8, 3.4, 1.2)
    let p2 = proj(5.2, 1.2, 0.6)
    let pm = proj(3.4, 2.3, 0.9)

    // Coordinate Axes
    line(o, proj(6.2, 0, 0), stroke: 0.6pt, mark: (end: ">")) // x-axis
    line(o, proj(0, 4.2, 0), stroke: 0.6pt, mark: (end: ">")) // y-axis
    line(o, proj(0, 0, 2.6), stroke: 0.6pt, mark: (end: ">")) // z-axis

    content(proj(6.4, 0, 0), $x$, anchor: "west")
    content(proj(0, 4.4, 0), $y$, anchor: "south")
    content(proj(0, 0, 2.8), $z$, anchor: "north-east")
    content(o, $O$, anchor: "north-east", padding: 0.1)

    // Projections of points 1 and 2 to the y-axis
    let py1 = proj(0, 3.4, 0)
    let py2 = proj(0, 1.2, 0)
    line(p1, py1, stroke: (dash: "dashed", paint: luma(120), thickness: 0.5pt))
    line(p2, py2, stroke: (dash: "dashed", paint: luma(120), thickness: 0.5pt))
    circle(py1, radius: 0.04, fill: luma(100))
    circle(py2, radius: 0.04, fill: luma(100))
    content(py1, $y_1$, anchor: "east", padding: 0.08)
    content(py2, $y_2$, anchor: "east", padding: 0.08)

    // Position vectors r_1 and r_2
    line(o, p1, stroke: (paint: blue.darken(20%), thickness: 0.9pt), mark: (end: ">"))
    line(o, p2, stroke: (paint: blue.darken(20%), thickness: 0.9pt), mark: (end: ">"))
    content(proj(0.9, 1.8, 0.6), $ar(r)_1$, anchor: "south-east", padding: 0.06)
    content(proj(2.6, 0.6, 0.3), $ar(r)_2$, anchor: "north-west", padding: 0.06)

    // Trajectory path (Bézier curve)
    bezier(
      p1,
      p2,
      proj(2.6, 3.0, 1.6),
      proj(4.2, 1.8, 0.4),
      stroke: (paint: black, thickness: 0.9pt),
    )

    // Endpoints 1 and 2
    circle(p1, radius: 0.05, fill: black)
    circle(p2, radius: 0.05, fill: black)
    content(p1, $1$, anchor: "south-east", padding: 0.08)
    content(p2, $2$, anchor: "south-west", padding: 0.08)

    // State point on the trajectory
    circle(pm, radius: 0.05, fill: red.darken(20%))

    // Force vectors at pm:
    // Downward gravity vector G along -y direction
    let g-len = 1.3
    let p-g = proj(3.4, 2.3 - g-len, 0.9)

    // Normalized tangent direction along descending trajectory: ~ (+0.92, -0.38, 0)
    // Angle alpha between -y and tangent vector tau (~ 67 deg)
    let t-len = g-len * 0.40
    let p-gt = proj(3.4 + t-len * 0.92, 2.3 - t-len * 0.38, 0.9)

    // Vector G
    line(pm, p-g, stroke: (paint: red.darken(10%), thickness: 1pt), mark: (end: ">"))
    content(p-g, $ar(G)$, anchor: "north")

    // Tangential vector G_t
    line(pm, p-gt, stroke: (paint: red.darken(10%), thickness: 1pt), mark: (end: ">"))
    content(p-gt, $G cos alpha$, anchor: "west", padding: 0.08)

    // Dotted orthogonal projection from G onto tangent line
    line(p-g, p-gt, stroke: (dash: "dotted", paint: luma(120), thickness: 0.5pt))

    // Angle alpha arc visualization
    let r-arc = 0.45
    arc(
      (pm.at(0), pm.at(1) - r-arc),
      start: -90deg,
      stop: -23deg,
      radius: r-arc,
      stroke: 0.5pt,
    )
    content((pm.at(0) + 0.16, pm.at(1) - 0.32), $alpha$, anchor: "north-west")
  }),
)

Práce v tíhovém poli

$
  A_(1,2) & = - integral_1^2 G d s cos alpha \
          & = -G integral_1^2 d s cos alpha \
          & = - G integral_(y_1)^(y^2) d y \
          & = - G [y]_(y_1)^(y_2) \
          & = G y_1 - G y_2 \
          \
          & = m g y_1 - m g y_2 \
$
#important[$
  & = E_(p 1) - E_(p 2) \
$]

kde *$m g y = E_p$* je potenciální energie

a tedy

$
            A_(1 2) & = E_(p 1) - E_(p 2) = E_(k 2) - E_(k 1) \
  E_(k 1) + E_(p 1) & = E_(k 2) + E_(p 2) = E = "konst" \
$

tedy se v tomto případě zachovává mechanická energie.

#pb()
- Mějme uzavřenou křivku v tomto poli

#import "@preview/cetz:0.5.2"

#figure(
  cetz.canvas(length: 1.1cm, {
    import cetz.draw: *

    // Projection adhering to convention: x -> right, y -> top, z -> outwards (down-left)
    let proj(x, y, z) = (
      x - 0.55 * z,
      y - 0.40 * z,
    )

    let o = proj(0, 0, 0)

    // Points on the closed curve (z = 0 plane)
    let p1 = proj(1.8, 3.6, 0)
    let p2 = proj(4.6, 1.4, 0)

    // Coordinate Axes
    line(o, proj(5.8, 0, 0), stroke: 0.6pt, mark: (end: ">")) // x-axis
    line(o, proj(0, 4.4, 0), stroke: 0.6pt, mark: (end: ">")) // y-axis
    line(o, proj(0, 0, 2.2), stroke: 0.6pt, mark: (end: ">")) // z-axis

    content(proj(6.0, 0, 0), $x$, anchor: "west")
    content(proj(0, 4.6, 0), $y$, anchor: "south")
    content(proj(0, 0, 2.4), $z$, anchor: "north-east")
    content(o, $O$, anchor: "north-east", padding: 0.08)

    // Smooth closed trajectory in the xy-plane passing through states 1 and 2
    catmull(
      p1,
      proj(3.2, 4.1, 0),
      proj(4.8, 3.2, 0),
      p2,
      proj(3.5, 0.8, 0),
      proj(1.5, 1.2, 0),
      proj(1.1, 2.4, 0),
      close: true,
      stroke: (paint: black, thickness: 0.9pt),
    )

    // Projections of points 1 and 2 to the y-axis
    let py1 = proj(0, 3.6, 0)
    let py2 = proj(0, 1.4, 0)

    line(p1, py1, stroke: (dash: "dashed", paint: luma(120), thickness: 0.5pt))
    line(p2, py2, stroke: (dash: "dashed", paint: luma(120), thickness: 0.5pt))

    circle(py1, radius: 0.04, fill: luma(100))
    circle(py2, radius: 0.04, fill: luma(100))

    content(py1, $y_1$, anchor: "east", padding: 0.08)
    content(py2, $y_2$, anchor: "east", padding: 0.08)

    // Endpoints 1 and 2
    circle(p1, radius: 0.05, fill: black)
    circle(p2, radius: 0.05, fill: black)

    content(p1, $1$, anchor: "south-east", padding: 0.08)
    content(p2, $2$, anchor: "north-west", padding: 0.08)
  }),
)

- V tomto poli pak pro pohyb z $1$ do $2$ a pak z $2$ do $1$ platí:

$
  A = A_(1 2) + A_(2 1) = E_(p 1) - E_(p 2) + E_(p 2) - E_(p 1) = bold(0)
$

- z toho plyne důležitá podmínka pro tzv. *konzervativní* silová pole:

#important[$
  integral.cont ar(F) d ar(r) = 0
$]

- tedy integrál síly na uzavřené křivce je roven nule
- a tedy zásadní vlastností konzervativních silových polí je to, že respektují zákon zachování mechanické energie
- opakem konzervativních silových polí jsou pole dissipativní, kde tento zákon neplatí
- např. vlivem třecích sil

== Výkon
- Výkonem označujeme časovou derivaci práce

$
  P = (d A)/(d t) = dt(A) = (ar(F) d ar(r))/(d t) = ar(F) ar(v)
$

a tedy

$
  A = P t
$

#pb()
== Stokesova věta vektorové analýzy
- Silové pole nazýváme konzervativní, jestliže pro něj platí:
$
  integral.cont ar(F) d ar(r) = 0
$

- Silové pole nazýváme dissipativní, jestliže pro něj platí:
$
  integral.cont ar(F) d ar(r) != 0
$

- Tento integrál se dá také zapsat jako:

$
  integral.cont ar(F) d ar(r) = integral.double "rot" ar(F) dot.op d ar(s) = integral.double nabla times ar(F) dot.op d ar(s)\
$

kde

$
  nabla times ar(F) = vec((partial F_z)/(partial y) - (partial F_y)/(partial z), (partial F_x)/(partial z) - (partial F_z)/(partial x), (partial F_y)/(partial x) - (partial F_x)/(partial y))\
  nabla times ar(F) = det mat(
    accent(i, hat), accent(j, hat), accent(k, hat);
    partial/(partial x), partial/(partial y), partial/(partial z);
    F_x, F_y, F_z;
  )\
$

== Intenzita a potenciál silového pole

$
    E_p & = E_p(x,y,z) "    hledáme diferenciál " d E_p \
  d E_p & = (partial E_p)/(partial x) d x + (partial E_p)/(partial y) d y + (partial E_p)/(partial z) d z \
  d E_p & = - d A = - ar(F) dot.op d ar(r) = - (F_x dif x + F_y dif y + F_z d z) \
    F_x & = -(partial E_p)/(partial x) \
    F_y & = -(partial E_p)/(partial y) \
    F_z & = -(partial E_p)/(partial z) \
        \
  ar(F) & =- vec((partial E_p)/(partial y), (partial E_p)/(partial y), (partial E_p)/(partial z)) = - nabla dot.op E_p \
$

#pb()
=== Základní charakteristiky silového pole
- pro porovnání polí zavádíme tzv. *intentzitu*
- síla působící na jednotkovou hmotnost
$
  ar(I) = ar(F)/m "    " [N dot.op k g^-1]
$

- a dále zavádíme tzv. *potenciál*

$
  V & = (E_p)/m "    " [J dot.op k g^-1] \
$

kde

#important[$
  ar(I) & = - nabla dot.op V \
$]

#pb()
== Časový účinek síly
$
  (d ar(p))/(d t) & = ar(F) \/ dot.op d t \
          d ar(p) & = ar(F) d t \
$

#important(caption: "impulz síly")[$
  ar(p_2) - ar(p_1) = integral_(t_1)^(t_2) ar(F) d t = ar(cal(I))
$]

#important()[$
  ar(cal(I)) = ar(F) (t_2 - t_1)
$]

== Moment hybnosti
$
                        m ar(a) & = m (d ar(v))/(d t) = ar(F) \/ times ar(r) \
  m (d ar(v))/(d t) times ar(r) & = ar(F) times ar(r) = ar(M) \
  m d/(d t) (ar(r) times ar(v)) & = d/(d t) (ar(r) times m ar(v)) = d/(d t) (ar(r) times ar(p)) = (d ar(b))/(d t) = ar(M) \
$

- kde $ar(b)$ je moment hybnosti

#important[$
  ar(M) = (d ar(b))/(d t)
$]

#pb()
= Gravitační pole
$
  F = kappa.alt (m_1 m_2)/r^2
$

kde $kappa.alt = (6.6743 plus.minus 0.0002) dot.op 10^(-11) m^3 k inv(g) s^(-2)$

#figure(
  cetz.canvas(length: 1.1cm, {
    import cetz.draw: *

    // Orientation convention: x -> right, y -> top, z -> outwards (down-left)
    let proj(x, y, z) = (
      x - 0.55 * z,
      y - 0.40 * z,
    )

    let o = proj(0, 0, 0)

    // Positions placed in distinct quadrants relative to origin to ensure clear vector separation:
    // m1: high on y, close to xz-plane
    // m2: far along x, low on y, displaced in z
    let p1 = proj(1.2, 4.2, 0.4)
    let p2 = proj(5.4, 1.3, 1.2)

    // Coordinate Axes
    line(o, proj(6.4, 0, 0), stroke: 0.6pt, mark: (end: ">")) // x-axis
    line(o, proj(0, 4.8, 0), stroke: 0.6pt, mark: (end: ">")) // y-axis
    line(o, proj(0, 0, 2.2), stroke: 0.6pt, mark: (end: ">")) // z-axis

    content(proj(6.6, 0, 0), $x$, anchor: "west")
    content(proj(0, 5.0, 0), $y$, anchor: "south")
    content(proj(0, 0, 2.4), $z$, anchor: "north-east")
    content(o, $O$, anchor: "north-east", padding: 0.08)

    // Position vectors r_1 and r_2 (clearly separated)
    line(o, p1, stroke: (paint: blue.darken(20%), thickness: 0.9pt), mark: (end: ">"))
    line(o, p2, stroke: (paint: blue.darken(20%), thickness: 0.9pt), mark: (end: ">"))
    content(proj(0.6, 2.1, 0.2), $ar(r)_1$, anchor: "east", padding: 0.08)
    content(proj(2.7, 0.65, 0.6), $ar(r)_2$, anchor: "north", padding: 0.08)

    // Connecting line of interaction (distance r)
    line(p1, p2, stroke: (dash: "dashed", paint: luma(120), thickness: 0.6pt))

    // Distance label r placed centrally along the dashed segment
    let p-mid = proj(3.3, 2.75, 0.8)
    content(p-mid, $r$, anchor: "south-west", padding: 0.08)

    // Relative displacement vector from m1 to m2:
    // delta = (4.2, -2.9, 0.8), length ~ 5.166
    // Unit vector: u ~ (0.813, -0.561, 0.155)
    let f-mag = 1.3
    let f-dx = f-mag * 0.813
    let f-dy = f-mag * (-0.561)
    let f-dz = f-mag * 0.155

    // Gravitational force on m_1 directed toward m_2: F_1
    let p1-f = proj(1.2 + f-dx, 4.2 + f-dy, 0.4 + f-dz)
    line(p1, p1-f, stroke: (paint: red.darken(15%), thickness: 1.1pt), mark: (end: ">"))
    content(p1-f, $ar(F)_1$, anchor: "north-west", padding: 0.08)

    // Gravitational force on m_2 directed toward m_1: F_2 (equal and opposite)
    let p2-f = proj(5.4 - f-dx, 1.3 - f-dy, 1.2 - f-dz)
    line(p2, p2-f, stroke: (paint: red.darken(15%), thickness: 1.1pt), mark: (end: ">"))
    content(p2-f, $ar(F)_2$, anchor: "south-east", padding: 0.08)

    // Masses m_1 and m_2
    circle(p1, radius: 0.09, fill: black)
    circle(p2, radius: 0.13, fill: black)

    content(p1, $m_1$, anchor: "south", padding: 0.12)
    content(p2, $m_2$, anchor: "north-west", padding: 0.12)
  }),
)

#important[$
  F_(2 1) = - kappa.alt (m_1 m_2)/norm(ar(r_2) - ar(r_1))^2 dot.op (ar(r_1) - ar(r_2))/norm(ar(r_2) - ar(r_1))\
  F_(1 2) = - kappa.alt (m_2 m_1)/norm(ar(r_1) - ar(r_2))^2 dot.op (ar(r_2) - ar(r_1))/norm(ar(r_1) - ar(r_2))\
$]

#pb()
#figure(
  cetz.canvas(length: 1.15cm, {
    import cetz.draw: *

    // x: right, y: top, z: outwards (down-left)
    let proj(x, y, z) = (
      x - 0.55 * z,
      y - 0.40 * z,
    )

    let o = proj(0, 0, 0)

    // Axes
    line(o, proj(6.2, 0, 0), stroke: 0.6pt, mark: (end: ">"))
    line(o, proj(0, 5.0, 0), stroke: 0.6pt, mark: (end: ">"))
    line(o, proj(0, 0, 2.2), stroke: 0.6pt, mark: (end: ">"))

    content(proj(6.4, 0, 0), $x$, anchor: "west")
    content(proj(0, 5.2, 0), $y$, anchor: "south")
    content(proj(0, 0, 2.4), $z$, anchor: "north-east")

    // Trajectory defined via cubic Bezier
    // B(t) = (1-t)^3 P0 + 3(1-t)^2 t P1 + 3(1-t) t^2 P2 + t^3 P3
    let p0 = (1.2, 4.4, 0.3)
    let c1 = (2.6, 4.5, 0.4)
    let c2 = (4.6, 3.8, 0.2)
    let p3 = (5.4, 2.2, 0.1)

    // State 1 and State 2 vectors
    let p1-2d = proj(..p0)
    let p2-2d = proj(..p3)

    line(o, p1-2d, stroke: (paint: blue.darken(20%), thickness: 0.9pt), mark: (end: ">"))
    line(o, p2-2d, stroke: (paint: blue.darken(20%), thickness: 0.9pt), mark: (end: ">"))
    content(proj(0.6, 2.3, 0.15), $ar(r)_1$, anchor: "east", padding: 0.08)
    content(proj(3.0, 1.2, 0.05), $ar(r)_2$, anchor: "north-west", padding: 0.08)

    // Draw trajectory
    bezier(
      p1-2d,
      p2-2d,
      proj(..c1),
      proj(..c2),
      stroke: (paint: black, thickness: 0.9pt),
    )

    // Endpoints
    circle(p1-2d, radius: 0.05, fill: black)
    circle(p2-2d, radius: 0.05, fill: black)
    content(p1-2d, $1$, anchor: "south-east", padding: 0.08)
    content(p2-2d, $2$, anchor: "west", padding: 0.1)

    // Exact evaluation at t = 0.48 so m is guaranteed ON the path
    let t = 0.48
    let omt = 1.0 - t
    let bz(i) = (
      calc.pow(omt, 3) * p0.at(i)
        + 3 * calc.pow(omt, 2) * t * c1.at(i)
        + 3 * omt * calc.pow(t, 2) * c2.at(i)
        + calc.pow(t, 3) * p3.at(i)
    )
    let pm-3d = (bz(0), bz(1), bz(2))
    let pm = proj(..pm-3d)

    // Position vector r(t) to mass m on the path
    line(o, pm, stroke: (dash: "dashed", paint: luma(110), thickness: 0.7pt), mark: (end: ">"))
    content(
      proj(pm-3d.at(0) * 0.55, pm-3d.at(1) * 0.55, pm-3d.at(2) * 0.55),
      $ar(r)$,
      anchor: "south-east",
      padding: 0.06,
    )

    // Gravitational attractive force F pointing directly from m toward origin M
    let r-len = calc.sqrt(calc.pow(pm-3d.at(0), 2) + calc.pow(pm-3d.at(1), 2) + calc.pow(pm-3d.at(2), 2))
    let f-mag = 1.45
    let p-f = proj(
      pm-3d.at(0) - f-mag * (pm-3d.at(0) / r-len),
      pm-3d.at(1) - f-mag * (pm-3d.at(1) / r-len),
      pm-3d.at(2) - f-mag * (pm-3d.at(2) / r-len),
    )
    line(pm, p-f, stroke: (paint: red.darken(15%), thickness: 1.1pt), mark: (end: ">"))
    content(p-f, $ar(F)$, anchor: "east", padding: 0.08)

    // Mass m on trajectory
    circle(pm, radius: 0.08, fill: black)
    content(pm, $m$, anchor: "south-west", padding: 0.1)

    // Central mass M at origin (drawn last so axes don't clip through it awkwardly)
    circle(o, radius: 0.18, fill: gray.darken(40%))
    content(o, $M$, anchor: "north-west", padding: 0.22)
  }),
)

Pro velké(hmotné) těleso v počátku(např. slunce)

$
  ar(I) = ar(F)/m\
  \
  A_(1,2) = integral_ar(r_1)^ar(r_2) m ar(I) d ar(r)\
  A_(1,2) = integral_ar(r_1)^ar(r_2) ar(F) d ar(r)\
  A_(1,2) = integral_ar(r_1)^ar(r_2) - kappa.alt (m M)/norm(ar(r))^2 dot.op ar(r)/norm(r) d ar(r)\
  A_(1,2) = - kappa.alt m M integral_ar(r_1)^ar(r_2) 1 /norm(ar(r))^2 dot.op ar(r)/norm(r) d ar(r)\
  A_(1,2) = - kappa.alt m M integral_(r_1)^(r_2) 1 /r^2 d r\
  A_(1,2) = kappa.alt m M [1/r]_(r_1)^(r_2)\
  A_(1,2) = kappa.alt m M (1/r_2 - 1/r_1)\
$

Tím pádem stanovím nulovou hladinu gravitační potenciální energie $E_p$ do $r = infinity$


#pb()

Práce v gravitačním poli a potenciální energie

$
  E_(p 2) - E_(p 1) = - A_(12) & = -kappa.alt m M (1/r_2 - 1/r_1) \
         - (E_(p 1) - E_(p 2)) & = kappa.alt m M (1/r_1 - 1/r_2) \
                       E_(p 2) & = 0 \
                           r_2 & = infinity \
                           E_p & = -(kappa.alt m M)/r \
$

Potenciál gravitačního pole

$
  V & = E_p/m \
  V & = -(kappa.alt M)/r \
  V & = -(kappa.alt M)/sqrt(x^2 + y^2 + z^2) \
$

A jelikož

$
  ar(F) = - nabla E_p\
  ar(I) = - nabla V\
$

#pb()
= Příklad(moc ne no)
#theorem(title: [Gaussova-Ostrogradského věta])[
  $
    "objem " V " v prostoru ohraničen plochou "S\
    \
    integral.surf ar(F) dot.op d ar(S) = integral.triple nabla dot.op ar(F) d V\
    "kde " nabla dot.op ar(F) "je divergence"\
  $
]

kámo pro gravitační pole nebo tak něco:

$
  integral.surf ar(I) dot.op d ar(S) = -4 pi kappa.alt sum_(i in V) m_i
$

#pb()
= Příklad(asi nějakej co můžeme i vyřešit)
Intenzita gravitačního pole na kulové ploše.

mějme $m; space r;$

$
                                   I & = I(r) \
  integral.surf ar(I) dot.op d ar(S) & = I integral.surf_(ar(S)(V)) d S \
                                     & = 4 pi r^2 I \
$

použiju gaussovu-ostrogradského větu???

$
  4 pi r^2 I & = - 4 pi kappa.alt m \
       r^2 I & = - kappa.alt m \
           I & = - (kappa.alt m)/(r^2) \
$

#pb()
= Příklad(tentokrát prosím ať je to něco normálního)
Mějme homogenní kouli o poloměru $R$, bla bla bla není co počítat - nahradíme hmotným bodem

#pb()
= Příklad(nějaký počítání třeba pls pls?)
Intenzita ve vzdálenosti $r$ od středu homogenní koule kde $r < R$
$
  4 pi r^2 I(r) & = -4 pi kappa.alt (4/3 pi r^3)/(4/3 pi R^3) M \
           I(r) & = - kappa.alt M r/R^3 \
$

= Příklad(Agartha)
Uvnitř intenzita 0

#pb()
= Pohyb v zemském tíhovém poli
$
  - kappa.alt M_z ar(r)/r^3 -> - (kappa.alt M_z ar(r_0))/(R_z)^2
$

a pak 2. newtonův zákon
$
  m ar(g) = - kappa.alt (m M_z)/(R_z)^2 dot.op ar(r_0)\
  g = (kappa.alt M_z)/(R_z)^2 dot.op\
$

== Pohybové rovnice

=== Zrychlení

$
  cancel(m) (dif^2 x)/(dif t^2) & = 0 \
  cancel(m) (dif^2 y)/(dif t^2) & = -g \
  cancel(m) (dif^2 z)/(dif t^2) & = 0 \
$

=== Rychlost

$
  (dif x)/(dif t) & = v_0_x \
  (dif y)/(dif t) & = v_0_y - g t \
  (dif z)/(dif t) & = v_0_z \
$

#pb()
=== Poloha

$
  x & = v_0_x t + x_0 \
  y & = v_0_y t - 1/2 g t^2 + y_0 \
  z & = v_0_z t + z_0 \
$

obecně

$
  ar(r) = ar(r_0) + ar(v_0) t + 1/2 ar(g) t^2\
$

pak pro šikmý vrh

$
  x & = v_0 t cos alpha \
  y & = v_0 t sin alpha \
$

#cetz.canvas({
  import cetz.draw: *

  let ang = 48.37deg

  line((-1, 0), (9.5, 0), mark: (end: ">"), name: "xaxis")
  line((0, -0.5), (0, 3.4), mark: (end: ">"), name: "yaxis")
  content("xaxis.end", [x], anchor: "west", padding: 0.1)
  content("yaxis.end", [y], anchor: "south", padding: 0.1)

  let pts = range(41).map(i => {
    let t = i / 40
    (8 * t, 9 * t - 9 * t * t)
  })
  line(..pts, stroke: blue.darken(20%))

  circle((0, 0), radius: 0.06, fill: black)

  let v0 = (1.66, 1.87)
  line((0, 0), v0, mark: (end: ">"), name: "v0")
  content("v0.end", [$v_0$], anchor: "north-west", padding: 0.1)

  arc((0, 0), start: 0deg, stop: ang, radius: 0.9)
  content((1.05, 0.47), [$alpha$], anchor: "center")

  let P = (6, 1.6875)
  let V = (7.568, 0.805)
  circle(P, radius: 0.05, fill: black)
  line(P, V, mark: (end: ">"), name: "v")
  content("v.end", [$v$], anchor: "east", padding: 0.1)
  line(P, (V.at(0), P.at(1)), stroke: (dash: "dashed", paint: gray))
  line((V.at(0), P.at(1)), V, stroke: (dash: "dashed", paint: gray))
  content((6.8, 1.6875), [$v_x$], anchor: "south", padding: 0.08)
  content((7.65, 1.25), [$v_y$], anchor: "west", padding: 0.08)

  line((6.5, 3.2), (6.5, 2.4), mark: (end: ">"), name: "g")
  content("g.end", [$g$], anchor: "west", padding: 0.12)
})

#pb()
= Keplerovy zákony
#definition(title: [Centrální silové pole])[
  $
    ar(F)(ar(r)) = f(r) dot.op ar(r)/r
  $
]

#claim[
  $ar(M) = 0$   $(dif ar(B))/(dif t) = 0$ tím pádem $ar(B) = "konst."$

  $(dif ar(b))/(dif t) = 0$ tím pádem $ar(b) = "konst."$
]

#proof[
  $ar(M) = ar(r) times ar(F) = ar(r) times f(r) ar(r)/r = 0$


  $
                              ar(I) = ar(b_0) & = "konst." \
    norm(ar(b_0)) = norm(ar(r) times m ar(v)) & = m r v sin alpha \
                                      ar(b_0) & perp ar(r), ar(v) \
                                              & "pohyb je rovinný" \
  $
]

#cetz.canvas({
  import cetz.draw: *

  let ea = 4.8
  let eb = 3.2
  let P = (3.677, 2.057)
  let R = (3.212, 2.378)
  let v-end = (5.556, 0.564)

  let orbit-pts = range(13).map(i => {
    let t = (40 + 5 * i) * calc.pi / 180
    (ea * calc.cos(t), eb * calc.sin(t))
  })
  line(..orbit-pts, name: "orbit")

  circle(P, radius: 0.09, fill: black, stroke: none)

  line((0, 0), P, mark: (end: ">"), name: "r")
  line(P, v-end, mark: (end: ">"), name: "v")
  line(R, P, mark: (end: ">"), name: "dr")

  arc(P, start: -38.5deg, stop: 29.2deg, radius: 1.2, name: "alpha")

  circle((0, 0), radius: 0.18, fill: black, stroke: none)

  content((0, -0.3), [$M$], anchor: "north")
  content("r.mid", [$r$], anchor: "south", padding: 0.15)
  content("v.end", [$v$], anchor: "east", padding: 0.12)
  content((rel: (0.23, 0.33), to: "dr.mid"), [$dif r$], anchor: "south-west", padding: 0.05)
  content((5.15, 1.94), [$alpha$], anchor: "center")
})

$
  dif S = 1/2 norm(ar(r) times dif ar(r)) & = 1/2 r dif r sin alpha \
                    v_p = (dif S)/(dif t) & = 1/2 r v sin alpha = b_0/(2 m) = "konst." \
$

plošná rychlost je konstantní, dává smysl - tedy 2. Keplerův zákon

$
  m (dif^2 r)/(dif t^2) & = - kappa.alt (m M)/(r^2) ar(r) \
$

#pb()
platí ZZME, ZZMH

- pohyb rovinný, použijeme polární souřadnice

$
  x & = R cos phi \
  y & = R sin phi \
$

celková energie:

$
  E & = E_k + E_p = 1/2 m v^2 - kappa.alt (M m)/r \
$

musíme určit vektor rychlosti

$
  (dif x)/(dif t) & = (dif r)/(dif t) cos phi - r sin phi (dif phi)/(dif t) \
  (dif y)/(dif t) & = (dif r)/(dif t) sin phi + r cos phi (dif phi)/(dif t) \
  v^2 & = v_x^2 + v_y^2 \
  v_x^2 & = ((dif r)/(dif t))^2 cos^2 phi - 2 cos phi sin phi r (dif r)/(dif t) (dif phi)/(dif t) + ((dif phi)/(dif t))^2 r^2 sin^2 phi ((dif phi)/(dif t))^2 \
  v_y^2 & = ((dif r)/(dif t))^2 sin^2 phi + 2 cos phi sin phi r (dif r)/(dif t) (dif phi)/(dif t) + ((dif phi)/(dif t))^2 r^2 cos^2 phi ((dif phi)/(dif t))^2\
  v^2 &= ((dif r)/(dif t))^2 + r^2 ((dif phi)/(dif t))^2\
$

a

$
  ar(b_0) = ar(r) times m ar(v) = x m v_y - y m v_x\
  ar(b_0) = m(r cos phi ((dif r)/(dif t) sin phi + r cos phi (dif phi)/(dif t))) - m (r sin phi ((dif r)/(dif t) - r sin phi (dif phi)/(dif t)))\
  ar(b_0) = m r (r cos^2 phi (dif phi)/(dif t) + r sin^2 phi (dif phi)/(dif t))\
  abs(ar(b_0)) = m r^2 (dif phi)/(dif t)\
$

a zpět:

$
                  E & = E_k + E_p = 1/2 m v^2 - kappa.alt (m M)/r \
                    & = 1/2 m (((dif r)/(dif t))^2 + r^2 ((dif phi)/(dif t))^2) - kappa.alt (m M)/r = E_0 \
                    \
                b_0 & = m r^2 (dif phi)/(dif t) \
  (dif phi)/(dif t) & = (b_0)/(m r^2) \
                    \
                  E & = 1/2 m (((dif r)/(dif t))^2 + (b_0^2)/(m^2 r^2) ) - kappa.alt (m M)/r \
                  E & = 1/2 m (((dif r)/(dif t))^2 + (b_0^2)/(m^2 r^2) ) - alpha/r \
                    \
        "kde" alpha & = kappa.alt m M \
$

#pb()
= Kmitavý pohyb
- Nejednodušší lineární harmonický oscilátor
== Netlumený harmonický kmit

$
  F = - k x\
$

je vratná síla

a pohybové rovnice jsou:

$
       m (dif^2 x)/(dif t^2) & = -k x \
  m(dif^2 x)/(dif t^2) + k x & = 0 \
$

lineární diferenciální rovnice s konstantními koeficienty
- odhadneme řešení jako funkci která je nulová po derivaci idk

$
  x = c e^(lambda t)\
$

$
  (dif^2)/(dif t^2) c e^(lambda t) = c e^(lambda t) lambda^2\
$

$
  m c lambda^2 e^(lambda t) + k c e^(lambda t) & = 0 \
                                m lambda^2 + k & = 0 \
                                        lambda & = plus.minus i sqrt(k/m) \
$

$
         y_H(t) & = c_1 e^(t i sqrt(k/m)) + c_2 e^(t -i sqrt(k/m)) \
         y_H(t) & = c_1 (cos(sqrt(k/m) t) + i sin(sqrt(k/m)) t) + c_2 (cos(sqrt(k/m) t) - i sin(sqrt(k/m)t))) \
         y_H(t) & = c_1 cos(sqrt(k/m) t) + c_1 i sin(sqrt(k/m) t) + c_2 cos(sqrt(k/m)t) - c_2 i sin(sqrt(k/m)t) \
         y_H(t) & = (c_1+c_2) cos(sqrt(k/m) t) + i (c_1 - c_2) sin(sqrt(k/m)t) \
      c_1 + c_2 & = A sin alpha \
  i (c_1 - c_2) & = A cos alpha \
         y_H(t) & = A sin alpha cos(sqrt(k/m) t) + A cos alpha sin(sqrt(k/m)t) \
         y_H(t) & = A sin (sqrt(k/m) t + alpha) \
$

#pb()
kde

$
  omega = sqrt(k/m)
$

a $alpha = phi$ je fázový posun(počáteční fáze)

tj.

$
  x(t) & = A sin (sqrt(k/m) t + phi) \
$

#pb()
=== Energie harmonických kmitů
$
              x_0 & = 0 \
             x(t) & = A sin(omega t + phi) \
  (dif x)/(dif t) & = omega A cos(omega t + phi) \
             v(t) & = omega A cos(omega t + phi) \
              E_k & = 1/2 m v^2 \
          E_k (t) & = 1/2 m omega^2 A^2 cos^2(omega t + phi) \
$

$
      E_p & = - A_(0 x) \
  E_p (x) & = - integral_x_0^(x) F d t \
  E_p (x) & = - integral_x_0^(x) - k x dif x \
  E_p (x) & = integral_x_0^(x) k x dif x \
  E_p (x) & = k integral_x_0^(x) x dif x \
  E_p (x) & = k [1/2 x^2]_(x_0)^(x) \
  E_p (x) & = k 1/2 x^2 \
$
#important[$
  E_p (t) & = 1/2 k A^2 sin^2(omega t + phi) \
  E_p (t) & = 1/2 m omega^2 A^2 sin^2(omega t + phi) \
$]

#important[$
  E (t) & = 1/2 m omega^2 A^2 sin^2(omega t + phi) + 1/2 m omega^2 A^2 cos^2(omega t + phi) \
  E (t) & = E_p (t) + E_k (t) \
$]



#cetz.canvas({
  import cetz.draw: *

  let n = 200
  let tmax = 2 * calc.pi
  let amp = 1.5

  let ek-pts = range(n + 1).map(i => {
    let t = tmax * i / n
    (t, amp * calc.cos(t) * calc.cos(t))
  })
  let ep-pts = range(n + 1).map(i => {
    let t = tmax * i / n
    (t, amp * calc.sin(t) * calc.sin(t))
  })

  line((-0.35, 0), (7.0, 0), mark: (end: ">"), name: "xax")
  line((0, -0.35), (0, 2.15), mark: (end: ">"), name: "yax")

  content("xax.end", [$t$], anchor: "north-east", padding: 0.12)
  content("yax.end", [$E$], anchor: "south-east", padding: 0.12)

  for (k, lab) in ((1, [$pi/2$]), (2, [$pi$]), (3, [$3 pi/2$]), (4, [$2 pi$])) {
    let tx = k * calc.pi / 2
    line((tx, 0), (tx, -0.1))
    content((tx, -0.14), lab, anchor: "north", padding: 0.05)
  }

  line((0, amp), (tmax, amp), stroke: (paint: gray, thickness: 1pt, dash: "dashed"), name: "etot")
  content((0, amp), [$E$], anchor: "east", padding: 0.12)

  line(..ek-pts, stroke: (paint: blue.darken(25%), thickness: 1.3pt), name: "ek")
  line(..ep-pts, stroke: (paint: red.darken(20%), thickness: 1.3pt), name: "ep")

  content((calc.pi / 2, amp), [$E_p$], anchor: "north-east", padding: 0.15)
  content((calc.pi, amp), [$E_k$], anchor: "north-east", padding: 0.15)
})


#pb()
== Tlumené harmonické kmity

$
  F_v & = - k_v dot.op v \
  k_v & > 0 \
$

pak pohybová rovnice:
$
                                      m (dif^2 x)/(dif t^2) & = - k x - k_v (dif x)/(dif t) \
                                        (dif^2 x)/(dif t^2) & = - k/m x - k_v/m (dif x)/(dif t) \
        (dif^2 x)/(dif t^2) + k/m x + k_v/m (dif x)/(dif t) & = 0 \
                                                        k/m & = omega_0^2 "frekvence netlumených kmitů" \
                                                      k_v/m & = 2 delta \
  (dif^2 x)/(dif t^2) + 2 delta (dif x)/(dif t) + x omega^2 & = 0 \
                      lambda^2 + 2 delta lambda + omega_0^2 & = 0 "charakteristická rovnice" \
                                               lambda_(1,2) & = (-2 delta plus.minus sqrt(4 delta^2 -4 omega^2))/2 \
                                               lambda_(1,2) & = -delta plus.minus sqrt(delta^2 -omega^2) \
$

máme 3 skupiny řešení...

=== "Velké" tlumení $delta^2 > omega_0^2$

$
             D & = sqrt(delta^2 -omega^2) \
  lambda_(1,2) & = -delta plus.minus D \
          x(t) & = c_1 e^(t(-delta + D)) + c_2 e^(t(-delta - D)) \
$

zjištujeme jestli výchylka může nabýt hodnoty $0$

$
  c_1 e^(t(-delta + D)) + c_2 e^(t(-delta - D)) & = 0 \
                                      e^(2 D t) & = - c_2/c_1 \
$

exponenciála je nezáporná na $D_f$...

#pb()
=== Mezní tlumení $delta^2 = omega_0^2$

$
                             lambda_(1,2) & = -delta \
  c_1 e^(- delta t) + c_2 t e^(- delta t) & = 0 \
              (c_1 + c_2 t) e^(- delta t) & = 0 \
                                  c_1/c_2 & = -t \
$

tedy podmínka:

$
  c_1/c_2 < 0\
$

#cetz.canvas({
  import cetz.draw: *

  let n = 121
  let tmax = 6.0
  let over = range(n).map(i => {
    let t = tmax * i / (n - 1)
    (t, 2 * (-0.5 * calc.exp(-0.4 * t) + 1.5 * calc.exp(-1.6 * t)))
  })
  let crit = range(n).map(i => {
    let t = tmax * i / (n - 1)
    (t, 2 * (1 - 1.5 * t) * calc.exp(-t))
  })

  line((-0.3, 0), (6.7, 0), mark: (end: ">"), name: "tax")
  line((0, -1.2), (0, 2.6), mark: (end: ">"), name: "xax")
  content("tax.end", [$t$], anchor: "north", padding: 0.15)
  content("xax.end", [$x(t)$], anchor: "south-west", padding: 0.15)

  line(..over, stroke: blue.darken(15%))
  line(..crit, stroke: red.darken(15%))

  circle((0.9155, 0), radius: 0.055, fill: blue.darken(15%), stroke: none)
  circle((0.6667, 0), radius: 0.055, fill: red.darken(15%), stroke: none)

  line((3.3, 1.95), (3.9, 1.95), stroke: blue.darken(15%))
  content((4.0, 1.95), text(size: 9pt)[aperiodický \ $delta > omega_0$], anchor: "west")

  line((3.3, 0.95), (3.9, 0.95), stroke: red.darken(15%))
  content((4.0, 0.95), text(size: 9pt)[mezní aperiodický \ $delta = omega_0$], anchor: "west")
})


#pb()

==== Balistická metoda
zkoumáme balistický oscilátor - střílíme do hmoty na závěsu

$
  x & = x_0 = 0 \
  v & = v_0 \
  t & = t_0 \
  v & = v(t) \
$

zderivujeme řešení rovnice podle času

$
  (dif x)/(dif t) & = c_2 e^(-delta t) - delta (c_1 + c_2t)e^(-delta t) \
$

dosadíme počáteční podmínky

$
    0 & = c_1 \
  v_0 & = c_2 - delta c_1 = c_2 \
    x & = v_o t e^(-delta t) \
$

maximální výchylka oscilátoru
$
    0 & = (dif x)/(dif t) = v_0 e^(-delta t) (1 - delta t) \
  t_m & = 1/delta \
  x_m & = v_0/(e delta) \
$

hybnost před rázem je $m_s v_s$

po rázu je $(m_s + m) v_0$

vypočítáme $v_0$ a $x_m$

$
  v_0 & = (m_s v_s)/(m_s + m) \
  x_m & = (m_s v_s)/((m_s + m) e delta) \
  v_s & = (x_m e delta(m_s + m))/m_s \
$

#pb()
=== "Malé tlumení" $delta^2 - omega_0^2 < 0$
$
  lambda_(1,2) & = - delta plus.minus i sqrt(delta^2 - omega_0^2) \
         omega & = sqrt(delta^2 - omega_0^2) \
  lambda_(1,2) & = - delta plus.minus i omega \
          x(t) & = c_1 e^((-delta + i omega)t) + c_1 e^((-delta - i omega)t) \
          x(t) & = e^(-delta t) (c_1 e^(i omega t) + c_2 e^(-i omega t)) \
$

máme zase periodický pohyb, jen úhlová rychlost je menší a výchylka se zmenšuje

$
  x(t) & = A e^(-delta t) sin(omega t + phi) \
$

#cetz.canvas({
  import cetz.draw: *

  let d-val = 0.25
  let w-val = 2
  let amp = 1
  let tmax = 10
  let n = 240

  let curve = range(n + 1).map(i => {
    let t = tmax * i / n
    (t, amp * calc.exp(-d-val * t) * calc.sin(w-val * t))
  })
  let upper = range(n + 1).map(i => {
    let t = tmax * i / n
    (t, amp * calc.exp(-d-val * t))
  })
  let lower = range(n + 1).map(i => {
    let t = tmax * i / n
    (t, -amp * calc.exp(-d-val * t))
  })

  line((-0.4, 0), (10.9, 0), mark: (end: ">"), name: "tax")
  line((0, -1.35), (0, 1.35), mark: (end: ">"), name: "xax")

  content((rel: (0, 0.12), to: "tax.end"), [$t$], anchor: "south", padding: 0.1)
  content((rel: (0.12, 0), to: "xax.end"), [$x(t)$], anchor: "west", padding: 0.1)

  line(..upper, stroke: (paint: blue.darken(20%), dash: "dashed", thickness: 0.6pt))
  line(..lower, stroke: (paint: blue.darken(20%), dash: "dashed", thickness: 0.6pt))

  line(..curve, stroke: blue.darken(25%))

  content((2.4, 0.62), [$A e^(-delta t)$], anchor: "south", padding: 0.1)
  content((7.9, -0.78), [$x(t) = A e^(-delta t) sin(omega t + phi)$], anchor: "north", padding: 0.1)
})

platí:

$
         x_(1m) & = A e^(-delta t_m) sin(omega t_m + phi) \
         x_(2m) & = A e^(-delta (t_m + T)) sin(omega (t_m + T) + phi) \
  x_(1m)/x_(2m) & = e^(delta T) \
          gamma & = ln e^(delta T) = delta T "logaritmický dekrement" \
$

#pb()
== Nucené harmonické kmity

$
            m (dif^2 x)/(dif t^2) + k_v (dif x)/(dif t) + k x & = F_0 sin(Omega t) \
  (dif^2 x)/(dif t^2) + 2 delta (dif x)/(dif t) + omega_0^2 x & = F_0/m sin(Omega t) \
                                                         x(t) & = x_H (t) + x_P (t) \
$

kde

$
  2 delta = k_v/m
$

chceme partikulární řešení ve tvaru $B sin(Omega t + phi)$

homogenní řešení už známe...

$
  x_H (t) & = A e^(-delta t) sin(omega t + alpha) + B sin(Omega t + phi) \
$

přechodové řešení - když první člen ještě má význam

ustálené řešení - první člen je blízký nule

$
  x(t) = B sin(Omega t + phi)
$

přejdeme na komplexní reprezentaci

$
  A sin(omega t + alpha) & = Im A e^(i (omega t + alpha)) \
     F_0/m sin (Omega t) & = F_0/m Im e^(i Omega t) \
   B sin (Omega t + phi) & = B Im e^(i(Omega t + phi)) \
$

a tedy

$
      (dif x)/(dif t) & = i B Omega e^(i Omega t + phi) \
  (dif^2 x)/(dif t^2) & = - B Omega^2 e^(i(Omega t + phi)) \
$

dosadíme do původní rovnice

$
  - B Omega^2 Im e^(i(Omega t + phi)) + i 2 delta B Omega e^(i(Omega t + phi)) + omega_0^2 B e^(i(Omega t + phi)) &= F_0/m e^(i Omega t)\
  B(-Omega^2 + omega_0^2 + i 2 delta Omega) &= F_0/m e^(-i phi)\
  kappa &= (omega_0^2 - Omega^2) + i(2 delta Omega)\
  kappa &= abs(kappa) e^(i beta)\
  abs(kappa) &= sqrt((omega_0^2 - Omega^2)^2 + 4 delta^2 Omega^2)\
  tg(beta) &= (2 delta Omega)/(omega_0^2 - Omega^2)\
  B abs(kappa) e^(i beta) &= F_0/m e^(-i phi)\
  B abs(kappa) &= F_0/m\
  beta &= - phi\
  B &= (F_0/m)/abs(kappa) = (F_0/m)/sqrt((omega_0^2 - Omega^2) + 4 delta^2 Omega^2)\
  tg phi &= - tg beta \
  (-2 delta Omega)/(omega_0^2 - Omega^2) &= (2 delta Omega)/(omega_0^2 - Omega^2)\
$

a tedy

$
  x(t) = (F_0/m)/sqrt((omega_0^2 - Omega^2) + 4 delta^2 Omega^2) sin(Omega t + arctan((2 delta Omega)/(Omega^2 - omega_0^2)))
$

hledáme hodntu maximální hodnotu $B$ - amplituda asi

zderivuji, najdu kde derivace nabývá hodnoty $0$

$
  (dif B)/(dif Omega) = (-F_0/m (-4( omega_0^2 - Omega^2)Omega + 8 delta^2 Omega))/(2((omega_0^2 - Omega^2) + 4 delta^2 Omega^2))^(3/2)
$

$
  (-F_0/m (-4( omega_0^2 - Omega^2)Omega + 8 delta^2 Omega))/(2((omega_0^2 - Omega^2) + 4 delta^2 Omega^2))^(3/2) = 0
$

limitní případy - $Omega = 0, sq Omega = infinity$

$
  -F_0/m (-4( omega_0^2 - Omega^2)Omega + 8 delta^2 Omega) & = 0 \
             -F_0/m (-4( omega_0^2 - Omega^2) + 8 delta^2) & = 0 \
                       4( omega_0^2 - Omega^2) - 8 delta^2 & = 0 \
                       4 omega_0^2 - 4 Omega^2 + 8 delta^2 & = 0 \
                           omega_0^2 - Omega^2 + 2 delta^2 & = 0 \
                                                   Omega^2 & = omega_0^2 - 2 delta^2 \
                                                   omega_0 & > delta sqrt(2) \
$

#cetz.canvas({
  import cetz.draw: *

  let w0 = 1.0
  let xmax = 3.0
  let ymax = 6.0
  let sx = 1.5
  let sy = 0.75
  let eps = 0.00000001

  let amp(d, om) = {
    let a = w0 * w0 - om * om
    1 / calc.sqrt(a * a + 4 * d * d * om * om + eps)
  }

  line((0, 0), (xmax * sx + 0.35, 0), mark: (end: ">"))
  line((0, 0), (0, ymax * sy + 0.35), mark: (end: ">"))
  content((xmax * sx + 0.4, 0), [$Omega$], anchor: "west", padding: 0.05)
  content((0, ymax * sy + 0.4), [$B$], anchor: "south", padding: 0.05)

  for v in (1, 2, 3) {
    line((v * sx, 0), (v * sx, -0.1))
    content((v * sx, -0.12), [#v], anchor: "north", padding: 0.04)
  }

  for v in (1, 2, 3, 4, 5, 6) {
    line((0, v * sy), (-0.1, v * sy))
    content((-0.12, v * sy), [#v], anchor: "east", padding: 0.04)
  }

  line((sx, 0), (sx, ymax * sy), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
  content((sx, ymax * sy + 0.05), [$omega_0$], anchor: "south", padding: 0.05)

  let deltas = (0.0, 0.1, 0.2, 0.35, 0.6)
  let cols = (blue, green, orange, red, purple)

  let build-segments(pts, ylim) = {
    let result = pts.fold((segs: (), cur: (), prev: none), (acc, p) => {
      let prev = acc.prev
      if p.at(1) <= ylim {
        let cur = if prev != none and prev.at(1) > ylim {
          let t = (ylim - prev.at(1)) / (p.at(1) - prev.at(1))
          ((prev.at(0) + t * (p.at(0) - prev.at(0)), ylim),)
        } else {
          acc.cur
        }
        (segs: acc.segs, cur: cur + (p,), prev: p)
      } else {
        if acc.cur.len() > 0 {
          let q = acc.cur.last()
          let cur2 = if q.at(1) < ylim - 0.0001 {
            let t = (ylim - q.at(1)) / (p.at(1) - q.at(1))
            acc.cur + ((q.at(0) + t * (p.at(0) - q.at(0)), ylim),)
          } else {
            acc.cur
          }
          (segs: if cur2.len() > 1 { acc.segs + (cur2,) } else { acc.segs }, cur: (), prev: p)
        } else {
          (segs: acc.segs, cur: (), prev: p)
        }
      }
    })
    if result.cur.len() > 1 { result.segs + (result.cur,) } else { result.segs }
  }

  for (d, col) in deltas.zip(cols) {
    let pts = range(301).map(i => {
      let om = xmax * i / 300
      (om * sx, amp(d, om) * sy)
    })
    for seg in build-segments(pts, ymax * sy) {
      line(..seg, stroke: (paint: col, thickness: 1pt))
    }
    if d > 0 {
      let op = calc.sqrt(calc.max(0, w0 * w0 - 2 * d * d))
      circle((op * sx, amp(d, op) * sy), radius: 0.055, fill: col, stroke: none)
    }
  }

  for (i, (d, col)) in deltas.zip(cols).enumerate() {
    let y = 4.85 - i * 0.42
    let dstr = if d == 0 { "0" } else { str(d) }
    line((5.2, y), (5.7, y), stroke: (paint: col, thickness: 1pt))
    content((5.8, y), [$delta = #dstr$], anchor: "west", padding: 0.05)
  }
})

#pb()
== Princip superpozice
Mějme dvě rovnice...
$
  m (dif^2 x_1)/(dif t^2) + k_v (dif x_1)/(dif t) + k x_1 & = F_1(t) \
  m (dif^2 x_2)/(dif t^2) + k_v (dif x_2)/(dif t) + k x_2 & = F_2(t) \
$

Rovnice sečteme

$
  m dif^2/(dif t^2) (x_1 + x_2) + k_v dif/(dif t) (x_1 + x_2) + k (x_1 + x_2) & = F_1(t) + F_2(t) \
$


== Skládání stejnosměrných kmitů se stejnou frekvencí $omega$

$
  x_1(t) & = A_1 sin(omega t + phi_1) \
  x_2(t) & = A_2 sin(omega t + phi_2) \
$
kde
$
    A_1 & != A_2 \
  phi_1 & != phi_2 \
$

v komplexních číslech - tzv. *fázory* v Gaussově rovině

$
  x_1 -> accent(A_1, hat) (t) sq x_2 -> accent(A_2, hat) (t)
$

#cetz.canvas({
  import cetz.draw: *

  // Parameters
  let len1 = 2.8
  let len2 = 1.9
  let ang1 = 22deg
  let ang2 = 72deg

  // Phasor endpoints
  let p1 = (len1 * calc.cos(ang1), len1 * calc.sin(ang1))
  let p2 = (len2 * calc.cos(ang2), len2 * calc.sin(ang2))
  let ps = (p1.at(0) + p2.at(0), p1.at(1) + p2.at(1))

  // Exact resultant angle
  let angs = calc.atan2(ps.at(0), ps.at(1))

  // Coordinate Axes
  line((-0.5, 0), (4.8, 0), mark: (end: ">", fill: black), stroke: 0.8pt)
  line((0, -0.5), (0, 3.8), mark: (end: ">", fill: black), stroke: 0.8pt)
  content((5.0, 0), [$frak(R)$], anchor: "west")
  content((0, 4.0), [$frak(I)$], anchor: "south")

  // Parallelogram dashed lines
  line(p1, ps, stroke: (paint: gray, dash: "dashed", thickness: 0.75pt))
  line(p2, ps, stroke: (paint: gray, dash: "dashed", thickness: 0.75pt))

  // Phase Arcs centered strictly at (0, 0)
  // anchor: "origin" forces the center of the arc's circle to (0, 0)
  let r1 = 0.9
  let rs = 1.4
  let r2 = 1.9

  arc((0, 0), start: 0deg, stop: ang1, radius: r1, anchor: "origin", stroke: 0.6pt + luma(80))
  arc((0, 0), start: 0deg, stop: angs, radius: rs, anchor: "origin", stroke: 0.6pt + luma(80))
  arc((0, 0), start: 0deg, stop: ang2, radius: r2, anchor: "origin", stroke: 0.6pt + luma(80))

  // Angle labels: placed at the midpoint of each arc
  let l_r1 = r1 + 0.22
  let l_rs = rs + 0.22
  let l_r2 = r2 + 0.22

  content((l_r1 * calc.cos(ang1 * 0.5), l_r1 * calc.sin(ang1 * 0.5)), [$phi.alt_1$], anchor: "center")
  content((l_rs * calc.cos(angs * 0.6), l_rs * calc.sin(angs * 0.6)), [$phi.alt$], anchor: "center")
  content((l_r2 * calc.cos(ang2 * 0.72), l_r2 * calc.sin(ang2 * 0.72)), [$phi.alt_2$], anchor: "center")

  // Phasor Vectors
  line((0, 0), p1, mark: (end: ">", fill: blue.darken(20%)), stroke: 1.3pt + blue.darken(20%))
  line((0, 0), p2, mark: (end: ">", fill: blue.darken(20%)), stroke: 1.3pt + blue.darken(20%))
  line((0, 0), ps, mark: (end: ">", fill: red.darken(20%)), stroke: 1.5pt + red.darken(20%))

  // Phasor Labels
  content((p1.at(0) + 0.15, p1.at(1)), [$hat(A)_1$], anchor: "west")
  content((p2.at(0) - 0.15, p2.at(1) + 0.1), [$hat(A)_2$], anchor: "east")
  content((ps.at(0) + 0.15, ps.at(1) + 0.1), [$hat(A) = hat(A)_1 + hat(A)_2$], anchor: "south-west")
})

$
  A^2 & = A_1^2 + A_2^2 - 2 A_1 A_2 cos(pi (alpha_2 - alpha_1)) \
$

=== Kmity ve fázi

$
  alpha_2 - alpha_1 & = 0 => A = A_1 + A_2 \
$

=== Kmity v protifázi

$
  alpha_2 - alpha_1 & = pi => A = A_1 - A_2 \
$

=== Fáze výsledných kmitů

$
  tg alpha &= ("průmět " accent(A, hat) "na osu y")/("průmět " accent(A, hat) "na osu x") = (A_1 sin alpha_1 + A_2 sin alpha_2)/(A_1 cos alpha_1 + A_2 cos alpha_2)
$

=== Stejnosměrné kmity
$
  x_1 (t) & = A sin(omega_1 t + alpha) \
  x_2 (t) & = A sin(omega_2 t + alpha) \
$

sečtu

$
  sin(Phi) + sin(Psi) & = 2 sin ((Phi + Psi)/2) cos ((Phi - Psi)/2) \
$

a tedy

$
  x = x_1 + x_2 = 2A cos(((omega_1 t - omega_2) t)/2) sin(((omega_1 + omega_2)t)/2 + alpha)
$

vznikají rázy ig

#cetz.canvas({
  import cetz.draw: *

  let t-max = 10
  let n = 400
  let w1 = 3.0
  let w2 = 3.6
  let wm = (w1 + w2) / 2
  let wd = (w1 - w2) / 2

  let amp = 0.8
  let y1 = 5.2
  let y2 = 2.6
  let y3 = -1.4

  let ts = range(n + 1).map(i => t-max * i / n)

  line((0, y1), (t-max + 0.5, y1), stroke: gray)
  line((0, y1 - 1.0), (0, y1 + 1.0), stroke: gray, mark: (end: ">"))
  line(..ts.map(t => (t, y1 + amp * calc.sin(w1 * t))), stroke: blue.darken(20%))
  content((rel: (-0.3, 0), to: (0, y1)), [$x_1 (t)$], anchor: "east")

  line((0, y2), (t-max + 0.5, y2), stroke: gray)
  line((0, y2 - 1.0), (0, y2 + 1.0), stroke: gray, mark: (end: ">"))
  line(..ts.map(t => (t, y2 + amp * calc.sin(w2 * t))), stroke: green.darken(30%))
  content((rel: (-0.3, 0), to: (0, y2)), [$x_2 (t)$], anchor: "east")

  line((0, y3), (t-max + 0.5, y3), stroke: gray)
  line((0, y3 - 2.0), (0, y3 + 2.0), stroke: gray, mark: (end: ">"))
  line(..ts.map(t => (t, y3 + 2 * amp * calc.cos(wd * t))), stroke: (paint: red.darken(20%), dash: "dashed"))
  line(..ts.map(t => (t, y3 - 2 * amp * calc.cos(wd * t))), stroke: (paint: red.darken(20%), dash: "dashed"))
  line(..ts.map(t => (t, y3 + 2 * amp * calc.cos(wd * t) * calc.sin(wm * t))), stroke: blue.darken(20%))
  content((rel: (-0.3, 0), to: (0, y3)), [$x(t) = x_1 + x_2$], anchor: "east")

  content((rel: (0.15, 0.12), to: (0, y3 + 2 * amp)), text(size: 8pt)[obálka], anchor: "south-west")
  content((rel: (0.15, 0.15), to: (t-max, y3)), [$t$], anchor: "south-west")
})

==== Rázy
$
  (omega_1 - omega_2)/2 << (omega_1 + omega_2)/2
$

nechť

$
  a(t) & = 2A sin(((omega_1 - omega_2)t)/2 + alpha) \
$

pak
$
  x(t) & = a(t) sin(((omega_1 + omega_2)t)/2 + alpha) \
$

amplituda se mění s velkou frekvencí

#pb()
== Kmitání ve dvou souřadnicích
mějme
$
  x(t) & = A_1 sin omega t \
  x(t) & = A_2 sin omega (omega t + alpha) \
$

vyjádříme $t$
$
  sin omega t &= x(t)/A_1\
  y(t) & = A_2(sin omega t cos alpha + cos omega t sin alpha)\
  y(t) & = A_2(x(t)/A_1 cos alpha + cos omega t sin alpha)\
  y(t)/A_2 - x(t)/A_1 cos alpha &= cos omega t sin alpha\
  (y(t)/A_2)^2 - 2 y(t)/A_2 x(t)/A_1 cos alpha + (x(t)/A_1 cos alpha)^2 &= (1 - sin^2 omega t)sin^2 alpha\
  (y(t)/A_2)^2 - 2 (x(t) y(t) cos alpha)/(A_1 A_2) + ((x(t)/A_1)^2 cos^2 alpha + (x(t)/A_1)^2 sin^2 alpha) &= sin^2 alpha\
  (y(t)/A_2)^2 - 2 (x(t) y(t) cos alpha)/(A_1 A_2) + (x(t)/A_1)^2 &= sin^2 alpha
$

=> Rovnice pootočené elipsy v kartézských souřadnicích...

#cetz.canvas({
  import cetz.draw: *
  let a-len = 2.4
  let b-len = 1.3
  let ang = 30deg
  let ca = calc.cos(ang)
  let sa = calc.sin(ang)
  let pts = range(73).map(i => {
    let t = 2 * calc.pi * i / 72
    let u = a-len * calc.cos(t)
    let v = b-len * calc.sin(t)
    (u * ca - v * sa, u * sa + v * ca)
  })
  line(..pts, close: true, fill: blue.lighten(88%), stroke: blue.darken(30%))
  line((-3.4, 0), (3.6, 0), mark: (end: ">"), name: "xax")
  line((0, -2.7), (0, 3.0), mark: (end: ">"), name: "yax")
  content("xax.end", [\(x\)], anchor: "south-west", padding: 0.08)
  content("yax.end", [\(y\)], anchor: "south-east", padding: 0.08)
  line((0, 0), (3.3 * ca, 3.3 * sa), stroke: (paint: gray, dash: "dashed"), mark: (end: ">"), name: "xp")
  line((0, 0), (-2.2 * sa, 2.2 * ca), stroke: (paint: gray, dash: "dashed"), mark: (end: ">"), name: "yp")
  content("xp.end", [\(x'\)], anchor: "south-west", padding: 0.08)
  content("yp.end", [\(y'\)], anchor: "south-east", padding: 0.08)
  arc((0, 0), start: 0deg, stop: 30deg, radius: 0.85)
  content((1.12 * calc.cos(15deg), 1.12 * calc.sin(15deg)), [$phi$], anchor: "south-west", padding: 0.05)
  content((1.55 * ca + 0.16, 1.55 * sa - 0.28), [$A_1$], anchor: "north", padding: 0.05)
  content((-0.95 * sa - 0.28, 0.95 * ca - 0.16), [$A_2$], anchor: "east", padding: 0.05)
  circle((0, 0), radius: 0.045, fill: black)
})

nalézt úhel $phi$ který určuje pootočení elipsy je ponecháno jako zábavný domácí úkol pro čtenáře


=== $alpha = 0$\
$
  (y(t)/A_2)^2 - 2 (x(t) y(t) cos alpha)/(A_1 A_2) + (x(t)/A_1)^2 & = sin^2 alpha \
            (y(t)/A_2)^2 - 2 (x(t) y(t))/(A_1 A_2) + (x(t)/A_1)^2 & = 0 \
                                          (y(t)/A_2 - x(t)/A_1)^2 & = 0 \
                                              y(t)/A_2 - x(t)/A_1 & = 0 \
                                                         y(t)/A_2 & = x(t)/A_1 \
                                                             y(t) & = x(t) A_2/A_1 \
$

Rovnice přímky procházející 1. a 3. kvadrantem

=== $alpha = pi/2$
$
  x(t) & = A_1 sin omega t \
  y(t) & = A_2 sin omega t + pi/2 \
       \
  x(t) & = A_1 sin omega t \
  y(t) & = A_2 cos omega t \
$

Pravotočivý pohyb po elipse

=== $alpha = pi$
$
  y(t) & = - x(t) A_2/A_1 \
$

Rovnice přímky procházející 2. a 4. kvadrantem

=== $alpha = 3/2 pi$
$
  x(t) & = A_1 sin omega t \
  y(t) & = A_2 sin omega t + 3/2 pi \
       \
  x(t) & = A_1 sin omega t \
  y(t) & = - A_2 cos omega t \
$

Levotočivý pohyb po elipse

#pb()
== Pro rozdílné frekvence kolmých kmitů
Výsledné kmity jsou omezené obdélníkem daným amplitudami jednotlivých kmitů.

Pokud $omega_1/omega_2 = m/n; sq m,n in ZZ$ dostáváme tzv. Lissajousovy obrazce.

Tvar těchto obrazců závisí hlavně na volbě poměru úhlových frekvencí $omega_1/omega_2$ a fázového posunu $alpha$.

#cetz.canvas({
  import cetz.draw: *
  let amp = 1.0
  let n = 300
  let phases = (0, calc.pi / 4, calc.pi / 2)
  let ratios = ((1, 2), (2, 3))
  let cx = (0, 3.0, 6.0)
  let cy = (0, -3.4)
  for (r, pair) in ratios.enumerate() {
    let (fa, fb) = pair
    for (c, ph) in phases.enumerate() {
      let ox = cx.at(c)
      let oy = cy.at(r)
      let pts = range(n + 1).map(i => {
        let t = 2 * calc.pi * i / n
        (ox + amp * calc.sin(fa * t + ph), oy + amp * calc.sin(fb * t))
      })
      line(..pts, stroke: blue.darken(25%))
    }
  }
  let heads = ([$delta = 0$], [$delta = pi/4$], [$delta = pi/2$])
  for (c, lbl) in heads.enumerate() {
    content((cx.at(c), 1.45), lbl, anchor: "south")
  }
  content((-1.7, cy.at(0)), [$omega_1 \/ omega_2 = 1\/2$], anchor: "east")
  content((-1.7, cy.at(1)), [$omega_1 \/ omega_2 = 2\/3$], anchor: "east")
})


#pb()
= Mechanika soustavy hmotných bodů a tuhého tělesa
== Popis soustavy hmotných bodů a tuhého tělesa
Soustavou hmotných bodů rozumíme $N$ hmotných bodů které mohou mezi sebou interagovat.
Každý bod má tzv. 3 *stupně volnosti* - tj 3 souřadnice, kterými popíšeme jeho polohu $ar(r_i)$.

Rozdělujeme na dva typy:
+ *Volná* soustava hmotných bodů, vektory $ar(r_i)$ jsou na sobě nezávislé - $3N$ stupňů volnosti
+ *Tuhá* soustava hmotných bodů, vzdálenosti $abs(ar(r_i) - ar(r_j))$ jsou konstantní - $6$ *stupňů volnosti* - vybereme $3$ body jejichž polohy svážeme $3$ rovnicemi

Zavedeme pojem *tuhé těleso* - abstrakce reálného tělesa - stejné rozložení hmoty, konstantní geometrie.

Pro tuhé těleso definujeme hustotu $rho = rho(ar(r)) != 0$ jako funkci souřadnic, kde

$
  rho = lim_(V->0) M/V = (dif M)/(dif V)
$

Tuhé těleso má analogicky s tuhou soustavou hmotných bodů $6$ stupňů volnosti - stačí vybrat 3 body v tělese.

Dále definujeme tzv. *hmotný střed* tuhé soustavy hmotných bodů jako *vážený průměr*

#definition(title: "Hmotný střed tuhé soustavy hmotných bodů")[
  $
    ar(r_s) = (sum_(i=1)^N m_i ar(r_i))/(sum_(i=1)^N m_i)
  $
]

Analogicky zobecníme pro tuhé těleso

#definition(title: "Hmotný střed tuhého tělesa")[
  $
    ar(r_s) = (integral_V ar(r) rho(ar(r)) dif V)/(integral_V rho(ar(r)) dif V)
  $
]

#pb()
== Kinematika tuhého tělesa
Už víme, že tuhé těleso má $6$ stupňů volnosti, stanovíme tedy $6$ souřadnic. Zvolíme bod $A; sq ar(r_a) = vec(a_1, a_2, a_3)$, osu procházející tímto bodem $ar(o); sq ar(o) = vec(o_1, o_2, o_3); sq abs(ar(o)) = 1$, kde osu určíme pouze pomocí $2$ souřadnic díky podmínce na jednotkový vektor(přesná orientace osy nás nezajímá, řešíme jen přímku, kterou vymezuje). Posledním údajem je úhel $phi = phi(t)$ určující natočení kolem této osy.

=== Rotace tuhého tělesa kolem pevné osy
Vektor osy $ar(o)$ zůstává časově konstantní, stejně jako souřadnice bodů ležících na ose, tedy jediná časově proměnná souřadnice je úhel $phi = phi(t)$.
$
    omega & = (dif phi)/(dif t) \
  epsilon & = (dif omega)/(dif t) = (dif^2 phi)/(dif t^2) = dtt(phi)
$

=== Rotace tuhého tělesa kolem pevného bodu

Obecnějším pohybem je *rotace tuhého tělesa kolem pevného bodu*, kde se mění i vektor osy $ar(o)$. Ten ale můžeme v každém okamžiku popsat jako rotaci kolem pevné osy. Podle *Eulerovy věty* i v tomto případě:

$
  ar(v) & = ar(omega) times ar(r) \
$

=== Translace tuhého tělesa
Pohyb, při kterém všechny body tuhého tělesa mají stejný vektor rychlosti $ar(v_T)$ nazýváme *posuvným*, nebo *translačním* pohybem. Podle *Chaslesovy věty* lze libovolný pohyb tuhého tělesa vyjádřit jako kombinaci translace a rotace kolem pevéosy. Rychlost libovolného bodu je tedy dána vztahem:

$
  ar(v) = ar(v_T) + ar(omega) times ar(v)
$

== Dynamika tuhého tělesa
=== Princip akce a reakce asi

Součet vnitřních sil a momentů je nulový - nemají vliv na pohyb tuhého tělesa.

$
  sum_N ar(F)^I & = 0 \
  sum_N ar(M)^I & = 0 \
$
=== 1. Impulsová věta

$
              (dif ar(p_i))/(dif t) & = ar(F_i) = ar(F^I_i) + ar(F^E_i) \
  sum_(i=1)^n (dif ar(p_i))/(dif t) & = sum_(i=1)^n ar(F_i) = sum_(i=1)^n ar(F^I_i) + sum_(i=1)^n ar(F^E_i) \
    dif/(dif t) sum_(i=1)^n ar(p_i) & = 0 + sum_(i=1)^n ar(F^E_i) \
$
#important[$
  (dif ar(P))/(dif t) & = ar(F)^E \
$]

jiná formulace

$
  M ar(r_s) & = sum_(i=1)^n m_i ar(r_i) \
  M ar(a_s) & = sum_(i=1)^n m_i (dif^2 ar(r_i))/(dif t^2) \
  M ar(a_s) & = (dif ar(P))/(dif t) \
$
#important[$
  M ar(a_s) & = ar(F)^E \
$]

*Hmotný střed je působištěm tíhových sil - těžiště.*

$
  ar(F)^E & = sum_(i=1)^n m_i ar(g) \
  ar(M)^E & = sum_(i=1)^n ar(r_i) times ar(F_i)^E \
  ar(M)^E & = sum_(i=1)^n m_i ar(r_i) times ar(g) = M ar(r_s) times ar(g) = ar(r_s) times M ar(g) \
$

=== 2. Impulsová věta
$
              (dif ar(b_i))/(dif t) & = ar(M_i) = ar(M_i)^E + ar(M_i)^I \
  sum_(i=1)^n (dif ar(b_i))/(dif t) & = sum_(i=1)^n ar(M_i) = sum_(i=1)^n ar(M_i)^E + sum_(i=1)^n ar(M_i)^I \
  sum_(i=1)^n (dif ar(b_i))/(dif t) & = sum_(i=1)^n ar(M_i)^E \
                (dif ar(B))/(dif t) & = ar(M)^E \
$

#pb()
=== Energie soustavy hmotných bodů a tuhého tělesa
Kinetická energie:
$
  E_k = sum_(i=1)^n (m_i v_i^2)/2 = 1/2 sum_(i=1)^n m_i v_i^2
$

Práce:
$
  A_(1,2) & = sum_(i=1)^n integral_(ar(r_i)^1)^(ar(r_i)^2) ar(F_i) dif ar(r_i) \
$

Analogicky platí:
$
  A_(1,2) & = E_(k 2) - E_(k 1)
$

Pro konzervativní síly:
$
  A_(1,2) & = E_(p 1) - E_(p 2)
$

A tedy *ZZME*:
#corollary[
  $
    E_(k 1) + E_(p 1) = E_(k 2) + E_(p 2)
  $
]

#theorem(title: [Königova věta])[
  $
    E_k = 1/2 M v_s^2 + 1/2 sum_(i=1)^n m_i v_(i s)^2
  $
]

#proof[
  $
    ar(v_i) & = ar(v_s) + ar(v)_(i s) \
        E_k & = 1/2 sum_(i=1)^n m_i (ar(v)_s + ar(v)_(i s)) dot.op (ar(v)_s + ar(v)_(i s)) \
            & = 1/2 sum_(i=1)^n m_i (ar(v)_s^2 + 2 ar(v) dot.op ar(v)_(i s) + ar(v)_(i s)^2) \
            & = 1/2 M ar(v)_s^2 + 0 + 1/2 sum_(i=1)^n m_i ar(v)_(i s)^2 \
            & = 1/2 M ar(v)_s^2 + 1/2 sum_(i=1)^n m_i ar(v)_(i s)^2 \
  $
]

pro translační pohyb:

#important[$
  E_k & = 1/2 sum_(i=1)^n m_i ar(v)_i^2 = 1/2 M ar(v)_s^2 \
$]

#pb()
pro rotaci kolem pevné osy:
$
  E_k & = 1/2 sum_(i=1)^n m_i ar(v)_i^2 = 1/2 sum_(i=1) m_i ar(r)_i^2 omega^2 = 1/2 omega^2 sum_(i=1)^n m_i ar(r)_i^2 \
$
#important[$
  E_k & = 1/2 omega^2 J \
$]

kde $J$ je moment setrvačnosti
#important[$
  J & = sum_(i=1)^n m_i ar(r)_i^2 \
$]

A obecně tedy podle *Chaslesovy věty*:
$
  E_k & = 1/2 M ar(v)_T^2 + 1/2 J_0 omega^2
$

kde $J_0$ moment setrvačnosti je vůči těžišťové ose

==== Výpočet momentu setrvačnosti tuhého tělesa
$
  J_0 & = integral_m r^2 dif m \
$

pro osu $z$

$
  J & = integral_V (x^2 + y^2) rho dif V \
$

$
  J & = M R^2 \
  R & = sqrt(J/M)
$

kde $R$ je tzv. *gyrační poloměr* tělesa k dané ose

pro $a$ vzdálenost libovolné osy od těžišťové osy

$
  J & = integral (a+x)^2 + y^2 dif m = integral a^2 + a x + r^2 dif m
      J             & = a^2 integral d_m + integral r^2 d_m \
  J & = a^2 M + J_0 \
$

#definition(title: "Steinerova věta")[$
  J & = a^2 M + J_0 \
$]

#pb()
==== Moment setrvačnosti příklady
===== 1.
#cetz.canvas({
  import cetz.draw: *

  // the rod
  rect((0, -0.2), (6, 0.2), fill: blue.lighten(80%), stroke: blue.darken(30%), name: "rod")

  // rotation axis through the end of the rod, perpendicular to it
  line((0, -1.3), (0, 1.5), stroke: (dash: "dashed"), name: "axis")
  circle((0, 0), radius: 0.07, fill: black)

  // sense of rotation
  arc((1, 0), start: 20deg, stop: 160deg, radius: 1, mark: (end: ">"))

  // length dimension
  line((0, -0.9), (6, -0.9), mark: (start: ">", end: ">"), name: "dim")
  line((6, -0.9), (6, -0.25), stroke: (dash: "dotted"))

  content("dim.mid", [$l$], anchor: "south", padding: 0.1)
  content((3, 0.25), [$m, rho$], anchor: "south", padding: 0.05)
  content((0, 1.5), [osa $z$], anchor: "south", padding: 0.1)
  content((1, 1), [$omega$], anchor: "south-west", padding: 0.05)
})

homogenní tyč délky $l$, hmotnosti $m$ a lineární hustotou $rho = m/l$

osa v krajním bodě
$
  dif J & = x^2 dif m \
  dif J & = x^2 rho dif x \
  dif J & = x^2 m/l dif x \
      J & = integral_0^l x^2 m/l dif x \
      J & = m/l integral_0^l x^2 dif x \
      J & = m/l [x^3/3]_0^x \
      J & = m/l l^3/3 \
      J & = 1/3 m l^2 \
$
těžišťová osa
$
  J_0 & = 1/m [x^3/3]_(-l/2)^(l/2) \
  J_0 & = 1/12 m l^2 \
$
podle Steinerovy věty v krajním bodě
$
  J & = 1/12 m l^2 + m l^2 1/4 \
  J & = 1/3 m l^2 \
$

#pb()
===== 2.
Moment setrvačnosti tenkého homogenního kotouče vůči ose $z$

$M; sq R; rho = M/(pi R^2)$

$
  J_0 & = integral (x^2 + y^2) rho dif S \
$

rozdělíme na tenké prstence tloušťky $dif r; sq r in chevron 0, R chevron.r$

$
  dif S & = 2 pi r dif r \
        \
        \
    J_0 & = 2 M/R^2 [r^4/4]_0^R = 1/2 M R^2 \
        \
        \
        \
    J_0 & = 2 M/R^2 [r^4/4]_0^R = 1/2 M R^2 \
$

stejný výsledek pro homogenní válec

===== 3.
2D integrál

$
  J = integral (x^2 + y^2) M/(pi R^2) dif x dif y\
$

použijeme polární souřadnice

$
  x & = r cos phi \
  y & = r sin phi \
$

#theorem(title: [Věta o substituci])[
  $
    dif x dif y & = cal(J) dif phi dif r \
         cal(J) & = det mat(
                    (partial x)/(partial r), (partial x)/(partial phi);
                    (partial y)/(partial r), (partial y)/(partial phi)
                  ) = r cos^2 phi + r sin^2 phi = r \
  $
]

kde $cal(J)$ je tzv. *Jacobiho determinant*

a tedy podle *Fubiniovy věty* pro dvojitý integrál
$
  J & = integral_0^R integral_0^(2pi) r^2 M/(pi R^2) r dif r dif phi \
  J & = M/(pi R^2) integral_0^R r^3 dif r dot.op integral_0^(2 pi) dif phi \
  J & = M/(pi R^2) dot.op R^4/4 dot.op 2 pi = 1/2 M R^2 \
$

#pb()
===== Fubiniova věta pro dvojitý integrál
#theorem(title: "Fubiniova věta pro dvojitý integrál")[
  Mějme funkci 2 proměnných $f(x,y); sq f: RR^2 -> RR$ pro kterou platí:

  $f(x,y) >=0$ na intervalu $X times Y$ kde integrujeme, potom

  $
    integral_X integral_Y f(x,y) dif (x,y) = integral_X (integral_Y f(x,y) dif y) dif x = integral_Y (integral_X f(x,y) dif x) dif y\
  $
]

#pb()
===== 3.
Homogenní koule

$M; sq R; sq rho = M/(4/3 pi R^3) = (3M)/(4 pi R^3)$

ve sférických souřadnicích

$
  x & = r cos phi sin theta \
  y & = r cos phi cos theta \
  z & = r cos phi \
$

Jacobiho determinant

$
  cal(J) & = det mat(
             (partial x)/(partial r), (partial x)/(partial phi), (partial x)/(partial theta);
             (partial y)/(partial r), (partial y)/(partial phi), (partial y)/(partial theta);
             (partial z)/(partial r), (partial z)/(partial phi), (partial z)/(partial theta);
           ) = r^2 sin theta \
$

a tedy

$
  dif x dif y dif z & = r^2 sin theta dif r dif phi dif theta \
          x^2 + y^2 & = r^2 sin^2 theta \
$

zapíšeme tedy integrál

$
  J &= integral_0^R integral_0^(2pi) integral_0^(pi) r^2 sin^2 theta (3M)/(4pi R^3) r^2sin 2 theta dif r dif phi dif theta\
  J &=(3M)/(4pi R^3)[r^5/5]_0^R [phi]_0^(2 pi) dot.op integral_0^pi sin^3 theta dif theta\
  J &=(3M)/(4pi R^3)[r^5/5]_0^R [phi]_0^(2 pi) dot.op integral_0^pi sin theta (1- cos^2 theta) dif theta\
  J &=(3M)/(4pi R^3)[r^5/5]_0^R [phi]_0^(2 pi) dot.op integral_0^pi sin theta dif theta - integral_0^pi sin theta cos^2 theta dif theta\
  J &=(3M)/(4pi R^3)[r^5/5]_0^R [phi]_0^(2 pi) dot.op ([-cos theta]_0^pi + [(cos^3 theta)/3]_0^pi)\
  J &=(3M)/(4pi R^3)[r^5/5]_0^R [phi]_0^(2 pi) dot.op (1 + 1 - 1/3 - 1/3)\
  J &=(3M)/(4pi R^3)[r^5/5]_0^R [phi]_0^(2 pi) 4/3\
  J &= 2/5 M R^2\
$

#pb()
== Statika - hodnocení sil působících na tuhé těleso
#cetz.canvas({
  import cetz.draw: *

  let body-pts = range(61).map(i => {
    let ang = 2 * calc.pi * i / 60
    let rad = 2.6 + 0.35 * calc.cos(2 * ang) - 0.25 * calc.sin(3 * ang) + 0.15 * calc.cos(5 * ang)
    (1.3 * rad * calc.cos(ang), 0.9 * rad * calc.sin(ang))
  })
  line(..body-pts, close: true, fill: blue.lighten(85%), stroke: blue.darken(40%))
  content((-2.0, -1.3), [těleso], anchor: "north")

  let pt-t = (0, 0)
  let pt-q = (0.72, 0.96)
  let pt-p = (2.32, -0.24)
  let pt-p-prime = (-0.88, 2.16)
  let ray-start = (-2.48, 3.36)
  let ray-end = (4.72, -2.04)

  line(ray-start, ray-end, stroke: (dash: "dashed", paint: gray.darken(40%)), name: "ray")
  content("ray.start", [paprsek síly], anchor: "south-west", padding: 0.15)

  let s = 0.25
  let r1 = (pt-q.at(0) - 0.6 * s, pt-q.at(1) - 0.8 * s)
  let r2 = (r1.at(0) + 0.8 * s, r1.at(1) - 0.6 * s)
  let r3 = (pt-q.at(0) + 0.8 * s, pt-q.at(1) - 0.6 * s)
  line(r1, r2, r3, stroke: gray.darken(50%))

  line(pt-t, pt-q, stroke: (dash: "dotted", paint: black), name: "arm")
  content("arm.mid", [$d$], anchor: "south-east", padding: 0.08)

  line(pt-t, pt-p, mark: (end: ">"), stroke: gray.darken(30%), name: "r-vec")
  content("r-vec.mid", [$bold(r)$], anchor: "north", padding: 0.15)

  let f-end = (rel: (1.6, -1.2), to: pt-p)
  line(pt-p, f-end, mark: (end: ">"), stroke: 1.4pt + black, name: "F1")
  content("F1.end", [$bold(F)$], anchor: "south-west", padding: 0.1)

  let f-prime-end = (rel: (1.6, -1.2), to: pt-p-prime)
  line(pt-p-prime, f-prime-end, mark: (end: ">"), stroke: (paint: blue.darken(30%), dash: "solid"), name: "F2")
  content("F2.mid", [$bold(F)′$], anchor: "south-west", padding: 0.1)

  circle(pt-t, radius: 0.08, fill: black, name: "T")
  content("T.south-west", [$T$], anchor: "north-east", padding: 0.1)

  circle(pt-p, radius: 0.07, fill: black, name: "P")
  content("P.south-west", [$A$], anchor: "north-east", padding: 0.1)

  circle(pt-p-prime, radius: 0.07, fill: blue.darken(30%), stroke: blue.darken(30%), name: "P2")
  content("P2.south-west", [$A′$], anchor: "north-east", padding: 0.1)
})

Mějme šišku a sílu působící na šišku. K síle si zavedeme tzv. *paprsek síly*, směr, kterým síla působí. Působení síly se nemění když ji posouvám po paprsku(silové působení i moment)

#cetz.canvas({
  import cetz.draw: *
  let body-pts = range(61).map(i => {
    let ang = 2 * calc.pi * i / 60
    let rad = 2.5 + 0.3 * calc.cos(2 * ang) - 0.25 * calc.sin(3 * ang) + 0.12 * calc.cos(5 * ang)
    (1.3 * rad * calc.cos(ang), 0.9 * rad * calc.sin(ang) - 0.8)
  })
  line(..body-pts, close: true, fill: blue.lighten(85%), stroke: blue.darken(40%))
  content((-2.3, -2.5), [těleso], anchor: "north")
  let pt-p = (0, 1.5)
  let pt-a1 = (-1.6, -0.5)
  let pt-a2 = (1.6, -0.5)
  let v1 = (0.8, 1.0)
  let v2 = (-0.8, 1.0)
  let vr = (0, 2.0)
  line((-2.4, -1.5), (1.6, 3.5), stroke: (dash: "dashed", paint: gray.darken(40%)), name: "ray1")
  line((2.4, -1.5), (-1.6, 3.5), stroke: (dash: "dashed", paint: gray.darken(40%)), name: "ray2")
  line((0, -3.2), (0, 4.2), stroke: (dash: "dashed", paint: green.darken(30%)), name: "ray-r")
  content("ray-r.start", [paprsek výslednice], anchor: "north", padding: 0.15)
  let f1-end = (rel: v1, to: pt-a1)
  line(pt-a1, f1-end, mark: (end: ">"), stroke: 1.3pt + black, name: "F1")
  content("F1.mid", [$bold(F)_1$], anchor: "south-east", padding: 0.1)
  let f2-end = (rel: v2, to: pt-a2)
  line(pt-a2, f2-end, mark: (end: ">"), stroke: 1.3pt + black, name: "F2")
  content("F2.mid", [$bold(F)_2$], anchor: "south-west", padding: 0.1)
  let f1p-end = (rel: v1, to: pt-p)
  let f2p-end = (rel: v2, to: pt-p)
  let fr-end = (rel: vr, to: pt-p)
  line(f1p-end, fr-end, stroke: (dash: "dotted", paint: gray.darken(50%)))
  line(f2p-end, fr-end, stroke: (dash: "dotted", paint: gray.darken(50%)))
  line(pt-p, f1p-end, mark: (end: ">"), stroke: 1pt + blue.darken(30%), name: "F1p")
  content("F1p.end", [$bold(F)'_1$], anchor: "west", padding: 0.12)
  line(pt-p, f2p-end, mark: (end: ">"), stroke: 1pt + blue.darken(30%), name: "F2p")
  content("F2p.end", [$bold(F)'_2$], anchor: "east", padding: 0.12)
  line(pt-p, fr-end, mark: (end: ">"), stroke: 1.5pt + red.darken(20%), name: "FR")
  content("FR.end", [$bold(F)_R$], anchor: "south-west", padding: 0.12)
  let pt-a = (0, -1.6)
  let fr-shifted-end = (rel: vr, to: pt-a)
  line(pt-a, fr-shifted-end, mark: (end: ">"), stroke: 1.5pt + green.darken(30%), name: "FRs")
  content("FRs.mid", [$bold(F)'_R$], anchor: "west", padding: 0.15)
  circle(pt-a1, radius: 0.07, fill: black, name: "A1")
  content("A1.north-west", [$A_1$], anchor: "south-east", padding: 0.1)
  circle(pt-a2, radius: 0.07, fill: black, name: "A2")
  content("A2.north-east", [$A_2$], anchor: "south-west", padding: 0.1)
  circle(pt-p, radius: 0.08, fill: black, name: "P")
  content("P.west", [$P$], anchor: "east", padding: 0.15)
  circle(pt-a, radius: 0.07, fill: green.darken(30%), stroke: green.darken(30%), name: "A")
  content("A.east", [$A$], anchor: "west", padding: 0.15)
})

Pro různoběžné síly se paprsky protínají, přesuneme si síly do průsečíku, sečteme síly a výslednou sílu můžeme posouvat po jejím paprsku, účinek se nemění.

#cetz.canvas({
  import cetz.draw: *

  let body-pts = range(61).map(i => {
    let ang = 2 * calc.pi * i / 60
    let rad = 2.6 + 0.3 * calc.cos(2 * ang) - 0.2 * calc.sin(3 * ang) + 0.1 * calc.cos(5 * ang)
    (1.4 * rad * calc.cos(ang), 0.75 * rad * calc.sin(ang) + 0.2)
  })
  line(..body-pts, close: true, fill: blue.lighten(85%), stroke: blue.darken(40%))
  content((-2.8, 1.3), [těleso], anchor: "south")

  let pt-a1 = (-2.0, 0.0)
  let pt-a2 = (2.0, 0.0)
  let pt-a = (-0.4, 0.0)
  let pt-p = (-0.4, 2.4)

  let v-f1 = (0, -1.8)
  let v-f2 = (0, -1.2)
  let v-fn1 = (-1.2, 0)
  let v-fn2 = (1.2, 0)
  let v-r1 = (-1.2, -1.8)
  let v-r2 = (1.2, -1.2)
  let v-fr = (0, -3.0)

  line((-2.0, 2.6), (-2.0, -3.2), stroke: (dash: "dashed", paint: gray.lighten(20%)))
  line((2.0, 2.6), (2.0, -3.2), stroke: (dash: "dashed", paint: gray.lighten(20%)))
  line((-3.8, 0.0), (3.8, 0.0), stroke: (dash: "dashed", paint: gray.darken(20%)))

  line((0.2, 3.3), (-3.4, -2.1), stroke: (dash: "dashed", paint: gray.darken(50%)), name: "ray1")
  line((-1.2, 3.0), (3.4, -1.05), stroke: (dash: "dashed", paint: gray.darken(50%)), name: "ray2")

  line((-0.4, 3.2), (-0.4, -3.6), stroke: (dash: "dashed", paint: green.darken(30%)), name: "ray-r")
  content("ray-r.start", [paprsek výslednice], anchor: "south", padding: 0.12)

  let f1-end = (rel: v-f1, to: pt-a1)
  let fn1-end = (rel: v-fn1, to: pt-a1)
  let r1-end = (rel: v-r1, to: pt-a1)

  line(f1-end, r1-end, stroke: (dash: "dotted", paint: gray.darken(50%)))
  line(fn1-end, r1-end, stroke: (dash: "dotted", paint: gray.darken(50%)))

  line(pt-a1, f1-end, mark: (end: ">"), stroke: 1.3pt + black, name: "F1")
  content("F1.mid", [$bold(F)_1$], anchor: "west", padding: 0.1)

  line(pt-a1, fn1-end, mark: (end: ">"), stroke: 1.1pt + orange.darken(15%), name: "Fn1")
  content("Fn1.mid", [$bold(F)_n$], anchor: "south", padding: 0.1)

  line(pt-a1, r1-end, mark: (end: ">"), stroke: 1.3pt + blue.darken(30%), name: "R1")
  content("R1.end", [$bold(F)'_1$], anchor: "north-east", padding: 0.1)

  let f2-end = (rel: v-f2, to: pt-a2)
  let fn2-end = (rel: v-fn2, to: pt-a2)
  let r2-end = (rel: v-r2, to: pt-a2)

  line(f2-end, r2-end, stroke: (dash: "dotted", paint: gray.darken(50%)))
  line(fn2-end, r2-end, stroke: (dash: "dotted", paint: gray.darken(50%)))

  line(pt-a2, f2-end, mark: (end: ">"), stroke: 1.3pt + black, name: "F2")
  content("F2.mid", [$bold(F)_2$], anchor: "east", padding: 0.1)

  line(pt-a2, fn2-end, mark: (end: ">"), stroke: 1.1pt + orange.darken(15%), name: "Fn2")
  content("Fn2.mid", [$-bold(F)_n$], anchor: "south", padding: 0.1)

  line(pt-a2, r2-end, mark: (end: ">"), stroke: 1.3pt + blue.darken(30%), name: "R2")
  content("R2.end", [$bold(F)'_2$], anchor: "north-west", padding: 0.1)

  let fr-end = (rel: v-fr, to: pt-a)
  line(pt-a, fr-end, mark: (end: ">"), stroke: 1.6pt + red.darken(20%), name: "FR")
  content("FR.end", [$bold(F)_R$], anchor: "west", padding: 0.12)

  circle(pt-a1, radius: 0.07, fill: black, name: "A1")
  content("A1.north-east", [$A_1$], anchor: "south-west", padding: 0.08)

  circle(pt-a2, radius: 0.07, fill: black, name: "A2")
  content("A2.north-west", [$A_2$], anchor: "south-east", padding: 0.08)

  circle(pt-p, radius: 0.08, fill: black, name: "P")
  content("P.east", [$P$], anchor: "west", padding: 0.15)

  circle(pt-a, radius: 0.07, fill: red.darken(20%), stroke: red.darken(20%), name: "A")
  content("A.north-west", [$A$], anchor: "south-east", padding: 0.08)
})
Pro rovnoběžné síly stejného směru si k oběma přičtu kolmé síly s opačnými směry, dostanu dvě různoběžné síly které pak zase sečteme.

Pro libovolnou sílu $ar(F)$ působící v bodě $ar(r)$ vzhledem k bodu $O$ si můžeme tuto sílu nejprve po jejím paprsku přenést na kolmici k $O$ a dále doplnit dvojicí sil $ar(F)'; -ar(F)'$ se stejnou velikostí jako $ar(F)$, ale působící v bodě $O$. Tyto síly se odečtou, takže výsledný silový účinek je stále stejný, síla v bodě $O$ je ale $ar(F)'$ doplněná o moment dvojice sil $-ar(F)'$ a $ar(F)$. Tento moment je ale nezávislý na volbě vztažného bodu $O'$:

#proof[
  $
    ar(M) & = (ar(r)_1 times -ar(F)') + (ar(r_2) times ar(F)) \
          & = (ar(r)_1 times -ar(F)') + (ar(r_2) times ar(F)) \
          & = (ar(r)_1 - ar(r)_2) times ar(F) \
          & = ar(r) times ar(F) \
  $
]

Tento moment je tedy volný vektor, který můžeme přenést do libovolného bodu tělesa.

V dokonale tuhém tělese můžeme každou sílu přenést do bodu $O$, připojíme-li k ní *doplňkovou dvojici sil*, jejíž moment je roven momentu přenesené síly k bodu $O$.


#important(caption: "Výsledná síla k bodu O je tedy:")[$
  ar(R) & = sum_(i=1)^n ar(F)_i \
$]


#important(caption: "a doplňkový moment je:")[$
  ar(M) & = sum_(i=1)^n ar(r)_i times ar(F)_i \
$]

#pb()
=== Rovnováha tuhého tělesa

#definition(title: "Rovnováha")[
  Říkáme, že těleso je v *rovnováze*, jestliže je výslednice vnějších sil působících na těleso rovna nule:
  $
    sum_i^n ar(F)^E_i = ar(0) = ar(F)^E\
  $

  a výsledný vnější moment je také roven nule:

  $
    sum_i^n ar(M)^E_i = ar(0) = ar(M)^E\
  $
]

Rozlišujeme 3 typy rovnováhy:

(1.) *stálá(stabilní)* rovnovážná poloha
#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Styles (CeTZ 0.5.2 compatible)
  let s-surf = (stroke: (paint: black, thickness: 1.4pt))
  let s-ghost = (stroke: (paint: gray.darken(20%), dash: "dashed", thickness: 0.8pt), fill: gray.lighten(85%))
  let s-fg = (
    stroke: (paint: blue.darken(20%), thickness: 1.2pt),
    mark: (end: "stealth", scale: 0.9, fill: blue.darken(20%)),
  )
  let s-fn = (
    stroke: (paint: green.darken(30%), thickness: 1.2pt),
    mark: (end: "stealth", scale: 0.9, fill: green.darken(30%)),
  )
  let s-fv = (
    stroke: (paint: red.darken(20%), thickness: 1.5pt),
    mark: (end: "stealth", scale: 1.0, fill: red.darken(20%)),
  )
  let s-guide = (stroke: (paint: gray.darken(30%), dash: "dotted", thickness: 0.7pt))

  // Surface parameters: y = a * x^2
  let a = 0.28
  let r = 0.48

  // 1. Shaded ground & parabolic trough
  let surf-pts = range(-30, 31).map(i => {
    let x = i * 0.1
    (x, a * x * x)
  })

  line(
    ..surf-pts,
    (3.0, -0.45),
    (-3.0, -0.45),
    close: true,
    fill: gray.lighten(88%),
    stroke: none,
  )
  line(..surf-pts, ..s-surf)

  // 2. Equilibrium position (bottom of trough, x0 = 0)
  let c0 = (0, r)
  circle(c0, radius: r, ..s-ghost, name: "ball-eq")
  circle(c0, radius: 0.04, fill: gray.darken(40%), stroke: none)

  // 3. Displaced position (x1 = 1.65)
  let x1 = 1.65
  let y1 = a * x1 * x1
  // Slope tan(alpha) = 2*a*x1; unit normal n = (-sin(alpha), cos(alpha))
  let slope = 2 * a * x1
  let alpha = calc.atan(slope)
  let nx = -calc.sin(alpha)
  let ny = calc.cos(alpha)

  // Center of displaced sphere: C1 = Contact + R * n
  let cx = x1 + r * nx
  let cy = y1 + r * ny
  let c1 = (cx, cy)

  circle(
    c1,
    radius: r,
    fill: blue.lighten(85%),
    stroke: (paint: blue.darken(40%), thickness: 1.1pt),
    name: "ball-disp",
  )

  // 4. Force vectors at displaced center of mass C1
  let fg-mag = 1.85
  let fn-mag = fg-mag * ny // F_N = F_G * cos(alpha)
  let fv-mag = fg-mag * (-nx) // F_v = F_G * sin(alpha)

  let pt-fg = (cx, cy - fg-mag)
  let pt-fn = (cx + fn-mag * nx, cy + fn-mag * ny)
  // Tangent unit vector pointing back toward equilibrium: t = (-cos(alpha), -sin(alpha))
  let tx = -ny
  let ty = nx
  let pt-fv = (cx + fv-mag * tx, cy + fv-mag * ty)

  // Parallelogram projection lines
  line(pt-fg, pt-fv, ..s-guide)
  line(pt-fn, pt-fv, ..s-guide)
  // Normal axis line through contact point
  line((x1, y1), pt-fn, ..s-guide)

  // Draw vectors: F_G (gravity), F_N (normal reaction), F_v (restoring resultant)
  line(c1, pt-fg, ..s-fg, name: "FG")
  content("FG.end", text(fill: blue.darken(20%))[$bold(F)_G$], anchor: "north", padding: 0.1)

  line(c1, pt-fn, ..s-fn, name: "FN")
  content("FN.end", text(fill: green.darken(30%))[$bold(F)_N$], anchor: "south-east", padding: 0.08)

  line(c1, pt-fv, ..s-fv, name: "Fv")
  content("Fv.end", text(fill: red.darken(20%))[$bold(F)_v$], anchor: "south-east", padding: 0.1)

  // Center of mass dot
  circle(c1, radius: 0.05, fill: black, stroke: none)

  // 5. Elevation increase Delta h and equilibrium axis
  line((0, -0.45), (0, 2.3), stroke: (paint: gray.darken(40%), dash: "dash-dotted", thickness: 0.6pt))
  content((0, 2.35), text(fill: gray.darken(50%), size: 0.85em)[$E_p = "min"$], anchor: "south")

  line((0, r), (cx + 0.9, r), ..s-guide)
  line((cx, cy), (cx + 0.9, cy), ..s-guide)
  line(
    (cx + 0.75, r),
    (cx + 0.75, cy),
    stroke: (paint: black, thickness: 0.6pt),
    mark: (start: "stealth", end: "stealth", scale: 0.6, fill: black),
    name: "dh",
  )
  content("dh.mid", [$Delta h > 0$], anchor: "west", padding: 0.1)
})
(2.) *vratká(labilní)* rovnovážná poloha
#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Styles (CeTZ 0.5.2 compatible)
  let s-surf = (stroke: (paint: black, thickness: 1.4pt))
  let s-ghost = (stroke: (paint: gray.darken(20%), dash: "dashed", thickness: 0.8pt), fill: gray.lighten(85%))
  let s-fg = (
    stroke: (paint: blue.darken(20%), thickness: 1.2pt),
    mark: (end: "stealth", scale: 0.9, fill: blue.darken(20%)),
  )
  let s-fn = (
    stroke: (paint: green.darken(30%), thickness: 1.2pt),
    mark: (end: "stealth", scale: 0.9, fill: green.darken(30%)),
  )
  let s-fv = (
    stroke: (paint: red.darken(20%), thickness: 1.5pt),
    mark: (end: "stealth", scale: 1.0, fill: red.darken(20%)),
  )
  let s-guide = (stroke: (paint: gray.darken(30%), dash: "dotted", thickness: 0.7pt))

  // Surface parameters: y = h0 - a * x^2
  let h0 = 1.9
  let a = 0.25
  let r = 0.48

  // 1. Shaded ground & parabolic crest
  let surf-pts = range(-30, 31).map(i => {
    let x = i * 0.1
    (x, h0 - a * x * x)
  })

  line(
    ..surf-pts,
    (3.0, -0.55),
    (-3.0, -0.55),
    close: true,
    fill: gray.lighten(88%),
    stroke: none,
  )
  line(..surf-pts, ..s-surf)

  // 2. Equilibrium position (top of crest, x0 = 0)
  let c0 = (0, h0 + r)
  circle(c0, radius: r, ..s-ghost, name: "ball-eq")
  circle(c0, radius: 0.04, fill: gray.darken(40%), stroke: none)

  // 3. Displaced position (x1 = 1.35)
  let x1 = 1.35
  let y1 = h0 - a * x1 * x1
  // Slope dy/dx = -2*a*x1; downward angle beta = atan(2*a*x1) > 0
  // Outward unit normal n = (sin(beta), cos(beta))
  let beta = calc.atan(2 * a * x1)
  let nx = calc.sin(beta)
  let ny = calc.cos(beta)

  // Center of displaced sphere: C1 = Contact + R * n
  let cx = x1 + r * nx
  let cy = y1 + r * ny
  let c1 = (cx, cy)

  circle(
    c1,
    radius: r,
    fill: blue.lighten(85%),
    stroke: (paint: blue.darken(40%), thickness: 1.1pt),
    name: "ball-disp",
  )

  // 4. Force vectors at displaced center of mass C1
  let fg-mag = 1.85
  let fn-mag = fg-mag * ny // F_N = F_G * cos(beta)
  let fv-mag = fg-mag * nx // F_v = F_G * sin(beta)

  let pt-fg = (cx, cy - fg-mag)
  let pt-fn = (cx + fn-mag * nx, cy + fn-mag * ny)
  // Downward tangent unit vector pointing away from equilibrium: t = (cos(beta), -sin(beta))
  let tx = ny
  let ty = -nx
  let pt-fv = (cx + fv-mag * tx, cy + fv-mag * ty)

  // Parallelogram projection lines
  line(pt-fg, pt-fv, ..s-guide)
  line(pt-fn, pt-fv, ..s-guide)
  // Normal axis line through contact point
  line((x1, y1), pt-fn, ..s-guide)

  // Draw vectors: F_G (gravity), F_N (normal reaction), F_v (destabilizing resultant)
  line(c1, pt-fg, ..s-fg, name: "FG")
  content("FG.end", text(fill: blue.darken(20%))[$bold(F)_G$], anchor: "north", padding: 0.1)

  line(c1, pt-fn, ..s-fn, name: "FN")
  content("FN.end", text(fill: green.darken(30%))[$bold(F)_N$], anchor: "south-west", padding: 0.08)

  line(c1, pt-fv, ..s-fv, name: "Fv")
  content("Fv.end", text(fill: red.darken(20%))[$bold(F)_v$], anchor: "north-west", padding: 0.08)

  // Center of mass dot
  circle(c1, radius: 0.05, fill: black, stroke: none)

  // 5. Elevation drop Delta h < 0 and equilibrium axis
  line((0, -0.55), (0, 3.15), stroke: (paint: gray.darken(40%), dash: "dash-dotted", thickness: 0.6pt))
  content((0, 3.2), text(fill: gray.darken(50%), size: 0.85em)[$E_p = "max"$], anchor: "south")

  let x-dim = cx + 1.15
  line(c0, (x-dim + 0.15, h0 + r), ..s-guide)
  line(c1, (x-dim + 0.15, cy), ..s-guide)
  line(
    (x-dim, h0 + r),
    (x-dim, cy),
    stroke: (paint: black, thickness: 0.6pt),
    mark: (start: "stealth", end: "stealth", scale: 0.6, fill: black),
    name: "dh",
  )
  content("dh.mid", [$Delta h < 0$], anchor: "west", padding: 0.1)
})
(3.) *volná(indiferentní)* rovnovážná poloha
#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Styles (CeTZ 0.5.2 compatible, matching the previous two diagrams)
  let s-surf = (stroke: (paint: black, thickness: 1.4pt))
  let s-ghost = (stroke: (paint: gray.darken(20%), dash: "dashed", thickness: 0.8pt), fill: gray.lighten(85%))
  let s-fg = (
    stroke: (paint: blue.darken(20%), thickness: 1.2pt),
    mark: (end: "stealth", scale: 0.9, fill: blue.darken(20%)),
  )
  let s-fn = (
    stroke: (paint: green.darken(30%), thickness: 1.2pt),
    mark: (end: "stealth", scale: 0.9, fill: green.darken(30%)),
  )
  let s-guide = (stroke: (paint: gray.darken(30%), dash: "dotted", thickness: 0.7pt))

  // Surface parameters: horizontal plane y = h0
  let h0 = 0.8
  let r = 0.48

  // 1. Shaded ground & flat surface
  line(
    (-3.0, h0),
    (3.0, h0),
    (3.0, -0.45),
    (-3.0, -0.45),
    close: true,
    fill: gray.lighten(88%),
    stroke: none,
  )
  line((-3.0, h0), (3.0, h0), ..s-surf)

  // 2. Initial equilibrium position (x0 = -0.8)
  let x0 = -0.8
  let c0 = (x0, h0 + r)
  circle(c0, radius: r, ..s-ghost, name: "ball-eq")
  circle(c0, radius: 0.04, fill: gray.darken(40%), stroke: none)

  // 3. Displaced equilibrium position (x1 = 1.1)
  let x1 = 1.1
  let c1 = (x1, h0 + r)

  circle(
    c1,
    radius: r,
    fill: blue.lighten(85%),
    stroke: (paint: blue.darken(40%), thickness: 1.1pt),
    name: "ball-disp",
  )

  // 4. Collinear opposing forces at C1 (F_N = -F_G, F_v = 0)
  let f-mag = 1.65
  let pt-fg = (x1, h0 + r - f-mag)
  let pt-fn = (x1, h0 + r + f-mag)

  line(c1, pt-fg, ..s-fg, name: "FG")
  content("FG.end", text(fill: blue.darken(20%))[$bold(F)_G$], anchor: "west", padding: 0.12)

  line(c1, pt-fn, ..s-fn, name: "FN")
  content("FN.end", text(fill: green.darken(30%))[$bold(F)_N$], anchor: "west", padding: 0.12)

  // Center of mass dot
  circle(c1, radius: 0.05, fill: black, stroke: none)

  // 5. Constant elevation line, displacement arrow Delta x, and labels
  line((-2.6, h0 + r), (2.7, h0 + r), ..s-guide)
  content((2.15, h0 + r + 0.12), [$Delta h = 0$], anchor: "south")

  // Displacement vector between centers
  line(
    (x0 + 0.12, h0 + r),
    (x1 - 0.12, h0 + r),
    stroke: (paint: gray.darken(50%), thickness: 0.8pt),
    mark: (end: "stealth", scale: 0.7, fill: gray.darken(50%)),
    name: "dx",
  )
  content("dx.mid", text(fill: gray.darken(60%), size: 0.9em)[$Delta x$], anchor: "south", padding: 0.08)

  // Energy and zero-resultant annotations
  content((-0.8, 2.55), text(fill: gray.darken(50%), size: 0.85em)[$E_p = "konst."$], anchor: "south")
  content((2.15, h0 + r - 0.35), text(fill: red.darken(20%), size: 0.9em)[$bold(F)_v = bold(0)$], anchor: "north")
})

#pb()
==== Příklad
Homogenní tyč opřená o zeď

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Styles (CeTZ 0.5.2 compatible)
  let s-wall = (stroke: (paint: black, thickness: 1.4pt))
  let s-fg = (
    stroke: (paint: blue.darken(20%), thickness: 1.4pt),
    mark: (end: "stealth", scale: 1.0, fill: blue.darken(20%)),
  )
  let s-fn = (
    stroke: (paint: green.darken(30%), thickness: 1.4pt),
    mark: (end: "stealth", scale: 1.0, fill: green.darken(30%)),
  )
  let s-ft = (
    stroke: (paint: red.darken(20%), thickness: 1.4pt),
    mark: (end: "stealth", scale: 1.0, fill: red.darken(20%)),
  )
  let s-guide = (stroke: (paint: gray.darken(30%), dash: "dotted", thickness: 0.7pt))

  // Geometry parameters: rod length L = 5.2, angle alpha = 52 deg
  let L = 5.2
  let angle = 40deg
  let xA = L * calc.cos(angle) // Floor contact A = (xA, 0)
  let yB = L * calc.sin(angle) // Wall contact B = (0, yB)
  let pt-a = (xA, 0.0)
  let pt-b = (0.0, yB)
  let pt-t = (xA / 2, yB / 2) // Center of mass T

  // 1. Shaded wall and floor blocks
  rect((-0.45, -0.45), (0.0, yB + 1.4), fill: gray.lighten(88%), stroke: none)
  rect((-0.45, -0.45), (xA + 1.8, 0.0), fill: gray.lighten(88%), stroke: none)
  line((0.0, yB + 1.4), (0.0, 0.0), (xA + 1.8, 0.0), ..s-wall)

  // Right-angle symbol at the corner O (0,0)
  line((0.0, 0.3), (0.3, 0.3), (0.3, 0.0), stroke: (paint: gray.darken(40%), thickness: 0.6pt))
  circle((0.15, 0.15), radius: 0.025, fill: gray.darken(40%), stroke: none)
  content((-0.15, -0.15), text(fill: gray.darken(50%), size: 0.85em)[$O$], anchor: "north-east")

  // 2. Helper dashed lines for moment arms / geometry
  line(pt-t, (xA / 2, 0.0), ..s-guide)
  line(pt-b, (xA, yB), ..s-guide)
  line(pt-a, (xA, yB), ..s-guide)

  // Angle alpha arc at contact point A
  arc(
    pt-a,
    start: 180deg,
    stop: 180deg - angle,
    radius: 0.85,
    anchor: "origin",
    stroke: (paint: black, thickness: 0.7pt),
  )
  content((xA - 0.58, 0.26), [$alpha$])

  // 3. The rod (drawn as a thick rounded bar so contact points sit cleanly on its axis)
  line(
    pt-a,
    pt-b,
    stroke: (paint: eastern.darken(30%), thickness: 6pt, cap: "round"),
  )
  line(
    pt-a,
    pt-b,
    stroke: (paint: eastern.lighten(60%), thickness: 3.6pt, cap: "round"),
  )

  // 4. Force vectors
  // Gravity F_G at center of mass T
  let fg-mag = 1.9
  line(pt-t, (rel: (0, -fg-mag), to: pt-t), ..s-fg, name: "FG")
  content("FG.end", text(fill: blue.darken(20%))[$bold(F)_G$], anchor: "west", padding: 0.12)

  // Floor normal reaction F_N1 (upward at A) and friction F_t1 (leftward toward wall at A)
  let fn1-mag = 1.65
  let ft1-mag = 0.95
  line(pt-a, (rel: (0, fn1-mag), to: pt-a), ..s-fn, name: "FN1")
  content("FN1.end", text(fill: green.darken(30%))[$bold(F)_(R 1)$], anchor: "west", padding: 0.1)

  line(pt-a, (rel: (-ft1-mag, 0), to: pt-a), ..s-ft, name: "Ft1")
  content("Ft1.end", text(fill: red.darken(20%))[$bold(F)_(t 1)$], anchor: "south", padding: 0.12)

  // Wall normal reaction F_N2 (rightward at B) and friction F_t2 (upward along wall at B)
  let fn2-mag = 0.95
  let ft2-mag = 0.85
  line(pt-b, (rel: (fn2-mag, 0), to: pt-b), ..s-fn, name: "FN2")
  content("FN2.end", text(fill: green.darken(30%))[$bold(F)_(R 2)$], anchor: "south", padding: 0.1)

  line(pt-b, (rel: (0, ft2-mag), to: pt-b), ..s-ft, name: "Ft2")
  content("Ft2.end", text(fill: red.darken(20%))[$bold(F)_(t 2)$], anchor: "east", padding: 0.12)

  // 5. Points A, B, T
  circle(pt-a, radius: 0.07, fill: black, stroke: none, name: "A")
  content("A", [$A$], anchor: "north-west", padding: 0.14)

  circle(pt-b, radius: 0.07, fill: black, stroke: none, name: "B")
  content("B", [$B$], anchor: "south-east", padding: 0.14)

  circle(pt-t, radius: 0.07, fill: black, stroke: none, name: "T")
  content("T", [$T$], anchor: "south-west", padding: 0.12)
})

podmínky rovnováhy:

$
  ar(F)_g + ar(F)_(t 1) + ar(F)_(t 2) + ar(F)_(R 1) + ar(F)_(R 2) = ar(0)\
$

v jednotlivých souřadnicích

$
            ar(F)_(R 1) + ar(F)_(R 2) & = 0 \
  ar(F)_(t 1) + ar(F)_(t 2) + ar(F)_g & = 0 \
$

a podmínka pro momenty, zvolíme např. bod působiště $ar(F)_(t 2); ar(F)_(R 2)$ - ty tedy mají nulový moment

$
  ar(F)_g times ar(r)_1 + ar(F)_(R 1) times ar(r)_2 + ar(F)_(t 2) times ar(r)_3 & = ar(0) \
$

#pb()
== Otáčení kolem pevné osy

tbd obrázek

$
  (dif ar(b))/(dif t) & = ar(M)^E \
$

mějme bod $A$ na ose $o$, $ar(r)_i$ vzdálenost bodů $A$ a $B$ a vzdálenost $ar(r)_i'$ vzdálenost bodu $B$ od osy a úhel $alpha$ který svírá $ar(r)_i$ s osou

$
  ar(b)_i & = ar(r)_i times m_i ar(v)_i \
$

$ar(b)_i$ rozložíme do kolmého a rovnoběžného směru s osou

$
  ar(M)^E & = ar(M)^K + ar(M)^R \
$

a tedy

$
  (dif ar(b))/(dif t) = dif/(dif t) sum_(i=1)^n ar(b)_i^K + dif/(dif t) sum_(i=1)^n ar(b)_i^R = ar(M)^K + ar(M)^R\
$

zkoumáme rovnoběžnou složku

$
  dif/(dif t) sum ar(b)_i^R & = ar(M)^R \
$

kde

$
  abs(ar(b)_i^R) & = abs(ar(b)_i) sin alpha \
                 & = abs(ar(r)_i times m_i ar(v)_i) sin alpha = abs(ar(r)_i) abs(ar(v)_i) m_i sin alpha \
        abs(v)_i & = abs(ar(r)_i) abs(ar(omega)) sin alpha \
  abs(ar(b)_i^R) & = ar(r)_i^2 omega m_i sin^2 alpha \
  abs(ar(b)_i^R) & = ar(r)_i^2' omega^2 m_i \
$

tedy

$
  dif(dif t) sum ar(b)_i^R & = dif/(dif t) sum (m_i r_i^2) ar(omega) \
                           & = dif/(dif t) sum J_i ar(omega) \
                           & = dif/(dif t) J ar(omega) = ar(M)^R = ar(M) \
$

#definition(title: "2. Věta Impulzová")[
  #important[$
    dif/(dif t) J ar(omega) = ar(M)^R = ar(M)
  $]

  $J = "konst"$ - $ar(M) = J ar(epsilon) = J dtt(ar(phi))$

  $J != "konst"$ - $ar(M) = 0$
]

#pb()
=== Příklad 1.
Valení homogenního válce po nakloněné rovině.

tbd image

mějme $alpha$, $M$, $R$, určujeme $ar(a)_s$ zrychlení hmotného středu válce
$
  J & = 1/2 M R^2 \
  G & = g M \
$

Zapíšeme si obě dvě impulzové věty.

1.
$
  M ar(a)_s & = F - F_t \
  M ar(a)_s & = M g sin alpha - F_t \
$

kde $F_t$ je síla valivého tření

2.
$
        J epsilon & = M \
  1/2 M R^2 a_s/R & = F_t R \
$

dosadíme

$
  1/2 M R a_s & = M R(g sin alpha - a_s) \
      1/2 a_s & = g sin alpha - a_s \
      3/2 a_s & = g sin alpha \
          a_s & = 2/3 g sin alpha \
$

Nebo jinak přes ZZME

válec ve výšce $h$ - $E_(p 1) = M g h$, $E_(k 1) = 0$

tedy

$
  E_(p 1) & = E_(k 2) \
  E_(k 1) & = E_(p 2) \
    M g h & = E_(p 1) = M g s sin alpha = 1/2 M v_s^2 + 1/2 J omega^2 \
          & = 1/2 M v_s^2 + 1/2 M R^2 omega^2 = 3/4 M v_s^2 \
$

dosadíme
$
  M g 1/2 a_s t^2 sin alpha & = 3/4 M a_s^2 t^2 \
                        a_s & = 2/3 g sin alpha \
$

#pb()
=== Fyzické a matematické kyvadlo

tbd image

$
          M & = - m g a sin alpha \
  J epsilon & = J dtt(alpha) = - m g a sin alpha \
$
tedy
$
  dtt(alpha) + (m g a)/J sin alpha = 0\
$

počítáme výchylku do $5 degree$ 🤫, tedy $sin alpha approx alpha$

a tedy dostáváme
$
  dtt(alpha) + (m g a)/J alpha = 0\
$

netlumený lineární harmonický oscilátor, kde

$
  omega & = sqrt((m g a)/J) \
      T & = (2 pi)/omega = 2 pi sqrt(J/(m g a)) \
$

zobecníme na matematické kyvadlo s délkou $l$ na nehmotném závěsu...

a tedy
$
  T = 2 pi sqrt(J/(m g a)) = 2 pi sqrt((m l^2)/(m g l)) = 2pi sqrt(l/g)\
$

redukovaná délka $l_r$...

$
    T & = 2 pi sqrt(l_r/g) \
  l_r & = J/(m a) \
$

#pb()
== Rotace kolem pevného bodu
=== Inerciální soustava
bod $O$ v počátku soustavy, $ar(r) = vec(x, y, z)$

pak píšeme
$
  ar(r)_i & = ar(omega) times ar(r)_i \
        J & = ar(r)_i times m_i ar(v)_i \
        J & = ar(r)_i times m_i (ar(omega) times ar(r)_i) \
    ar(B) & = sum_(i=1)^n m_i ar(r)_i times (ar(omega) times ar(r)_i) \
$

složený vektorový součin
$
  ar(a) times (ar(b) times ar(c)) & = (ar(a) dp ar(c)) ar(b) - (ar(a) dp ar(b)) ar(c) \
$

a tedy

$
        ar(B) & = sum_(i=1)^n m_i (r_i^2 ar(omega) - (ar(omega) dp ar(r)_i) ar(r)_i) \
  "kde" ar(B) & parallel.not ar(omega) sq !!! \
$

využijeme poznatek z LA

$
      ar(B) & = vec(B_x, B_y, B_z) \
  ar(omega) & = vec(omega_x, omega_y, omega_z) \
$

$
  I = mat(
    sum_(i=1)^n m_i (y_i^2 + z_i^2), sum_(i=1)^n - m_i x_i y_i, sum_(i=1)^n - m_i x_i z_i;
    sum_(i=1)^n - m_i x_i y_i, sum_(i=1)^n m_i (x_i^2 + z_i^2), sum_(i=1)^n - m_i y_i z_i
    ;
    sum_(i=1)^n - m_i x_i z_i, sum_(i=1)^n - m_i y_i z_i, sum_(i=1)^n m_i (x_i^2 + y_i^2)
  )
$

$
  ar(B) & = I ar(omega) \
$

kde $ar(B), ar(r)_i, ar(omega)$ jsou funkce času 😭 a $I$ je veličina tenzorové povahy...
