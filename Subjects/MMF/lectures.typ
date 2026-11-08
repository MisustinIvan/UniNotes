#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "@local/mod:0.1.0": *

#show: boilerplate

= Matematické metody fyziky - přednáška - Pavel Krtouš
== Derivace - opakování
definice zase...
$
  f'(x) & = (f(x+ Delta x) - f(x))/(Delta x) + "chyba řádu " Delta x \
$

== Taylorův rozvoj
aproximuji dále - další mocniny $epsilon$
$
    f(x_0 + epsilon) & = f_0 + f_1 epsilon + f_2 epsilon^2 + f_3 epsilon^3 + ... \
    f(x_0 + epsilon) & = sum_(n=0)^N f_n epsilon^n + "chyba řádu" epsilon^(n+1) \
                 f_n & = 1/n! f^[n](x_0) \
   f(x_0 + epsilon)' & = f_1 + 2 f_2 epsilon + 3 f_3 epsilon^2 + ... \
  f(x_0 + epsilon)'' & = 2 f_2 + 6 f_3 epsilon + 12 f_4 epsilon^2 + ... \
$

=== Rozvoje konkrétních funkcí
==== Příklad 1.
$
           f(x) & = 1/(1-x) \
                \
            x_0 & = 0 \
        epsilon & = x \
  x_0 + epsilon & =x \
                \
           f(0) & = 1 => f_0 = 1 \
          f'(x) & = (1-x)^(-1)' = (1-x)^(-2) => f_1 = 1 \
         f''(x) & = (1-x)^(-2)' = 2(1-x)^(-3) => f_2 = 1 \
        f'''(x) & = 2(1-x)^(-3)' = 2(1-x)^(-3) => f_2 = 1 \
                \
        1/(1-x) & = 1 + x + x^2 + x^3 + x^4 + ... \
$

==== Příklad 2.
$
       f(x) & = sqrt(1+x) = (1+x)^(1/2) \
       f(0) & = 1 => f_0 = 1 \
      f'(x) & = 1/2 (1+x)^(-1/2) \
      f'(0) & = 1/2 => f_1 = 1/2 \
     f''(x) & = -1/2 1/2 (1+x)^(-3/2) = -1/4 (1+x)^(-3/2) \
     f''(0) & = -1/4 => f_2 = -1/8 \
    f'''(x) & = 3/8 (1+x)^(-5/2) \
    f'''(0) & = 3/8 => f_3 = 3/8 dot.op 1/6 = 1/16 \
            \
  sqrt(1+x) & = 1 + 1/2 x - 1/8 x^2 + ... \
$

==== Příklad 3.
$
     f(x) & = (1+x)^alpha \
  (1+x)^n & = 1 + vec(n, 1)x + vec(n, 2)x^2 + vec(n, 3)x^3 + ... + vec(n, n)x^n \
    "tbd"
$

==== Příklad 4.
$
     f(x) & = ln(1+x) \
     f(0) & = 0 => f_0 = 0 \
    f'(x) & = 1/(1+x) \
    f'(0) & = 1 => f_1 = 1 \
   f''(x) & = -1 1/(1+x)^2 \
   f''(0) & = -1 => f_2 = -1/2 \
  f'''(x) & = 2 1/(1+x)^3 \
  f'''(0) & =2 =>f_3 = 1/3 \
          \
  ln(x+1) & = x - 1/2 x^2 + 1/3 x^3 - 1/4 x^4 + ... \
  ln(1-x) & = - (x + 1/2 x^2 + 1/3 x^3 + 1/4 x^4 + ...) \
$

==== Příklad 5.
$
    f(x) & = exp(x) \
     f_n & = exp(x) \
  exp(x) & = 1 + x + 1/2! x^2 + 1/3! x^3 + 1/4! x^4 + ... \
$

==== Příklad 6.
$
       f(x) & = sin x \
       f(0) & = 0 => f_0 = 0 \
      f'(x) & = cos x \
      f'(0) & = 1 => f_1 = 1 \
     f''(x) & = -sin x \
     f''(0) & = 0 => f_2 = 0 \
    f'''(x) & = -cos x \
    f'''(0) & = -1 => f_3 = -1 \
   f''''(x) & = sin x \
   f''''(0) & = 0 => f_4 = 0 \
  f'''''(x) & = cos x \
  f'''''(0) & = 1 => f_5 = 1 \
            \
      sin x & = x - 1/3! x^3 + 1/5! x^5 + ... \
$

