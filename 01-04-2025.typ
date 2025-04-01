#import "@preview/rubber-article:0.3.1": maketitle, article

#show: article.with(lang: "he")

#show math.equation.where(block: true): set block(breakable: true)
#show math.equation.where(block: false): box
#set text(font: "David CLM")

#let ds = $. space$
#let mtext = text.with(font: "David CLM")
#let Span = math.op[Span]
#let amat = math.mat.with(augment: -1)

#maketitle(
  title: "אלגברה לינארית 1א",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 1, month: 4, year: 2025).display("[day].[month].[year]"),
)


= סכום ישר

== דוגמא

$
  V = RR^3 \
  W_1 = Span{(1,0,0), (0,1,0)} \
  W_2 = Span{(0,1,0), (0,0,1)} \
  W_1 + W_2 = Span{(1,0,0), (0,1,0), (0,0,1)} \
  (1,1,1) = underbrace((1,1,0), in W_1) + underbrace((0,0,1), in W_2) = underbrace((1,0,0), in W_1) + underbrace((0,1,1), in W_2) \
$

ניתן לייצג את
$(1,1,1)$
ביותר מדרך אחת כי
$W_1 inter W_2 != {0}$.

== הגדרה

יהיו
$W_1, W_2 subset.eq V$
תתי-מרחבים של
$V$.
נאמר ש-$V$
הוא סכום ישר של
$W_1, W_2$
אם:

+ $W_1 + W_2 = V$
+ $forall v in V ds exists! w_1 in W_1, w_2 in W_2 ds v = w_1 + w_2$

=== סימון

$
  V = W_1 plus.circle W_2
$

== דוגמא

$
  W_1 = Span{(1,0,0)} \
  W_2 = Span{(0,1,0), (0,0,1)} \
  RR^3 = W_1 + W_2
$

== טענה

$V = W_1 plus.circle W_2$
אמ"מ
$V = W_1 + W_2$
ו-$W_1 inter W_2 = {0}$.

=== הוכחה

נניח ש-$W_1 plus.circle W_2$.
אם קיים
$0 != w in W_1 inter W_2$,
אז
$w in W_1 inter W_2$
ולכן
$0 = overbrace(w, in W_1) + overbrace((-w), in W_2)$,
ואז קיבלנו הצגה לא יחידה ל-$0$.

כיוון שני: נניח ש-$V = W_1 + W_2$ ו-$W_1 inter W_2 = {0}$,
נרשום:

$
  v = u_1 + u_2 = w_1 + w_2
$

כאשר
$u_1, w_1 in W_1, u_2, w_2 in W_2$,
ואז:

$
  u_1 - w_1 = w_2 - u_2 \
  arrow.b.double \
  u_1 - w_1 = w_2 - u_2 = 0
$

= תלות לינארית

== הגדרה - בלתי תלות לינארית

