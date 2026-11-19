#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "@local/mod:0.1.0": *

#show: boilerplate

#title[Mechanika a molekulová fyzika - cvičení]
= Cvičení 1.
== Opakování
=== Skalár
- číslo, nezávislé na bázi SS
- ve fyzice např. čas, dálka
=== Vektor
- velikost, orientace vzhledem k dané bázi SS
- ve fyzice např. okamžitá rychlost, síla, poloha?
==== Příklad 1.
$
                 a^arrow & = vec(1, 2) \
                 b^arrow & = vec(2, 1) \
       a^arrow + b^arrow & = vec(3, 3) \
       a^arrow - b^arrow & = vec(-1, 1) \
  1/2 a^arrow + 2b^arrow & = vec(1/2 + 4, 1 + 2) = vec(9/2, 3) \
$
#pb()
=== Souřadnicové systémy
==== $2D$
===== Kartézský SS
- báze $B = {vec(1, 0), vec(0, 1)}$
===== Polární SS
- máme vzdálenost od počátku $r$ a úhel $phi$
- převod do kartézských $x = r cos phi$ a $y = r sin phi$
==== $3D$
===== Kartézský SS
- báze $B = {e_1, e_2, e_3} = {vec(1, 0, 0), vec(0, 1, 0), vec(0, 0, 1)}$
- pak $a^arrow = vec(a_1, a_2, a_3) = a_1 e_1 + a_2 e_2 + a_3 e_3$
===== Cylindrické souřadnice
- máme vzdálenost od osy počátku $r$, úhel $phi$ a výšku $z$
- převod do kartézských
  - $x = r cos phi$
  - $y = r sin phi$
  - $z = z$
===== Sférické souřadnice
- máme vzdálenost od počátku $r$
- azimutální úhel $phi$ (kolem osy pólu)
- polární úhel $theta$ (od osy pólu)

- převod do kartézských
  - $x = r cos phi sin theta$
    - nejprve promítnutí do roviny kolmé na osu pólu - $r sin theta$, pak promítnutí na osu $x$
  - $y = r sin phi sin theta$
    - nejprve promítnutí do roviny kolmé na osu pólu - $r sin theta$, pak promítnutí na osu $y$
  - $z = r cos theta$
    - promítnutí na osu z

==== Příklad 1
$
    P & = vec(1, 1) \
    r & = sqrt(2) \
  phi & = pi/4 \
$
==== Příklad 2
$
      P & = vec(4, 3, 7) \
      r & = sqrt(16+9+49) = sqrt(74) \
    psi & = arctan(y/x) = arctan(3/4) \
  theta & = arccos(z/r) = arccos(7/sqrt(74)) \
      r & = sqrt(x^2 + y^2) = sqrt(16+9) = 5 \
$
=== Skalární součin
$
  a^arrow dot.op b^arrow & = norm(a) norm(b) cos phi \
  a^arrow dot.op b^arrow & = a_1 b_1 + a_2 b_2 + a_3 b_3 \
$
např. výpočet práce ve fyzice
$
  W & = F^arrow dot.op s^arrow \
$
=== Vektorový součin
$
                    c^arrow & = a^arrow times b^arrow \
              norm(c^arrow) & = norm(a^arrow) norm(b^arrow) sin phi \
                    c^arrow & = det mat(
                                i, j, k;
                                a_1, a_2, a_3;
                                b_1, b_2, b_3
                              ) = vec(i (a_2 b_3 - a_3 b_2), j (a_1 b_3 - a_3 b_1), k(a_1 b_2 - a_2 b_1)) \
  a^arrow times b^arrow = 0 & => a^arrow parallel b^arrow \
$
==== Příklad 1
$
            a^arrow & = vec(2, 4, -2) \
            b^arrow & = vec(-3, -6, 3) \
  a^arrow x b^arrow & =det mat(
                        i, j, k;
                        2, 4, -2;
                        -3, -6, 3;
                      ) = vec(i(12-12), j(6-6), k(-12+12)) = vec(0, 0, 0) \
$

