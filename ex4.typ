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
+ $
    1 dot A = A
  $

= שאלה 3

== סעיף א

יהיו
$[a], [b] in U subset.eq ZZ_p$,
אז:

$
  [a] dot [b] = [a dot b] = \[underbrace(a + ... + a, b "times")\] = underbrace([a] + ... + [a], b "times") in U
$

בנוסף, בהנתן
$[a] in U$,
מכך ש-$ZZ_p$
שדה קיים
$[b] in ZZ_p$
כך ש-

$
  0 = [a] dot [b] = [a dot b] = \[underbrace(a + ... + a, b "times")\] = underbrace([a] + ... + [a], b "times") in U
$

לכן סה"כ
$U$
תת"מ של
$ZZ_p$.

== סעיף ב

$QQ^2 subset.eq RR^2$,
ו-$QQ^2$
מקיים סגירות לחיבור אבל לא סגירות לכפל בסקלר של
$RR$
ולכן
$QQ^2$
לא תת"מ של
$RR^2$.

= שאלה 4

+ $
    0 = 0_(i j) = 0_(j i) = 0 \
    0 = 0_(i j) = -0_(j i) = -0 \
  $

+ $
    A_(i j) = A_(j i) and B_(i j) = B_(j i)
    => (A + B)_(i j) = A_(i j) + B_(i j) = A_(j i) + B_(j i) = (A + B)_(j i) \
    A_(i j) = -A_(j i) and B_(i j) = -B_(j i)
    => (A + B)_(i j) = A_(i j) + B_(i j) = -A_(j i) - B_(j i) = -(A + B)_(j i) \
  $

+ $
    A_(i j) = A_(j i) => (lambda dot A)_(i j) = lambda dot A_(i j) = lambda dot A_(j i) = (lambda dot A)_(j i) \
    A_(i j) = -A_(j i) => (lambda dot A)_(i j) = lambda dot A_(i j) = lambda dot (-A_(j i)) = - lambda dot A_(j i) = -(lambda dot A)_(j i) \
  $

עבור
$A in "Sym"_(n)(FF) inter "ASym"_(n)(FF)$:

$
  +cases(
    A_(i j) = A_(j i),
    A_(i j) = -A_(j i),
  ) \
  2A_(i j) = 0 \
  A_(i j) = 0 \
$

לכן סה"כ
$"Sym"_(n)(FF) inter "ASym"_(n)(FF) = {0}$.

= שאלה 5

== סעיף א

+ $
    0 in QQ
  $
+ $
    a / b + n / m = (a n + b m) / (b m) in QQ
  $
+ $
    a / b dot n / m = (a dot n) / (b dot m) in QQ
  $

== סעיף ב

לא כיוון שאין לו סגירות לכפל, לדוגמא
$sqrt(2) in RR, 1/2 in QQ, sqrt(2)/2 in.not QQ$.

= שאלה 6

== סעיף א

$
  S inter T subset.eq S => Span(S inter T) subset.eq Span(S) \
  S inter T subset.eq T => Span(S inter T) subset.eq Span(T) \
  arrow.b.double \
  Span(S inter T) subset.eq Span(S) inter Span(T)
$

== סעיף ב

נפריח עם דוגמא נגדית:

$
  Span({mat(1;0)} inter {mat(2;0)}) = Span(emptyset) supset.eq.not Span{mat(1;0)} = Span{mat(1;0)} inter Span{mat(2;0)}
$

== סעיף ג

נפריח עם דוגמא נגדית:

$
  Span{mat(1;0),mat(0;1)} != Span{mat(1;0)} union Span{mat(0;1)}
$

= שאלה 7

== סעיף א

נסמן:

$
  S = {a_1, ..., a_n} \
  T = {a_1, ..., a_n, b_1, ..., b_m}
$

יהי
$lambda_1 a_1 + ... + lambda_n a_n in Span(S)$,
אז
$lambda_1 a_1 + ... + lambda_n a_n$
$=$
$lambda_1 a_1 + ... + lambda_n a_n + 0 dot b_1 + ... + 0 dot b_1$
$in.rev$
$Span(T)$.

== סעיף ב

/ $arrow.l.double$\::
  נניח בה"כ
  $S subset.eq.not Span(T)$,
  אז קיים
  $s in S$
  כך ש-$s in.not Span(T)$.
  $s in S$
  לכן
  $s in Span(S)$,
  לכן
  $Span(S) != Span(T)$
/ $arrow.r.double$\::
  נניח כי
  $Span(S) != Span(T)$,
  ונניח בה"כ כי קיים
  $s in Span(S)$
  כך ש-$s in.not Span(T)$.
  נסמן
  $S = {s_1, ..., s_n}$,
  אז קיימים
  $lambda_1, ..., lambda_n$
  כך ש-$s = lambda_1 s_1 + ... + lambda_n s_n$.
  בהכרח קיים
  $i$
  כך ש-$s_i in.not Span(T)$
  כיוון שאחרת
  $s in Span(T)$
  מסגירות לכפל וחיבור וזו סתירה. לכן
  $S subset.eq.not Span(T)$.
