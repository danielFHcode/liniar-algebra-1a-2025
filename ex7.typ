#import "@preview/rubber-article:0.3.1": maketitle, article
#import "@preview/xarrow:0.3.1": xarrow

#show: article.with(lang: "he", heading-numbering: none)

#show math.equation.where(block: true): set block(breakable: true)
// #show math.equation.where(block: false): box
#set text(font: "David CLM", lang: "he")

#let ds = $. space$
#let mtext = text.with(font: "David CLM")
#let Span = math.op[Span]
#let amat = math.mat.with(augment: -1)
#let tab = $space space space space$
#let Sym = math.op[Sym]
#let ASym = math.op[ASym]
#let Col = math.op[Col]
#let Row = math.op[Row]
#let Null = math.op[Null]
#let rank = math.op[rank]
#let Ker = math.op[Ker]

#maketitle(
  title: "אלגברה לינארית 1א - תרגיל בית 7",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 19, month: 5, year: 2025).display("[day].[month].[year]"),
)

= שאלה 1

$
  rank(A + B + A B) &<= rank A + rank B + rank A B \
  rank(A + B + A B) &<= rank A + rank B + rank B \
  rank(A + B + A B) &<= rank A + rank(B + B) \
  rank(A + B + A B) &<= rank A + rank B \
$

= שאלה 2

== סעיף א

$
  mat(
    1, 1, 2;
    0, 1, 2;
  )
  xarrow(R_1 => R_1 - R_2)
  mat(
    1, 0, 0;
    0, 1, 2;
  ) \
  Null(A) = { (u,-2v,v) | u,v in RR } => dim Null(A) = 2 \
  dim FF^3 = dim Null(A) + rank A \
  3 = 2 + rank A \
  1 = rank A \
$

== סעיף ב

$
  mat(
    1, 1, 3;
    1, -2, 0;
    1, -1, lambda;
  )
  xarrow(R_2 => R_2 - R_1 \ R_3 => R_3 - R_1)
  mat(
    1, 1, 3;
    0, -3, -3;
    0, -2, lambda-3;
  )
  xarrow(R_2 => R_2 / (-3))
  mat(
    1, 1, 3;
    0, 1, 1;
    0, -2, lambda-3;
  )
  xarrow(R_1 => R_1 - R_2 \ R_3 => R_3 + 2R_2)
  mat(
    1, 0, 2;
    0, 1, 1;
    0, 0, lambda-1;
  )
$

/ אם $lambda = 1$\::

  $
    mat(
      1, 0, 2;
      0, 1, 1;
      0, 0, 0;
    ) \
    Null(A) = { (-2u, -u, u) | u in RR } => dim Null(A) = 1 \
    dim FF^3 = dim Null(A) + rank A \
    3 = 1 + rank A \
    2 = rank A
  $

/ אחרת, ניתן לחלק ב-$lambda - 1$\::

  $
    xarrow(R_3 => R_3 / (lambda-1))
    mat(
      1, 0, 2;
      0, 1, 1;
      0, 0, 1;
    )
    xarrow(R_1 => R_1 - 2R_3 \ R_2 => R_2 - R_1)
    mat(
      1, 0, 0;
      0, 1, 0;
      0, 0, 1;
    )
  $

  פעולות אלמנטריות לא משנות
  $rank$
  ו-$rank I_3 = 3$
  לכן
  $rank A = 3$
  במקרה זה.

= שאלה 3

(אני מניח שהכוונה
$A = mat(v_1 dot v_1^tack.b, ..., v_n dot v_n^tack.b)$
כיוון שאחרת מתקיים
$A subset.eq FF^1$
ואז השאלה פשוט לא הגיונית)

נניח בשלילה כי
$rank A < n$,
אז כיוון ש-$n = dim Null(A) + rank A$
מתקיים
$dim Null(A) = n - rank A > 0$,
לכן קיים
$x in FF^n$
כך ש-$A x = 0$.
אז אם נסמן
$mat(x_1; dots.v; x_n)$,
מתקיים:

$
  x_1 dot v_1 dot v_1^tack.b + ... + x_n dot v_n dot v_n^tack.b &= 0 \
  x_1 dot v_1^tack.b dot v_1 + ... + x_n dot v_n^tack.b dot v_n &= 0 \
  (x_1 dot v_1^tack.b) dot v_1 + ... + (x_n dot v_n^tack.b) dot v_n &= 0 \