יהי
$V$
מרחב ווקטורי ו-$emptyset != S subset.eq V$,
נאמר ש-$S$
בלתי תלויה לינארית (בת"ל) אם לכל
$n >= 1$
ולכל
$u_1, ..., u_n in S$
מתקיים:

$
  lambda_1 u_1 + ... + lambda_n u_n = 0
  =>
  lambda_1 = ... = lambda_n = 0
$

== דוגמא

+ $
    {1 - x, x^2 - x} subset.eq RR[x]
  $

  הוכחה:

  $
    lambda_1(1-x) + lambda_2(x^2 - x) = 0 \
    lambda_2 x^2 - (lambda_1 + lambda_2)x + lambda_1 = 0 \
    arrow.b.double \
    lambda_2 = 0, lambda_1 + lambda_2 = 0, lambda_1 = 0 \
    arrow.b.double \
    lambda_1 = lambda_2 = 0 \
  $

+ $
    {1, x, x^2, x^3, ...} in RR[x]
  $

  הוכחה:

  כל צירוף לינארי של קבוצה זו הוא מהצורה
  $a_0 + a_1 x + ... + a_n x^n$
  שזה שווה אפס אם"ם כל המקדמים הם אפס.

== הערה

$S subset.eq V$
היא תלויה לינארית אם קיימים
$u_1, ..., u_n in S$
כך ש-0 הוא צירוף לינארי לא טריוויאלי שלהם, כלומר קיימים
$lambda_1, ..., lambda_n$
לא כולם
$0$
כך ש-

$
  lambda_1 u_1 + ... + lambda_n u_n = 0
$

== טענה

יהי
$V$
מרחב וקטורי ותהי
${u_1,...,u_n} subset.eq V$
בת"ל אז
${u_1, ..., u_n, v}$
בת"ל אם"ם
$v in.not Span{u_1,...,u_n}$.

=== הוכחה

אם
$v in Span{u_1, ..., u_n}$
אז קיימים
$lambda_1, ..., lambda_n in FF$
כך ש-

$
  v = lambda_1 u_1 + ... + lambda_n u_n \
  0 = lambda_1 u_1 + ... + lambda_n u_n + (-1) dot v \
$

$arrow.l.double$
${u_1, ..., u_n, v}$
ת"ל.

כיוון שני: נניח ש-${u_1, ..., u_n, v}$
ת"ל. אז קיימים
$lambda_1, ..., lambda_n, mu$
לא כולם
$0$
כך ש-

$
  lambda_1 u_1 + ... + lambda_m u_n + mu v = 0
$

אם
$mu = 0$,
נקבל:

$
  lambda_1 u_1 + ... + lambda_m u_n = 0
$

שזו סתירה לכן:

$
  v = -lambda_1 / mu u_1 - ... - lambda_n / mu u_n in Span{u_1,...,u_n}
$

= הגדרה - בסיס

יהי
$V$
מרחב וקטורי. קבוצה
$B subset.eq V$
נקראת בסיס אם

+ $B$ - בת"ל
+ $V = Span(B)$

== משפט

יהי
$V$
מרחב ווקטורי ו-$B subset.eq V$.

+ $B$
  בסיס אמ"מ היא בת"ל וכל קבוצה המכילה ממש את
  $B$
  היא ת"ל.

+ $B$
  בסיס אם ורק אם
  $Span(B) = V$
  וכל קבוצה המוכלת ממש ב-$B$
  אינה פורשת את
  $V$.

=== הוכחה

+ נראה ש-$Span(B) = V$.
  נניח ש-$Span(B) != V$,
  אז קיים
  $u in V$
  כך ש-$u in.not Span(B)$.
  לפי הטענה הקודמת
  $B union {u}$
  היא בת"ל וזו סתירה. מכאן
  $Span(B) = V$.

  כיוון שני: נניח ש-$B$
  בסיס. ברור ש-$B$
  בת"ל. יהי
  $u in V$,
  $B$
  בסיס ולכן
  $u in Span(B)$,
  כלומר לפי הטענה הקודמת
  $B union {u}$
  קבוצה ת"ל.

+ תרגיל לקורא.

== משפט

לכל מרחב וקטורי
$V != {0}$
הנוצר סופית יש בסיס.

=== הוכחה

ידוע שקיימת קבוצה
$S = {u_1, ..., u_n}$
כך ש-$V = Span{u_1, ..., u_n}$.
אם
$S$
בת"ל סיימנו, אחרת קיים
$1 <= k <= n$
כך ש-$u_k in Span{u_1, ..., u_(k-1), u_(k+1), ..., u_n}$,
אז
$V = Span{u_1, ..., u_(k-1), u_(k+1), ..., u_n}$. אם הקבוצה שקיבלנו בת"ל - סיימנו. אחרת נחזור על התהליך.

== טענה
יהי
$V$
מרחב וקטורי נוצר סופית.
${u_1, ..., u_m} subset.eq V$
היא בסיס אם ורק אם לכל
$u in V$
קיימת הצגה יחידה מהצורה:

$
  u = u = lambda_1 u_1 + ... + lambda_n u_n
$

=== הוכחה

אם
${u_1,...,u_n}$
בסיס ו-
$u = lambda_1 u_1 + ... + lambda_m u_m = mu_1 u_1 + ... + mu_n u_n$,
אז:

$
  (lambda_1 - mu_1)u_1 + ... + (lambda_n - mu_n) u_n = 0 \
  arrow.b.double \
  lambda_1 - mu_1 = ... = lambda_n - mu_n = 0
$

$arrow.l.double$
סתירה.

כיוון שני: נניח שלכל וקטור יש הצגה יחידה
$u = lambda_1 u_1 + ... + lambda_n u_n$,
ברור ש-${u_1, ..., u_n}$
פורשת את
$V$.
ל-$0$
יש הצגה יחידה
$0 = lambda_1 u_1 + ... + lambda_n u_n$
לכן
$lambda_1 = ... = lambda_n = 0$
בהכרח,
כלומר
${u_1, ..., u_n}$
בת"ל.

== טענה

יהי
$V$
מרחב וקטורי ו-${u_1, ..., u_k}$
בסיס ל-$V$.
אז לכל
$m > k$
ולכן
$v_1, ..., v_m in V$
מתקיים
${v_1, ..., v_m}$
ת"ל.

=== הוכחה

לכל
$1 <= j <= m$
נרשום:

$
  v_j = sum_(i=1)^k d_(i j) u_i
$

נסתכל על:

$
  sum_(j=1)^n lambda_j u_j &= 0 \
  sum_(j=1)^n (lambda_j dot sum_(i=1)^k d_(i j) u_i) &= 0 \
  sum_(j=1)^n sum_(i=1)^k lambda_j dot d_(i j) u_i &= 0 \
  sum_(i=1)^k sum_(j=1)^n lambda_j dot d_(i j) u_i &= 0 \
  sum_(i=1)^k (u_i dot sum_(j=1)^n lambda_j dot d_(i j)) &= 0 \
$

${u_1, ..., u_m}$
בת"ל ולכן לכל
$1 <= i <= k$:

$
  sum_(j=1)^m d_(i j) lambda_j = 0
$

קיבלנו מערכת משוואות לינארית הומוגנית עם
$k$
משוואות ו-$m > k$
נעלמים. כלומר יש למערכת פתרון לא טריוויאלי
(לא כל $lambda_j$ הם $0$)
לכן
${v_1, ..., v_m}$ -
תלויה לינארית.

== מסקנות

יהי
$V$
מרחב וקטורי עם בסיס בעל
$n$
איברים, אז:

+ כל קבוצה עם יותר מ-$n$
  איברים היא ת"ל.
+ כל קבוצה עם פחות מ-$n$
  איברים היא פורשת את
  $V$.
+ כל קבוצה בת"ל עם
  $n$
  איברים היא בסיס.
+ כל קבוצה הפורשת את
  $V$
  עם
  $n$
  איברים היא בסיס.
+ כל בסיס מכיל בדיוק
  $n$
  איברים.

$n$
נקרא המימד של
$V$
ומסומן ע"י:

$
  dim V
$

עבור
$V = {0}$,
נסמן:

$
  dim V = 0
$

אם
$V$
אינו נוצר סופית נסמן:

$
  dim V = infinity
$

== דוגמאות

+ $
    V = RR^n
  $

  ${e_1, ..., e_n}$
  הוא הבסיס הסטנדרטי של
  $RR^n$
  כאשר:

  $
    e_1 = (1, 0, ..., 0) \
    dots.v \
    e_n = (0, ..., 0, 1) \
  $

  לכן
  $dim RR^n = n$.

+ $
    V = RR_(n)[x] \
    B = {1, x, x^2, ..., x^n} \
    dim V = n+1
  $

+ $
    V = RR[X] \
    B = {1, x, x^2, ...} \
    dim V = infinity
  $

+ $
    V = M_(n times m)(RR) \
    { E_(i j) }^(m,n)_(1,1) \
    dim M_(n times m)(RR) = m dot n \
  $

== משפט

יהי
$V$
מרחב וקטורי נוצר סופית. יהי
$U subset.eq V$
תת מרחב וקטורי. אז:

+ $U$
  נוצר סופית ו-$dim U <= dim V$.
+ $U = V$
  אם ורק אם
  $dim U = dim V$.

== משפט

יהי
$V$
מרחב וקטורי
$n$
מימדי. תהי
${u_1,...,u_k} in V$
בת"ל. אז ניתן להשלים את
${u_1, ..., u_k}$
לבסיס של
$V$.

=== הוכחה

אם
${u_1, ..., u_k}$
אינו בסיס אז קיים
$u_(k+1) in V$
כך ש-$u_(k+1) in.not Span{u_1, ..., u_k}$
ולכן
$Span{u_1, ..., u_k}$.
נמשיך את התהליך עד שנקבל קבוצה בת"ל
${u_1, ..., u_n}$.
