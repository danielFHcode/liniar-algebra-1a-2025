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

== דוגמא

$
  T: RR^3 -> RR^2 \
  B = (v_1, v_2, v_3) \
  C = (w_1, w_2) \
  v_1 = mat(0; 1; 0), v_2 = mat(1; 0; 1), v_3 = mat(1; 2; 0) \
  w_1 = mat(1; 0), w_2 = mat(1; 1) \
  A = mat(
    -1, -2, -1;
    0, 4, 1;
  ) \
  u_1 = -1 dot w_1 + 0 dot w_2 = mat(-1; 0) \
  u_2 = -2 dot w_1 + 4 dot w_2 = mat(2; 4) \
  u_3 = -1 dot w_1 + 1 dot w_2 = mat(0; 1) \
$

נגדיר את
$T$
כך ש-

$
  T(v_1) = u_1 \
  T(v_2) = u_2 \
  T(v_3) = u_3 \
  T mat(x; y; z) = T(d_1 v_1 + d_2 v_2 + d_3 v_3) = d_1 u_1 + d_2 u_2 + d_3 u_3
$

$
  amat(
    0, 1, 1, x;
    1, 0, 2, y;
    0, 1, 0, z;
  )
  -->
  amat(
    1, 0, 2, y;
    0, 1, 1, x;
    0, 1, 0, z;
  )
  -->
  amat(
    1, 0, 2, y;
    0, 1, 1, x;
    0, 0, -1, z-x;
  ) \
  d_3 = x - z \
  d_2 = x - d_3 = z \
  d_1 = y - 2d_3 = y - 2x + 2z \
  T mat(x; y; z) = (y - 2x + 2z)mat(-1; 0) + z mat(2; 4) + (x-z)mat(0; 1) = mat(2x-y; x+3z)
$

== משפט

יהיו
$V,W$
מרחבים ווקטוריים כך ש-$dim V = n, dim W = m$.
יהי בסיס
$B$
ל-$V$
ו-$C$
בסיס ל-$W$.

אז ההעתקה:

$
  psi : Hom(V, W) -> M_(m times n)(FF) \
  psi(T) = [T]^B_C
$

היא איזומורפיזם.

=== הוכחה

ראינו ש-$psi$
היא חח"ע ועל. הותר לבדוק שהיא לינארית:

$
  [T + S]_C^B = [T]_C^B + [S]_C^B \
  [lambda dot T]_C^B = lambda dot [T]_C^B
$

נסמן
$B = (v_1, ..., v_n)$.
אז:

$
  [T + S]_C^B = mat(
    |, , |;
    [(T + S)v_1]_C, ..., [(T+S)v_n]_C;
    |, , |;
  ) = mat(
    |, , |;
    [T v_1]_C, ..., [T v_n]_C;
    |, , |;
  ) + mat(
    |, , |;
    [S v_1]_C, ..., [S v_n]_C;
    |, , |;
  ) = [T]_C^B + [S]_C^B
$

ובאותו אופן - כפל בסקלר.

=== מסקנה

$
  dim Hom(V, W) = dim V dot dim W
$

= תכונות של מטריצה מייצגת

תהי
$T: V -> W$
העתקה לינארית. יהי
$V$
בסיס ל-$V$
ו-$C$
בסיסי ל-$W$.
אז לכל
$v in V$:

$
  [T v]_C = [T]^B_C dot [v]_B
$

== הוכחה

נסמן
$[v]_B = mat(lambda_1; dots.v; lambda_n)$,
אז:

$
  v = lambda_1 v_1 + ... + lambda_n v_n \
  [T(v)]_C
  = [lambda_1 T(v_1) + ... + lambda_n T(v_n)]_C
  = lambda_1 [T v_1] + ... + lambda_n [T v_n]_C
$

== דוגמא

$
  T : RR^2 -> RR_2[x] \
  T mat(a; b) = (a + 2b) + (3a-b)x + 3b x^2 \
  B = (mat(1; 1), mat(2; 0)), C = (1,x,x^2) \
  arrow.b.double \
  T mat(1; 1) = 3 + 2x + 3x^2 \
  T mat(2; 0) = 2 + 6x \
  [T]^B_C = mat(
    3, 2;
    2, 6;
    3, 0;
  )
$

לפי הטענה:

$
  v = mat(a; b) \
  [T(v)]_C = mat(
    3, 2;
    2, 6;
    3, 0;
  ) [v]_B \
  v = mat(a; b) = d_1 mat(1; 1) + d_2 mat(2; 0) \
  d_1 = b, space d_2 = (a-b) / 2 \
  [T mat(a, b)]_C = mat(
    3, 2;
    2, 6;
    3, 0;
  ) mat(b; (a-b) / 2)
$

== טענה

תהי
$T: V -> W$
העתקה לינארית. יהיו
$B,C$
בסיסים ל-$V,W$
בהתאמה. אז:

$
  rank([T]^B_C) = dim Im T
$

=== הוכחה

נסמן
$V = Col([T]^B_C)$,
אז:

$
  V = Span{[T v_1]_C, ..., [T v_n]_C}
$

כאשר
$B = (v_1, ..., v_n)$.
מצד שני:

$
  Im T = Span{T v_1, ..., T v_n}
$

נגדיר:

$
  S : Im T -> F^m \
  S(w) = [w]_C
$

אז:

$
  Im S = Span{[T v_1]_C, ..., [T v_n]_C} = V
$

קיבלנו ש-$S$
היא איזומורפיזם בין
$Im T$
ל-$V$
(כי $S$ חח"ע).
לכן:

$
  dim Im T = dim V = rank([T]^B_C)
$
