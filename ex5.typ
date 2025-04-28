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
  title: "אלגברה לינארית 1א - תרגיל בית 5",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 26, month: 4, year: 2025).display("[day].[month].[year]"),
)

= שאלה 1

== סעיף א

$
  amat(
    0, 1, 2, 7;
    2, 0, 1, 3;
    0, 0, 3, 6;
    0, 0, 7, 14;
  )
  -->^(R_4 => R_4 / 7 \ R_3 => R_3 / 3)
  amat(
    0, 1, 2, 7;
    2, 0, 1, 3;
    0, 0, 1, 2;
    0, 0, 1, 2;
  )
  -->^(R_1 => R_1 - 2R_3 \ R_2 => R_2 - R_3 \ R_4 => R_4 - R_3)
  amat(
    0, 1, 0, 3;
    2, 0, 0, 1;
    0, 0, 1, 2;
    0, 0, 0, 0;
  )
  -->^(R_2 => R_2 / 2)
  amat(
    0, 1, 0, 3;
    1, 0, 0, 1/2;
    0, 0, 1, 2;
    0, 0, 0, 0;
  )
  -->^(R_1 <=> R_2)
  amat(
    1, 0, 0, 1/2;
    0, 1, 0, 3;
    0, 0, 1, 2;
    0, 0, 0, 0;
  ) \
  arrow.b.double \
  mat(7; 3; 6; 14) = 1 / 2mat(0;2;0;0) + 3mat(1;0;0;0) + 2mat(2;1;3;7) in Span(S)
$

== סעיף ב

$
  amat(
    1, 0, 2;
    0, 1, 3;
    3, -2, 0;
    0, 1, 3;
  )
  -->^(R_3 => R_3 + 2R_2 \ R_4 => R_4 - R_2)
  amat(
    1, 0, 2;
    0, 1, 3;
    3, 0, 6;
    0, 0, 0;
  )
  -->^(R_3 => R_3 / 3)
  amat(
    1, 0, 2;
    0, 1, 3;
    1, 0, 2;
    0, 0, 0;
  )
  -->^(R_3 => R_3 - R_2)
  amat(
    1, 0, 2;
    0, 1, 3;
    0, 0, 0;
    0, 0, 0;
  ) \
  arrow.b.double \
  mat(2;3;0;3) = 2mat(1;0;3;0) + 3mat(0;1;-2;1)
$

== סעיף ג

$
  sin(x + a) = underbrace(cos a, mtext("קבוע")) dot sin x + underbrace(sin a, mtext("קבוע")) dot cos x in Span{sin x, cos x}
$

= שאלה 2

== סעיף א

יהי
$mat(x;y;z) in RR^3$

$
  amat(
    1, 2, 4, 5, x;
    2, 3, 5, 6, y;
    3, 4, 6, 7, z;
  )
  -->^(R_2 => R_2 - 2R_1 \ R_3 => R_3 - 3R_1)
  amat(
    1, 2, 4, 5, x;
    0, -1, -3, -4, y-2x;
    0, -2, -6, -8, z-3x;
  ) \
  -->^(R_2 => -R_2)
  amat(
    1, 2, 4, 5, x;
    0, 1, 3, 4, 2x-y;
    0, -2, -6, -8, z-3x;
  )
  -->^(R_1 => R_1 - 2R_2 \ R_3 => R_3 + 2R_2)
  amat(
    1, 0, -2, -3, 2y-3x;
    0, 1, 3, 4, 2x-y;
    0, 0, 0, 0, z-3x;
  ) \
  arrow.b.double \
$
$
  z - 3x &= 0 \
  z &= 3x \
$
$
  arrow.b.double \
  Span(S) subset.eq { mat(3z;y;z) | y,z in RR } subset.neq RR^3
$

לכן
$S$
לא פורשת את
$RR^3$.

== סעיף ב

יהי
$mat(x;y;z) in RR^3$.

$
  amat(
    1, 2, 2, x;
    2, 3, 2, y;
    3, 4, 3, z;
  )
  -->^(R_2 => R_2 - 2R_1 \ R_3 => R_3 - 3R_1)
  amat(
    1, 2, 2, x;
    0, -1, -2, y-2x;
    0, -2, -3, z-3x;
  )
  -->^(R_2 => -R_2)
  amat(
    1, 2, 2, x;
    0, 1, 2, 2x-y;
    0, -2, -3, z-3x;
  ) \
  -->^(R_1 => R_1 - 2R_2 \ R_3 + 2R_2)
  amat(
    1, 0, -2, 2y-3x;
    0, 1, 2, 2x-y;
    0, 0, 1, z+x-y;
  )
  -->^(R_1 => R_1 + 2R_3 \ R_2 => R_2 - 2R_3)
  amat(
    1, 0, 0, 2z-x;
    0, 1, 0, y-2z;
    0, 0, 1, z+x-y;
  ) \
  arrow.b.double \
  mat(x; y; z) = (2z-x)mat(1;2;3) + (y-2z)mat(2;3;4) + (z+x-y)mat(2;2;3) in Span(S)
