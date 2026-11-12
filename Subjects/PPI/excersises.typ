#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "@local/mod:0.1.0": *

#show: boilerplate

= Úvod do praktické fyziky - cvičení - Vojtěch Chlan
== Informace o předmětu
- příprava k fyzikálním praktikům - *zpracování dat*
- *získání zápočtu* - úspěšné absolvování dvou testů během semestru
- úlohy v testech podobné *nepovinným* domácím úkolům
- *doporučená literatura*
  - J. Englich - Úvod do praktické fyziky 1

== Chyby měření
- *náhodná chyba* - statistická
- *systematická* - metodická - např. neznám vnitřní odpor ampérmetru
- *hrubá* - hodně velká odchylka, několikanásobek standardní odchylky

chyba měření je *odchylka* naměřené hodnoty od správné hodnoty
- co je *správná* hodnota???

po korekci systematických chyb -> nejistota měření

metody odhadu nejistoty měření
- *statistické* $u_A$ - vyhodnocení z opakovaných měření
- *ostatní* $u_B$ - vyhodnocení z jiných zdrojů informací - např. info výrobce, třída přesnosti, odhad...

=== Jak sloučit nejistoty?
- maximální nejistota
  $
    u_"max" = u_A + u_B\
  $
*nevhodná*, max použití pro *plánování* experimentu, ne pro vyhodnocení dat

- kombinovaná standardní nejistota
$
  u_c^2 = u_A^2 + u_B^2\
$

vyjádření nejistoty:
- v jednotkách měřené veličiny - *absolutní* standardní nejistota
- v poměru k hodnotě měřené veličiny - *relativní* standardní nejistota
  $
    eta_x = u_(C,x)/(accent(mu_x, ~))
  $

zápis výsledku měření:

- odhad skutečné hodnoty měřené veličiny: $x = accent(eta_x, ~)$
- kombinovaná standardní nejistota: $u_(C,x)$

$
  x & = accent(eta_x, ~) (u_(C,x)) [x] (p = ...%) \
  p & = 68.27% "(standardní)" \
  p & = 95.45% "(rozšířená)" \
  p & = 99.73% "(mezní)" \
$

nejistotou uvádíme s přesností na *jednu*(výjimečně dvě - zaokrouhlovací chyba) *platné číslice*

výsledek zaokrouhlíme v řádu poslední platné číslice nejistoty

pokud se chyba měření ve výsledku neudává, předpokládá se implicitně, že je menší než polovina řádu za poslední platnou číslicí výsledku

=== Fyzikální jednotky
- *jednotky SI* + násobky a předpony
- *CGS*
- *MKS*
- *atomové jednotky*

#pb()
=== Maximální nejistota
- hrubý - řádový odhad nejistoty měření
  - $a = mu_a^~ plus.minus epsilon_a$
  - $b = mu_b^~ plus.minus epsilon_b$

- pak součet
  - $S = a+b = (mu_a^~ + mu_b^~) plus.minus (epsilon_a + epsilon_b)$

- pak rozdíl
  - $R = a-b = (mu_a^~ + mu_b^~) plus.minus (epsilon_a + epsilon_b)$
  - absolutní maximální nejistota $epsilon_R = epsilon_a + epsilon_b$
  - relativní maximální nejistota *!!!* $eta_r = (epsilon_a + epsilon_b)/abs(mu_a - mu_b)$ *!!!*

- pak součin
  - $N = a b = (mu_a^~ mu_b^~) plus.minus (epsilon_a mu_b^~ + epsilon_b mu_a^~)$
  - absolutní maximální nejistota $epsilon_a mu_b^~ + epsilon_b mu_a^~$
  - absolutní relativní nejistota $eta_N = (epsilon_a mu_b^~ + epsilon_b mu_a^~)/(mu_a^~ mu_b^~) = eta_a + eta_b$

- pak podíl
  - $P = a/b = (mu_a^~)/(mu_b^~) plus.minus (epsilon_a/mu_b^~ + epsilon_b mu_a^~/(mu_b^~)^2)$
  - absolutní maximální nejistota $epsilon_a/mu_b^~ + epsilon_b mu_a^~/(mu_b^~)^2$
  - absolutní relativní nejistota $eta_P = eta_a + eta_b$

- pak mocnina
  - $M = a^n = mu_a^~^n plus.minus n epsilon_a mu_a^~^(n-1)$
  - absolutní maximální chyba $epsilon_M = n epsilon_a mu_a^~^(n-1)$
  - absolutní relativní nejistota $eta_M = abs(n) eta_a$

#pb()
=== Nejistota měření a měřidel
- obvykle systematická chyba
- *korekce*

- 2 typy měřidel
  - analogové
  - digitální

==== Analogové
- statistické šetření výrobce na sérii vyrobených přístrojů
  - mají sérii $Delta_i = abs(X_i - X_0)$ - rozdílů od referenční hodnoty
  - z nich stanoví maximální možnou chybu
    - třída přesnosi $P = (Delta_(i "max"))/(R) 100%$

  - nejistota naměřené veličiny $u_B = (P R)/sqrt(3) 10^(-2)$

    - v intervalu $(-u_B, u_B)$ se skutečná hodnota naměřené veličiny pohybuje cca s pravděpodobností $p accent(=, ~) 0.58$

- je tedy vhodné měřit v horní části stupnice ručkového přístroje - protože absolutní chyba na stupnici je stále stejná, protože stupnice měřícího přístroje standardně bývá rozdělena podle chyby - kdy $a = Delta = "nejmenší dílek stupnice"$ tedy $u_B = Delta/sqrt(3) dt(=) 0.58 Delta dt(=) Delta/2$
==== Digitální
- chyba je násobkem měřené hodnoty plus násobek řádu poslední platné cifry zobrazené na displeji