==== Příklad 7.
$
   f(x) & = cos x \
        & "symetrie..." \
  cos x & = 1 - 1/2! x^2 + 1/4! x^4 - 1/6! x^6 + ... \
$

#pb()
=== Obecné křivočaré souřadnice
==== Tečný vektor
Parametrizace křivky:
$
  Z : RR -> EE^3\
$
hledáme tečný vektor $ar(t)$ v $Z(xi)$
$
  ar(t) & = (d Z)/(d xi) = (Z(xi + Delta xi) - Z(xi))/(Delta xi) + "chyba řádu" Delta xi
$
"derivace" je vektor

soustava souřadnic:
- *P* počátek
- $ar(e_j)$ osy(složky báze)

pak souřadnice bodu $A$ jsou $A = P + ar(r) = P + x^1 ar(e_1) + x^2 ar(e_2) + ...$

pak tečný vektor $ar(t)$ je:

$
                 Z(xi) & = P + ar(r(xi)) \
                 Z(xi) & = P + x^1(xi) ar(e_1) + x^2(xi) ar(e_2) + ... \
  ar(t) = (d Z)/(d xi) & = 0 + (d x^1)/(d xi) e_1 + (d x^2)/(d xi) e_2 + ... \
                   t^n & = (d x^n)/(d xi) \
$

jak tohle dělat v *křivočarých* souřadnicích?

=== Křivočaré souřadnice
- místo $x^1, x^2, x^3$ používáme $xi^1, xi^2, xi^3$\

v euklidovském prostoru je báze všude v prostoru stejná - v křivočarých souřadnicích aproximujeme bázi lokálně jako tečné vektory křivek určujících soustavu - ztrácím tím ale globální konzistenci

==== Např. polární (2D) nebo cylindrické (3D) souřadnice
$
       xi^1 & = rho \
       xi^2 & = phi \
       xi^3 & = z \
            \
            \
          x & = rho cos phi \
          y & = rho sin phi \
          z & = z \
            \
            & "tečné vektory k souřadnicovým čarám - nemusí být jednotkové ani kolmé!!!" \
  ar(t_rho) & = ... \
  ar(t_phi) & = ... \
    ar(t_z) & = ... \
$
$
                 & "zderivuji podle " rho \
       ar(t_rho) & = cos phi ar(e_x) + sin phi ar(e_y) + 0 ar(e_z) \
  abs(ar(t_rho)) & = 1 "znamená že měří vzdálenost" \
                 \
                 \
                 & "zderivuji podle " phi \
       ar(t_phi) & = - rho sin phi ar(e_x) + rho cos phi ar(e_y) + 0 ar(e_z) \
  abs(ar(t_phi)) & = rho "znamená že neměří vzdálenost" \
                 \
                 \
                 & "zderivuji podle " z \
         ar(t_z) & = 1 ar(e_z) \
    abs(ar(t_z)) & = 1 "znamená že měří vzdálenost" \
$

ověříme kolmost:
$
  ar(t_rho) dot.op ar(t_phi) & = 0
$
jsou na sebe kolmé, tyto souřadnice nazýváme *ortogonální*

pak definujeme jednotkové vektory
$
  ar(e_rho) & = ar(t_rho) \
  ar(e_phi) & = 1/rho ar(t_phi) \
    ar(e_z) & = ar(t_z) \
$

=> pak v každém bodě aproximujeme bázi jako *pootočenou kartézskou bázi*

$h_rho, h_psi, h_z$ jsou Lamého koeficienty kde $h_j = abs(ar(t_j))$

#pb()
==== např. sférické souřadnice

$
  R, theta, phi
$

$
    x & = R sin theta cos phi \
    y & = R sin theta sin phi \
    x & = R cos theta \
  rho & = R sin theta \
$

Spočítáme tečné vektory

$
  ar(t_R) & = sin theta cos phi ar(e_x) + sin theta cos phi ar(e_y) + cos theta ar(e_z) \
          & = 1/R (x ar(e_x) + y ar(e_y) + z ar(e_z)) = ar(e_r) \
$

$
        ar(t_theta) & = R cos theta cos phi ar(e_x) + R cos theta sin phi ar(e_y) - R sin theta ar(e_z) \
                    & = z x/rho ar(e_x) + z y/rho ar(e_y) - rho ar(e_z) = R ar(e_theta) \
  norm(ar(t_theta)) & = sqrt(z^2 (x^2/rho^2 + y^2/rho^2) + rho^2) = R \
$