$

סה"כ
$Span(S) subset.eq RR^3 subset.eq Span(S)$
$arrow.l.double$
$Span(S) = RR^3$.

= שאלה 3

יהיו
$n_1 / m_1, ..., n_k / m_k in QQ$
כך ש-

$
  n_1 / m_1 ln(p_1) + ... + n_k / m_k ln(p_k) &= 0 \
  ln(p_1^(n_1/m_1)) + ... + ln(p_k^(n_k/m_k)) &= 0 \
  ln(p_1^(n_1/m_1) dot ... dot   p_k^(n_k/m_k)) &= 0 \
  p_1^(n_1 / m_1) dot ... dot p_k^(n_k / m_k) &= 1 \
  p_1^(n_1 dot m_2 dot ... dot m_k) dot ... dot p_k^(n_k dot m_1 dot ... dot m_(k-1)) &= 1^(m_1 dot ... dot m_k) \
  p_1^(n_1 dot m_2 dot ... dot m_k) dot ... dot p_k^(n_k dot m_1 dot ... dot m_(k-1)) &= 1 \
$

מהמשפט היסודי של האריטמטיקה קיים ייצוג יחיד לכל מספר כמכפלה של ראשוניים מועלים בחזקה. ניתן לייצג את אחד בתור
$p_1^0 dot ... dot p_k^0$
ולכן:

$
  n_1 dot m_2 dot ... dot m_k = ... n_k dot m_1 dot ... dot m_(k-1) = 0 \
  arrow.b.double \
  cases(
    n_1 dot m_2 dot ... dot m_k &= 0,
    dots.v,
    n_k dot m_1 dot ... dot m_(k-1) &= 0,
  )
$

$m_1, ..., m_n$
בהכרח גדולים מאפס כי הם מכנים, לכן נאכל לחלק בהם:

$
  cases(
      n_1 &= 0,
      dots.v,
      n_k &= 0,
    )
$

לכן
$n_1 = ... = n_k$,
ולכן
$p_1, ..., p_k$
בת"ל.

= שאלה 4

נניח בשלילה כי קיימת קבוצה כזו
$S = {f_1, ..., f_k}$.

$|RR| = |RR^k|$
לכן קיים זיווג
$A: RR -> RR^k$.
בנוסף נסמן לכל
$v in RR^k$
את האיבר ה-$i$
של
$v$
בתור
$v_i$.
נגדיר פונקצייה:

$
  F : RR -> RR \
  F(x) = 1 + sum_(i=1)^k A(x)_i dot f_(i)(x)
$

$F in V$
לכן קיימים
$a_1, ..., a_n in RR$
כך ש-$F(x) = sum_(i=1)^k a_i dot f_(i)(x)$.
$A$
זיווג ובפרט על לכן קיים
$y in RR$
כך ש-$A(x) = (a_1, ..., a_n)$,
אז:

$
  F(x) &= 1 + sum_(i = 1)^k A(x)_i dot f_(i)(x) \
  sum_(i=1)^k a_i dot f_(i)(x) &= 1 + sum_(i = 1)^k (a_1, ..., a_k)_i dot f_(i)(x) \
  sum_(i=1)^k a_i dot f_(i)(x) &= 1 + sum_(i = 1)^k (a_1, ..., a_k)_i dot f_(i)(x) \
  cancel(sum_(i=1)^k a_i dot f_(i)(x)) &= 1 + cancel(sum_(i=1)^k a_i dot f_(i)(x)) \
  0 &= 1 \
$
$
  arrow.b.double \
  mtext("סתירה!")
$

לכן בהכרח
$Span{f_1, ..., f_k} != V$
ובבפרט
$Span{f_1, ..., f_k} subset.neq V$.

= שאלה 5

== סעיף א