== Důležité - rozdíl mezi maximální dovolenou chybou a standardní nejistotou!
#important(caption: "maximální dovolená chyba")[$
  Delta_"max" = P dot.op R dot.op 10^(-2)
$]

#important(caption: "standardní nejistota")[$
  u_B = (P R)/sqrt(3) 10^(-2) = Delta_"max"/sqrt(3)
$]

#pb()
== Pravděpodobnost a rozdělení pravděpodobnosti

např. kostka idk

- konečně mnoho výsledků $n$, všechny stejně pravděpodobné
- pravděpodobnost jevu $A$
$
  p(A) = n_A/n
$

kde $n_A$ je počet příznivých jevů $A$ a $n$ je počet všech jevů

- lépe

experiment nezávisle $n$-krát opakujeme

relativní četnost jevu $A$

$
  X_A = n_A/n
$

$
  P(A) = lim_(n->infinity) X_A
$

vyžaduje nekonečný experiment...

Obě definice maji ale společné 3 vlastnosti, považujeme za axiomy:
+ $p(A) >= 0$ - pravděpodobnost libovolného jevu je nezáporná
+ $p(Omega) = 1$ - pravděpodobnost *jistého* jevu je 1
+ $p(union_(i=1)^infinity) = sum_(i=1)^infinity p(A_i))$ - pro disjunktní jevy $A_i$

- normalizační podmínka
  - $sum_(i=1)^n p_i = 1$ konečná
  - $sum_(i=1)^infinity p_i = 1$ nekonečná

- distribuční funkce
  - pravděpodobnost, že veličina $X$ bude v intervalu $(-infinity, x chevron.r$
    - $F(x) eq.triple p(X <= x)$

- *spojitá* náhodná veličina
  - rozdělení pravděpodobnosti - *hustota pravděpodobnosti* $f(x)$
    - udává pravděpodobnost, že se výsledek nachází v infinitesimálním intervalu $chevron x_0, x_0 + d x chevron.r$
    - $p eq.triple f(x_0) d x$
  - distribuční funkce
    - $F(x) eq.triple integral_(-infinity)^x f(t) d t$
  - pravděpodobnost v intervalu $chevron a, b chevron.r$
    - $p = integral_a^b f(x) d x = F(b) - F(a)$

#figure(
  cetz.canvas({
    import cetz.draw: *

    // Density function: Gaussian curve
    let f(x) = 2.6 * calc.exp(-calc.pow(x - 3.5, 2) / 1.8)

    let a = 2.3
    let b = 4.6

    // Shaded area under curve between a and b
    let area-pts = ((a, 0),)
    let n-area = 30
    for i in range(0, n-area + 1) {
      let x = a + i * (b - a) / n-area
      area-pts.push((x, f(x)))
    }
    area-pts.push((b, 0))
    line(..area-pts, close: true, fill: rgb("3b82f633"), stroke: none)

    // Axes
    line((-0.3, 0), (6.5, 0), mark: (end: ">"), stroke: 0.8pt)
    line((0, -0.3), (0, 3.2), mark: (end: ">"), stroke: 0.8pt)
    content((6.4, -0.3), [$x$])
    content((-0.35, 3.1), [$f(x)$])

    // Curve
    let curve-pts = ()
    let n-curve = 60
    for i in range(0, n-curve + 1) {
      let x = 0.5 + i * (6.0 - 0.5) / n-curve
      curve-pts.push((x, f(x)))
    }
    line(..curve-pts, stroke: 1.5pt + rgb("#1e40af"))

    // Vertical dashed lines at boundary points
    line((a, 0), (a, f(a)), stroke: (dash: "dashed", paint: rgb("#6b7280"), thickness: 0.8pt))
    line((b, 0), (b, f(b)), stroke: (dash: "dashed", paint: rgb("#6b7280"), thickness: 0.8pt))

    // Ticks and labels on x-axis
    line((a, -0.08), (a, 0.08), stroke: 0.8pt)
    line((b, -0.08), (b, 0.08), stroke: 0.8pt)
    content((a, -0.35), [$a$])
    content((b, -0.35), [$b$])

    // Label pointing to probability area
    line((4.7, 2.3), (3.6, 1.2), mark: (end: ">"), stroke: 0.7pt + rgb("#4b5563"))
    content((4.8, 2.3), anchor: "west", [
      $p = P(a <= X <= b) = integral_a^b f(x) dif x$
    ])

    // Curve label
    content((1.2, f(1.2) + 0.35), [$f(x)$], anchor: "south")
  }),
  caption: [Hustota pravděpodobnosti $f(x)$ a pravděpodobnost výskytu jevu v intervalu $chevron a, b chevron.r$],
)

=== Rovnoměrné rozdělení
- množina výsledků $Omega = {x_1, x_2, ..., x_n}$
- každý výsledek je stejně pravděpodobný
  - $p(A_i) = p forall i in {1,...,n}$
- normalizační podmínka
  - $1 = sum_(i=1)^n p(A_i) = sum_(i=1)^n p = n p => p = 1/n$
- obecně pro interval $chevron a, b chevron.r$
  - $p_i = 1/n = 1/(b-a+1)$
- distribuční funkce
  - $i < a - 0$
  - $a < i < b - 1/(b-a+1)$
  - $i > b - 1$

