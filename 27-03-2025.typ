#import "@preview/rubber-article:0.3.1": maketitle, article

#show: article.with(lang: "he")

#show math.equation.where(block: true): set block(breakable: true)
#set text(font: "David CLM")

#let ds = $. space$
#let mtext = text.with(font: "David CLM")
#let Span = math.op[Span]

#maketitle(
  title: "אלגברה לינארית 1א",
  authors: ("דניאל פ.ח.",),
  date: datetime.today().display("[day].[month].[year]"),
)

= מרחבים ווקטוריים

== דוגמא

$
  M_(m times n)(FF) = { mat(
      a_(1 1), ..., a_(1 n);
      dots.v, dots.down, dots.v;
      a_(m 1), ..., a_(m n);
    )
    |
    a_(1 1), ..., a_(1 n), ..., a_(m 1), ..., a_(m n) in FF }
$

פעולות:

$
  (A + B)_(i j) := (A)_(i j) + (B)_(i j) \
  (lambda dot A)_(i j) := lambda dot (A)_(i j) \
$

== טענה

יהי
$V$
מרחב וקטורי מעל שדה
$FF$,
אז:

+ איבר האפס ב-$V$ הוא יחיד.
+ נגדי של איבר הוא יחיד.
+ $
    forall u,v,w in V ds u + w = v + w => u = v
  $
+ $
    forall u in V ds 0 dot u = 0
  $
+ $
    forall lambda in FF, u in V ds lambda dot u = 0 -> lambda = 0 or u = 0
  $
+ $
    forall lambda in FF ds lambda dot 0 = 0
  $
+ $
    forall lambda in FF, u in V ds (-lambda) dot u = lambda dot (-u) = -(lambda dot u)
  $

=== הוכחה

+ יהיו
  $0,0'$
  איברי אפס. אז
  $0' = 0 + 0' = 0$.

+ יהי
  $u in V$
  ויהיו
  $u', u'' in V$
  נגדיים ל-$u$.
  אז
  $u' = u' + 0 = u' + (u + u'') = (u' + u) + u'' = 0 + u'' = u''$.

+ $
    u + v &= w + v \
    u + v + (-v) &= w + v + (-v) \
    u &= w \
  $

+ $
    0 dot u
    = (0 + 0) dot u
    = 0 dot u + 0 dot u \
    arrow.b.double \
  $
  $
    0 dot u = 0 dot u + 0 dot u \
    0 + 0 dot u = 0 dot u + 0 dot u \
    0 = 0 dot u \
  $

השאר יישאר כתרגיל לקורא.

= תת מרחב ווקטורי

יהי
$V$
מרחב ווקטורי מעל שדה
$FF$.
תת קבוצה
$U subset.eq V$
נקראת תת-מרחב ווקטורי של
$V$,
אם
$U$
מרחב ווקטורי ביחס לפעולות ב-$V$.

== דוגמא

$
  V = RR^2 \
  U = { (a,2a) | a in RR } \
  (a,2a) + (b,2b) = (a+b, 2(a+b)) \
  lambda dot (a,2a) = (lambda dot a, 2 dot (lambda dot a))
$

== טענה

יהי
$V$
מרחב ווקטורי. אז
$U subset.eq V$
הוא תת-מרחב ווקטורי אם:

+ $0 in U$
+ $U$
  סגורה לחיבור:
  $
    forall u_1, u_2 in U ds u_1 + u_2 in U
  $
+ $U$
  סגורה לכפל בסקלר:
  $
    forall lambda in FF, u in U ds lambda dot u in U
  $

_הערה:_
את תכונות 2 ו-3 ניתן להחליף בתכונה זאת: לכל
$u,v in U$
ולכל
$lambda, mu in FF$
מתקיים
$lambda u + mu u in U$.

=== הוכחה

/ קיום איבר נגדי\::
  יהי
  $u in U$,
  קיים
  $-u in V$,
  ואז
  $-u = (-1) dot u in U$.

השאר טריוויאלי.

== דוגמאות

+ $
    V = RR^2 \
    U = { (1,0) + t dot (1,1) | t in RR }
  $
  $U$
  לא תת-מרחב ווקטורי
  של
  $V$:
  $(0,0) in.not U$.

+ $
    V = { (a_n) | mtext("סדרה") (a_n) } \
    U = { (a_n) | mtext("סדרה חסומה") (a_n) }
  $

  \*סדרה חסומה זו סדרה
  $(a_n)$
  המקיימת
  $exists k ds forall n >= k ds a_n = 0$

+ תהי
  $A in M_(m times n)(FF)$,
  נגדיר:

  $
    U = { x in FF^n
      |
      (A|0)
      mtext("פתרון של")
      x }
  $

  אז
  $U$
  תת-מרחב וקטורי של
  $FF^n$.

== טענה