#pb()
==== Příklad 2
jaký je úhel mezi vektory?
$
  a^arrow & = vec(1, 2, 0) \
  b^arrow & = vec(0, 2, -3) \
      phi & = arccos((a^arrow dot.op b^arrow)/(norm(a) norm(b))) \
      phi & = arccos(4/(sqrt(5) sqrt(13))) \
$

#pb()
=== Derivace i guess
$
  d/dx (f plus.minus g) & = (d f)/dx plus.minus (d g)/dx \
             d/dx (f g) & = (d f)/dx g + f (d g)/dx \
             d/dx (f/g) & = ((d f)/dx g - f (d g)/dx)/g^2 \
     d/dx (f compose g) & = (d f)/dx compose g dot.op (d g)/dx \
               d/dx sin & = cos \
               d/dx cos & = -sin \
               d/dx tan & = 1/(cos^2x) \
$
=== Příklad 1
Po jaké křivce se pohybuje bod, jehož parametrické rovnice mají tvar $x = 3A sin(pi/2t)$ a $y = 2A cos(pi/2t)$?

$
           x^2 & = 3^2 A^2 sin^2(pi/2 t) \
           y^2 & = 2^2 A^2 cos^2(pi/2 t) \
               \
  => x^2 + y^2 & =3^2 A^2 sin^2(pi/2 t) + 2^2 A^2 cos^2(pi/2 t)
                 => x^2/(9A^2) + y^2/(4A^2) & = 1 \
$
bod se pohybuje po elipse

#pb()
=== Příklad 2
Po jaké křivce se pohybuje bod, jehož parametrické rovnice mají tvar $x = r sin(omega t)$ a $y = r cos (omega t)$? Zjistěte jeho rychlost a zrychlení.
$
        x^2 & = r^2 sin^2 (omega t) \
        y^2 & = r^2 cos^2 (omega t) \
  x^2 + y^2 & = r^2 (sin^2 (omega t) + cos^2 (omega t)) \
  x^2 + y^2 & = r^2 \
$
Bod se pohybuje po kružnici s poloměrem $r$

Rychlost:
$
  v_x & = (d x)/(d t) = omega r cos(omega t) \
  v_y & = (d y)/(d t) = -omega r sin(omega t) \
    v & = sqrt(v_x^2 + v_y^2) = sqrt(omega^2 r^2 cos^2(omega t) + (-omega)^2 r^2 sin^2(omega t)) \
      & = sqrt(omega^2 r^2) \
      & = omega r
$
Zrychlení
$
  a_x & = (d v_x)/(d t) = d/(d t) omega r cos(omega t) \
      & = - omega^2 r sin(omega t) \
  a_y & = (d v_y)/(d t) = d/(d t) -omega r sin(omega t) \
      & = - omega^2 r cos(omega t) \
    a & = sqrt(a_x^2 + a_y^2) = sqrt(omega^4 r^2 sin^2(omega t) + omega^4 r^2 cos^2(omega t)) \
      & = sqrt(omega^4 r^2) \
      & = omega^2 r
$

=== Příklad 3.
Určete rychlost a zrychlení bodu, jehož parametrické rovnice polohy v závislosti na čase mají tvar $x = 3A sin(pi/2t)$ a $y = 2A cos(pi/2t)$?
$
  x & = 3 A sin(pi/2 t) \
  y & = 2 A cos(pi/2 t) \
$