- je li náhodná veličina spojitá
$
  f(x) = cases(
    1/(b-a) space x in chevron a, b chevron.r,
    0 space x in.not chevron a, b chevron.r
  ) arrow^(integral f(x)) F(x) = cases(
    0 x < a,
    (x-a)/(b-a) x in chevron a, b chevron.r,
    1 x> b
  )
$

#figure(
  cetz.canvas({
    import cetz.draw: *

    // --- Hustota pravděpodobnosti f(x) ---
    // Vybarvená plocha pod křivkou
    rect((1.2, 0), (4.0, 1.8), fill: rgb("3b82f626"), stroke: none)

    // Pomocné přerušované čáry
    line((0, 1.8), (1.2, 1.8), stroke: (dash: "dashed", paint: gray, thickness: 0.6pt))
    line((1.2, 0), (1.2, 1.8), stroke: (dash: "dashed", paint: gray, thickness: 0.6pt))
    line((4.0, 0), (4.0, 1.8), stroke: (dash: "dashed", paint: gray, thickness: 0.6pt))

    // Osy pro f(x)
    line((-0.4, 0), (4.8, 0), mark: (end: ">"), stroke: 0.7pt)
    content((4.8, -0.3), [$x$])
    line((0, -0.3), (0, 2.5), mark: (end: ">"), stroke: 0.7pt)
    content((-0.3, 2.5), [$f(x)$])

    // Průběh hustoty f(x)
    line((-0.4, 0), (1.2, 0), stroke: 1.5pt + rgb("1d4ed8"))
    line((1.2, 1.8), (4.0, 1.8), stroke: 1.5pt + rgb("1d4ed8"))
    line((4.0, 0), (4.6, 0), stroke: 1.5pt + rgb("1d4ed8"))

    // Hraniční body
    circle((1.2, 0), radius: 0.06, fill: white, stroke: 1.2pt + rgb("1d4ed8"))
    circle((4.0, 0), radius: 0.06, fill: white, stroke: 1.2pt + rgb("1d4ed8"))
    circle((1.2, 1.8), radius: 0.06, fill: rgb("1d4ed8"), stroke: 1.2pt + rgb("1d4ed8"))
    circle((4.0, 1.8), radius: 0.06, fill: rgb("1d4ed8"), stroke: 1.2pt + rgb("1d4ed8"))

    // Popisky
    content((1.2, -0.3), [$a$])
    content((4.0, -0.3), [$b$])
    content((-0.55, 1.8), [$frac(1, b - a)$])
    content((2.6, 0.9), [$"Plocha" = 1$])

    // --- Distribuční funkce F(x) ---
    // Posun počátku
    let ox = 6.2

    // Pomocné přerušované čáry
    line((ox, 1.8), (ox + 4.0, 1.8), stroke: (dash: "dashed", paint: gray, thickness: 0.6pt))
    line((ox + 4.0, 0), (ox + 4.0, 1.8), stroke: (dash: "dashed", paint: gray, thickness: 0.6pt))

    // Osy pro F(x)
    line((ox - 0.4, 0), (ox + 4.8, 0), mark: (end: ">"), stroke: 0.7pt)
    content((ox + 4.8, -0.3), [$x$])
    line((ox, -0.3), (ox, 2.5), mark: (end: ">"), stroke: 0.7pt)
    content((ox - 0.3, 2.5), [$F(x)$])

    // Průběh distribuční funkce F(x)
    line((ox - 0.4, 0), (ox + 1.2, 0), stroke: 1.5pt + rgb("1d4ed8"))
    line((ox + 1.2, 0), (ox + 4.0, 1.8), stroke: 1.5pt + rgb("1d4ed8"))
    line((ox + 4.0, 1.8), (ox + 4.6, 1.8), stroke: 1.5pt + rgb("1d4ed8"))

    // Význačné body
    circle((ox + 1.2, 0), radius: 0.06, fill: rgb("1d4ed8"), stroke: 1.2pt + rgb("1d4ed8"))
    circle((ox + 4.0, 1.8), radius: 0.06, fill: rgb("1d4ed8"), stroke: 1.2pt + rgb("1d4ed8"))

    // Popisky
    content((ox + 1.2, -0.3), [$a$])
    content((ox + 4.0, -0.3), [$b$])
    content((ox - 0.25, 1.8), [$1$])
  }),
  caption: [Hustota pravděpodobnosti $f(x)$ a distribuční funkce $F(x)$ spojitého rovnoměrného rozdělení],
)


#pb()
==== Příklad
5-místný displej voltmetru, poslední pozice rozbitá, jaké se dopouštíme dodatečné chyby?

střední hodnota...

$
  0 "mV", 10 "mV", 20 "mV" ... "90 mV"\
  Delta^(\_) 1/10 (90)/2 = 45 "mV"\
$

=== Histogram
- relativní četnost
  - $r_i = n_i/N; sq N = sum_(i=1)^m n_i$
- šířka binu
  - $Delta_i = x_(i+1) - x_i$