$
  ar(t_phi) & = -R sin theta sin phi ar(e_x) + R sin theta cos phi ar(e_y) \
            & = -y ar(e_x) + x ar(e_y) = rho ar(e_phi) \
$

$
  h_R = 1\
  h_theta = R\
  h_phi = r sin phi\
$


Opět se jedná o ortogonální souřadnice

#pb()
== Gradient

$
  nabla f = vec((partial f)/(partial x), (partial f)/(partial y), (partial f)/(partial z))
$

Efektivně vektorová derivace?

Jak se mění skalární pole podél křivky?

$
  A: RR -> RR^n\
  f: RR^n -> RR\
$

$
  f(A(xi)) = f(x(xi), y(xi), z(xi))
$

$
  d/(d xi) f(A(xi)) &= (partial f)/(partial x) (d x)/(d xi) + (partial f)/(partial y) (d y)/(d xi) + (partial f)/(partial z) (d z )/(d xi)\
  &= ar(nabla) f dot.op ar(t)\
$

Gradient je tečný na ekvipotenciály

Gradient umožňuje lineární aproximaci funkce v bodě.

$
  f(A + Delta ar(A)) = f(A) + Delta ar(A) dot.op ar(nabla) f(A) + "chyby " Delta ar(A^2)
$

==== Vlastnosti gradientu
stejné jako u derivace

$
  ar(nabla) (f + g) = ar(nabla) f + ar(nabla) g\
  ar(nabla) (f g) = g ar(nabla) f + f ar(nabla) g\
  ar(nabla) (f compose g) = f'compose g dot.op ar(nabla) f\
  ar(nabla) (f (f_1, f_2, f_3, ...)) = (partial f)/(partial f_1) ar(nabla) f_1 + (partial f)/(partial f_2) ar(nabla) f_2 + ... \
$

$
  x,y,z\
  ar(nabla) x = ar(e_x)\
  ar(nabla) y = ar(e_y)\
  ar(nabla) z = ar(e_z)\
$

#pb()
==== Příklady

===== 1
$
            R & = sqrt(x^2 + y^2 + z^2) \
  ar(nabla) R & = (partial R)/(partial x) ar(e_x) + (partial R)/(partial y) ar(e_y) + (partial R)/(partial z) ar(e_z) \
  ar(nabla) R & = 1/R (x ar(e_x) + y ar(e_y) + z ar(e_z)) \
$

===== 2
$
  ar(nabla) exp(-1/2 r^2) = exp(-1/2 r^2) (-1/2 2 r) ar(nabla) r = -r exp(-1/2 r^2) ar(e_r)\
$

===== Cylindrické souřadnice

$
  ar(nabla) rho = ar(nabla) sqrt(x^2 + y^2) = x/rho ar(e_x) + y/rho ar(e_y) = ar(e_rho)\
$

$
      arctan' x & = 1/(1+x^2) \
  ar(nabla) phi & = ar(nabla) arctan(y/x) = 1/(1 + y^2/x^2) ar(nabla) y/x = 1/((x^2 + y^2)/x^2) ar(nabla) (y 1/x) \
                & = 1/((x^2 + y^2)/x^2) (1/x ar(nabla) y + y ar(nabla) 1/x) \
                & = x^2/rho^2 (1/x ar(e_y) - y/x^2 ar(e_x)) = 1/rho^2 (x ar(e_y) - y ar(e_x)) = 1/rho ar(e_phi) \
$

$
  ar(nabla) z = ar(e_z)\
$

===== Sférické souřadnice

$
  ar(nabla) R & = ar(e_R) \
$

$
  ar(nabla) theta & = ar(nabla) arctan rho/z \
                  & = 1/(1 + rho^2/z^2) (ar(nabla) rho 1/z + rho ar(nabla)1/z) \
                  & = z^2/r^2 (1/z ar(e_rho) - rho/z^2 ar(e_z)) \
                  & = 1/r^2 (z ar(e_rho) - rho ar(e_z)) \
                  & = 1/r^2 ar(t_theta) \
                  & = 1/r ar(e_theta) \
$

$
  ar(nabla) phi & = 1/rho ar(e_phi) \
$

#pb()
== Úvod do diferenciálních rovnic 💀
=== Klasifikace
==== Podle počtu proměnných
===== Parciální
- více proměnných
- řešit nebudeme 🙏 ongor
===== Obyčejné
$
  F (y^(n)(x), y^(n-1)(x), y^(n-2)(x), ...,y(x),x) = 0
$
- kde $y(x)$ je neznámá funkce

==== Podle řádu
- nejvyšší derivace udává řád diferenciální rovnice

