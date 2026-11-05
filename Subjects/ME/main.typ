#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "@local/mod:0.1.0": *

#show: boilerplate

#title[Procvičovací seminář z mechaniky]
= Skalární součin pro libovolnou bázi
$
  ar(a) dot.op ar(b) = sum_(i=1)^n a_i ar(e_i) dot.op sum_(j=1)^m b_j e_j
$

Pro ortonormální bázi vyjde

$
  ar(a) dot.op ar(b) = sum_(i=1)^n a_i b_i
$

Kroneckerovo delta - funkce 2 proměnných vracející 1 nebo 0 jestli se proměnné rovnají

$
  delta_(i j) = cases(
    0 "když" i != j,
    1 "když" i = j
  )
$

= Vektorový součin pro libovolnou bázi

$
  norm(ar(a) times ar(b)) = norm(ar(a)) norm(ar(b)) sin alpha\
$

#definition(title: [vektorový součin])[
  přes determinant matice pro danou bázi $B = {accent(i, hat), accent(j, hat), accent(k, hat)}$:

  $
    ar(a) times ar(b) = det mat(
      accent(i, hat), accent(j, hat), accent(k, hat);
      a_1, a_2, a_3;
      b_1, b_2, b_3;
    )
  $
]

= Polohový vektor
$
  ar(r) = vec(x, y, z) = vec(x_1, x_2, x_3)\
$

== Pohyb
$
        ar(v) & = (Delta ar(r))/(Delta t) \
  Delta ar(r) & = ar(r)(t+Delta t) - ar(r)(t) \
$

$
  ar(v)(t) = cases(
    x = x(t),
    y = y(t),
    z = z(t),
  ) " - parametrický popis pohybu"
$

jestli chci popsat trajektorii pohybu, musím vyloučit parametr, v tomto případě $t$

#pb()
např.
$
        x & = alpha t \
        y & = beta t \
          \
  x/alpha & = y/beta \
   x beta & = y alpha \
        y & = x beta/alpha \
$

== Normálové a tečné zrchlení

$
  ar(v) = (d ar(r))/(d t) = abs(v) ar(tau)
$

kde $ar(tau)$ je jednotkový vektor ve směru tečny k trajektorii

$
  ar(a) & = (d ar(v))/(d t) = d/(d t) abs(v) ar(tau) = (d abs(v))/(d t) ar(tau) + abs(v) (d ar(tau))/(d t) \
           & = (d abs(v))/(d t) ar(tau) + abs(v) (d ar(tau))/(d s) (d s)/(d t) \
           & = (d abs(v))/(d t) ar(tau) + abs(v)^2 (d ar(tau))/(d s) \
$

kde velikost rychlosti $abs(v)$i její směr $ar(tau)$ jsou funkce času a směr rychlosti $ar(tau)$ je také funkce dráhy

a máme tedy 2 složky zrychlení
$
  (d abs(v))/(d t) ar(tau) = "tečné zrychlení - změna velikosti rychlosti"
$

a
$
  abs(v)^2 (d ar(tau))/(d s) = "normálové zrychlení - změna směru rychlosti, jelikož " d ar(tau) perp ar(tau)\
  abs(v)^2/R ar(n)\
$

=== Matematická odbočka, otočení vektoru

$
  ar(omega) = (d phi)/(d t) ar(c)
$

kde $ar(c)$ je jednotkovým vektorem ve směru osy otáčení

kde $ar(omega)$ udává navíc ještě směr otáčení

$
      ar(c) times ar(r) & = (d ar(r))/norm(d ar(r)) norm(ar(c)) norm(ar(r)) sin alpha \
      ar(c) times ar(r) & = (d ar(r))/norm(d ar(r)) R \
                          d s & = abs(d ar(r)) \
      ar(c) times ar(r) & = (d ar(r))/(d phi) \
  d ar(phi) times ar(r) & = d ar(r) \
$

== Kruhový pohyb
$
  d ar(r) & = d ar(phi) times ar(r) \
    ar(v) & = ar(omega) times ar(r) \
             \
    ar(a) & = (d ar(v))/(d t) = d/(d t)(ar(omega) times ar(r)) \
    ar(a) & = (d ar(omega))/(d t) times ar(r) + ar(omega) times ar(v) \
    ar(a) & = ar(epsilon) times ar(r) + ar(omega) times ar(v) \
$


== Příklad

$
  ar(r) = t^3 vec(1, 0) + 3 t^3 vec(0, 1)
$

$
  ar(v) & = 3t^2 vec(1, 0) + 9t^2 vec(0, 1) \
  ar(a) & = 6t vec(1, 0) + 18t vec(0, 1) \