#figure(
  cetz.canvas({
    import cetz.draw: *

    // Osy
    line((-0.2, 0), (7.2, 0), mark: (end: ">"), stroke: 0.8pt)
    line((0, -0.2), (0, 4.0), mark: (end: ">"), stroke: 0.8pt)

    // Popisky os
    content((7.2, -0.35), [$x$])
    content((-0.4, 4.0), [$r_i$])

    // Sloupce histogramu
    let bin-fill = rgb("e0e7ff")
    let bin-stroke = 0.9pt + rgb("3730a3")
    let highlight-fill = rgb("a5b4fc")

    rect((0.8, 0), (1.6, 0.7), fill: bin-fill, stroke: bin-stroke)
    rect((1.6, 0), (2.4, 1.6), fill: bin-fill, stroke: bin-stroke)
    // Vyznačený i-tý bin
    rect((2.4, 0), (3.2, 2.8), fill: highlight-fill, stroke: bin-stroke)
    rect((3.2, 0), (4.0, 3.4), fill: bin-fill, stroke: bin-stroke)
    rect((4.0, 0), (4.8, 2.3), fill: bin-fill, stroke: bin-stroke)
    rect((4.8, 0), (5.6, 1.3), fill: bin-fill, stroke: bin-stroke)
    rect((5.6, 0), (6.4, 0.5), fill: bin-fill, stroke: bin-stroke)

    // Vyznačení relativní četnosti r_i na ose y
    line((0, 2.8), (2.4, 2.8), stroke: (paint: rgb("6366f1"), dash: "dashed", thickness: 0.7pt))
    line((-0.08, 2.8), (0.08, 2.8), stroke: 0.8pt)
    content((-0.35, 2.8), [$r_i$])

    // Značky na ose x pro i-tý bin
    line((2.4, -0.08), (2.4, 0.08), stroke: 0.8pt)
    line((3.2, -0.08), (3.2, 0.08), stroke: 0.8pt)
    line((0.8, -0.08), (0.8, 0.08), stroke: 0.8pt)
    line((6.4, -0.08), (6.4, 0.08), stroke: 0.8pt)

    content((0.8, -0.35), [$x_1$])
    content((2.4, -0.35), [$x_i$])
    content((3.2, -0.35), [$x_(i+1)$])
    content((6.4, -0.35), [$x_(m+1)$])

    // Kóta šířky binu Delta_i
    line((2.4, -0.1), (2.4, -0.75), stroke: (paint: luma(160), dash: "dotted", thickness: 0.6pt))
    line((3.2, -0.1), (3.2, -0.75), stroke: (paint: luma(160), dash: "dotted", thickness: 0.6pt))
    line((2.4, -0.7), (3.2, -0.7), mark: (start: ">", end: ">"), stroke: 0.7pt + rgb("3730a3"))
    content((2.8, -1.0), [$Delta_i$])
  }),
  caption: [Příklad histogramu s vyznačenou šířkou třídy $Delta_i$ a relativní četností $r_i$],
)

- četnost je v binech

- normovaný histogram - relativní četnosti se vydělí šířkou binu
  - $xi_i = r_i/Delta_i$

  - plocha je normována
    - $sum_(i=1)^m xi_i Delta_i = sum_(i=1)^m r_i = 1$

- šířka binů není chybou měření...
- je vhodné zvolit třeba takovou šířku, pro kterou nevidíme rozdíly menší než nejistotu měření
- např. pro Gaussovku