==== Lineární/nelineární
===== Nelineární
- neplatí superpozice řešení

$
  (d^2 phi)/(d^2 t) + g/l sin phi = 0\
$

===== Lineární
- platí superpozice řešení

$
  y^n +a_(n-1)(x) y^(n-1) + ... a_0 y = f(x)\
$

- kde $a_(n-1)$ je nekonstantní koeficient, může být funkcí $x$

==== Homogenní/Nehomogenní
==== Autonomní/Neautonomní
==== Separovatelná/Neseparovatelná
===== Separovatelná
$
  (d y(x))/(d x) = f(y(x)) g(x)\
$
- řešíme separací proměnných

$
  integral (d y)/(f (y)) = integral g(x) dx\
$
===== Neseparovatelná
$$

#pb()
=== Počáteční úloha
$
  (d x(t))/(d t) = f(x(t),t); sq x(t_0) = x_0\
$
- f je spojité kolem $x_0, t_0$ - existuje řešení
- f je Lipschitovzky spojitá - existuje jednoznačné řešení
  - $abs(f(x,t) - f(y,t)) <= L abs(x-y)$

=== Počáteční úloha 2.
$
  (dif y (x))/(dif x) & = 2 sqrt(y(x)) \
                 y(0) & = 0 \
$

separace proměnných

$
  y'(x) = f(y)g(x)\
  integral y'(x) = integral f(y)g(x)\
$

a tedy

$
  integral (dif y)/(sqrt(y)) & = integral 2 dif x \
                   2 sqrt(y) & = 2 x + c \
$

zjistíme konstantu

$
  2 sqrt(y_0) & = 2 dot.op 0 + c \
            c & = 2 sqrt(y_0) \
$

pokračuji
$
  2 sqrt(y) & = 2 x + 2 sqrt(y_0) \
    sqrt(y) & = x + sqrt(y_0) \
          y & = x^2 + 2 x sqrt(y_0) + y_0 \
$

#pb()
=== Obyčejné lineární diferenciální rovnice s konstantními koeficienty

$
  y(x) "... neznámá funkce"\
  y^(n)(x) + a_(n-1) y^(n-1)(x) + a_(n-2) y^(n-2)(x) + ... + a_0 y(x) = f(x)\
$

řešení:

$
  y(x) = y_H (x) + y_P (x)\
$

součet *homogenního*(řeší rovnici s $0$ na RHS) a *partikulárního* řešení(to budeme hádat, jinak např. variace konstant)

algoritmus řešení:

$
                   y & ~ e^(lambda x) \
       e^(lambda x)' & = lambda e^(lambda x) \
      e^(lambda x)'' & = lambda^2 e^(lambda x) \
     e^(lambda x)''' & = lambda^3 e^(lambda x) \
                     & ... \
  e^(lambda x)^((n)) & = lambda^n e^(lambda x) \
$

mějme naši rovnici

$
  y^(n)(x) + a_(n-1) y^(n-1)(x) + a_(n-2) y^(n-2)(x) + ... + a_0 y(x) & = 0 \
  lambda^(n) e^(lambda x) + a_(n-1) lambda^(n-1) e^(lambda x) + a_(n-2) lambda^(n-2) e^(lambda x) + ... + a_0 e^(lambda x) & = 0 \
  lambda^(n) + a_(n-1) lambda^(n-1) + a_(n-2) lambda^(n-2) + ... + a_0 & = 0 \
$

a dostaneme algebraickou rovnici pro $lambda$ $n$-tého řádu - $n$ kořenů v $CC$ ${lambda_1, lambda_2, ..., lambda_n}$ - těchto $n$ kořenů mi dá $n$ integračních konstant?

pak můžeme $y_H (x)$ zapsat jako:

$
  c_1 e^(lambda_1 x) + c_2 e^(lambda_2 x) + ...
$

#pb()
==== Příklad 1. - radioaktivní rozpad
$
  (dif N(t))/(dif t) & = -lambda N(t) \
$

kde $lambda$ je střední doba života částice

$
  N' + lambda N & = 0 \
$

použiju $e^(alpha t)$ místo $e^(lambda t)$

$
  alpha e^(alpha t) + lambda e^(alpha t) = 0\
  alpha + lambda = 0\
  alpha = -lambda\
$

$
  N(t) = C e^(-lambda t) = C e^(alpha t)\
$

v čase $t=0$ mám $N_0$ částic

$
             N(0) & = N_0 \
  C e^(-lambda 0) & = N_0 \
                C & = N_0 \
$

