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

= דטרמיננטה עם תמורות

== הגדרה

יהי
$n$
מס' טבעי. נסמן
$J_n = {1,...,n}$.
תמורה על
$J_n$
היא העתקה
$sigma: J_n -> J_n$
חח"ע ועל.

== סימון

רישום של תמורה:

$
  mat(
    1, 2, 3, 4, 5, 6, 7, 8;
    5, 2, 4, 8, 1, 7, 6, 3;
  ) \
  sigma(1) = 5, sigma(2) = 2, ...
$

== סימון

$(k ell)$
מסמן את התמורה שמחליפה בין
$k$
ל-$ell$
ומשאירה את שאר האיברים במקום.

== סימון

הרכבה של תמורות
$sigma, tau : J_n -> J_n$
היא תמורה גם כן:

$
  sigma tau
$

== סימון

נסמן את אוסף התמורות על
$J_n$
ב-$S_n$.

== הגדרה

תהי
$sigma in S_n$
המטריצה של התמורה
$sigma$:

$
  P(sigma) = mat(
    |, , |;
    e_sigma(1), ..., e_sigma(n);
    |, , |;
  )
$

ונגדיר את הסימן של
$sigma$
להיות:

$
  sign(sigma) = det(P(sigma))
$

== דוגמא

$
  sigma = (1 2) \
  P(sigma) = mat(
    0, 1, 0;
    1, 0, 0;
    0, 0, 1;
  )
$

== טענה

תהיינה
$sigma, tau in S_n$,
אז:

$
  P(sigma tau) = P(sigma) P(tau) \
  sign(sigma tau) = sign(sigma) sign(tau)
$

=== הוכחה

נסמן
$A = P(sigma)$.

$
  P(sigma) P(tau)
  &= A mat(
    |, , |;
    e_tau(1), ..., e_tau(n);
    |, , |;
  ) \
  &= mat(
    |, , |;
    A e_tau(1), ..., A e_tau(n);
    |, , |;
  ) \
  &= mat(
    |, , |;
    e_sigma(tau(1)), ..., e_sigma(tau(n));
    |, , |;
  ) = P(sigma tau) \
$

נפעיל דטרמיננטה על השוויון ונקבל:

$
  sign(sigma tau) = det(P(sigma tau)) = det(P(sigma) P(tau)) = det(P(sigma)) det(P(tau)) = sign(sigma) sign(tau)
$

== הערה

אם
$sigma = (k ell)$
אז
$sign(sigma) = -1$.

נאמר שתמורה
$sigma$
היא זוגית אם
$sign(sigma) = 1$
ואחרת נאמר ש-$sigma$
אי-זוגית.

== משפט

תהי
$A in M_(n)(FF)$.
אז:

$
  abs(A) = N(A) := sum_(sigma in S_n) [A]_(1 sigma(1)) dot ... dot [A]_(n sigma(n))
$

=== דוגמא

$
  A = mat(a, b; c, d) \
  sigma_1 = (1,2) \
  sigma_2 = mtext("זהות") \
  abs(A) = sign(sigma_1) dot [A]_(1 sigma_1(1)) dot [A]_(2 sigma_1(2)) + sign(sigma_2) dot [A]_(1 sigma_2(1)) dot [A]_(2 sigma_2(2)) = -b c + a d
$

=== הוכחה

תהיינה
$A,B,C$
מטריצות הנבדלות רק בשורה מספר
$k$
כאשר השורה ב-$C$
היא סכום השורות ב-$A$
ו-$A$.
נראה ש-$N(C) = N(A) + N(B)$.

$
  N(C)
  &= sum_(sigma in S_n) [C]_(1 sigma(1)) dot [C]_(k sigma(k)) dot ... dot [C]_(n sigma(n)) \
  &= sum_(sigma in S_n) [C]_(1 sigma(1)) dot ([A]_(k sigma(k)) + B_(k sigma(k))) dot ... dot [C]_(n sigma(n)) \
  &= sum_(sigma in S_n) [C]_(1 sigma(1)) dot [A]_(k sigma(k)) dot ... dot [C]_(n sigma(n)) + sum_(sigma in S_n) [C]_(1 sigma(1)) dot [B]_(k sigma(k)) dot ... dot [C]_(n sigma(n)) \
  &= sum_(sigma in S_n) [A]_(1 sigma(1)) dot [A]_(k sigma(k)) dot ... dot [A]_(n sigma(n)) + sum_(sigma in S_n) [B]_(1 sigma(1)) dot [B]_(k sigma(k)) dot ... dot [B]_(n sigma(n))
  = N(A) + N(B)
$

תרגיל לקורא - לבדוק את התכונה השנייה של מולטילינאריות.

נניח שב-$A$
יש שורות
$k,ell$.
שוות. נראה ש-$N(A) = 0$.
נסמן
$tau = (k ell)$
אז כל תמורה אי זוגית
$phi$
היא מהצורה
$phi = (phi tau) tau$.
$phi tau$
זוגית (כי
$tau$
אי זוגית ו$phi$
איז זוגית). הצורה היא יחידה כי אם
$sigma_1 tau = sigma_2 = tau$
אז
$sigma_1 = (sigma_1 tau) tau = (sigma_2 tau) tau = sigma_2$.

#text(fill: red)[\* משוואות שמראות שזה אומר ש-$N(A) = 0$ שלא הספקתי להעתיק \*]

כעט נוכיח כי
$N(I) = 1$:

