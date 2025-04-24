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
  title: "אלגברה לינארית 1א - תרגיל בית 4",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 23, month: 4, year: 2025).display("[day].[month].[year]"),
)

= שאלה 1

== סעיף א

זהו אינו מרחב ווקטורי כיוון שהוא לא סגור לכפל. לדוגמא
$sqrt(2) in RR, 1 in QQ, sqrt(2) dot 1 in.not QQ$.

== סעיף ב

חילופיות, אסוציטיביות, קיום איבר ניטרלי, קיום הופכי, והסגירות של חיבור נובעים מכך ש-$CC$
שדה.

אסוציטיביות וקיום איבר ניטרלי נובעים מכך ש-$CC$
שדה.

2 צורות הדיסטריבטיביות נובעות מכך ש-$CC$
שדה.

נותר להוכיח סגירות של כפל:

$
  lambda dot (x + y i) = lambda x + (lambda y)i in CC
$

== סעיף ג

נוכיח שזה תת"מ של
$RR -> RR$

+ $
    f(x) = 0 => -1 <= f(x) <= 1 => f in V
  $
+ $
    -C <= f(x) <= C and -D <= g(x) <= D
    => -(C + D) <= (f + g)(x) <= C + D
    => f + g in V
  $
+ $
    -C <= f(x) <= C
    => -lambda dot C <= lambda dot f(x) <= lambda dot C
    => lambda dot f in V
  $

== סעיף ד

נוכיח שזהו תת"מ של
$RR -> RR$:

+ $
    f(x) = 0 => f(17) = 0 => f in V
  $
+ $
    f(17) = 0 and g(17) = 0 => (f + g)(17) = 0 + 0 = 0 => f + g in V
  $
+ $
    f(17) = 0 => (lambda dot f)(17) = lambda dot 0 = 0 => f in V
  $

== סעיף ה

זהו לא מ"ו כיוון שהוא לא סגור לחיבור:

$
  f(x) = 1 and g(x) = 1 =>
  f(17) = 1 and g(17) = 1 =>
  (f + g)(17) = 2 != 1 =>
  f in V and g in V and f + g in.not V
$

== סעיף ו

נוכיח שזהו תת"מ של
$RR -> RR$:

+ $
    f(x) = 0 => f(17) = 0 \
    f(x) = 0 => f'(x) = 0 => f'(17) = 0 \
    f(x) = 0 => f'(x) = 0 => f''(x) = 0 => f''(17) = 0 \
    arrow.b.double \
    f in V
  $
+ $
    f(17) = 0 and g(17) = 0 => (f + g)(17) = 0 \
    f'(17) = 0 and g'(18) = 0 => (f + g)'(17) = (f' + g')(17) = 0 \
    f''(17) = 0 and g''(18) = 0 => (f + g)''(17) = (f' + g')'(17) = (f'' + g'')(17) = 0 \
    arrow.b.double \
    f + g in V
  $
+ $
    f(17) = 0 => (lambda dot f)(17) = 0 \
    f'(x) = 0 => (lambda dot f)'(17) = lambda dot f'(17) = 0 \
    f''(x) = 0 => (lambda dot f)''(17) = (lambda dot f')'(17) = (lambda dot f'')(17) = 0 \
    arrow.b.double \
    lambda dot in V
  $

== סעיף ז

נוכיח כי זה תת"מ של
$RR^3$:

+ $
    a = b = 0 => mat(0; 0; 0-0) in V
  $
+ $
    mat(a; b; a-b) + mat(x; y; x-y) = mat(a+x; b+y; (a+x)-(b+y)) in V
  $
+ $
    lambda dot mat(a; b; a-b) = mat(lambda dot a; lambda dot b; lambda dot a - lambda dot b) in V
  $

= שאלה 2

+ $
    A, B subset.eq {1,...,n} => A triangle B subset.eq {1,...,n}
  $
+ $
    A triangle (B triangle C) = (A triangle B) triangle C
  $
+ $
    A triangle B = B triangle A
  $
+ $
    A triangle emptyset = A
  $
+ $
    A triangle A = emptyset
  $
+ $
    A subset.eq {1,...,n} => A, emptyset subset.eq {1,...,n} => 1 dot A, 0 dot A subset.eq {1,...,n}
  $
+ $
    1 dot (A triangle B) = A triangle B = (1 dot A) triangle (1 dot B) \
    0 dot (A triangle B) = emptyset = emptyset triangle emptyset = (0 dot A) triangle (0 dot B)
  $
+ $
    A dot (1 + 0) = A dot 1 = A dot 1 triangle emptyset = A dot 1 + A dot 0 \
    A dot (0 + 1) = A dot 1 = emptyset triangle A dot 1 = A dot 0 + A dot 1 \
    A dot (1 + 1) A dot 0 = emptyset = A triangle A = A dot 1 triangle A dot 1 \
    A dot (0 + 0) = A dot 0 = emptyset = A dot 0 triangle A dot 0 \
  $
