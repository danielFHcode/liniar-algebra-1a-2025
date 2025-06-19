#import "@preview/rubber-article:0.3.1": article, maketitle
#import "@preview/delimitizer:0.1.0": *
#import "@preview/icu-datetime:0.1.2": fmt-date

#show: article.with(lang: "he")

#show math.equation.where(block: true): set block(breakable: true)
#show math.equation.where(block: false): box
#set text(font: "David CLM")

#let ds = $. space$
#let mtext = text.with(font: "David CLM")
#let Span = math.op[Span]
#let Row = math.op[Row]
#let Col = math.op[Col]
#let rank = math.op[rank]
#let Ker = math.op[Ker]
#let Hom = math.op[Hom]
#let Id = math.op[Id]
#let Null = math.op[Null]
#let adj = math.op[adj]
#let sign = math.op[sign]
#let amat = math.mat.with(augment: -1)
#let dmat = math.mat.with(delim: "|")
#let tab = $space space space space$

#let bcases(..cases) = math.cases(
  ..cases.named(),
  ..cases.pos().map(arr => arr.join($&tab$))
)

#maketitle(
  title: "אלגברה לינארית 1א",
  authors: ("דניאל פ.ח.",),
  date: fmt-date(datetime(day: 10, month: 6, year: 2025), locale: "he"),
)

= מרחבים דואלים

== הגדרה

יהי
$V$
מ"ו מעל שדה
$FF$.

$
  V\* := { f: V -> FF | mtext("לינארית") f }
$

$V\*$
הינו מרחב וקטורי.

== דוגמאות

- / $V = RR$\::
    יהי
    $f: RR -> RR$
    פונקציה.

    $
      f(1) = m \
      arrow.b.double \
      f(x) = f(x dot 1) = x dot f(1) =  m x
    $

- / $V = RR^2$\::
    יהי
    $f: RR&2 -> RR$
    פונקציה.

    $
      f(e_1) = a \
      f(e_2) = b \
      arrow.b.double \
      f(x,y) = f(x e_1 + y e_2) = x f(e_1) + y f(e_2)
    $

- / $V = RR^n$\::
    $
      f(e_1) = a_1, ..., f(e_n) = a_n \
      f(x_1, ..., x_n) = f(e_1 x_1 + ... + e_n x_n) = x_1 f(e_1) + ... + x_n f(e_n) = x_1 a_1 + ... + x_n a_n
    $

== טענה

$
  (RR^n)\* eq^tilde RR^n
$

=== הוכחה

נגדיר:

$
  T: RR^n -> (RR^n)\* \
  T(a_1, ..., a_n) = f_(a_1, ..., a_n) = f_a
$

כאשר:

$
  f_(a_1, ..., a_n)(x_1,...,x_n) = sum_(i=1)^n a_i x_i
$

/ $T$ לינארית\::
  יהיו
  $a,b in RR^n$,
  אז:

  $
    T(a+b) = f_(a+b) \
    f_(a+b)(x) = sum_(i=1)^n (a_i+b_i) x_i = sum_(i=1)^n a_i x_i + sum_(i=1)^n b_i x_i = f_(a)(x) + f_(b)(x) 
  $
  \
  $
    T(lambda a) = f_(lambda a) \
    f_(lambda a)(x) = sum_(i=1)^n lambda a_i x_i = lambda sum_(i=1)^n a_i x_i = lambda f_a
  $

/ $T$ חח"ע\::
  נניח ש-$f_a = T(a_1, ..., a_n) = 0$.

  $
    forall lambda in RR^n ds f_(a)(x) = sum_(i=1)^n a_i x_i = 0 \
    forall i ds 0 = f_(a)(e_i) = a_i ==> a = 0
  $

/ $T$ על\::
  הוכחנו בדוגמא.

*באופן כללי*
לכל מ"ו
$V$
כך ש-$dim V = n$
מתקיים גם
$dim V\* = n$.

== טענה

בהנתן בסיס ל-$V$
${v_1, ..., v_n}$
יש בסיס ל-$V\*$
${f_1, ..., f_n}$
כך ש-

$
  forall i,j ds f_(j)(v_i) = bcases(
    1, i = j;
    0, i != j;
  )
$

=== הוכחה

יהי
$f in V\*$
ויהי
$v in V$.

$
  forall i ds f(v_i) = a_i \
  arrow.b.double \
  f = sum_(i=1)^n a_i f_i \
  f(v_2) = sum_(i=1)^n a_i f_(i)(v_2) = a_2
$

/ בת"ל\::
  נניח ש-$f = alpha_1 f_1 + ... + alpha_n f_n = 0$,
  אז
  $forall i ds f(v_i) = alpha_i = 0$.

== גרעין

$
  Ker f = { x in V : f(x) = 0 }
$

ב-$RR^n$
מתקיים:

$
  Ker f_q = { lambda in RR^n bigg(|) sum_(i=1)^n a_i x_i = 0 }
$

זהו תת"מ ממרחב
$n-1$.

באופן כללי, אם
$0 != f in V\*$,
יש
$v in V$
כך ש-$f(v) != 0$.
נניח ש-$f(v)$.

$
  forall x in V ds x = overbrace(x - f(x) v, in Ker f) + f(x) v
$

אז:

$
  f(x-f(x)) = f(x) - f(x) f(v) = 0 => V = Ker f plus.circle Span {v}
$

// = המרחב $V\*\*$

// $
//   V\*\*  = { f : V\* -> FF | mtext("לינארי") f }
// $

// לכל
// $v in V$
// אפשר להתאים:

// $
//   e_v in V\*\*
//   e_(v)(c) = f(v)
// $

// זה מגדיר העתקה לינארית מ-$V$
// ל-$V\*\*$.
// זה איזומורפיזם

== טענה

יהי
$V$
מ"ו,
$dim V = n$,
$U subset.eq V$
ת"מ.
נניח ש-$dim U = r$.
אז
$dim U degree = n-r$.

=== הוכחה

ניקח בסיס ל-$U$
$e_1, ..., e_n$.
ניקח
$f_1, ..., f_n$
כך ש-

$
  f_(i)(e_i) = bcases(
    1, i=j;
    0, i != j;
  )
$

נשלים לבסיס של
$V$:

$
  e_1, ..., e_r, e_(r+1), ..., e_n
$

ובאופן דומה ב-$V\*$:

$
  f_1, ..., f_r, f_(r+1), ..., f_n
$

/ זה בסיס ל-$U degree$\::
  לכל
  $j >= r+1$
  מתקיים:

  $
    forall i <= r ds f_(j)(e_i) = 0 => f_j |_u = 0
  $

/ פורשת\::
  יהי