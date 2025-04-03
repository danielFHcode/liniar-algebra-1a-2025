#import "@preview/rubber-article:0.3.1": article, maketitle


#show: article.with(lang: "he")

#show math.equation.where(block: true): set block(breakable: true)
#show math.equation.where(block: false): box
#set text(font: "David CLM")

#let ds = $. space$
#let mtext = text.with(font: "David CLM")
#let Span = math.op[Span]
#let amat = math.mat.with(augment: -1)
#let tab = $space space space space$

#maketitle(
  title: "אלגברה לינארית 1א",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 3, month: 4, year: 2025).display("[day].[month].[year]"),
)

= בסיסים

== משפט

יהי
$V$
מרחב ווקטורי נוצר סופית. יהי
$U subset.eq V$
תת מרחב ווקטורי. אז:

+ $U$
  נוצר סופית ו-$dim U <= dim V$.

+ $U = V$
  אם ורק אם
  $dim U = dim V$.

=== הוכחה

+ כל קבוצה בלתי תלויה לינארית ב-$U$
  היא קבוצה בלתי תלויה לינארית ב-$V$.
  נסמן $n = dim V$.
  כל קבוצה בת"ל ב-$U$
  היא עם לכל היותר
  $n$
  איברים ולכן
  $dim U <= dim V$.

+ יהי
  ${u_1, ..., u_n}$
  בסיס ל-$U$.
  ${u_1, ..., u_n}$
  קבוצה בת"ל ולכן היא בסיס ל-$V$.
  $U = V = Span{u_1, ..., u_n}$.

== משפט

יהי
$V$
מרחב וקטורי נוצר סופית. אז לכל שני תתי מרחבים
$U, W subset.eq V$:

$
  dim(U + W) = dim U + dim W - dim(U inter W)
$

בפרט, אם
$U inter W = {0}$
אז
$dim(U plus.circle W) = dim U + dim W$.

=== הוכחה

יהי
${v_1, ...., v_k} = B$
בסיס ל-$U inter W$.
נשלים את
$B$
לבסיס
${v_1, ..., v_k, u_1, ..., u_m}$
של
$U$
ונשלים את
$B$
לבסיס
${v_1, ..., v_k, w_1, ..., w_m}$
של
$W$.
אז הקבוצה
${v_1, ..., v_k, u_1, ..., u_m, w_1, ..., w_n}$
פורשת את
$U + W$.
נראה שמדובר הקבוצה בת"ל:

$
  a_1 v_1 + ... + a_k v_k + b_1 u_1 + ... + b_m u_m + c_1 w_1 + ... + c_n w_n = 0 \
  sum_(i=1)^k a_i v_i + sum_(i=1)^m b_i u_i + sum_(i=1)^n c_i w_i = 0 \
  sum_(i=1)^k a_i v_i + sum_(i=1)^m b_i u_i = -sum_(i=1)^n c_i w_i = v in U inter W \
$

לכן קיימים
$d_1, ..., d_k$
כך ש-

$
  v = sum_(i=1)^k d_i v_i = -sum_(i=1)^n c_i w_i \
  sum_(i=1)^k d_i v_i + sum_(i=1)^n c_i w_i = 0 \
  arrow.b.double \
  d_1 = ... = d_k = c_1 = ... = c_n = 0 \
  arrow.b.double \
  a_1 = ... = a_k = b_1 = ... = b_n = 0
$

קיבלנו ש-${v_1, ..., v_k, u_1, ..., u_m, w_1, ..., w_n}$
בסיס ל-$U + W$.

$
  dim(U + W) = k + m + n = dim U + n + k - k = dim U + dim W - dim(U + W)
$

= מטריצות

$
  M_(m times n)(FF) = { mat(
      a_(1 1), ..., a_(1 n);
      dots.v, dots.down, dots.v;
      a_(m 1), ..., a_(m n);
    ) | a_(i j) in FF_(1 <= i <= m \ 1 <= j <= n) }
$