#figure(
  cetz.canvas({
    import cetz.draw: *

    let panels = (
      (ox: 0.0, m: 6, label: [$m = 6$]),
      (ox: 5.0, m: 14, label: [$m = 14$]),
      (ox: 10.0, m: 30, label: [$m = 30$]),
    )

    let plot-w = 3.6
    let plot-h = 2.0
    let plot-x0 = 0.3

    for p in panels {
      let ox = p.ox
      let m = p.m

      // Osy
      line((ox, 0), (ox + plot-w + 0.6, 0), mark: (end: ">"), stroke: 0.7pt)
      line((ox, 0), (ox, plot-h + 0.4), mark: (end: ">"), stroke: 0.7pt)
      content((ox + plot-w + 0.5, -0.25), text(size: 8pt)[$x$])
      content((ox - 0.2, plot-h + 0.3), text(size: 8pt)[$xi(x)$])

      // Sloupce histogramu
      let bin-w = plot-w / m
      for i in range(m) {
        let z-mid = -3.0 + 6.0 * (i + 0.5) / m
        let h-val = calc.exp(-0.5 * z-mid * z-mid) * plot-h
        let bx1 = ox + plot-x0 + i * bin-w
        let bx2 = bx1 + bin-w

        rect(
          (bx1, 0),
          (bx2, h-val),
          fill: rgb("e0e7ff"),
          stroke: 0.5pt + rgb("4338ca"),
        )
      }

      // Teoretická Gaussova křivka
      let curve-pts = ()
      let steps = 40
      for i in range(steps + 1) {
        let z = -3.0 + 6.0 * (i / steps)
        let y-val = calc.exp(-0.5 * z * z) * plot-h
        curve-pts.push((ox + plot-x0 + (z + 3.0) / 6.0 * plot-w, y-val))
      }
      line(..curve-pts, stroke: 1.1pt + rgb("dc2626"))

      // Popisek panelu
      content((ox + plot-x0 + plot-w / 2, -0.45), text(size: 9pt)[#p.label])
    }
  }),
  caption: [Přechod od normovaného histogramu ke spojité hustotě pravděpodobnosti (Gaussově křivce) se zvyšujícím se počtem binů $m$],
)


#pb()
=== Přechod od rovnoměrného rozdělení na jiné rozdělení
==== Např. exponenciální rozložení
$
  U(0,1) & -> f(t) \
    f(x) & = e^(-t) \
$

#cetz.canvas({
  import cetz.draw: *

  let f(x) = calc.exp(-x)
  let x-max = 5.6
  let accent = rgb("dc2626")

  // osy
  line((-0.4, 0), (6.2, 0), mark: (end: ">"), stroke: 0.8pt)
  line((0, -0.35), (0, 1.4), mark: (end: ">"), stroke: 0.8pt)

  // vyšrafovaná plocha P(X <= 2)
  let area-pts = range(41).map(i => {
    let x = 2.0 * i / 40
    (x, f(x))
  })
  line((0, 0), ..area-pts, (2, 0), close: true, fill: accent.lighten(85%), stroke: none)

  // hustota
  let curve-pts = range(113).map(i => {
    let x = x-max * i / 112
    (x, f(x))
  })
  line(..curve-pts, stroke: 1.2pt + accent)

  // hranice integrace
  line((2, 0), (2, f(2)), stroke: (dash: "dashed", paint: accent, thickness: 0.8pt))

  // značky na osách
  for t in (1, 2, 3, 4, 5) {
    line((t, 0), (t, -0.07), stroke: 0.8pt)
    content((t, -0.07), [#t], anchor: "north", padding: 0.12)
  }
  line((-0.07, 1), (0, 1), stroke: 0.8pt)
  content((-0.07, 1), [1], anchor: "east", padding: 0.12)

  // popisky os
  content((6.2, 0), [$x$], anchor: "west", padding: 0.15)
  content((0, 1.4), [$f(x)$], anchor: "south", padding: 0.15)

  // předpis hustoty
  content((3.2, 0.9), [$f(x) = e^(-x)$], anchor: "west", padding: 0.1)

  // popisek plochy
  content((2.7, 0.42), [$P(X <= 2)$], anchor: "west", padding: 0.1)
  line((2.65, 0.4), (1.55, 0.19), mark: (end: ">"), stroke: 0.6pt)
})

chceme *inverzní funkci*

$
                                         r & = F(t) \
                                         t & = inv(F) (r) \
                                         f & = 1/tau e^(- t/tau) \
  integral_0^(+infinity) e^(- t/tau) dif t & = 1/tau (-tau) e^(- t/tau) \
                                         F & = 1 - e^(-t/tau) equiv r \
                                         t & = - tau ln(1-r) \
$


==== Např. Gaussova distribuce

$
  f(x) & = 1/sqrt(2 pi sigma) e^(- (x-mu)^2/(2 sigma^2)) \
  F(x) & = 1/2 + 1/2 erf((x-mu)/(sigma sqrt(2)))
$

kde $erf$ je error funkce ať je to co je to

#pb()
=== Střední hodnota a rozptyl
jako operátor $E[...], chevron ... chevron.r$

$
  mu equiv E[x] & = sum_i x_i p_i \
  mu equiv E[x] & = integral_(-infinity)^(infinity) x f(x) dx \
$

n-tý moment

$
  mu_n equiv E[x] & = sum_i x_i^n p_i \
  mu_n equiv E[x] & = integral_(-infinity)^(infinity) x^n f(x) dx \
$

n-tý centrální moment

$
                    mu_n' & equiv E[(x-mu)^n] \
  mu_n' equiv E[(x-mu)^n] & = sum_i (x_i - mu)^n p_i \
  mu_n' equiv E[(x-mu)^n] & = integral_(-infinity)^(infinity) (x-mu)^n f(x) dx \
$

- 1. centrální moment $mu_1' = 0$
- 2. centrální moment - *disperze*, *rozptyl*, *variance*

$
  mu_2' & = D[x] = V[x] = E[(x-mu)^2] = E[x^2] - (E[x])^2 \
$

- "střední hodnota čtverce minus čtverec střední hodnoty"

$
  chevron x^2 chevron.r - chevron x chevron.r^2
$

z toho standardní(směrodatná odchylka)

$
  sigma & = sqrt(V[x]) \
$

#pb()
==== Pro rovnoměrné rozdělení
normovací podmínka
$
  1 & = integral_a^b f(x) dif x = p(b-a) => p = 1/(b-a) \
$

střední hodnota

$
  E & = integral_a^b x p dif x = (a+b)/2
$

disperze

$
  V & = (x-E)^2 p dx = (b-a)^2/12
$

standardní odchylka

$
  sigma & = sqrt(V) = (b-a)/(2 sqrt(3)) \
$

#pb()

=== Další charakteristiky
==== Medián
Pro medián $accent(x, ~)$ náhodné veličiny platí $F(accent(x, ~)) = 1/2$
- méně ovlivněn extrémními hodnotami

==== Modus
Hodnota, která se vyskytuje nejčastěji
$
  accent(x, hat) = argmax(f(x))
$

rozdělení unimodální, bimodální...

=== Binomické rozdělení
Házíme opakovaně kostkou...

#cetz.canvas({
  import cetz.draw: *

  let n = 10
  let bw = 0.6
  let step = 0.8
  let s = 16
  let probs = range(n + 1).map(k => calc.binom(n, k) / calc.pow(2, n))

  line((-0.7, 0), (n * step + 0.5, 0), mark: (end: ">"))
  line((-0.7, 0), (-0.7, 4.6), mark: (end: ">"))

  for (k, p) in probs.enumerate() {
    let x0 = k * step - bw / 2
    let h = p * s
    rect((x0, 0), (x0 + bw, h), fill: blue.lighten(70%), stroke: blue.darken(30%))
    content((k * step, -0.15), [#k], anchor: "north")
  }

  content((-0.7, 4.6), [P(X = k)], anchor: "south", padding: 0.15)
  content((n * step + 0.5, 0), [k], anchor: "north-west", padding: 0.1)
  content((n * step + 0.5, 4.6), [n = 10, p = 0.5], anchor: "north-east")
})

s jakou pravděpodobností se při $n$-násobném opakování experimentu jev $A$ realizuje právě $k$-krát?

$
  B_(n,p)(k) = binom(n, k)p^k (1-p)^(n-k)
$

normalizační podmínka:

$
  1 & = sum_(k=0)^n B_(n,p)(k) = sum_(k=0)^n binom(n, k)p^k (1-p)^(n-k) = 1^n = 1 \
$

střední hodnota:
$
  E[k] & = mu_1 = sum_(k=0)^n k B_(n,p)(k) = n p \
$

disperze:
$
  V[k] & = n p(1-p)
$

#pb()
=== Poissonovo rozdělení
co se stane když $p -> 0; sq n -> infinity$

$p n = mu = "konst"$

#cetz.canvas({
  import cetz.draw: *
  let pmf(k, m) = calc.exp(-m) * calc.pow(m, k) / calc.fact(k)
  let xs(k) = k * 0.62
  let ys(v) = v * 10

  line((-0.45, 0), (8.9, 0), mark: (end: ">"))
  line((0, -0.25), (0, 3.35), mark: (end: ">"))
  content((8.95, 0), [k], anchor: "west")
  content((0, 3.45), [$P(X = k)$], anchor: "south")

  for k in range(0, 14) {
    line((xs(k), 0), (xs(k), -0.07))
    content((xs(k), -0.1), text(size: 6.5pt)[#k], anchor: "north")
  }
  for v in (0.1, 0.2) {
    line((0, ys(v)), (-0.07, ys(v)))
    content((-0.1, ys(v)), text(size: 7pt)[$#v$], anchor: "east")
  }

  for k in range(0, 11) {
    let h = ys(pmf(k, 2))
    rect((xs(k) - 0.13, 0), (xs(k) - 0.01, h), fill: blue.lighten(70%), stroke: blue.darken(30%) + 0.4pt)
  }
  for k in range(0, 14) {
    let h = ys(pmf(k, 5))
    rect((xs(k) + 0.01, 0), (xs(k) + 0.13, h), fill: orange.lighten(70%), stroke: orange.darken(30%) + 0.4pt)
  }

  rect((6.0, 2.85), (6.3, 3.05), fill: blue.lighten(70%), stroke: blue.darken(30%) + 0.4pt)
  content((6.4, 2.95), [$\mu = 2$], anchor: "west")
  rect((6.0, 2.45), (6.3, 2.65), fill: orange.lighten(70%), stroke: orange.darken(30%) + 0.4pt)
  content((6.4, 2.55), [$\mu = 5$], anchor: "west")
})

=== Náhodná procházka - random walk
např. v 1D

pohyb po přímce po krocích $plus.minus L$ s pravděpodobností $p$ že jde doleva a $1-p$ že jde doprava

disperze roste lineárně s počtem kroků, standardní odchylka tedy roste s odmocninou

=== Cauchyho-Lorentzovo rozdělení
Máme bod v $vec(x_0, gamma)$ a promítáme náhodně paprsky na osu $x$ pod úhlem $theta$ z rovnoměrného rozdělení $(-pi/2, pi/2)$

Jak vypadá rozdělení průsečíků s osou $x$?

#cetz.canvas({
  import cetz.draw: *

  let P = (0, 1.6)
  let gam = 1.6

  // x-axis
  line((-4.2, 0), (4.4, 0), mark: (end: ">"))
  content((4.55, 0), [$x$], anchor: "west")

  // vertical dashed line from the source point down to the axis
  line(P, (0, 0), stroke: (dash: "dashed", paint: black))

  // semicircle of uniformly distributed angles (centered at P)
  arc(P, start: -180deg, stop: 0deg, radius: 0.9, stroke: gray, anchor: "origin")

  // rays at several angles theta
  for t in (-60, -30, 30, 60) {
    let rad = t * 1deg
    let xi = gam * calc.tan(rad)
    line(P, (xi, 0))
    circle((xi, 0), radius: 0.05, fill: black, stroke: none)
  }
  circle((0, 0), radius: 0.05, fill: black, stroke: none)

  // angle theta between the vertical (-90deg) and the -30deg ray (-120deg)
  arc(P, start: -120deg, stop: -90deg, radius: 0.7, anchor: "origin")
  content((rel: (-105deg, 0.85), to: P), [$theta$])

  // source point
  circle(P, radius: 0.05, fill: black, stroke: none)

  // labels
  content((rel: (0.12, 0.12), to: P), [$(x_0, gamma)$], anchor: "south-west")
  content((rel: (0.1, -1.05), to: P), [$gamma$], anchor: "west")
  content((0, -0.22), [$x_0$], anchor: "north")
  content((rel: (-1.1, 0), to: P), [$theta tilde U(-pi/2, pi/2)$], anchor: "east")
})

$
  1 = integral_(-pi/2)^(pi/2) P_theta dif phi = [P_theta]_(-pi/2)^(pi/2) = - pi/2 = pi P_theta
$

normovací podmínka $1/pi$

$
                                                                                x/h & = tan theta \
                                                                                phi & = arctan x/h \
                                             integral_(-pi/2)^(pi/2) 1/pi dif theta \
                                                dif theta = 1/(1+(x/h)^2) 1/h dif x \
  1/pi integral_(-infinity)^(infinity) 1/(1+(x/h)^2) 1/h dif x = 1/pi h/(h^2 + x^2)
$

$h$ udává šířku distribuce

nemá definovanou střední hodnotu, disperze je nekonečná
- liché momenty digergují, sudé jsou nekonečné...

$
  chevron x chevron.r = integral_(-infinity)^infinity x f(x) dx
$

diverguje!!!

musím použít medián

distribuční funkce

$
  F(x) = 1/2 + 1/pi arctan((x-x_0)/w)
$

$1/2$ tam je protože si to posunu ne od $-infinity$ ale od $x_0$, kde bych už měl mít nasčítanou polovinu

==== Ve fyzice
===== Nucené kmity

$y = A sin(Omega t + phi_0)$

jak se chová amplituda?

$
  A = (F_0)/m 1/(sqrt((omega_0^2 - Omega^2) + 4 delta^2 Omega^2))
$

a energie
$
  E = 1/4 F_0^2/m (Omega^2 + omega^2)/((omega^2 - Omega^2) + 4 delta^2 Omega^2)
$

závislosti připomínají Lorentzovu křivku

===== Šířka spektrální čáry
- $Delta E Delta t > planck/2$ Heisenbergova relace neurčitosti
- doba života $tau = Delta t$
- Wigner-Weisenkopf: $e^(- i E_1 k t) = e^(-Gamma/2 t) e^(-i E_0 t)$, $tau = 1/Gamma$

Breit-Wigner
$
  f(E_1) = k/((E_1-E_0)^2 + Gamma^2/4)
$

#pb()
=== Normální rozdělení - Gaussovo rozdělení
- hustota pravděpodobnosti
$
  f(x) = 1/sqrt(2 pi sigma) e^(- (x-mu)^2/(2 sigma^2))
$

- střední hodnota
$
  E = integral_(-infinity)^infinity x f(x) dif x = mu
$

- disperze
$
  V = integral_(-infinity)^infinity (x-E)^2 f(x) dif x = sigma^2
$

- distribuční funkce
$
  F(x) = 1/2 + 1/2 erf((x-mu)/(sigma sqrt(2)))
$

Brownův pohyb, difuze, distribuce vlastností v populaci - *mnoho malých aditivních jevů*

#image("./img_1.jpeg", height: 20%)

standardní, normované gaussovo rozdělení $mu = 0; space sigma = 1$, jinak máme tzv. *lognormální*

#cetz.canvas({
  import cetz.draw: *
  let xs = range(161).map(i => -4 + 8 * i / 160)
  let gauss(x, m, s) = 1 / (s * calc.sqrt(2 * calc.pi)) * calc.exp(-((x - m) * (x - m)) / (2 * s * s))
  let draw-curve(m, s, col) = {
    let pts = xs.map(x => (x, gauss(x, m, s)))
    line(..pts, stroke: col)
  }

  line((-4.2, 0), (4.35, 0), mark: (end: ">"))
  line((-4.2, 0), (-4.2, 0.98), mark: (end: ">"))
  content((4.42, 0), [$x$], anchor: "west")
  content((-4.2, 1.0), [$f(x)$], anchor: "south")

  for t in (-4, -2, 0, 2, 4) {
    line((t, 0), (t, -0.05))
    content((t, -0.08), [#t], anchor: "north")
  }

  draw-curve(0, 2, green)
  draw-curve(0, 1, blue)
  draw-curve(0, 0.5, red)
  draw-curve(2, 1, orange)
  draw-curve(-2, 0.7, purple)

  rect((1.55, 0.55), (4.35, 0.95), stroke: gray, fill: white)
  let rows = (
    (blue, [$mu = 0, sigma = 1$]),
    (red, [$mu = 0, sigma = 0.5$]),
    (green, [$mu = 0, sigma = 2$]),
    (orange, [$mu = 2, sigma = 1$]),
    (purple, [$mu = -2, sigma = 0.7$]),
  )
  for (i, row) in rows.enumerate() {
    let y = 0.895 - i * 0.075
    line((1.7, y), (2.1, y), stroke: row.at(0))
    content((2.2, y), text(size: 7pt, row.at(1)), anchor: "west")
  }
})

#pb()
==== Příklad - difuze
Fickův zákon
$
  (partial C)/(partial t) = D Delta x
$

kde $C$ je koncentrace a $Delta$ je Laplaceův operátor $Delta = nabla^2$

#pb()
=== Více náhodných veličin
Dvě náhodné veličiny $x,y$ mají rozdělení na intervalech $V_x$ a $V_y$ dané distribučními funkcemi $p(x), q(y)$

Jaká je pravděpodobnost že se $x,y$ nachází v intervalu $(x, x + dif x)$ a $(y, y + dif y)$?

Mějme $rho(x, y)$, pak

střední hodnota
$
  mu_x & = span(x) equiv E[x] = integral_V x rho(x, y) dif x dif y \
  mu_y & = span(y) equiv E[y] = integral_V y rho(x, y) dif x dif y \
$

obecně
$
  mu_(f(x,y)) = span(f(x,y)) equiv E[f(x,y)] = integral_V f(x,y) rho(x, y) dif x dif y\
$

analogicky další centrální momenty...

jak vypadá $rho(x, y)$?

pokud jsou nezávislé, pak $rho(x, y) = p(x),q(y)$

Obecně, pokud jsou nezávislé, vyjadřuje míru vztahu tzv. *kovariance*.

$
  cov(x, y) & = span((x-mu_x)(y-mu_y)) = integral_V (x-mu_x)(y-mu_y) rho(x, y) dif x dif y \
  cov(x, y) & = span(x, y) - span(x) span(y) => cov(x, x) = V(x) = sigma_x^2 \
$

koeficient korelace

$
  r(x,y) & = cov(x, y)/(sigma_x sigma_y) \
  r(x,y) & in (-1,1) \
$

- pro $r(x,y) approx -1$ antikorelované
- pro $r(x,y) approx 1$ korelované

#cetz.canvas({
  import cetz.draw: *

  let rnd(i, s) = {
    let t = calc.sin(i * 127.1 + s * 311.7) * 43758.5453
    t - calc.floor(t)
  }

  let cloud(corr, s) = range(22).map(i => {
    let u = rnd(i, s)
    let v = rnd(i, s + 1)
    let w = rnd(i, s + 2)
    let x = (u - 0.5) * 1.8
    let noise = (v + w - 1) * 0.9
    (x, corr * x + noise * calc.sqrt(1 - corr * corr))
  })

  let panel(origin, corr, s, label) = group({
    set-origin(origin)
    rect((-1.3, -1.3), (1.3, 1.3), stroke: gray.lighten(20%))
    line((-1.3, 0), (1.3, 0), stroke: (paint: gray.lighten(45%), thickness: 0.5pt))
    line((0, -1.3), (0, 1.3), stroke: (paint: gray.lighten(45%), thickness: 0.5pt))
    for p in cloud(corr, s) {
      circle(p, radius: 0.055, fill: blue.darken(15%), stroke: none)
    }
    content((0, -1.62), label, anchor: "north")
  })

  panel((0, 0), -1, 1, [$r approx -1$])
  panel((3.6, 0), -0.5, 2, [$r approx -0.5$])
  panel((7.2, 0), 0, 3, [$r approx 0$])
  panel((10.0, 0), 0.9, 4, [$r approx 0.9$])

  content((1.42, 0), [$x$], anchor: "west")
  content((0, 1.42), [$y$], anchor: "south")
})