a tedy řešení:

#important[$
  N(t) = N_0 e^(-lambda t)\
$]

ještě vyjádřím poločas rozpadu

$
       N(T)/N_0 & = 1/2 \
  e^(-lambda T) & = 1/2 \
      -lambda T & = ln(1/2) \
              T & = - ln(1/2)/lambda \
              T & = ln(2)/lambda \
$

#pb()
==== Příklad 2. - nehomogenní rovnice - RL obvod
Máme odpor a cívku v obovodu
#cetz.canvas({
  import cetz.draw: *

  let A = (0, 0)
  let B = (5, 0)
  let C = (5, 3.5)
  let D = (0, 3.5)

  // top wire with resistor
  line(D, (1.5, 3.5))
  rect((1.5, 3.2), (3.5, 3.8), name: "R")
  line((3.5, 3.5), C)

  // right side: inductor coils
  line(C, (5, 2.8))
  arc((5, 2.45), start: -90deg, stop: 90deg, radius: 0.35)
  arc((5, 1.75), start: -90deg, stop: 90deg, radius: 0.35)
  arc((5, 1.05), start: -90deg, stop: 90deg, radius: 0.35)
  line((5, 0.7), B)

  // bottom wire
  line(B, A)

  // left side: voltage source
  line(D, (0, 2.2))
  circle((0, 1.75), radius: 0.45, name: "src")
  line((0, 1.3), A)

  content("R.north", [R], anchor: "south", padding: 0.15)
  content((5.7, 1.75), [L], anchor: "west", padding: 0.1)
  content((-0.7, 1.75), [$U$], anchor: "east", padding: 0.1)
})

$
  L (dif I(t))/(dif t) + R I(t) & = U(t) \
$

- (a) - $U = U_0 = "konst"$
- (b) - $U = U_0 sin(omega t)$

pro případ (a):

nejprve nalezneme řešení příslušné homogenní rovnice

$
           L (dif I(t))/(dif t) + R I(t) & = 0 \
                 (dif I)/(dif t) + R/L I & = 0 \
  lambda e^(lambda t) + R/L e^(lambda t) & = 0 \
                            lambda + R/L & = 0 \
                                  lambda & = - R/L \
                                 I_H (t) & = C e^(-R/L t) \
$

hledáme partikulární řešení

$
  (dif I_P)/(dif t) + R/L I_P = U_0/L
$

zkusme $I_P = "konst"$

$
  (dif I_P)/(dif t) + R/L I_P & = U_0/L \
                      R/L I_P & = U_0/L \
                          I_P & = U_0/R \
$

a tedy plné řešení nehomogenní rovnice:

$
  I(t) & = I_H + I_P \
  I(t) & = C e^(- R/L t) + U_0/R \
$

dále určím $C$ z počátečních podmínek

$
  I(0) = 0 & = C + U_0/R \
         C & = - U_0/R \
$

$
  I(t) & = I_H + I_P \
  I(t) & = -U_0/R e^(- R/L t) + U_0/R \
  I(t) & = U_0/R (1 - e^(- R/L t)) \
$

pro případ (b):
$
  (dif I_p)/(dif t) + R/L I_p = U_0/L sin omega t
$

zkusme $I_p = A sin omega t + B cos omega t$ - najdeme $A,B$

$
  (dif I_p)/(dif t) & = A omega cos omega t - B omega sin omega t \
$

a dosadím

$
  A omega cos omega t - B omega sin omega t + R/L (A sin omega t + B cos omega t) = U_0/L sin omega t
$

spočítám pro členy se $sin$ a členy s $cos$

$
    A omega cos omega t + R/L B cos omega t & = 0 \
                            A omega + R/L B & = 0 \
                                    A omega & = - R/L B \
                                          A & = - R/(omega L) B \
  - B omega sin omega t + R/L A sin omega t & = U_0/L sin omega t \
$

bla bla bla přeskočíme

$
  A & = (R U_0)/(R^2 + omega^2 L^2) \
  B & = -(U_0 L omega)/(R^2 + omega^2 L^2) \
$

dosadíme

$
  I_p & = (R U_0)/(R^2 + omega^2 L^2) sin omega t -(U_0 L omega)/(R^2 + omega^2 L^2) cos omega t \
$

$
  I(t) = C e^(- R/L t) + U_0/R + (R U_0)/(R^2 + omega^2 L^2) sin omega t -(U_0 L omega)/(R^2 + omega^2 L^2) cos omega t\
$

a pak z počátečních podmínek určím $C$...