תהי
$A in M_(m times n)(FF)$.
נסמן ב-$[A]_(i j)$
את האיבר בשורה ה-$i$
והעמודה ה-$j$.

$M_(m times n)(FF)$
מרחב ווקטורי:

$
  [A + B]_(i j) = [A]_(i j) + [B]_(i j) \
  [lambda dot A]_(i j) = lambda dot [A]_(i j)
$

== הערות

+ מטריצות בגודל
  $1 times n$
  נקראת ווקטור שורה.

+ מטריצה בגודל
  $m times 1$
  נקראת ווקטור עמודה.

+ אם
  $m = n$,
  נסמן את מרחב המטריצות הריבועיות ב-$M_(n)(FF)$.

== הגדרה

תהי
$A in M_(m times n)(FF)$.
אז המטריצה המשוחלפת
(transpose)
$A^t in M_(n times m)(FF)$
מוגדרת כך ש-

$
  [A^t]_(i j) = [A]_(j i)
  tab
  #stack(
    dir: ttb,
    spacing: .5em,
    $1 <= i <= n$,
    $1 <= j <= m$
  )
$

=== דוגמא

$
  A = mat(
    1,2,3;
    4,5,6;
  ) \
  A^t = mat(
    1, 4;
    2, 5;
    3, 6;
  )
$

== הגדרה

מטריצה
$A in M_(n)(FF)$
נקראת סימטרית אם:

=== דוגמא

$
  mat(
    1,3,5;
    3,2,6;
    5,6,3;
  ) = mat(
    1,3,5;
    3,2,6;
    5,6,3;
  )^t
$

== הגדרה

$A in M_(n)(FF)$
נקראת אנטי סימטרית אם:

$
  A^t = -A
$

=== דוגמא

$
  mat(
    0,1,2;
    -1,0,3;
    -2,-3,0;
  )^t = -mat(
    0,1,2;
    -1,0,3;
    -2,-3,0;
  )
$

== תרגיל

תהי
$A in M_(n)(FF)$,
אז ניתן לרשום את
$A$
כסכום של מטריצה סימטרית ואנטי סימטרית.

=== הוכחה

נסתכל על המטריצה:

$
  (A + A^t) / 2
$

זוהי מטריצה סימטרית.

נסתכל על המטריצה:

$
  (A - A^t) / 2
$

זוהי מטריצה אנטי סימטרית.

הסכום של שתיהן הוא
$A$.

== תכונות של שחלוף

$
  (A + B)^t = A^t + B^t \
  (lambda dot A)^t = lambda dot A^t \
  (A^t)^t = A
$

= כפל מטריצות

== כפל ווקטור שורה בווקטור עמודה

נכפיל קודם מטריצות
$A$
בגודל
$1 times n$
ו-$B$
שהיא בגודל
$n times 1$.

$
  A = (a_1, ..., a_n) \
  B = mat(b_1; dots.v; b_n)
$

נגדיר את המכפלה שלהם להיות מטריצה בגודל
$1 times 1$:

$
  A dot B := sum_(i=1)^n a_i dot b_i = a_1 dot b_1 + ... + a_n dot b_n
$

== כפל מטריצה בווקטור עמודה

נרחיב את ההגדרה:
עבור
$A in M_(m times n)(FF), B in M_(n times 1)(FF)$,
נגדיר את מכפלתם להיות מטריצה בגודל
$m times 1$:

$
  mat(
    a_(1 1), ..., a_(1 n);
    dots.v, dots.down, dots.v;
    a_(m 1), ..., a_(m n);
  ) dot mat(
    b_1;
    dots.v;
    b_n;
  ) := mat(
    a_(1 1) b_1 + ... + a_(1 n) b_n;
    dots.v;
    a_(m 1) b_1 + ... + a_(m n) b_n;
  ) = b_1 mat(a_(1 1); dots.v; a_(1 m)) + ... + b_n mat(a_(n 1); dots.v; a_(n m))
$

// == דוגמא

// $
//   mat(
//     1, 2, 3;
//     4, 5, 6;
//   ) dot mat(
//     2;
//     0;
//     -1
//   )
// $