$

ואז
$v_1, ..., v_n$
ת"ל, שזו סתירה.

= שאלה 4

$
  amat(
    m, 0, 1, 1;
    1, m-1, 0, 1;
    m, 0, 2, m;
  )
  xarrow(R_1 <=> R_2)
  amat(
    1, m-1, 0, 1;
    m, 0, 1, 1;
    m, 0, 2, m;
  )
  xarrow(R_2 => R_2 - m R_1 \ R_3 => R_3 - m R_1)
  amat(
    1, m-1, 0, 1;
    0, 0, 1, 1-m;
    0, 0, 2, 0;
  )
  xarrow(R_3 => R_3 - 2R_1)
  amat(
    1, m-1, 0, 1;
    0, 0, 1, 1-m;
    0, 0, 0, 2m-2;
  )
$

/ אם $m=1$\::
  אז:

  $
    amat(
      1, -1, 0, 1;
      0, 0, 1, 0;
      0, 0, 0, 0;
    ) \
    { mat(1+u; u; 0) | u in FF }
  $

  קיים פתרון לכן המטריצה במרחב.

/ אחרת\::
  אז
  $2m-2 != 0$
  ולכן אין פתרון מה שאומר שהמטריצה לא במרחב.

= שאלה 5

== סעיף א

זוהי לא העתקה לינארית, נפריח עם דוגמא נגדית:

$
  T mat(0; 1) + T mat(0; -1)
  &= mat(0; 1) + mat(0; 1) \
  &= mat(0; 2) \
  &!= mat(0; 0) \
  &= mat(0; abs(0)) \
  &= T mat(0; 0) \
  &= T(mat(0; 1) + mat(0; -1)) \
$

== סעיף ב

זוהי העתקה לינארית:

$
  T(lambda_1 mat(x_1; dots.v; x_n) + lambda_2 mat(y_1; dots.v; y_n))
  = mat(lambda_1 (x_1 + x_2) + lambda_2 (y_1 + y_2); dots.v; lambda_n (x_n + x_n) + lambda_n (y_n + y_n))
  = lambda_1 T mat(x_1; dots.v; x_n) + lambda_2 T mat(y_1; dots.v; y_n)
$

בסיס ל-$Ker T$:

$
  Ker T
  &= { mat(x_1; dots.v; x_n) in FF^n | mat(x_1 + x_2; dots.v; x_n + x_1) = 0 } \
  &= { mat(x_1; dots.v; x_n) in FF^n | x_1 + cancel(x_2) = cancel(x_2) + x_3 = 0 and ... and x_n + cancel(x_1) = cancel(x_1) + x_2 = 0 } \
  &= { mat(x_1; dots.v; x_n) in FF^n | x_1 = x_3 = 0 and ... and x_n = x_2 = 0 } \
  &= { mat(x_1; dots.v; x_n) in FF^n | x_1 = ... = x_n = 0 } \
  &= { 0 } => dim Ker T = 0
$

אז בבירור
$emptyset$
בסיס ל-$Ker T$,
ובנוסף ממשפט המימדים נובע כי
$dim Im T = n$
ולכן
$Im T = RR^n$
ולכן
${e_1, ..., e_n}$
בסיס ל-$Im T$.

== סעיף ג

זוהי לא העתקה לינארית, נפריח עם דוגמא נגדית:

$
  5 dot T(0) = 5 dot (0 + x^2 - x) = 5x^2 - 5x != x^2 - x = T(0) = T(5 dot 0)
$

== סעיף ד

נוכיח כי זו העתקה לינארית:

$
  T(lambda_1 dot A + lambda_2 B)
  &= lambda_1 A + lambda_1 A^t + lambda_2 B + lambda_2 B^t
  &= lambda_1 T(A) + lambda_2 T(B)
$

בסיס ל-$Ker T$:

$
  { A in M_(n)(A) | A^t = 0 }
  &= { A in M_(n)(A) | A = 0^t } \
  &= { A in M_(n)(A) | A = 0 } \
  &= { 0 } \
$