#pb()
==== Příklad s vícenásobným kořenem charakteristického polynomu

$
               y & = y(x) \
  y'' - 4y' + 4y & = x^2 \
$

homogenní řešení

$
          y'' - 4y' + 4y & = 0 \
  lambda^2 - 4lambda + 4 & = 0 \
          (lambda - 2)^2 & = 0 \
$

mám jeden dvojnásobný kořen $lambda_(1,2) = 2$

musím řešení zapsat takto
$
  y_H & = (C_1 + X C_2)e^(2 x) \
$

partikulární řešení:

zase hádáme...

$
  y_P & = A x^2 + B x + C \
$

zkusme dosadit a najít $A,B,C$

$
  2A - 4(2 A x + B) + 4(A x^2 + B x + C) = x^2\
$

rovnost dvou polynomů

$
  4 A x^2 & = x^2 \
        A & = 1/4 \
$

$
  - 8 A x + 4 B x & = 0 \
    - 2 x + 4 B x & = 0 \
            4 B x & = 2 x \
              4 B & = 2 \
                B & = 1/2 \
$

$
  2A - 4B + 4 C & = 0 \
  1/2 - 2 + 4 C & = 0 \
            4 C & = 2 - 1/2 \
              C & = 3/8 \
$

a tedy

$
  y_P & = 1/4 x^2 + 1/2 x + 3/8 \
    y & = y_H + y_P \
    y & = (C_1 + x C_2)e^(2 x) + 1/4 x^2 + 1/2 x + 3/8 \
$


==== Příklad 4.
Řešte:

$
  y'' - 6y' + 8y & = e^x + e^(2x) \
$

Vyřešíme homogenní rovnici

$
           y'' - 6y' + 8y & = 0 \
  lambda^2 - 6 lambda + 8 & = 0 \
             lambda_(1,2) & = 2,4 \
$

Dosadíme:

$
  y_H & = a e^(2 x) + b e^(4 x) \
$

Najdeme partikulární řešení

$
  y_P & = A e^x + B x e^(2x)\
  A e^x + B(4 x e^(2x) + 2 e^(2x) + 2e^(2x)) - 6(A e^x + B 2 x e^(2x) + B e^(2x)) + 8 (A e^x + B x e^x) &= e^x + e^(2x)\
  A - 6A + 8A &= 1 => A = 1/3\
  B x e^(2x) (4 - 12 + 8) &= 0\
  B e^(2x) (4 - 6) &= e^(2x)\
  B (4 - 6) &= 1\
  -2 B &= 1 => B = -1/2\
$

Řešení

$
  y & = y_H + y_P \
  y & = a e^(2x) + b e^(4x) + 1/3 e^x - 1/2 x e^(2x) \
$

#pb()
==== Příklad 5.

$
  dtt(x) + 2 gamma dt(x) + omega_0^2 x & = a sin omega t \
$

Vyřeším charakteristický polynom
$
  lambda^2 + 2 gamma lambda + omega_0^2 & = 0 \
                           lambda_(1,2) & = -2gamma plus.minus sqrt(4 gamma^2 - 4 omega_0^2))/2 \
                           lambda_(1,2) & = - gamma plus.minus sqrt(gamma^2 - omega_0^2) \
$

Kmitání pro komplexní kořen? - chci $- Omega^2$

$
  lambda_(1,2) & = - gamma plus.minus sqrt(- Omega^2) \
  lambda_(1,2) & = - gamma plus.minus i Omega \
$

Homogenní řešení
$
  x_H (t) & = C_1 e^(lambda_1 t) + C_2 e^(lambda_2 t) \
$


Partikulární řešení
$
       x_P & = A sin omega t + B cos omega t \
   dt(x_P) & = A omega cos omega t - B omega sin omega t \
  dtt(x_P) & = - A omega^2 sin omega t - B omega^2 cos omega t \
$

A tedy:


$
  x_P &= - A omega^2 sin omega t - B omega^2 cos omega t + 2 gamma(A omega cos omega t - B omega sin omega t) + omega_0^2(A sin omega t + B cos omega t)\
  & = a sin omega t\
  - omega_0^2 B + 2 gamma omega A + omega_0^2 B &= 0\
  - omega_0^2 A - 2 gamma omega B + omega_0^2 A &= a\
$

#pb()
==== Příklad 6. - lineární harmonický oscilátor

$
     gamma & = 0 \
         a & = 0 \
      x(0) & = x_0 \
  dt(x)(0) & = 0 \
$