$

pro $t = 2$

$
  ar(v) = vec(12, 36)\
  ar(a) = vec(12, 36)\
$

#pb()
= Příklad

hodím kámen z $h$, rychlostí $abs(ar(v_0))$

chci $phi$ úhel dopadu, poloměr křivosti při dopadu

$
  x & = v_0 t \
  y & = 1/2 g t^2
$

mám parametricky popsaný pohyb, vyjdřím čas

$
  t & = x/v_0 \
  y & = 1/2 g x^2/v_0^2 = 1/2 g/v_0^2 x^2 \
$

=> rovnice paraboly

hledám $abs(ar(v))$
$
  v_x = (dif x)/(dif t) = v_0\
  v_y = (dif y)/(dif t) = g t\
$

abych zjistil rychlost při dopadu, potřebuji zjistit čas dopadu

$
    y & = h \
    h & = 1/2 g t_d^2 \
  t_d & = sqrt((2 h)/g) \
$

vektor rychlosti dopadu $ar(v)$ je tedy
$
  ar(v) = vec(v_0, g sqrt((2h)/g))
$

velikost rychlosti $abs(ar(v))$ je:

$
  abs(ar(v)) = sqrt(v_0^2 + g^2 (2h)/g)
$

Poloměr oskulační kružnice

$
  abs(ar(a_n)) & = v^2/R \
$
#important[$
  R & = v^2/abs(ar(a_n)) \
$]

$
         ar(g) & = ar(a_n) + ar(a_t) \
  abs(ar(a_n)) & = g cos phi \
$

$
  R & = v^2/(g cos phi) \
$

#pb()
= Inerciální vs neinerciální soustavy