#pb()
korelace neimplikuje příčinnou souvislost!

odhad nejistoty

$
  sigma_r & = (1-r^2)/sqrt(N-1) \
$

==== Příklad - lineární závislost
$
           y & = a x + b \
      r(x,y) & = cov(x, y)/(sigma_x sigma_y) = (span(x, y) - span(x) span(y))/(sigma_x sigma_y) \
     span(x) & = dots \
     span(y) & = span(a x + b) = integral_(-infinity)^infinity (a x + b) f(x) dif x = a span(x) + b \
  span(x, y) & = span(a x^2 + b x) = a span(x^2) + b span(x) \
   sigma_y^2 & = span(y^2) - span(y)^2 = span(a^2 x^2 + 2 a b + b^2) - a^2 span(x)^2 + 2 a b span(x) + b^2 \
             & = a^2 span(x^2) - a^2 span(x)^2 = a^2 sigma_x^2 \
$
tedy dosadíme
$
  r(x,y) & = (a span(x^2) + b span(x) - a span(x)^2 - b span(x))/(sigma x sqrt(a^2 sigma_x^2)) \
         & = (a sigma_x^2)/(sigma_x^2 sqrt(a^2)) = plus.minus 1 \
$

=== Obecně n náhodných veličin
mějme $x_1, x_2, dots, x_n$

