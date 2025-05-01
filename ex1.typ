#import "@preview/rubber-article:0.3.1": maketitle, article

#show: article.with(lang: "he", heading-numbering: none)

#show math.equation.where(block: true): set block(breakable: true)
#show math.equation.where(block: false): box
#set text(font: "David CLM")

#let ds = $. space$
#let mtext = text.with(font: "David CLM")
#let Span = math.op[Span]
#let amat = math.mat.with(augment: -1)
#let tab = $space space space space$

#maketitle(
  title: "אלגברה לינארית 1א - תרגיל בית 1",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 29, month: 4, year: 2025).display("[day].[month].[year]"),
)

= שאלה 1

== סעיף א

$
  overline(z dot w)
  =& overline((a + b i)(x + y i)) \
  =& overline(a x + a y i + b x i - b y) \
  =& a x - a y i - b x i - b y \
  =& a(x - y i) - b(x i + y) \
  =& a(x - y i) - b i(x - y i) \
  =& (a - b i)(x - y i) \
  =& overline(a + b i) dot overline(x + y i) \
  =& overline(z) dot overline(w) \
$

== סעיף ב

$
  z &= overline(z) \
  a + b i &= overline(a + b i) \
  cancel(a) + b i &= cancel(a) - b i \
  2 b i &= 0 \
  b &= 0 \
$
$
  arrow.b.double \
  z = a in RR
$

== סעיף ג

$
  Re(z)
  &= Re(a + b i) \
  &= a \
  &= (2a) / 2 \
  &= (2a + b - b) / 2 \
  &= (a + b + a - b) / 2 \
  &= (z + overline(z)) / 2 \
$

== סעיף ד

$
  Im(z)
  = Im(a + b i)
  = b
  = (2b i) / (2 i)
  = (b i + b i + a - a) / (2 i)
  = (a + b i - (a - b i)) / (2 i)
  = (z - overline(z)) / (2 i)
$

= שאלה 2

מתקיים:

$
  a_n = a_(n-1) + d = a_(n-1) + a_(n-2) + d = ... = a_0 + underbrace(d + ... + d, n "times") = a_0 + n dot d
$

ולכן:

$
  sum_(i=0)^n a_i = sum_(i=0)^n a_0 + n dot d = (n+1) dot a_0 + d dot sum_(i=0)^n i = (n+1) dot a_0 + d dot ((n+1)n) / 2 = ((n+1)(2a_0 + d n)) / 2 = ((n+1)(a_0 + a_n)) / 2
$

= שאלה 3

== סעיף א

$
  (1 + i)z &= 2 + i \
  (1 + i)(a + b i) &= 2 + i \
  a + b i + a i - b &= 2 + i \
  a - b + (a + b) i &= 2 + i \
$
$
  + cases(
    a - b &= 2,
    a + b &= 1,
  ) \
$
$
  2a &= 3 \
  a &= 3 / 2 \
$
$
  - cases(
    a - b &= 2,
    a + b &= 1,
  ) \
$
$
  2b &= 1 \
  b &= 1 / 2 \
$
$
  z = 3 / 2 + 1 / 2 i
$

== סעיף ב

$
  (sqrt(3) + 2i)z &= 2 + i \
  (sqrt(3) + 2i)(a + b i) &= 2 + i \
  a sqrt(3) + b sqrt(3) i + 2a i - 2b &= 2 + i \
  a sqrt(3) - 2b + (2a + b sqrt(3)) i &= 2 + i \
$
$
  cases(
    a sqrt(3) - 2b &= 2,
    2a + b sqrt(3) &= 1,
  ) \
  cases(
    2 a sqrt(3) - 4b &= 2,
    2 a sqrt(3) + 3 b &= 1,
  ) \
$
$
  7b &= -1 \
  b &= -1 / 7 \
$
$
  cases(
    a sqrt(3) - 2b &= 2,
    2a + b sqrt(3) &= 1,
  ) \
  cases(
    3a - 2b sqrt(3) &= 2,
    4a + 2b sqrt(3) &= 1,
  ) \
$
$
  7a &= 3 \
  a &= 3 / 7 \
