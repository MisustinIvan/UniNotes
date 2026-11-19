#import "@local/mod:0.1.0": *
#show: boilerplate

*Spojité rovnoměrné rozdělení*
- rozsah hodnot $span(a, b)$
- hustota pravděpodobnosti
  $
    f(x) = 1/(b-a)
  $
- distribuční funkce
  $
    F(x) = (x-a)/(b-a)
  $
- střední hodnota
$
  span(x) = (a+b)/2
$
- rozptyl
$
  V[x] = (b-a)^2/12
$


*Diskrétní rovnoměrné rozdělení*
- rozsah hodnot ${x_1, dots x_n}$
- hustota pravděpodobnosti
  $
    f(x) = 1/n = 1/(b-a+1)
  $
- distribuční funkce
$
  F(x) = (x - a + 1)/(n) = (x-a+1)/(b-a+1)
$
- střední hodnota
  $
    span(x) = (a+b)/2
  $
- rozptyl
$
  V[x] = ((b-a+1)^2 - 1)/12
$

*Binomické rozdělení*
- diskrétní rozdělení
- pravděpodobnostní funkce
$
  B_(n,p)(k) = binom(n, k) p^k (1-p)^(n-k)
$
- střední hodnota
$
  span(x) = n p\
$
- disperze
$
  V[x] = n p (1-p)
$

#pb()
*Poissonovo rozdělení*
- pravděpodobnostní funkce
$
  P_mu (k) = (mu^k e^(-mu))/k!
$
- střední hodnota
$
  span(x) = mu
$
- rozptyl
$
  V[x] = mu
$