pro každou veličinu můžeme zapsat

$
  span(f(x_i)) & = integral_V x_i rho(x_1, x_2, dots, x_n) dif(x_1, x_2, dots, x_n) \
$

Součet náhodných veličin:
$
  s = sum_(i=1)^n x_i\
$

a jeho střední hodnota
$
  span(s) = integral_V s rho(x_1, x_2, dots, x_n) dif(x_1, x_2, dots, x_n)\
$

#pb()
=== Aritmetický průměr
Střední hodnota součtu náhodných veličin
$
  span(sum_(i=1)^n x_i) = sum_(i=1)^n span(x_i)
$

Speciálně pro n-násobek $x$

$
  span(sum_(i=1)^n x) = n span(x)\
$

aritmetický průměr
$
        avg(x) & = 1/n sum_(i=1)^n x_i \
  span(avg(x)) & = span(1/n sum_(i=1)^n x_i) = 1/n sum_(i=1)^n span(x_i) = 1/n sum_(i=1)^n span(x) = span(x) \
$

*Zákon velkých čísel* - střední hodnota se blíží artimetickému průměru

$
  "Pr"{lim_(n->infinity) avg(x) = span(x)} = 1
$

slabý tvar - Čebyševova nerovnost
$
  lim_(n->infinity) "Pr"{abs(avg(x) - span(x)) >= epsilon} = 0