$
  v_x & = (d x)/(d t) = d/(d t) 3 A sin(pi/2 t) \
      & = 3 A pi/2 cos(pi/2 t) \
  v_y & = (d x)/(d t) = d/(d t) 2 A sin(pi/2 t) \
      & = - 2 A pi/2 sin(pi/2 t) \
      \
    v & = sqrt(v_x^2 + v_y^2) = sqrt(3^2 A^2 pi^2/2^2 cos^2(pi/2 t) + (-2)^2 A^2 pi^2/2^2 sin^2(pi/2 t)) \
      & = sqrt(9A^2 pi^2/4 cos^2(pi/2 t) + A^2 pi^2 sin^2(pi/2 t)) \
      & = sqrt(A^2 pi^2 (9/4 cos^2(pi/2 t) + sin^2(pi/2 t))) \
      & = A pi sqrt(9/4 cos^2(pi/2 t) + sin^2(pi/2 t)) \
      \
  a_x & = (d v_x)/(d t) = d/(d t) 3 A pi/2 cos(pi/2 t) \
      & = - 3 A pi^2/4 sin(pi/2 t) \
  a_y & = (d v_y)/(d t) = d/(d t) - 2 A pi/2 sin(pi/2 t) \
      & = -A pi^2/2 cos(pi/2 t) \
      \
    a & = sqrt(a_x^2 + a_y^2) = sqrt(9 A^2 pi^4/16 sin^2(pi/2 t) + A^2 pi^4/4 cos^2(pi/2 t)) \
      & = sqrt(A^2 pi^4(9/16 sin^2(pi/2 t) + 1/4 cos^2(pi/2 t))) \
      & = A pi^2 sqrt(9/16 sin^2(pi/2 t) + 1/4 cos^2(pi/2 t)) \
$

#pb()
= Cvičení 2.
== Příklad 6.
Z výšky 100m nad povrchem Země v zeměpisné šířce $phi = 50 degree$ pustíme rychlostí $v = 0$ těleso na zem. Určete kterým směrem a o kolik se odchýlí bod dopadu od kolmice.

Země se otáčí kolem své osy s $omega = (2pi)/(24*3600) "rad" dot.op inv(s)$

Znám dobu do dopadu:

$
  t = sqrt((2 h)/g)
$

#important(caption: "Coriolisova síla")[$
  ar(F_c) = - 2 m (ar(omega) times ar(v))
  ar(a_c) = 2 (ar(v) times ar(omega))
$]



#pb()
= Cvičení 3.
== Příklad 1.
Část řetízku o délce $a$ leží na perfektně hladké desce stolu o výšce $h$, zatímco zbytek o délce $b$ visí přes hranu. Z jakou dobu dopadne poslední oko řetízku na podlahu?

Vyjdeme ze zákona zachování mechanické energie:

$
                                           E_1 & = E_2 \
  (a m)/(a + b) g h + (b m)/(a + b) g (h- b/2) & = m g (h - (a+b)/2) + 1/2 m v^2 \
$

Vyjádřím rychlost:
$
  m g (h - (a+b)/2) + 1/2 m v^2 & = (a m)/(a + b) g h + (b m)/(a + b) g (h- b/2) \
                      1/2 m v^2 & = (a m)/(a + b) g h + (b m)/(a + b) g (h- b/2) - m g (h - (a+b)/2) \
                            v^2 & = 2 a/(a + b) g h + 2 b/(a + b) g (h - b/2) - 2 g (h - (a+b)/2) \
                              v & =sqrt(2 a/(a + b) g h + 2 b/(a + b) g (h - b/2) - 2 g (h - (a+b)/2)) \
                              v & =sqrt((2 a g h - 2 b g(h - b/2))/(a+b) - 2 g (h - (a+b)/2)) \
$

Vyjádřím čas:
$$

#pb()
== Příklad 2.
Odhadněte práci vynaloženou námořníky na svinutí čtvercové plachty o straně  b = 8 m upevněné na vodorovném ráhnu. Plachta má hmotnost m = 60 kg. Jaký je výkon jejích práce pokud to zvládli za 5 min.

$
        W & = integral_(t_0)^(t_1) F d t \
        W & = E_k - E_p \
        W & = m g h_2 - m g h_1 \
      h_2 & = h_1 + Delta h \
  Delta h & = l/2 = 4 m \
      h_1 & = 4 m \
        W & = 60 * 10 * 8 - 60 * 10 * 4 = 2400 J \
$

A výkon:
$
  P = W/t = 2400/(60*5) = 8 W\
$

#pb()
== Příklad 3.
Hmotný bod o hmotnosti m = 1 kg se pohybuje po dráze $y = x^3$ tak, že v čase t = 0 s je jeho
poloha [0, 0] a v t = 10 s je [10, 1000]. Zapište parametrické rovnice pohybu, určete sílu,
která jej vyvolává, a spočítejte práci, kterou vykoná v časovém intervalu \<0, 10\> s, přímým
výpočtem, a pak pomocí zákona zachování energie.