$
  dtt(x) + omega_0^2 x & = 0 \
                     x & = C_1 e^(i omega_0 t) + C_2 e^(- i omega t) \
$

$
  x_0 & = C_1 + C_2 \
    0 & = i omega_0 C_1 - i omega_0 C_2 \
    0 & = C_1 - C_2 \
  C_1 & = C_2 \
  C_1 & = C_2 = x_0/2 \
$


$
  x & = x_0/2(cos omega_0 t + i sin omega_0 t) + x_0/2(cos (-omega_0 t) + i sin(-omega_0 t)) \
  x & = x_0/2(cos omega_0 t + i sin omega_0 t + cos (-omega_0 t) + i sin(-omega_0 t)) \
  x & = x_0/2(cos omega_0 t + i sin omega_0 t + cos (omega_0 t) - i sin(omega_0 t)) \
  x & = x_0/2(2 cos omega_0 t) \
  x & = x_0 cos omega_0 t \
$

#pb()
== Geometrie a lineární algebra
=== Objekty

$
      bb(a) & = vec(a^1, ..., a^n) \
  bb(alpha) & = mat(alpha_1, ..., alpha_n) \
         AA & = mat(
                A_1^1, ... A^1_n;
                ..., ..., ...;
                A_1^n, ..., A^n_n;
              ) \
$

==== Geometrické vektory
- reprezentace vzhledem k bázi:

$
  ar(a) = sum_(j=1)^n a^j ar(e_j) = sum_(j=1)^n vec(a_1, a_2, ..., a_n) ar(e_j)\
$

kde $vec(a_1, a_2, ..., a_n)$ je aritmetický vektor

==== Matice - Lineární operátory
$
  ar(a) -> ar(b) & = A dot.op ar(a) \
$

chceme linearitu

$
  A dot.op ar(a) + A dot.op ar(b) & = A dot.op (ar(a) + ar(b)) \
                 A dot.op r ar(a) & = r A dot.op ar(a) \
$

$
  bb(b) = AA dot.op bb(a) -> b^j = sum_(i = 1)^n A^j_i a^i\
$

inverzní matice

$
  BB dot.op CC = AA -> BB = AA dot.op CC^(-1)\
$

$exists CC^(-1)...$ - *determinant*

- *Př* - diagonální matice
$
  DD = mat(
    lambda_1, ..., ...;
    ..., ..., ...;
    ..., ..., lambda_n;
  )\
  DD^(-1) = mat(
    lambda_1^(-1), ..., ...;
    ..., ..., ...;
    ..., ..., lambda_n^(-1);
  )\
  forall lambda_i != 0 forall i in 1..n\
$

chceme ověřit jestli máme nenulové prvky na diagonále - vynásobíme

pro diagonální matici je součin prvků na diagonále také její determinant

$
  det DD & = lambda_1 dot.op lambda_2 dot.op ... dot.op lambda_n \
$


$DD^(-1)$ existuje pokud $det DD != 0$\

Vlastnosti

$
  det(AA dot.op BB) & = det AA dot.op det BB
                      det(AA dot.op AA^(-1))     & = det AA dot.op det AA^(-1) \
                  1 & = det AA dot.op 1/(det AA) \
        det AA^(-1) & = 1/(det AA)
$

===== Stopa
Součet prvků na diagonále.

$
  tr AA & = sum_j A_j^j \
$

Vlastnosti

invariantní při cyklické záměně
$
  tr(AA dot.op BB dot.op CC) = tr(CC dot.op AA dot.op BB)
$

linearita
$
  tr(a AA + BB) & = a tr AA + tr BB \
$

===== Determinant diagonální matice

$
  det A & = product_(i=1)^n lambda_i \
$

$
  det (AA BB) = det AA det BB
$

===== Podobné matice
$AA',AA$ jsou *podobné*, pokud můžeme zapsat $AA'=TT AA TT^(-1)$

a tedy
$
  det AA' & = det AA
$

protože
$
  det TT^(-1) & = 1/(det TT) \
$

a
$
  tr AA' & = tr(TT AA TT^(-1)) \
  tr AA' & = tr(TT^(-1) TT AA) \
  tr AA' & = tr(EE AA) \
  tr AA' & = tr AA \
$

#pb()
===== Podobné matice - geometrie
$
       ar(a) & arrow^(ar(e_i)) bb(a) \
  A arrow AA \
$

jiná báze $ar(e_i)'$

chceme změnit reprezentaci $ar(a)$

$
  ar(a) & arrow^(ar(e_i)') bb(a')
$

