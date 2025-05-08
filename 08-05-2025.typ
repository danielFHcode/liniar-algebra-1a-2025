#import "@preview/rubber-article:0.3.1": article, maketitle

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
#let amat = math.mat.with(augment: -1)
#let tab = $space space space space$

#maketitle(
  title: "אלגברה לינארית 1א",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 6, month: 5, year: 2025).display("[day].[month].[year]"),
)

= הרכבה של העתקות לינאריות

== טענה

תהיינה:
$S: U -> V, T: V -> W$
העתקות לינאריות חח"ע ועל
(איזומורפיזם)
אז גם ההרכבה
$T compose S : U -> W$
איזומורפיזם.

=== הוכחה

נבדוק ש-$Ker(T compose S) = {0}$.
יהי
$u in Ker(T compose S)$,
אז
$T(S(u)) = 0$
ולכן
$S(u) in Ker(T)$.
$T$
איזומורפיזם ולכן
$Ker T = {0}$,
כלומר
$S(u) = 0$.
כלומר
$u in Ker(S)$
ו-$S$
חח"ע, ומכאן
$u = 0$.

יהי
$w in W$.
$T$
היא על ולכן קיים
$v in V$
כך ש-$T(v) = w$.
$S$
על ולכן קיים
$u in U$
כך ש-$S(u) = v$.
מכאן
$T(S(u)) = T(v) = w$.

= מטריצה מייצגת של העתקה לינארית


יהי
$V$
מרחב ווקטורי
$n$
מימדי מעל שדה
$FF$.
יהי
$B = (v_1, ..., v_n)$
בסיס סדור ל-$V$.
אז
$v |-> [v]_B$
איזומורפיזם מ-$V$
ל-$FF^n$.
כלומר, אם
$v = lambda_1 v_1 + ... + lambda_n v_n$,
אז ההעתקה היא
$v |-> mat(lambda_1; dots.v; lambda_n)$.

$
  [v + w]_B = [v]_B + [w]_B \
  [d dot v]_B = d dot [v]_B
$

== הגדרה

יהיו
$V,W$
מרחבים ווקטוריים. נסמן
$B = (v_1, ..., v_n)$
בסיס סדור ל-$V$,
$C = (w_1, ..., w_n)$
בסיס סדור ל-$W$.
תהי
$T: V -> W$
ההעתקה לינארית. אז המטריצה המייצגת של
$T$
בייחס ל-$B$
ו-$C$
היא:

$
  [T]^B_C = mat(
    |, |, , |;
    [T v_1]_C, [T v_2]_C, ..., [T v_n]_C;
    |, |, , |;
  ) in M_(m times n)(FF)
$

=== דוגמא

$
  T : RR_2[x] -> RR_2[x] \
  B = C = (1, x, x^2) \
  T(p(x)) = p'(x) \
  arrow.b.double \
  T(1) = 0 \
  T(x) = 1 \
  T(x^2) = 2x \
  arrow.b.double \
  [T]^B_C = mat(
    0, 1, 0;
    0, 0, 2;
    0, 0, 0;
  )
$

== טענה

$[T]^B_C$
קובעת את
$T$.
כלומר אם
$S,T: V -> W$
העתקות לינארית כך ש-$[S]^B_C = [T]^B_C$
אז
$S = T$.

=== הוכחה

$[S]^B_C = [T]^B_C$
$arrow.l.double$
לכל
$1 <= i <= n$
$[S v_i]_C = [T v_i]_C$.
$[ dot ]_C$
איזומורפיזם ולכן גם
$S v_i = T v_i$
לכל
$1 <= i <= n$.

#v(.5em)
#line(length: 100%, stroke: (thickness: 0.05em))
#v(.5em)

הראינו שההתאמה
$T |-> [T]^B_C$
היא חח"ע, כעט נראה שהיא על:

== טענה

יהיו
$V,W$
מרחבים ווקטוריים. יהי
$B = (v_1, ..., v_n)$
בסיס סדור ל-$V$
ו-$C = (w_1, ..., w_m)$
בסיס סדור ל-$W$.
תהי
$A in M_(m times n)(FF)$.
אז קיימת העתקה לינארית
$T: V -> W$
כך ש-$[T]^B_C = A$.

=== הוכחה

$
  A = mat(
    a_(1 1), ..., a_(1 n);
    dots.v, dots.down, dots.v;
    a_(m 1), ..., a_(m n);
  )
$

נגדיר
$u_1 = a_(1 1) w_1 + ... + a_(m 1) w_m$.
אז:

$
  [u_1]_C = mat(a_(1 1); dots.v; a_(m 1))
$

באופן כללי נגדיר
$u_k = a_(1 k) w_1 + ... + a_(m k) w_m$.
אז:

$
  [u_k]_C = mat(a_(1 k); dots.v; a_(m k))
$

נגדיר העתקה לינארית
$T: V -> W$
כך שלכל
$1 <= k <= n$,
$T(v_k) = u_k$.
אז:

$
  [T]^B_C = mat(
    |, , |;
    [T v_1]_C, ..., [T v_n]_C;
    |, , |;
  ) = mat(
    |, , |;
    [u_1]_C, ..., [u_n]_C;
    |, , |;
  ) = A
$