$
$
  z = 3 / 7 - 1 / 7 i
$

== סעיף ג

$
  (3 - 2i)(5 + i)z &= 1 + 2i \
  (15 + 3i - 10i + 2)z &= 1 + 2i \
  (17 - 7i)z &= 1 + 2i \
  (17 - 7i)(a + b i) &= 1 + 2i \
  17a + 17b i - 7a i - 7b &= 1 + 2i \
  17a - 7b + (-7a + 17b) i &= 1 + 2i \
$
$
  &cases(
    17a - 7b &= 1,
    -7a + 17b &= 2,
  ) \
  &cases(
    a - 7/17 b &= 1/17,
    a - 17/7 b &= -2/7,
  ) \
$
$
  240 / 119 b &= 27 / 119 \
  b &= 9 / 80 \
$
$
  17a - 64 / 80 &= 1 \
  17a &= 144 / 80 \
  17a &= 9 / 5 \
  a &= 9 / 85 \
$
$
  z = 9 / 85 + 9 / 80 i
$

= שאלה 4

== סעיף א

$
  (sqrt(1^2 + 1^2), arctan 1 / 1) = (sqrt(2), 45degree)
$

== סעיף ב

$
  (sqrt((1/sqrt(2))^2 + (1/sqrt(2))^2), arctan (1 / sqrt(2)) / (-1 / sqrt(2))) = (1, -45degree)
$

== סעיף ג

$
  (sqrt(1^2 + 2^2), arctan (-1) / 2) = (sqrt(5), -0.392699082)
$

= שאלה 5

== סעיף א

$
  5e^((5pi) / 3) = 5(cos (5pi) / 3 + i sin (5pi) / 3) = 5(1 / 2 - sqrt(3) / 2 i) = 5 / 2 - (5sqrt(3)) / 2i
$

== סעיף ב

$
  e^(-(pi i) / 2) = cos(-pi/2) + i sin(-pi/2) = 0 - i
$

= שאלה 6

$
  p(z_0) &= 0 \
  sum_(k=0)^n a_k (z_0)^k &= 0 \
  sum_(k=0)^n a_k (x_0 + y_0 i)^k &= 0 \
  sum_(k=0)^n a_k sum_(j=0)^k (x_0)^(k-j)(y_0 i)^j &= 0 \
  sum_(k=0)^(n) a_k sum_(j=0)^(k / 2) (x_0)^(2k-2j+1)(y_0 )^(2j+1) (-1)^(j+1) + i sum_(k=0)^(n) a_k sum_(j=0)^(k / 2) (x_0)^(2k-2j)(y_0 )^(2j) (-1)^j &= 0 \
$
$
  cases(
    sum_(k=0)^(n) a_k sum_(j=0)^(k/2) (x_0)^(2k-2j+1)(y_0 )^(2j+1) (-1)^(j+1) &= 0,
    sum_(k=0)^(n) a_k sum_(j=0)^(k/2) (x_0)^(2k-2j)(y_0 )^(2j) (-1)^ &= 0,
  ) \
  cases(
    sum_(k=0)^(n) a_k sum_(j=0)^(k/2) (x_0)^(2k-2j+1)(y_0 )^(2j+1) (-1)^(j+1) &= 0,
    -sum_(k=0)^(n) a_k sum_(j=0)^(k/2) (x_0)^(2k-2j)(y_0 )^(2j) (-1)^ &= 0,
  ) \
$
$
  sum_(k=0)^(n) a_k sum_(j=0)^(k / 2) (x_0)^(2k-2j+1)(y_0 )^(2j+1) (-1)^(j+1) - i sum_(k=0)^(n) a_k sum_(j=0)^(k / 2) (x_0)^(2k-2j)(y_0 )^(2j) (-1)^j &= 0 \
  sum_(k=0)^n a_k sum_(j=0)^k (x_0)^(k-j)(-y_0 i)^j &= 0 \
  sum_(k=0)^n a_k (x_0 - y_0 i)^k &= 0 \
  sum_(k=0)^n a_k (overline(z_0))^k &= 0 \
  p(overline(z_0)) &= 0 \
$
