#import "@local/mod:0.1.0": *
#show: boilerplate

=
== Zadání
Určete s jakou periodou $T$ bude kmitat kámen vhozený do šachty provrtané skrz střed Země(ze severního na jižní pól) a jakou rychlostí proletí středem země. Pro jednoduchost zanedbejte odpor prostředí a uvažujte Zemi jako plnou homogenní kouli o hmotnosti $M = 6 dp 10^24 "kg"$ a poloměru $R = 6378 "km"$.

== Řešení
Podle #link("https://en.wikipedia.org/wiki/Shell_theorem")[Newtona] víme, že pro těleso uvnitř homogenní slupky bude výsledné silové působení nulové. Pro kámen ve vzdálenosti $r$ od středu uvažujeme tedy jen část Země, která leží v úseku od středu do $r$.

Zapíšeme silové působení v závislosti na $r$\

$
  F(r) & = - kappa.alt (M dp (4/3 pi r^3)/(4/3 pi R^3) dp m)/r^2 \
  F(r) & = - kappa.alt M dp r/(R^3) dp m \
  F(r) & = - (kappa.alt M m)/R^3 r \
$

Což odpovídá silovému působení v lineárním harmonickém oscilátoru

Vypočítám kinetickou energii ve středu integrací síly.

$
  E_k & = integral_0^R - (kappa.alt M m)/R^3 r dif r \
  E_k & = - (kappa.alt M m)/R^3 integral_0^R r dif r \
  E_k & = - (kappa.alt M m)/R^3 [r^2/2]_0^R \
  E_k & = - (kappa.alt M m)/R^3 R^2/2 \
  E_k & = - (kappa.alt M m)/(2R) \
$

$
                   E_k & = 1/2 m v^2 \
  (kappa.alt M m)/(2R) & = 1/2 m v^2 \
       (kappa.alt M)/R & = v^2 \
                     v & = sqrt((kappa.alt M)/R) \
                     v & = 7921 inv(" m s")
$

#pb()
Ze vztahu pro úhlovou frekvenci vyjádřím periodu.

$
      F & = - k r \
   F(r) & = - (kappa.alt M m)/R^3 r \
      k & = (kappa.alt M m)/R^3 \
  omega & = sqrt(k/m) = sqrt((kappa.alt M)/R^3) \
  omega & = (2 pi)/T \
      T & = (2pi)/omega \
      T & = (2pi)/sqrt((kappa.alt M)/R^3) = 5059 "s" = 1 "h" 24 "min" 19 "s"
$

#pb()
=
== Zadání
Částice připojená na pružinu vykonává netlumený harmonický pohyb. Maximální zrychlení částice je $18 "m" "s"^(-2)$ a maximální rychlost je $3 inv(" m s")$. Najděte frekvenci a amplitudu pohybu.
== Řešení

Amplituda
$
                F & = - k x \
                a & = F/m \
          a_"max" & = (-k A)/m \
                A & = (m a_"max")/(-k) \
              E_k & = 1/2 m v^2 \
              E_p & = 1/2 k x^2 \
      E_(k "max") & = 1/2 m v_"max"^2 \
      E_(p "max") & = 1/2 k A^2 \
      E_(k "max") & = E_(p "max") \
  1/2 m v_"max"^2 & = 1/2 k A^2 \
                k & = (m v_"max"^2)/(A^2) \
                A & = (m a_"max")/((m v_"max"^2)/(A^2)) \
                A & = (a_"max")/((v_"max"^2)/(A^2)) \
                A & = (A^2 a_"max")/(v_"max"^2) \
                1 & = (A a_"max")/(v_"max"^2) \
                A & = (v_"max"^2)/a_"max" \
$

#pb()
Frekvence:

$
  omega & = sqrt(k/m) \
  omega & = sqrt((m v_"max"^2)/(A^2)/m) \
  omega & = sqrt((v_"max"^2)/(((v_"max"^2)/a_"max")^2)) \
  omega & = sqrt((v_"max"^2)/((v_"max"^4)/a_"max"^2)) \
  omega & = sqrt((a_"max"^2)/(v_"max"^2)) \
  omega & = 2 pi f \
      f & = omega/(2 pi) \
      f & = sqrt((a_"max"^2)/(v_"max"^2))/(2 pi) = 0.95 "Hz" \
$
#pb()
=
== Zadání
Určete amplitudu $A_0$ a fázovou konstantu $alpha$ netlumeného harmonického pohybu hmotného bodu po přímce, když se hmotný bod v čase $t = 0$ s vyznačuje výchylkou $x_0 = 5 "cm"$, rychlostí $v_0 = 20 inv(" cm s")$ a frekvencí pohybu $f = 1 "Hz"$
== Řešení
Zapíšu si rovnici pro netlumený lineární harmonický oscilátor
$
   x(t) & = A_0 sin(omega t + alpha) \
  omega & = 2 pi f \
   x(t) & = A_0 sin(2 pi f t + alpha) \
   v(t) & = x(t)' = 2 pi f A_0 cos(2 pi f t + alpha) \
$

Z rovnice pro polohu vyjádřím fázovou konstantu

$
  alpha & = arcsin(x(t)/A_0) - 2 pi f t = arcsin(x(0)/A_0) \
$

Dosadím do rovnice pro rychlost a získám konstantu $A_0$