$
  mat(
    1, 1, 1;
    2, 0, 1;
    1, 1, 3;
    1, 0, 7;
  )
  -->^(R_2 => R_2 - 2R_1 \ R_3 => R_3 - R_1 \ R_4 => R_4 - R_1)
  mat(
    1, 1, 1;
    0, -2, -1;
    0, 0, 2;
    0, -1, 6;
  )
  -->^(R_2 <=> R_4)
  mat(
    1, 1, 1;
    0, -1, 6;
    0, 0, 2;
    0, -2, -1;
  )
  -->^(R_2 => -R_2)
  mat(
    1, 1, 1;
    0, 1, -6;
    0, 0, 2;
    0, -2, -1;
  ) \
  -->^(R_1 => R_1 - R_2 \ R_4 + 2R_1)
  mat(
    1, 0, 7;
    0, 1, -6;
    0, 0, 2;
    0, 0, -13;
  )
  -->^(R_3 => R_3 / 2)
  mat(
    1, 0, 7;
    0, 1, -6;
    0, 0, 1;
    0, 0, -13;
  )
  -->^(R_1 => R_1 - 7R_3 \ R_2 => R_2 + 6R_3 \ R_4 => R_4 + 13R_4)
  mat(
    1, 0, 0;
    0, 1, 0;
    0, 0, 1;
    0, 0, 0;
  )
$

יש פתרון יחיד לכן הקבוצה בת"ל.

== סעיף ב

$
  mat(
    -2, -1, 2;
    1, 0, 1;
    1, 4, 0;
  )
  -->
  mat(
    3, 4, 2;
    1, 0, 1;
    1, 4, 0;
  )
  -->^(R_1 <=> R_2)
  mat(
    1, 0, 1;
    3, 4, 2;
    1, 4, 0;
  )
  -->^(R_2 => R_2 - 3R_1 \ R_3 => R_3 - R_1)
  mat(
    1, 0, 1;
    0, 4, 4;
    0, 4, 0;
  )
  -->^(R_2 <=> R_3)
  mat(
    1, 0, 1;
    0, 4, 0;
    0, 4, 4;
  ) \
  -->^(R_2 => R_2 / 4)
  mat(
    1, 0, 1;
    0, 1, 0;
    0, 4, 4;
  )
  -->^(R_3 => R_3 - 4R_1)
  mat(
    1, 0, 1;
    0, 1, 0;
    0, 0, 4;
  )
  -->^(R_3 => R_3 / 4)
  mat(
    1, 0, 1;
    0, 1, 0;
    0, 0, 1;
  )
  -->^(R_1 => R_1 - R_3)
  mat(
    1, 0, 0;
    0, 1, 0;
    0, 0, 1;
  )
$

יש פתרון יחיד לכן הקבוצה בת"ל.

== סעיף ג

$
  mat(
    -2, -1, 2;
    1, 0, 1;
    1, 4, 0;
  )
  -->
  mat(
    1, 2, 2;
    1, 0, 1;
    1, 1, 0;
  )
  -->^(R_2 => R_2 - R_1 \ R_3 => R_3 - R_1)
  mat(
    1, 2, 2;
    0, 1, 2;
    0, 1, 1;
  )
  -->^(R_1 => R_1 - 2R_2 \ R_3 => R_3 - R_1)
  mat(
    1, 0, 1;
    0, 1, 2;
    0, 0, 2;
  )
  -->^(R_3 => R_3 / 2)
  mat(
    1, 0, 1;
    0, 1, 2;
    0, 0, 1;
  )
  -->^(R_1 => R_1 - R_3 \ R_2 => R_2 - R_3)
  mat(
    1, 0, 0;
    0, 1, 0;
    0, 0, 1;
  )
$

= שאלה 6

// == הוכחת עזר

// נוכיח כי אם הקבוצה
// ${u_1, ..., u_n}$
// בת"ל, אז הקבוצה
// ${u_1, ..., u_i + u_j, ..., u_n}$
// בת"ל.

// נניח בשלילה כי
// ${u_1, ..., u_i + u_j, ..., u_n}$
// ת"ל, אז קיימים
// $lambda_1, ..., lambda_n$
// כך ש-

// $
//   lambda_1 u_1 + ... + lambda_i (u_i + u_j) + ... + lambda_j u_j + ... + lambda_n u_n &= 0 \
//   lambda_1 u_1 + ... + lambda_i u_i + lambda_i u_j + ... + lambda_j u_j + ... + lambda_n u_n &= 0 \
//   lambda_1 u_1 + ... + lambda_i u_i + ... + (lambda_i + lambda_j) u_j + ... + lambda_n u_n &= 0 \
// $

// ולכן
// ${u_1, ..., u_n}$
// ת"ל
// $arrow.l.double$
// סתירה! לכן
// ${u_1, ..., u_i + u_j, ..., u_n}$
// בת"ל.