zapíšu $ar(e_j)$ bázový vektor původní báze jako lineární kombinaci vektorů nové báze

a tedy

$
  ar(a) & = sum a^j ar(e_j) = sum_j sum_i a^j T^i_j ar(e_i)' = sum_i a^i' ar(e_i)' \
$

kde
$
    a_i' & = sum_j a^j T_j^i \
  bb(a') & = TT bb(a) \
$

===== *Operátory*
$
  ar(b) & = A ar(a) \
  bb(b) & = AA bb(a) \
$

jiná báze
$
  bb(b)' & = AA' bb(a)' \
$

a tedy
$
          TT bb(b) & = AA' TT bb(a) \
  TT^(-1) TT bb(b) & = TT^(-1) AA' TT bb(a) \
             bb(b) & = TT^(-1) AA' TT bb(a) \
    TT^(-1) AA' TT & = AA \
               AA' & = TT AA TT^(-1) \
$

===== Determinant operátoru
Determinant a stopa jsou invariantní vůči transformacím báze.

$
  det A & = det AA \
   tr A & = tr AA \
$

#pb()
===== Transpozice a geometrické objekty
$
  ar(a); ar(b); (ar(e_i), ar(e_j)) = delta_(i j); (ar(a), ar(b)) = ar(a) dot.op ar(b)\
$

$
  M^"op" : ar(a) -> ar(c) = M dot.op ar(a)\
$

definuji transponovaný operátor

$
  M^T: (ar(a), M dot.op ar(b)) & = (M^T dot.op ar(a), ar(b)) \
$

sklarární součin
$
  (ar(a), ar(b)) = (sum_i a^i ar(e_i), sum_j b^j ar(e_j)) = sum_(i j) a^i b^j delta_(i j) = sum_i a^i b^i\
$

zpět k transpozici operátoru, proč to platí?

$
    (ar(a), M dot.op ar(b)) & = (ar(a), ar(c)) = sum_(i j) a^i M_j^i b^j = sum_(i j) a^i c^i \
  (M^T dot.op ar(a), ar(b)) & = (ar(d), ar(b)) = sum_(i j) (M^T)^j_i a^i b^i \
$
===== Skalární součin
Je definovaný jeho chováním pro prvky báze.

===== Ortonormální matice
$MM$ zachovává skalární součin

$
  ar(a) dot.op ar(b) = MM ar(a) dot.op MM ar(b) = MM^T MM ar(a) dot.op ar(b)\
  MM^T MM = EE => MM^T = MM^(-1)\
$

#pb()
===== Vlastní čísla a vlastní vektory
zkoumáme, kdy je matice *diagonalizovatelná*

$
  AA & = TT DD TT^(-1) \
$

kde $DD$ je diagonalizovaná $AA$
$
  DD & = mat(
         alpha_i, ..., 0;
         ..., ..., ...;
         0, ..., alpha_n;
       )
$

$
  det AA & = det DD &     = sum_(i=1)^n alpha_i \
   tr AA & = tr DD  & = product_(i=1)^n alpha_i \
$

kde $alpha_i$ jsou *vlastní čísla*

a sloupečky $DD$ jsou tzv. *vlastní vektory*

tedy

$
  mat(
    alpha_i, ..., 0;
    ..., ..., ...;
    0, ..., alpha_n;
  ) dot.op vec(0, ..., 1) = vec(0, ..., alpha_n) = alpha_n vec(0, ..., 1)
$

#definition(title: [vlastní vektor a vlastní číslo])[
  $
      DD ar(a) & = lambda ar(a) \
    DD ar(e_i) & = lambda_i ar(e_i) \
  $
]

jako asi odvození no

$
                                               DD & = TT^(-1) AA TT \
  TT^(-1) AA TT dot.op ar(e_i) = lambda_i ar(e_i) \
       AA TT dot.op ar(e_i) = lambda_i TT ar(e_i) \
                    AA bb(a_i) = lambda_i bb(a_i) \
$

#pb()
===== Funkce matic
Předpokládejme že $A$ je diagnoalizovatelná matice, a $D = diag(lambda_1, lambda_2, ..., lambda_n)$ je matice podobná $A$

$
  F(AA) & = sum_(j=0)^infinity f_j AA^j \
  F(AA) & = sum_(j=0)^infinity f_j (TT DD TT^(-1))^j \
  F(AA) & = sum_(j=0)^infinity f_j TT DD^j TT^(-1) \
  F(AA) & = TT (sum_j f_j DD^j) TT^(-1) = TT F(DD) TT^(-1) \
$
