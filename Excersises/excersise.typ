#set text(font: "Iosevka NF")

$
  integral (x^2)/(x^2 - 1) d x; x in (-infinity; -1)\
  = integral 1 + (1/(x^2 - 1)) d x\
  = integral 1 d x + integral 1/(x^2 - 1) d x\
  = x + integral 1/(x^2 - 1) d x\
$

#pagebreak()

Dokažte
$
  7 divides 5^(2n+1) + 2^(2n+1) space forall n in NN\
$
zkusím indukcí?

$n = 1:$
$
  7 & divides 5^(3) + 2^(3) \
  7 & divides 125 + 8 \
  7 & divides 133 space checkmark \
$

$n + 1:$
$
  7 & divides 5^(2n+3) + 2^(2n+3) \
  7 & divides (7k - 2^(2n+1)) dot.op 5^2 + 2^(2n+1) dot.op 2^2 \
  7 & divides 7k dot.op 5^2 - 25 dot.op 2^(2n+1) + 4 dot.op 2^(2n+1) \
  7 & divides 7k dot.op 5^2 - 21 dot.op 2^(2n+1) \
  7 & divides 7k dot.op 5^2 + 7 dot.op (-3) dot.op 2^(2n+1) space checkmark \
$

#pagebreak()

spočítejte

$
  & lim_(x->0) (sqrt(2x + 1) -1 )/(x^2 -x) \
  & = lim_(x->0) (sqrt(2x + 1) -1 )'/(x^2 -x)' \
  & = lim_(x->0) sqrt(2x + 1)'/(2x - 1) \
  & = lim_(x->0) (2x + 1)^(1/2)'/(2x - 1) \
  & = lim_(x->0) (1/2 (2x + 1)^(-1/2) dot.op 2)/(2x - 1) \
  & = lim_(x->0) ((2x + 1)^(-1/2))/(2x - 1) \
  & = -1 \
$

spočítejte

$
                       & (sqrt(1 - cos(2x)))' \
                       \
           1 - cos(2x) & >= 0 \
               cos(2x) & <= 1 \
                     x & in RR \
  D(sqrt(1 - cos(2x))) & = RR \
  H(sqrt(1 - cos(2x))) & = chevron 0, sqrt(2) chevron.r \
  (sqrt(1 - cos(2x)))' & = ((1 - cos(2x))^(1/2))' \
                       & = 1/2 (1 - cos(2x))^(-1/2) dot.op 2 sin 2x \
                       & = (1 - cos(2x))^(-1/2) dot.op sin 2x \
                       & = (sin 2x)/(sqrt(1-cos(2x))) \
                       & = (sin 2x)/(sqrt(2 sin^2 x)) \
                       & = (sin 2x)/(sqrt(2 sin^2 x)) \
                       & = (2 sin x cos x)/(sqrt(2 sin^2 x)) \
$

jednostranné derivace
$
  D ((sin 2x)/(sqrt(2 sin^2 x))) = RR without {k pi | k in ZZ}
$

derivace zprava např. v $x = 0$\
$
  & lim_(x->0^+) (sin 2x)/(sqrt(2 sin^2 x)) \
  & = lim_(x->0^+) (2x)/(sqrt(2 x^2)) \
  & = lim_(x->0^+) (2x)/( x sqrt(2)) \
  & = 2/sqrt(2) \
  & = sqrt(2) \
$

derivace zleva např. v $x = 0$\
$
  & lim_(x->0^-) (sin 2x)/(sqrt(2 sin^2 x)) \
  & = lim_(x->0^+) (2x)/(sqrt(2 x^2)) \
  & = lim_(x->0^+) (2x)/( |x| sqrt(2)) \
  & = -2/sqrt(2) \
  & = -sqrt(2) \
$

#pagebreak()
$
  & integral (e^x + 1)/(e^(2x) + 2e^x - 3) d x \
  & =integral (e^x + 1)/((e^x + 3)(e^x - 1)) d x \
  & =integral (e^x + 1)/((e^x + 3)(e^x - 1)) d x \
$
asi parciální zlomky ne?

$
                       A/(e^x + 3) + B/(e^x - 1) & = (e^x + 1)/((e^x + 3)(e^x - 1)) \
  (A(e^x - 1) + B(e^x + 3))/((e^x + 3)(e^x - 1)) & = (e^x + 1)/((e^x + 3)(e^x - 1)) \
                         A(e^x - 1) + B(e^x + 3) & = e^x + 1 \
                          A e^x - A + B e^x + 3B & = e^x + 1 \
                                                 \
                                           A + B & =1 \
                                          3B - A & = 1 \
                                               A & = 3B -1 \
                                       3B -1 + B & = 1 \
                                              4B & = 2 \
                                               B & = 1/2 \
                                               A & = 3/2 - 1 \
                                               A & = 1/2 \
$

$
  & = integral 1/(2(e^x + 3)) + 1/(2(e^x - 1)) d x \
  & = integral 1/(2(e^x + 3)) d x + integral 1/(2(e^x - 1)) d x \
  & = 1/2 integral 1/(e^x + 3) d x + 1/2 integral 1/(e^x - 1) d x \
$
