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

= העתקות לינאריות

== טענה

תהי
$T: V -> W$
העתקה לינארית. אז:

+ $T(Span{v_1, ..., v_n}) = Span(T(v_1), ..., T(v_n))$
+ אם
  ${T(v_1), ..., T(v_n)}$
  בת"ל, אז גם
  ${v_1, ..., v_n}$
  בת"ל.

=== הוכחה

+ צד שמאל של השוויון - וקטורים מהצורה
  $T(d_1 v_1 + ... + d_n v_n)$.
  וצד ימין - וקטורים מהצורה
  $d_1 T(v_1) + ... + d_n T(v_n)$.
  אבל הם שווים לפי תכונות של העתקה לינארית.

+ נניח
  $d_1 v_1 + ... + d_n v_n = 0$,
  אז:

  $
    T(d_1 v_1 + ... + d_n v_n) = T(0) = 0 \
    arrow.b.double \
    d_1 T(v_1) + ... + d_n T(v_n) = 0
  $

  ${T(v_1), ..., T(v_n)}$
  בת"ל ולכן
  $d_1 = ... = d_n = 0$.

== טענה

בעתקה לינארית נקבעת ביחידות על פי התמונה של הבסיס:
אם
$B={v_1,...,v_n}$
בסיס ל-$V$
ו-${w_1,...,w_n} subset.eq W$
אז קיימת העתקה לינארית יחידה
$T: V -> W$
כך ש-$T(v_k) = w_k$
לכל
$1 <= k <= n$.

=== הוכחה

יהי
$v in V$.
נרשום:

$
  v = lambda_1 v_1 + ... + lambda v_n
$

ונגדיר:

$
  T(v) = lambda_1 w_1 + ... + lambda_n w_n
$

נראה ש-$T$
יחידה. תהי
$S: V -> W$
העתקה לינארית המקיימת
$S(v_k) = w_k$
לכל
$1 <= k <= n$.
אז לכל
$v in V$
מתקיים:

$
  S(v) = S(lambda_1 v_1 + ... + lambda_n v_n) = lambda_1 S(v_1) + ... + lambda_n S(v_n) = lambda_1 w_1 + ... + lambda_n w_n = T(v)
$

=== דוגמא

האם קיימת
$T: RR^3 -> RR^3$
לינארית כך ש-

$
  T mat(1; 1; 1) = mat(1; 1) tab
  T mat(1; 1; 0) = mat(1; 1) tab
  T mat(0; 0; 1) = mat(0; 1)
$

אז:

$
  T mat(1; 1; 1) = T(mat(1; 1; 0) + mat(0; 0; 1)) = T mat(1; 1; 0) + T mat(0; 0; 1) = mat(1; 1) + mat(0; 1) = mat(1; 2)
$

סתירה.

= גרעין ותת מרחב ווקטורי של העתקה לינארית

תהי
$T: V -> W$
העתקה לינארית. אז הגרעין של
$T$
הוא:

$
  Ker(T) = {v in V | T(v) = 0} subset.eq V
$

והתמונה של
$T$
היא:

$
  Im(T) = {T(v) | v in V} subset.eq W
$

== דוגמא

$
  R : RR^2 -> RR^2 \
  T mat(x; y) = mat(x; 0) \
  Ker T = { mat(0; y) | y in RR } \
  Im T = { mat(x; 0) | x in RR } \
$

_הערה:_ $0 in Ker(T)$ תמיד

== טענה

תהי
$T: V -> W$
העתקה לינארית, אז:

+ $Ker T$ -
  תת מרחב ווקטורי של
  $V$
+ $Im T$ -
  תת מרחב וקטורי של
  $W$

=== הוכחה

+ יהיו
  $v_1, v_2 in Ker(T)$,
  אז
  $T(lambda_1 v_1 + lambda_2 v_2) = lambda_1 T(v_1) + lambda_2 T(v_2) = 0$.
+ יהיו
  $W_1, W_2 in Im(T)$,
  קיימים
  $v_1, v_2 in V$
  כך ש-$T(v_1) = w_1, t(v_2) = w_2$.
  יהיו
  $lambda_1, lambda_2 in FF$
  אז
  $T(lambda_1 v_1 + lambda_2 v_2) = lambda_1 w_1 + lambda_2 w_2$
  ולכן
  $lambda_1 w_1 + lambda_2 w_2 in Im(T)$.

== דוגמאות