#figure(
  cetz.canvas({
    import cetz.draw: *

    let L = 1.6
    let ax = (0.866 * L, -0.5 * L)
    let ay = (-0.866 * L, -0.5 * L)
    let az = (0, L)

    let O1 = (0, 0)
    let O2 = (4.2, 0.5)

    line(O1, (rel: ax, to: O1), mark: (end: ">"), name: "sx")
    line(O1, (rel: ay, to: O1), mark: (end: ">"), name: "sy")
    line(O1, (rel: az, to: O1), mark: (end: ">"), name: "sz")

    line(O2, (rel: ax, to: O2), mark: (end: ">"), name: "px")
    line(O2, (rel: ay, to: O2), mark: (end: ">"), name: "py")
    line(O2, (rel: az, to: O2), mark: (end: ">"), name: "pz")

    circle(O1, radius: 0.05, fill: black, stroke: none)
    circle(O2, radius: 0.05, fill: black, stroke: none)

    content("sx.end", [$x$], anchor: "north-west", padding: 0.08)
    content("sy.end", [$y$], anchor: "north-east", padding: 0.08)
    content("sz.end", [$z$], anchor: "south", padding: 0.08)

    content("px.end", [$x'$], anchor: "north-west", padding: 0.08)
    content("py.end", [$y'$], anchor: "north-east", padding: 0.08)
    content("pz.end", [$z'$], anchor: "south", padding: 0.08)

    content((rel: (0, -0.45), to: O1), [$S$], anchor: "north", padding: 0.05)
    content((rel: (0, -0.45), to: O2), [$S'$], anchor: "north", padding: 0.05)

    line((1.4, 1.1), (3.0, 1.1), mark: (end: ">"), stroke: (paint: blue.darken(20%), dash: "dashed"), name: "vel")
    content("vel.mid", [$ar(v) = "konst."$], anchor: "south", padding: 0.12)
  }),
  caption: [
    Inerciální vztažná soustava $S$ a soustava $S'$, která se vůči $S$
    pohybuje rovnoměrně přímočaře – je tedy také inerciální.
  ],
)

Mějme soustavu $S$ a soustavu $S'$ kde $S'$ se pohybuje vůči soustavě $S$

pak poloha $P'$ v $P$ je $ar(R)$, poloha bodu v $S'$ vůči $S'$ je $ar(r')$ a $ar(r)$ poloha bodu vůči soustavě $S$

kde

$
  ar(r) = ar(R) + ar(r')\
$

$
  (dif ar(r))/(dif t) = (dif ar(R))/(dif t) + (dif ar(r'))/(dif t)\
  ar(v) = ar(u) + ar(v')\
$

Inerciální vztažná soustava <=> $ar(u) = "konst."$

tj. $ar(R) = ar(u) t$

a $ar(r) = ar(u) t + ar(r')$ - *Galileova transformace*

a dále:

$
  (dif ar(v))/(dif t) & = (dif ar(u))/(dif t) + (dif ar(v'))/(dif t) \
                ar(a) & = ar(a_u) + ar(a') \
$

kde $ar(a_u) = 0$

$
    ar(F) & = m ar(a) \
  ar(F^*) & = ar(F_u) + ar(F') \
  ar(F^*) & = m ar(u) + m ar(a') \
  ar(F^*) & = m ar(a') \
$

Newtonovy zákony jsou vůči Galileově transformaci *invariantní* pro ISS.

V NISS působí *fiktivní síly* - také *setrvačné síly*.

#pb()
= Časová derivace v rotující soustavě

#cetz.canvas({
  import cetz.draw: *
  let ang = 35deg
  let ca = calc.cos(ang)
  let sa = calc.sin(ang)
  let px = 2.0
  let py = 3.0

  line((-0.9, 0), (5.4, 0), mark: (end: ">"))
  line((0, -0.9), (0, 4.4), mark: (end: ">"))
  content((5.4, 0), [$x$], anchor: "west", padding: 0.15)
  content((0, 4.4), [$y$], anchor: "south", padding: 0.15)

  let xr = (4.8 * ca, 4.8 * sa)
  let yr = (-3.8 * sa, 3.8 * ca)
  line((0, 0), xr, mark: (end: ">"), stroke: blue.darken(30%))
  line((0, 0), yr, mark: (end: ">"), stroke: blue.darken(30%))
  content(xr, [$x'$], anchor: "south-east", padding: 0.15)
  content(yr, [$y'$], anchor: "south-west", padding: 0.15)

  arc((0, 0), start: 0deg, stop: 35deg, radius: 1.3, stroke: blue.darken(30%))
  content(
    (1.55 * calc.cos(17.5deg), 1.55 * calc.sin(17.5deg)),
    [$phi$],
    anchor: "north",
    padding: 0.05,
  )

  content((rel: (-0.15, -0.15), to: (0, 0)), [$O$], anchor: "north-east", padding: 0.05)

  let sx = px * ca + py * sa
  let sy = -px * sa + py * ca
  let proj-x = (sx * ca, sx * sa)
  let proj-y = (-sy * sa, sy * ca)
  line(
    (px, py),
    proj-x,
    stroke: (paint: blue.lighten(30%), dash: "dashed", thickness: 0.6pt),
  )
  line(
    (px, py),
    proj-y,
    stroke: (paint: blue.lighten(30%), dash: "dashed", thickness: 0.6pt),
  )

  line((0, 0), (px, py), mark: (end: ">"), name: "rv")
  content("rv.mid", [$ar(r)$], anchor: "south-east", padding: 0.12)

  circle((px, py), radius: 0.07, fill: black, stroke: none, name: "pt")
  content((rel: (0.15, 0.18), to: "pt"), [$P$], anchor: "south-west", padding: 0.05)
})



$
             dif ar(A) & = ar(A_2) - ar(A_1) \
           dif' ar(A') & = dif ar(A) + dif ar(R) \
             dif ar(R) & = dif ar(phi) times ar(A) \
            dif' ar(A) & = dif ar(A) - dif ar(phi) times ar(A) \
  (dif' ar(A))/(dif t) & = (dif ar(A))/(dif t) - (dif ar(phi))/(dif t) times ar(A) \
  (dif' ar(A))/(dif t) & = (dif ar(A))/(dif t) - ar(omega) times ar(A) \
$

zpět k pohybu

$
  (dif' ar(r))/(dif t) &= (dif r)/(dif t) - ar(omega) times ar(r)\
  ar(v') &= ar(v) - ar(omega) times ar(r)\
  ar(a') &= (dif' ar(v'))/(dif t) = (dif ar(v'))/(dif t) - ar(omega) times ar(v')\
  ar(a') &= dif/(dif t)(ar(v) - ar(omega) times ar(r)) - ar(omega) times ar(v')\
  ar(a') &= (dif ar(v))/(dif t) - (dif ar(omega))/(dif t) times ar(r) - ar(omega) times (dif ar(r))/(dif t) - ar(omega) times ar(v')\
  ar(a') &= (dif ar(v))/(dif t) - ar(epsilon) times ar(r) - ar(omega) times ar(v) - ar(omega) times ar(v')\
  ar(a') &= (dif ar(v))/(dif t) - ar(epsilon) times ar(r) - 2 ar(omega) times ar(v)\
  ar(a') &= ar(a) - ar(epsilon) times ar(r) - ar(omega) times (ar(omega) times ar(r)) - 2 ar(omega) times ar(v)\
  ar(F) &= m ar(a)\
  ar(F') &= m ar(a')\
  ar(F') &= ar(F) + ar(F_epsilon) + ar(F_o) + ar(F_C)\
$

#pb()
kde
+ $ar(F)$ je síla síla
+ $ar(F_epsilon)$ je Eulerova síla
+ $ar(F_o)$ je odstředivá síla
+ $ar(F_C)$ je Coriolisova síla

== Eulerova síla
$
  ar(F_epsilon) & = - m ar(epsilon) times ar(r) \
$

působí v rovině otáčení, existuje jen pokud se $ar(omega)$ mění

== Coriolisova síla
$
  ar(F_C) & = - 2 m ar(omega) times ar(v') \
$

působí kolmo na rovinu otáčení, nepůsobí, jestliže se pohybuji rovnoběžně s osou otáčení


== Odstředivá síla

$
  ar(F_o) & = - m ar(omega) times (ar(omega) times ar(r))
$

působí v rovině otáčení, ve směru od osy otáčení


#import "@preview/cetz:0.3.4": canvas, draw
#canvas({
  import draw: *

  // Simple projection: disk in the xy-plane, ω along z, viewed slightly from above
  let s = 0.5 // perspective foreshortening of the disk
  let P(v) = (v.at(0), s * v.at(1) + v.at(2))
  let add(a, b) = a.zip(b).map(((p, q)) => p + q)
  let sc(k, v) = v.map(c => k * c)

  let O = (0, 0, 0)
  let r = (1.0, -1.732, 0) // |r| = 2, angle −60°
  let F-o = sc(1.4, (0.5, -0.866, 0)) // −ω×(ω×r): radially outward
  let v = sc(1.3, (-0.866, 0.5, 0)) // velocity in the rotating frame
  let F-C = sc(1.4, (0.5, 0.866, 0)) // −2ω×v′: ⟂ v′, to the right
  let F-e = sc(1.2, (-0.866, -0.5, 0)) // −ω̇×r: against the rotation (ω̇ ∥ ω)

  let fic = (paint: red.darken(20%), thickness: 1.2pt)

  // Axis below the disk (hidden part dashed)
  line(P((0, 0, -1.2)), P(O), stroke: (dash: "dashed", paint: gray))

  // Disk
  circle(P(O), radius: (3, 3 * s), fill: blue.lighten(88%), stroke: blue.darken(30%))
  circle(P(O), radius: 0.06, fill: black, stroke: none)

  // Position and velocity
  line(P(O), P(r), name: "r", mark: (end: ">"))
  content("r.mid", $ar(r)$, anchor: "south-west", padding: 0.1)

  line(P(r), P(add(r, v)), name: "v", mark: (end: ">"), stroke: green.darken(30%))
  content("v.end", $ar(v)'$, anchor: "south-east", padding: 0.1)

  // Fictitious forces
  line(P(r), P(add(r, F-o)), name: "fo", mark: (end: ">"), stroke: fic)
  content("fo.end", $ar(F)_o$, anchor: "north-west", padding: 0.1)

  line(P(r), P(add(r, F-C)), name: "fc", mark: (end: ">"), stroke: fic)
  content("fc.end", $ar(F)_C$, anchor: "south-west", padding: 0.1)

  line(P(r), P(add(r, F-e)), name: "fe", mark: (end: ">"), stroke: fic)
  content("fe.end", $ar(F)_epsilon$, anchor: "north-east", padding: 0.1)

  circle(P(r), radius: 0.08, fill: black, stroke: none)

  // ω as a vector along the axis + direction of rotation
  line(P(O), P((0, 0, 2.8)), name: "w", mark: (end: ">"), stroke: 1.2pt)
  content("w.end", $ar(omega)$, anchor: "south", padding: 0.1)

  arc(P((0, 0, 2.0)), start: 0deg, stop: 260deg, radius: (0.6, 0.3), anchor: "origin", mark: (end: ">"))
})

#pb()
== Příklad 1.

je pohyb popsaný funkcemi

$
  x & = R cos(omega t) \
  y & = R sin(omega t) \
  z & = k t \
$

$
  v_x & = - omega R sin(omega t) \
  v_y & = omega R cos(omega t) \
  v_z & = k \
$

$
  abs(v) & = sqrt(omega^2 R^2 sin^2(omega t) + omega^2 R^2 cos^2(omega t) + k^2) \
  abs(v) & = sqrt(omega^2 R^2 (sin^2(omega t) + cos^2(omega t)) + k^2) \
  abs(v) & = sqrt(omega^2 R^2 + k^2) \
$
