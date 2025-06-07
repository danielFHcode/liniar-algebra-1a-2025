#import "@preview/rubber-article:0.3.1": article, maketitle
#import "@preview/delimitizer:0.1.0": *

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


#maketitle(
  title: "אלגברה לינארית 1א",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 27, month: 5, year: 2025).display("[day].[month].[year]"),
)

= מטריצות סטורסטיות

== תזכורת

מטריצה
$A = (a_(i j))$
נקראת סטורסטית לפי עמודות כאשר לכל
$j$:

$
  sum_(i = 1)^n a_(i j) = 1
$

== טענה

תהי
$A$
מטריצה סטורסטית לפי עמודות. אז 1 הוא ע"ע של
$A$.

=== הוכחה

$
  det(A - I) =^? 0
$

סכום כל השורות של
$A - I$
הינו 0 לכן השורות של
$A$
ת"ל כלומר
$A-I$
אינה הפיכה.

== טענה

תהי
$A$
סטורסטית חיובית, אז:

+ $dim V_1(A) = 1$
+ אם
  $0 != v in V_1(A)$
  אז כל הרכיבים שלו בעלי אותו סימן (כולם חיוביים או כולם שליליים).

=== הוכחה

2. יהי
   $0 != v = (x_1,...,x_m)^t in V_1(A)$
   וקטור עצמי. קיים
   $K$
   כך ש-$x_K != 0$.
    נניח ש-$x_K > 0$.
    נתון ש-$A v = v$
    ולכן:

   $
      x_i = sum_(j = 1)^n a_(i j) x_j
   $

   לכן:

   $
     abs(x_i) = abs(sum_(j=1)^n a_(i j) x_j) <= sum_(j=1)^n a_(i j) abs(x_j)
   $

   ויש שוויון אם ורק אם לכל
   $j$
   #text(fill: red)[אבל]:

   $
     sum_(i=1)^n abs(x_i)
     <= sum_(i=1)^n sum_(j = 1)^n a_(i j) abs(x_j)
     = sum_(j=1)^n sum_(i=1)^n a_(i j) abs(x_j) = sum_(j = 1)^n abs(x_j)
   $

   לכן כל אי שוויון היה שוויון, כלומר:

   $
     abs(x_i) = sum_(j=1)^n a_(i j) abs(x_j)
   $

   ולכן לכל
   $1 <= j <= n$
   מתקיים
   $x_j >= 0$.
   בנוסף:

   $
     x_i = sum_(j=1)^n a_(i j) x_j > a_(i K) x_K > 0
   $

1. כדי להראות את (1) מספיק להוכיח: אם
   $u,v in RR^n$
   בת"ל אז קיימים
   $alpha,beta in RR$
   כך של-$alpha u + beta v$
   יש רכיבים עם סימנים שוויוניים.

   אם ל-$A$
   יש שני ע"ע
   $u,v != 0$
   המתונים ל-$1$
   אז גם כל צירוף לינארי שלהם
   $alpha u + beta v$
   הוא ע"ע של
   $A$.

   אבל ראינו שלכל ו"ע של
   $A$
   יש סימנים זהים לכל הרכיבים. סתירה.

   *הוכחת הטענה:*

   נגדיר:

   $
     W = { v in RR^n bigg(|) sum_(i=1)^n [v]_i = 0 }
   $

   לכל
   $0 != w in W$
   יש רכיבים חיוביים ושליליים. לכן מפיק למצוא
   $alpha, beta in RR$
   כך ש-$0 != alpha u + beta u in W$.
   אם
   $u in W$ -
   סיימנו
   ($alpha = 1$, $beta = 0$).
   אחרת נגדיר:

   $
     beta =  sum_(i=1)^n = [u]_i != 0 \
     alpha = - sum_(i=1)^n [v]_i \
     sum_(i=1)^n [alef u + beta u]_i = alpha sum_(i=1)^n [u]_i + beta sum_(i=1)^n [v]_i = alpha dot beta + beta dot (-alpha) = 0
   $

== סימון

יהי
$v = (v_1, ..., v_n) in RR^n$,
נסמן:

$
  norm(v) = sum_(i=1)^n abs(v_i)
$

== טענה

תהי
$A$
מטריצה סטורסטית חיובית. אז קיים
$0 < C < 1$
כך שלכל
$v in W$
ייתקיים:

+ $A v in W$

+ $norm(A v) <= C norm(v)$.

== משפט

תהי
$A$
סטורסטית חיובית. יהי
$0 != v in RR^n$
כך ש-$A v = v$
ובנוסף
$sum_(i=1)^n) [v]_i = 1$.
יהי
$v_0 in RR^n$
כך שסכום הרכיבים שלו הוא
$1$.
אז
$v = lim_(k -> infinity) A^k dot v_0$,
כלומר ש-$lim_(k -> infinity) norm(A^k v_0 - v) = 0$.

= מרחבים דואליים

== הגדרה

יהי
$FF$
כלשהו. יהי
$V$
מרחב וקטורי מעל
$FF$.

פונקציונל (לינארי) מעל
$V$
הוא העתקה לינארית
$V -> F$.
קבוצת כל הפונקציונלים הלינאריים מעל
$V$
נקראת המרחב הדואלי ל-$V$
ומסומנת ע"י
$V\*$.

$
  V\* = Hom(V,F)
$

== מסקנה

אם
$V$
ממימדסופי את
$dim V = dim V\*$,
כלומר
$V =^tilde V\*$.

== דוגמאות

+ יהי
  $V = RR^n$.
  יהי
  $a = (a_1, ..., a_n)^t in RR^n$.
  נגדיר:

  $
    phi(v) = (a_1, ..., a_n)^t v = a^t v = a_1 v_1 + ... + a_n v_n
  $

  כל
  $phi in (RR^n)\*$
  הוא מהצורה הזאת. נסמן
  $v = (v_1, ..., v_n) in RR^n$,
  אז:

  $
    phi(v) = phi(v_1 e_1 + ... + v_n e_n) = v_1 phi(e_1) + ... + v_n phi(e_n)
  $

+ $V = RR^n$.
  יהיו
  $u_1, ..., u_(n-1) in RR^n$.
  נגדיר:

  #let aligned(..lines) = {
    let items-per-line = calc.max(..lines.pos().map(array.len))
    set text(lang: "en")
    grid(
      columns: (auto,)*items-per-line,
      gutter: .5em,
      align: (end,) + (start,)*(items-per-line - 1),
      ..lines.named(),
      ..lines.pos().map(items => items + (none,)*(items-per-line - items.len())).flatten().map(math.equation)
    )
  }

  #let cases(..args) = $lr(\{#aligned(..args))$

  $
    phi(v) = det mat(
      -, v, -;
      -, u_1, -;
      , dots.v, ;
      -, u_n, -;
    ) \
    cases(
      1, 2;
      1, 2;
    )
  $