+ $
    T: RR_(n)[x] -> RR_(n-1)[x] \
    T(p(x)) = T(p'(x)) \
    Ker T = RR_0[x] \
    dim Ker T = 1 \
    Im T = RR_(n-1)[x] \
    dim Im T = n \
  $

+ תהי
  $A in M_N(m times n)(RR)$:

  $
    T_A : RR^n -> RR^m \
    T_A(v) = A v \
    Ker(T_A) = "Null"(A) \
    Ker(T_A) = Col(A)
  $

== הגדרה

+ העתקה לינארית נקראת חד-חד ערכית אם:

  $
    T(v_1) = T(v_2) => v_1 = v_2
  $

+ העתקה לינארית
  $T: V -> W$
  נקראת על
  $W$
  אם:

  $
    Im(T) = W
  $

+ העתקה לינארית
  $T: V -> W$
  נראת איזומופרפיזם אם היא חח"ע ועל.

אם קיים איזומורפיזם
$T: V -> W$
נאמר ש-$V$
ו-$W$
איזומופיים ונסמן:

$
  V tilde.equiv W
$

=== דוגמא

יהי
$V$
מרחב וקטורי עם בסיס
$B = (v_1, ..., v_n)$.
נגדיר:

$
  T: V -> FF^n \
  T(v) = [v]_B
$

כאשר:

$
  [v]_B = mat(lambda_1; dots.v; lambda_n)
$

כאשר:

$
  v = lambda_1 v_1 + ... + lambda_n v_n
$

לדוגמא:

$
  V = RR_2[x] tilde.equiv RR^3 \
  B = (1,x,x^2) \
  [a + b x + c x^2]_B = mat(a; b; c)
$

== טענה

העתקה לינארית
$T : V -> W$
היא חח"ע אם ורק אם
$Ker T = {0}$

=== הוכחה

$
  T(v) = T(w) \
  arrow.b.t.double \
  T(v) - T(w) = 0 \
  arrow.b.t.double \
  T(v - w) = 0 \
  arrow.b.t.double \
  v - w in Ker{0} \
$

אם
$Ker T = {0}$
אז בהכרח
$v - w = 0$
ולכן
$v = w$
(כלומר $T$ חח"ע)

$
  T(v) = T(w) => v = w
$

== דוגמא

תהי
$A in M_(m times n)(FF)$.

$
  T_A : RR^n -> RR^n \
  T_(A)(v) = A v
$

$T_A$
חח"ע אם"ם
$Ker T_A = {0}$
כלומר אם"ם
$op("Null") A = {0}$.
יכול להתקיים כך אם"ם
$m >= n$.

$
  Im(T_A) = Col(A) \
  rank(A) = dim Col(A)
$

אם
$T_A$
היא כל אז
$rank(A) = m$
כלומר
$m <= n$.

$T_A$
היא איזומורפיזם אם"ם
$m = n$
ו-$A$
הפיכה.

== הגדרה

יהי
$T: V -> W$
איזומורפיזם, אז לכל
$w in W$
קיים
$v in V$
יחיד כך ש-$T(u) = w$
ולכן ניתן להגדיר:

$
  T^(-1) : W -> V \
  T^(-1)(w) = v \
$

$T^(-1)$
נקראת ההעתקה ההפכית של
$T$.

== טענה

$T^(-1)$
היא העתקה לינארית.

=== הוכחה

יהי
$w_1, w_2 in W$
ונסמן:

$
  v_1 = T^(-1)(w_1) \
  v_2 = T^(-1)(w_2) \
$

אז:

$
  T(d_1 v_1 + d_2 v_2) = d_1 T(v_1) + d_2 T(v_2) = d_1 w_1 + d_2 w_2 \
  arrow.b.double \
  T^(-1)(d_1 w_1 + d_2 w_2) = d_1 v_1 + d_2 v_2 = d_1 T^(-1)(w_1) + d_2 T^(-1)(w_2)
$

== משפט

תהי
$T: V -> W$
העתקה לינארית, אז:

$
  dim Ker T + dim Im T = dim V
$

=== הוכחה

/ מקרה 1\::
  נניח
  ${0} subset.neq Ker T subset.neq V$,
  נסמן
  $dim Ker T = k$.
  יהי
  ${v_1, ..., v_k}$
  בסיס ל-$Ker T$
  ונשלים אותו לבסיס ל-$V$:

  $
    {v_1, ..., v_k, u_1, ..., u_(n-k)}
  $

  אז:

  $
    Im T = Span{T(v_1), ..., T(v_k), T(u_1), ..., T(u_(n-k))} = Span{T(u_1), ..., T(u_(n-k))}
  $

  נותר להראות ש-${T(u_1), ..., T(u_(n-k))}$
  בת"ל. נרשום:

  $
    lambda_1 T(u_1) + ... + lambda_(n-k) T(u_(n-k)) &= 0 \
    T\(underbrace(lambda_1 u_1 + ... + lambda_(n-k) u_(n-k), in Ker T)\) &= 0 \
  $

  קיימים
  $d_1, ..., d_k$
  כך ש-

  $
    lambda_1 u_1 + ... + lambda_(n-k) u_(n-k) = d_1 v_1 + ... + d_k v_k \
    arrow.b.double \
    d_1 v_1 + ... + d_k v_k - lambda_1 u_1 - ... - lambda_(n-k) u_(n-k) = 0
  $

  אבל
  ${v_1, ..., v_k, u_1, ..., u_(n-k)}$
  בסיס ולכן:

  $
    d_1 = ... = d_k = lambda_1 = ... = lambda_(n-k) = 0 \
    arrow.b.double \
    dim Im T = n - k = dim V - dim Ker T
  $

/ מקרה 2\::
  נניח
  $Ker T = V$,
  אז
  $T(u) = 0$
  לכל
  $v$.

  $
    dim Ker T = dim V \
    dim Im T = 0
  $

/ מקרה 3\::
  נניח
  $Ker T = {0}$.
  תרגיל לקורא.

== מסקנה

תהי
$T: V -> W$
העתקה לינארית, אם
$dim V = dim W$
אז התנאים הבאים שקולים:

+ $T$
  חח"ע.

+ $T$
  על.

+ $T$
  איזומורפיזם.

=== הוכחה

אם
$T$
חח"ע אז
$dim Ker T = 0$
ולכן
$dim Im T = dim V = dim W$
אבל
$Im T subset.eq W$
ולכן
$Im T = W$
$arrow.double.l$
$T$
על.

אם
$T$
על אז:

$
  dim Im T = dim W = dim V \
  arrow.b.double \
  dim Ker T = 0 \
  arrow.b.double \
  Ker T = {0}
$

ולכן
$T$
חח"ע.

== מסקנה

אם
$dim V = dim W$
אז:

$
  V tilde.equiv
$

=== הוכחה

יהי
${v_1, ..., v_n}$
בסיס ל-$V$
ו-${w_1, ..., w_n}$
בסיס ל-$W$.
נגדיר העתקה לינארית
$T: V -> W$
ע"י
$T(v_k) = w_k$
לכל
$1 <= k < n$.
נבדוק ש-$T$
חח"ע:

יהי
$v in Ker(T)$.
נרשום:

$
  v = lambda_1 v_1 + ... + lambda_n v_n
$

אם
$T(v) = lambda_1 T(v_1) + ... + lambda_n T(v_n) = 0$
אז
$lambda_1 w_1 + ... + lambda_n w_n = 0$.
${w_1, ..., w_n}$
בת"ל ולכן
$lambda_1 = ... = lambda_n = 0$
כלומר
$v = 0$.

$
  Ker T = {0}
$

ולכן
$T$
איזומורפיזם.

= פעולות בין העתקות לינאריות

== חיבור

תהיינה
$T,S : V -> W$
העתקות לינאריות. אז:

$
  T + S : V -> W \
  (T + S)(v) = T(v) + T(s)
$

העתקה לינארית מ-$V$
ל-$W$.

== כפל בסקלר

לכל
$lambda in FF$:

$
  lambda T : V -> W \
  (lambda T)(v) = lambda T(v)
$

העתקה לינארית.

== מרחב ההעתקות הלינאריות

אוסף כל ההעתקות הלינאריות מ-$V$
ל-$W$
הוא מרחב וקטורי המסומן ע"י:

$
  Hom(V, W)\
$

== הרכבה

תהיינה

$
  T : V -> W \
  S : U -> V
$

העתקות לינאריות. נגדיר:

$
  T compose S : U -> W \
  T compose S (u) = T(S(u))
$

=== טענה

$T compose S$
הרכבהב לינארית.

==== הוכחה

$
  T(S(lambda_1 u_1 + lambda_2 u_2))
  = T(lambda_1 S(u_1) + lambda_2 S(u_2))
  = lambda T(S(u_1)) + lambda_2 T(S(u_2))
  = lambda T compose S(u_1) + lambda_2 T compose S(u_2)
$

==== דוגמא

תהי
$A in M_(k times m)(RR), B in M_(m times n)(RR)$.

$
  T_A : RR^m -> RR^k \
  T_(A)(v) = A v \
  T_B : RR^k -> RR^n \
  T_(B)(v) = B v \
$

אז:

$
  T_A compose T_B : RR^n -> RR^m \
  T_A compose T_B (v) = T_A (B dot v) = A dot B dot v \
  arrow.b.double \
  T_A compose T_B = T_(A dot B)
$

==== דוגמא

תהי
$T: V -> W$
איזומורפיזם.
אז:

$
  Id_V = T compose T^(-1) \
  Id_W = T^(-1) compose T \
$
