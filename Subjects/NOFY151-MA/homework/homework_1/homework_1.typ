#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "@local/mod:0.1.0": *

#show: boilerplate

$
  & m, n in NN_0 \
  & lim_(x->0) (root(3, 1 + m x + 2x^2) - root(3, 1 + x +x^2))/x^n \
  & = lim_(x->0) (1 + m x + 2x^2 - 1 - x -x^2)/(x^n (root(3, 1 + m x + 2x^2)^2 + root(3, 1 + m x + 2x^2) root(3, 1 + x +x^2) + root(3, 1 + x +x^2)^2)) \
  & = lim_(x->0) (x^2 + (m-1)x)/(x^n (root(3, 1 + m x + 2x^2)^2 + root(3, 1 + m x + 2x^2) root(3, 1 + x +x^2) + root(3, 1 + x +x^2)^2)) \
  & = lim_(x->0) (x^2 + (m-1)x)/(x^n Z(x)) \
$

kde

$
  Z(x) = root(3, 1 + m x + 2x^2)^2 + root(3, 1 + m x + 2x^2) root(3, 1 + x +x^2) + root(3, 1 + x +x^2)^2
$

a jelikož je funkce spojitá v $0$

$
  lim_(x->0) Z(x) = lim_(x->0) root(3, 1 + m x + 2x^2)^2 + root(3, 1 + m x + 2x^2) root(3, 1 + x +x^2) + root(3, 1 + x +x^2)^2 = 3
$

a tedy zpět k původní limitě

$
  & = 1/3 lim_(x->0) (x^2 + (m-1)x)/(x^n) = 1/3 lim_(x->0) (x + m - 1)/x^(n-1) \
$

Vyšetřím několik případů:
+ $m=1$:
  + $n=0$
    $
      & 1/3 lim_(x->0) x/inv(x) = 1/3 lim_(x->0) x^2 = 0 \
    $
  + $n=1$
    $
      & 1/3 lim_(x->0) x/x^(0) = 1/3 lim_(x->0) x = 0 \
    $
  + $n=2$
    $
      & 1/3 lim_(x->0) x/x^(1) = 1/3 lim_(x->0) x/x = 1/3 \
    $
  + $n>2$
    + $2 divides n$
      $
        & 1/3 lim_(x->0) 1/x^(n-2) = infinity \
      $
    + $2 divides.not n$
      $
        & 1/3 lim_(x->0) 1/x^(n-2) "neex. - jednostranné limity se neshodují" \
      $

#pb()
+ $m!=1$:
  + $n=0$
    $
      & 1/3 lim_(x->0) (x + m - 1)/inv(x) = 1/3 lim_(x->0) x^2 + m x - x = 0 \
    $
  + $n=1$
    $
      & 1/3 lim_(x->0) (x + m - 1)/x^(0) = 1/3 lim_(x->0) x + m - 1 = (m - 1)/3 \
    $
  + $n>1$
    + $2 divides.not n and m = 0$
      $
        & 1/3 lim_(x->0) (x - 1)/x^(n-1) = -infinity \
      $
    + $2 divides.not n and m > 1$
      $
        & 1/3 lim_(x->0) (x + m - 1)/x^(n-1) = infinity \
      $
    + $2 divides n$
      $
        & 1/3 lim_(x->0) (x + m - 1)/x^(n-1) "neex. - jednostranné limity se neshodují" \
      $