== סעיף א

${u+v+w, 3u-w, u-v} subset.eq Span{u,v,w}$
לכן כיוון ש-${u,v,w}$
בסיס של
$Span{u,v,w}$
(הוא בת"ל ופורש את המרחב)
נאכל לפצל את המשוואה
$lambda_1(u+v+w) + lambda_2(3u-w) + lambda_3(u-v) = 0$
לשלוש משוואות:

$
  cases(
    lambda_1 &+ 3lambda_2 &+ lambda_3 &= 0,
    lambda_1 & &- lambda_3 &= 0,
    lambda_1 &- lambda_2 & &= 0,
  ) \
  mat(
    1, 3, 1;
    1, 0, -1;
    1, -1, 0;
  )
  -->^(R_2 => R_2 - R_1 \ R_3 => R_3 - R_1)
  mat(
    1, 3, 1;
    0, -3, -2;
    0, -4, -1;
  )
  -->^(R_2 => -R_2 / 3)
  mat(
    1, 3, 1;
    0, 1, 2/3;
    0, -4, -1;
  ) \
  -->^(R_1 => R_1 - 3R_2 \ R_3 => R_3 + 4R_1)
  mat(
    1, 0, -1;
    0, 1, 2/3;
    0, 0, 5/3;
  )
  -->^(R_3 => 3 / 5 R_3)
  mat(
    1, 0, -1;
    0, 1, 2/3;
    0, 0, 1;
  )
  -->^(R_1 => R_1 + R_3 \ R_2 => R_2 - 2 / 3 R_3)
  mat(
    1, 0, 0;
    0, 1, 0;
    0, 0, 1;
  )
$

יש פתרון יחיד לכן זוהי סדרה בת"ל.

== סעיף ב

בצורה דומה לסעיף הקודם:

$
  mat(
    1, 1, 0;
    0, 1, 1;
    1, 0, 1;
  )
  -->^(R_3 => R_3 - R_1)
  mat(
    1, 1, 0;
    0, 1, 1;
    0, -1, 1;
  )
  -->^(R_1 => R_1 - R_2 \ R_3 => R_3 + R_2)
  mat(
    1, 0, -1;
    0, 1, 1;
    0, 0, 2;
  )
  -->^(R_3 => R_3 / 2)
  mat(
    1, 0, -1;
    0, 1, 1;
    0, 0, 1;
  )
  -->^(R_1 => R_1 + R_3 \ R_2 => R_2 - R_3)
  mat(
    1, 0, 0;
    0, 1, 0;
    0, 0, 1;
  )
$

יש פתרון יחיד לכן הקבוצה בת"ל.

== סעיף ג

בצורה דומה לשני הסעיפים הקודמים:

$
  mat(
    2, 1, 2;
    0, 1, -2;
    2, 3, -2;
  )
  -->^(R_1 => R_3 - R_1)
  mat(
    2, 1, 2;
    0, 1, -2;
    0, 2, -4;
  )
  -->^(R_1 => R_1 - R_2 \ R_3 => R_3 - 2R_1)
  mat(
    2, 0, 4;
    0, 1, -2;
    0, 0, 0;
  )
  -->^(R_1 => R_1 / 2)
  mat(
    1, 0, 2;
    0, 1, -2;
    0, 0, 0;
  ) \
  { (-2x, 2x, x) | x in RR }
$

יש אינסוף פתרונות לכן הקבוצה ת"ל.

= שאלה 7

== סעיף א

$
  lambda_1 cos x + lambda_2 sin x + lambda_3 e^x = x \
  arrow.b.double
$
$
  lambda_1 cos 0 + lambda_2 sin 0 + lambda_3 e^0 &= 0 \
  lambda_1 + lambda_3 &= 0 \
  lambda_1 &= -lambda_3 \
$
$
  lambda_1 cos pi / 2 + lambda_2 sin pi / 2 + lambda_3 e^(pi / 2) &= pi / 2 \
  lambda_2 + lambda_3 e^(pi / 2) &= pi / 2 \
  lambda_2 &= pi / 2 - lambda_3 e^(pi / 2) \
$
$
  arrow.b.double \
  -lambda_3 cos x + (pi / 2 - lambda_3 e^(pi / 2)) sin x + lambda_3 e^x = x \
  arrow.b.double \
$
$
  -lambda_3 cos pi + (pi / 2 - lambda_3 e^(pi / 2)) sin pi + lambda_3 e^pi &= pi \
  -lambda_3 dot (-1) + (pi / 2 - lambda_3 e^(pi / 2)) dot 0 + lambda_3 e^pi &= pi \
  lambda_3 + lambda_3 e^pi &= pi \
  lambda_3 &= pi / (1 + e^pi) \
$
$
  arrow.b.double \
  -pi / (1 + e^pi) cos x + (pi / 2 - (pi e^(pi / 2)) / (1 + e^pi)) sin x + pi / (1 + e^pi) e^x = x
$

אבל
$-pi / (1 + e^pi) cos x + (pi / 2 - (pi e^(pi / 2)) / (1 + e^pi)) sin x + pi / (1 + e^pi) e^x != x$
$arrow.l.double$
סתירה! לכן הקבוצה בת"ל.

== סעיף ב

$
  cos^2(x) + 1 + sin^2(x) - 2(1 + x + x^2) + 2(x + x^2)
  &= cos^2(x) + 1 + sin^2(x) - 2 - cancel(2x) - cancel(2x^2) + cancel(2x) + cancel(2x^2) \
  &= cos^2(x) + sin^2(x) - 1 \
  &= cancel(1) - cancel(1) \
  &= 0 \
$

לכן הקבוצה ת"ל.

== סעיף ג

$
  e^x &= lambda_1 e^(2x) + lambda_2 e^(3x) \
  1 &= lambda_1 e^x + lambda_2 e^(2x) \
$

$e^(2x)$
עולה בקצב מהיר פולינומיאלית יותר מ-$e^x$
לכן לא קיימים
$a,b in RR$
כך ש-$a e^x + b e^(2x)$
פונקציה קבוע, לכן למשוואה אין פתרון ולכן הסדרה בת"ל.


== סעיף ד

נסמן:

$
  a_i = cases(
    (-1)^(i+1)\, &tab i <= 2 floor(k/4),
    (-1)^i\, &tab 2 floor(k/4) < i <= floor(k/4),
    0\, &tab "else",
  )
$

$
  sum_(i=1)^k a_i (x^2 + x - i)
  &= sum_(i=1)^(2floor(k/4)) (-1)^(i+1) (x^2 + x - i) + sum_(i=2floor(k/4)+1)^(4floor(k/4)) (-1)^i (x^2 + x - i) \
  &= sum_(i=1)^(floor(k/4)) (x^2 + x - i) - (x^2 + x - (i+1)) + sum_(i=2floor(k/4)+1)^(3floor(k/4)) -(x^2 + x - i) + (x^2 + x - (i+1)) \
  &= sum_(i=1)^(floor(k/4)) 1 + sum_(i=2floor(k/4)+1)^(3floor(k/4)) -1 \
  &= cancel(floor(k/4)) - cancel(floor(k/4)) \
  &= 0
$

לכן הסדרה ת"ל עבור
$k >= 4$,
אחרת
$floor(k/4)=0$.
נסתכל על המקרים האחרים:

כאשר
$k=1$,
הסדרה בעלת איבר אחד ולכן לא ניתן ליצור לה צירוף לינארי ששווה לאפס אלא אם כן כל המקדמים הם אפס, לכן אז הסדרה גם בת"ל.

כאשר
$k=2$,
נאכל לפתור את מערכת המשוואות:

$
  mat(
    1, 1, -1;
    1, 1, -2;
  )
  -->^(R_2 => R_2 - R_1)
  mat(
    1, 1, -1;
    0, 0, -1;
  )
  -->^(R_1 => R_1 - R_2)
  mat(
    1, 1, 0;
    0, 0, -1;
  )
  -->^(R_2 => -R_2)
  mat(
    1, 1, 0;
    0, 0, 1;
  ) \
  { (x,-x,y) | x,y in RR }
$

יש אינסוף פתרונות לכן הסדרה ת"ל.

נאכל לפעול בצורה דומה עבור
$k = 3$:

$
  mat(
    1, 1, -1;
    1, 1, -2;
    1, 1, -3;
  )
  -->^(R_2 => R_2 - R_1 \ R_3 => R_3 - R_1)
  mat(
    1, 1, -1;
    0, 0, -1;
    0, 0, -1;
  )
  -->^(R_1 => R_1 - R_2 \ R_3 => R_3 - R_2)
  mat(
    1, 1, 0;
    0, 0, -1;
    0, 0, 0;
  )
  -->^(R_2 => -R_2)
  mat(
    1, 1, 0;
    0, 0, 1;
    0, 0, 0;
  ) \
  { (x, -x, y) | x,y in RR }
$

יש אינסוף פתרונות לכן הסדרה ת"ל.