$

kde $"Pr"$ značí pravděpodobnost

=== Disperze aritmetického průměru
Co je disperze $V(avg(x))$?

Disperze součtu náhodných veličin je $V(s) = span(s^2) - span(s)^2$

tedy
$
  V(s) = V(sum_(i=1)^n x_i) = sum_(i=1)^n V(x_i) + sum_(i,j = 1; i!=j)^n cov(x_i, x_j)\
$

Jsou li nezávislé, pak $cov(x_i, x_j) = 0$

Pro aritmetický průměr: $V(avg(x)) = 1/n V(x)$

tedy disperze aritmetického průměru je n-krát menší než disperze průměrované veličiny

a tedy $sigma_avg(x) = sqrt(1/n V(x)) = sqrt(sigma_x^2/n) = sigma_x/sqrt(n)$

#pb()
=== Centrální limitní věta
#theorem(title: "Centrální limitní věta")[
  Pro náhodnou veličinu $x$ popsanou rozdělením pravděpodobnosti $p(x)$ je
  - střední hodnota $mu = span(x)$
  - disperze $V(x) = span(x^2) - span(x)^2$

  Aritmetický průměr při n-násobném nezávislém opakování veličiny $x$ je
  - popsán rozdělením $q(avg(x))$
  - střední hodnota $mu_n = span(x)$
  - disperze $V_n = V/n$

  Pak

  #important[$
    lim_(n->infinity) q((avg(x) - mu)/sqrt(V_n)) = N(0,1)\
  $]

  tedy s rostoucím $n$ se distribuce aritmetického průměru blíží *normálnímu rozdělení* $N(0,1)$ - tedy na rozdělení $p(x)$ nezáleží!
]