יהי
$V$
מרחב-וקטורי
ו-$W_1,W_2 subset.eq V$
תתי מרחבים ווקטוריים. אז
$W_1 inter W_2$
גם תת מרחב ווקטורי.

=== הוכחה

+ $0 in W_1$
  ו-$0 in W_2$
  לכן
  $0 in W_1 inter W_2$.
+ יהיו
  $u,v in W_1 inter W_2$
  ו-$lambda, mu in FF$,
  אז:

  $
    u+v in W_1 => lambda dot u + mu dot v in W_1 \
    u+v in W_2 => lambda dot u + mu dot v in W_2 \
    arrow.b.double \
    lambda dot u + mu dot v in W_1 inter W_2
  $

_הערה:_ איחוד של תתי מרחבים הוא לא בהכרח תת מרחב.

=== תרגיל

הוכיחו כי
$W_1 union W_2$
תת מרחב ווקטורי אמ"מ
$W_1 subset.eq W_2 or W_2 subset.eq W_1$.

= הגדה - חיבור תתי מרחבים ווקטוריים

בהנתן שני תתי מרחבים ווקטוריים
$A,B subset.eq V$,
נגדיר:

$
  A + B := { a + b | a in A, b in B }
$

= צירופים לינאריים

יהי
$V$
מרחב וקטורי ויהיו
$u_1, ..., u_n in V$,
אז
$lambda_1 dot u_1 + ... + lambda_n dot u_n$
נקרא צירוף לינארי של
$u_1, ..., u_n$
עם מקדמים
$lambda_1, ..., lambda_n in FF$.

= הגדה - פרישה

יהי
$V$
מרחב וקטורי. תהי
$emptyset != H subset.eq V$.
אז הקבוצה הנפרשת ע"י
$H$
היא אוסף כל הצירופים הלינאריים
(הסופיים)
של איברי
$H$.

פורמלית:

$
  Span(H) := { lambda_1 u_1 + ... + lambda_n u_n | u_1, ..., u_n in H, lambda_1, ..., lambda_n in FF }
$

== טענה

+ $Span(H)$
  תת מרחב וקטורי.
+ $Span(H)$
  התת מרחב המינימלי שמכיל את
  $H$.
  כלומר כל תת מרחב
  $W subset.eq V$
  המכיל את
  $H$
  מקיים
  $Span(H) subset.eq W$.

=== הוכחה

+ יהיו
  $u,w in Span(H)$,
  קיימים
  $u_1, ..., u_n in H$
  ו-$lambda_1, ..., lambda_n in F$
  כך ש-$u = lambda_1 u_1 + ... + lambda_n u_n$
  ובאופן דומה
  $w = mu_1 w_1 + ... + mu_n w_n$.
  אז לכל
  $cal(L), beta in FF$:

  $
    cal(L) dot u + beta dot w
    = cal(L) lambda_1 u_1 + ... cal(L) lambda_n u_n + beta mu_1 w_1 + ... + beta mu_n w_n
  $

  בנוסף אם
  $H != emptyset$
  אז קיים
  $u in H$
  לכן
  $0 = 0 dot u in H$.

+ יהי
  $W subset.eq V$
  תת מרחב כך ש-$H subset.eq W$.
  יהי
  $u in Span(H)$,
  אז קיימים
  $u_1, ..., u_n in V, lambda_1, ..., lambda_n in FF$
  כך ש-$u = lambda_1 u_1 + ... + lambda_n u_n$.
  $W$
  הוא מרחב ווקטורי לכן
  $u = lambda_1 u_1 + ... + lambda_n u_n in W$.

== טענה

יהי
$V$
מרחב וקטורי:
תהינה
$emptyset != K,T subset.eq V$
קבוצות, אז
$Span(K) = Span(T)$
אמ"מ:

+ $K subset.eq Span(T)$
+ $T subset.eq Span(K)$

=== הוכחה

/ $arrow.l.double$\:: נניח 1. אז:
  $
    K subset.eq Span(K) = Span(T) \
    T subset.eq Span(T) = Span(K) \
  $
/ $arrow.r.double$\:: נניח
  $K subset.eq Span(T), T subset.eq Span(K)$
  ולכן ממינימליות
  $Span(T) subset.eq Span(K), Span(K) subset.eq Span(T)$
  לכן
  $Span(T) = Span(K)$.

= הגדרה - נוצר סופית

יהי
$V$
מרחב וקטורי, נאמר ש-$V$
נאצר סופית אם קיימת קבוצה סופית
${u_1, ..., u_n} subset.eq V$
כך ש-$V = Span{u_1, ..., u_n}$.

== דוגמא

$
  V = RR^n \
  arrow.b.double \
  V = Span{e_1, ..., e_n} \
  e_1 := (1, 0, ..., 0) \
  e_2 := (0, 1, 0, ..., 0) \
  dots.v \
  e_n := (0, ..., 0, 1)
$