$
                       v(0) & = 2 pi f A_0 cos(2 pi f t + arcsin(x(0)/A_0)) \
          v(0)/(2 pi f A_0) & = cos(arcsin(x(0)/A_0)) \
          v(0)/(2 pi f A_0) & = sqrt(1 - (x(0)/A_0)^2) \
  v(0)^2/(4 pi^4 f^2 A_0^2) & = 1 - (x(0)/A_0)^2 \
  v(0)^2/(4 pi^4 f^2 A_0^2) & = 1 - x(0)^2/A_0^2 \
        v(0)^2/(4 pi^4 f^2) & = A_0^2 - x(0)^2 \
                      A_0^2 & = v(0)^2/(4 pi^4 f^2) + x(0)^2 \
                        A_0 & = sqrt(v(0)^2/(4 pi^4 f^2) + x(0)^2) = 5.93 "cm" \
$

Dosadím do rovnice pro $alpha$

$
  alpha & = arcsin(x(0)/A_0) \
  alpha & = arcsin(x(0)/sqrt(v(0)^2/(4 pi^4 f^2) + x(0)^2)) = 57 degree 30' \
$

#pb()
=
== Zadání
Horizontální deska koná harmonický pohyb ve vodorovném směru s periodou $T = 4 "s"$. Těleso, které je položeno na desce se začne pohybovat, když amplituda kmitů dosáhne svou maximální hodnotu $x_max = 0,5 "m"$. Jaký je koeficient (součinitel) smykového tření $mu$ mezi tělesem a deskou?
== Řešení
Zapíšeme rovnici pro třecí sílu:
$
  F_t & = mu F_n = mu m g \
$
Zapíšeme rovnici pro pohyb lineárního harmonického oscilátoru:

$
   x(t) & = x_max sin(omega t) \
      T & = inv(f) \
      f & = inv(T) \
  omega & = 2 pi f \
  omega & = (2 pi)/T \
   x(t) & = x_max sin(t (2 pi)/T) \
$

Vyjádřím si zrychlení tohoto oscilátoru

$
   x(t) & = x_max sin(t (2pi/T)) \
   a(t) & = dtt(x)(t) \
   a(t) & = - x_max (4 pi^2)/T^2 sin(t (2 pi)/T) \
  a_max & = x_max (4 pi^2)/T^2 \
      a & = F/m \
  F_max & = a_max m \
  F_max & = x_max (4 pi^2)/T^2 m \
$

Položíme tyto síly do rovnosti

$
     F_t & = f_max \
  mu g m & = x_max (4 pi^2)/T^2 m \
    mu g & = x_max (4 pi^2)/T^2 \
      mu & = x_max (4 pi^2)/(g T^2) = 0.126 \
$

#pb()
=
== Zadání
Těleso o hmotnosti $m = 0,1 "kg"$, které je zavěšené na pružině, kmitá ve vzduchu s tlumením popsaným koeficientem útlumu $b = δ = 0,1 inv(s)$. Poměr amplitud $A_1/A_13 = 3$. Určete periodu $T$ tlumeného kmitavého pohybu. Určete periodu $T_0$ kmitavého pohybu ve vakuu bez tlumení a tuhost pružiny $k$.

== Řešení
Zapíšeme vztah mezi amplitudami a určíme periodu
$
      A_1/A_13 & = e^(delta 12T) \
  ln(A_1/A_13) & = delta 12 T \
             T & = ln(A_1/A_13)/(12 delta) = 0.9155 "s" \
$

Určíme periodu $T_0$ bez tlumení

$
       omega & = sqrt(delta^2 - omega_0^2) \
     omega_0 & = sqrt(delta^2 + omega^2) \
  (2 pi)/T_0 & = sqrt(delta^2 + (4pi^2)/T^2) \
  (2 pi)/T_0 & = sqrt(delta^2 + (4pi^2)/(ln(A_1/A_13)/(12 delta))^2) \
         T_0 & = (2pi)/sqrt(delta^2 + (4pi^2)/(ln(A_1/A_13)/(12 delta))^2) = 0.9154 "s" \
$

#pb()
Určím tuhost pružiny $k$

$
        omega_0 & = sqrt(k/m) \
      (2pi)/T_0 & = sqrt(k/m) \
  (4pi^2)/T_0^2 & =k/m \
              k & = m (4pi^2)/T_0^2 \
              k & = m (4pi^2)/((2pi)/sqrt(delta^2 + (4pi^2)/(ln(A_1/A_13)/(12 delta))^2))^2 = 4.711 " kg s"^(-2) \
$

#pb()
=
== Zadání
Jaký je logaritmický dekrement útlumu tlumeného harmonického pohybu hmotného bodu, když za čas $t = 10 "s"$ trvání pohybu ztrácí hmotný bod $50%$ svoji mechanické energie a když perioda tlumeného pohybu $T = 2 "s"$?
== Řešení

Určím logaritmický dekrement $b$:

$
    gamma & = ln(e^(delta T)) = delta T \
     E(t) & = E_0 e^(-2 delta t) \
  1/2 E_0 & = E_0 e^(-2 delta 10) \
      1/2 & = e^(-2 delta 10) \
  ln(1/2) & = -2 delta 10 \
    delta & = ln(1/2)/(-20) \
    gamma & = delta T = ln(1/2)/(-20) T = 0.0693 \
$

#pb()
=
== Zadání
Perioda tlumených kmitů $T = 0,2 "s"$, přičemž poměr amplitud $A_i = A(i T)$ je roven $A_1/A_6 = k = 13$. Vypočtěte rezonanční frekvenci kmitající soustavy.
== Řešení