לכן
$emptyset$
בסיס ל-$Ker T$,
ובנוסף ממשפט המימדים
$dim Im T = n^2$
ולכן
$Im T = M_(n)(RR)$,
ולכן
${e_(1 1), ..., e_(n n)}$
בסיס ל-$Im T$.

= שאלה 6

== סעיף א

נניח בשלילה כי קיימים
$lambda_1, ..., lambda_n in FF$
לא כולם אפס כך ש-

$
  lambda_1 v_1 + ... + lambda_n v_n &= 0 \
  T(lambda_1 v_1 + ... + lambda_n v_n) &= T(0) \
  lambda_1 T(v_1) + ... + lambda_n T(v_n) &= 0 \
$

אז
$T(v_1), ..., T(v_n)$
ת"ל, שזו סתירה.

== סעיף ב

נניח בשלילה כי קיימים
$lambda_1, ..., lambda_n in FF$
לא כולם אפס כך ש-

$
  lambda_1 T(v_1) + ... + lambda_n T(v_n) &= 0 \
  T(lambda_1 v_1 + ... + lambda_n v_n) &= T(0) \
$

ולכן כיוון ש-$T$
חח"ע:

$
  lambda_1 v_1 + ... + lambda_n v_n = 0
$

אז
$v_1, ..., v_n$
ת"ל, שזו סתירה.

= שאלה 7

== סעיף א

נסמן
$A = mat(
  |, , |;
  v_1, ..., v_n;
  |, , |;
)$,
אז
${v_1, ..., v_n}$
פורשת את
$Col A$,
לכן ניתן לצמצם אותה לבסיס
$\{v_(i_1), ..., v_(i_r)}$.
לכל
$v' in {v_1, ..., v_n}$
מתקיים
$v' in Col A$
ולכן קיימים
$lambda_1, ..., lambda_r in FF$
יחידים כך ש-$v' = lambda_1 v_i_1 + ... + lambda_r v_i_r$,
אז נסמן
#box[$(v)_k := lambda_k$]
לכל
$1 <= k <= r$.
כעט נגדיר
$A_k := mat(
  |, , |;
  (v_1)_k dot v_i_1, ..., (v_n)_k dot v_i_r;
  |, , |;
)$
לכל
$1 <= k <= r$,
ואז מתקיים:

$
  A_1 + ... + A_r = mat(
    |, ..., |;
    sum_(k=1)^r (v_1)_k v_i_k, ..., sum_(k=1)^r (v_n)_k v_i_k;
    |, ..., |;
  ) = mat(
    |, , |;
    v_1, ..., v_n;
    |, , |;
  ) = A
$

ובנוסף לכל
$1 <= k <= r$:

$
  rank A_k
  = dim Span{(v_1)_k dot v_i_k, space ..., space (v_n)_k dot v_i_k}
  = dim Span{v_i_k, ..., v_i_k}
  = dim Span{v_i_k}
  = 1
$

== סעיף ב

נניח בשלילה כי קיימות מטריצות כאלו
$A_1, ..., A_k$,
אז לכל
$1 <= i <= k$
נסמן
$A_i = mat(
  |, , |;
  v'_(i 1), ..., v'_(i n);
  |, , |;
)$,
ואז כיוון ש-$dim Col A_i = rank A_i = 1$,
ו-${v'_(i 1), ..., v'_(i n)} subset.eq Col A_i$,
בהכרח קיימים
$v_i in FF^m, lambda_(i 1), ..., lambda_(i n) in FF$
כך ש-

$
  A_i = mat(
    |, , |;
    lambda_(i 1) v_i, ..., lambda_(i n) v_i;
    |, , |;
  )
$

אז:

$
  rank A
  &= dim Col A \
  &= dim Col(A_1 + ... + A_k) \
  &= dim Col mat(
    |, , |;
    lambda_(1 1) v_1 + ... + lambda_(k 1) v_k, ..., lambda_(1 n) v_1 + ... + lambda_(k n) v_k;
    |, , |;
  ) \
  &= dim Span{ lambda_(1 1) v_1 + ... + lambda_(k 1) v_k, space ..., space lambda_(1 n) v_1 + ... + lambda_(k n) v_k } \
  &<= dim Span{v_1, ..., v_k} \
  &<= k \
  &< r
$

שזו סתירה כי
$rank A = r$.