$[I]_(1 sigma(1)) dot ... dot [I]_(n sigma(n)) != 0$
אם ורק אם
$sigma$
היא זהות
($sigma(k) = k$),
לכן:

$
  N(I) = [I]_(1 1) dot ... dot [I]_(n n) = 1
$

== תרגיל

תהי
$A in M_(n)(FF)$,
נגדיר:

$
  p(x) = det(A - x I_n)
$

הראו ש-$p_(n)(x)$
פולינום ממעלה
$n$
ומצאו את המקדם של
$x^n$.

$
  A - x I = mat(
    a_(1 1) - x, a_(1 2), ..., a_(1 n);
    a_(2 1), a_(2 2) - x, ..., a_(2 n);
    dots.v, dots.v, dots.down, dots.v;
    a_(n 1), a_(n 2), ..., a_(n n) - x
  )
$

=== הוכחה

נרשום
$abs(A - x I)$
לפי תמורות:

$
  abs(A - x I)
  &= sum_(sigma) sign(sigma) dot [A - x I]_(1 sigma(1)) dot ... + [A - x I]_(n sigma(n)) \
  &= (a_(1 1) - x) dot ... dot (a_(n n) - x) + sum_(sigma != mtext("זהות")) sign(sigma)[A - x I]_(1 sigma(1)) dot ... dot [A - x I]_(n sigma(n)) \
$

אם
$sigma != mtext("זהוצ")$
אז לפחות אחד מהאיברים
${[A - x I]_(k sigma(k))}_(k=1)^n$
לא תלוי ב-$x$
ולכן המכפלה שלהם היא מדרגה
$n-1>=$
המקדם של
$x^n$
הוא
$(-1)^n$.

= ערכים עצמיים ווקטורים עצמיים

== הגדרה

תהי
$A in M_(n)(FF)$.
יהי
$lambda in FF$.
נאמר ש-$lambda$
הוא ערך עצמי של
$A$
אם קיים
$0 != v in FF^n$
כך ש-$A dot v = lambda dot v$.
במקרה זה נאמר ש-$v$
הוא וקטור עצמי של
$A$
המתאים לערך עצמי
$lambda$.

באופן דומה, אם
$T: V -> V$
העתקה לינארית, נאמר ש0$lambda$
הוא ע"ע של
$T$
אם קיים
$0 != v in V$
כך ש-$T(v) = lambda v$.

== דוגמא

$
  T mat(x; y) = mat(x; -y) \
  v_1 = mat(0; 1), lambda_1 = -1 \
  v_2 = mat(1; 0), lambda_2 = 1 \
$

== טענה

תהי
$A$
מטריצה מסדר
$n times n$,
אז יש ל-$A$
לכל היותר
$n$
ערכים עצמיים.

=== הוכחה

$lambda$
היא ע"ע של
$A$
אם ורק אם למערכת
$(A - lambda I) dot v = 0$
יש פתרון לא טריוויאלי וזה קורה אם ורק אם
$A - lambda I$
לא הפיכה, כלומר
$p(lambda) = det(A - lambda I) = 0$.
ראינו ש-$p(lambda)$
פולינום ממעלה
$n$
ולכן יש לנו לכל היותר
$n$
שורשים.

== הערה

$p(lambda)$
נקרא הפולינום האופייני של המטריצה.

== הגדרה

יהי
$lambda$
הוא ע"ע של מטריצה
$A$
(הוא העתקה לינארית $T$),
נסמן ב-$V_lambda = {v | A v = lambda v}$
(או $V_lambda = {v | T(v) = lambda v}$).
$V_lambda$
החא המרחב העצמי המתאים ל-$lambda$.

== טענה

תהי
$T: V -> V$,
נניח שקיים
$B = (v_1, ..., v_n)$
בסיס סדור ל-$V$
כך ש-$v_1, ..., v_n$
הם ווקטורים עצמיים של
$T$,
אז:

$
  [T]^B_B = mat(
    lambda_1, ..., 0;
    dots.v, dots.down, dots.v;
    0, ..., lambda_n;
  )
$

כאשר
$lambda_1, ..., lambda_n$
ערכים עצמיים המתאימים ל-$v_1, ..., v_n$.

=== הוכחה

$
  [T]^B_B = mat(
    |, , |;
    [T(v_1)]_B, ..., [T(v_n)]_B;
    |, , |;
  ) = mat(
    |, , |;
    [lambda v_1]_B, ..., [lambda v_n]_B;
    |, , |;
  ) = mat(
    lambda_1, ..., 0;
    dots.v, dots.down, dots.v;
    0, ..., lambda_n;
  )
$

== טענה

תהי
$A$
מטריצה
$n times n$
עם וקטורים עצמיים
$(v_1, ..., v_n)$ - בסיס.

נגדיר:

$
  P = mat(
    |, , |;
    v_1, ..., v_n;
    |, , |;
  )
$

אז:

$
  A P = mat(
    |, , |;
    A v_1, ..., A v_n;
    |, , |;
  ) = mat(
    |, , |;
    lambda_1 v_1, ..., lambda_n v_n;
    |, , |;
  ) = P mat(
    lambda_1, ..., 0;
    dots.v, dots.down, dots.v;
    0, ..., lambda
  ) \
  arrow.b.double \
  P^(-1) A P = mat(
    lambda_1, ..., 0;
    dots.v, dots.down, dots.v;
    0, ..., lambda
  )
$
