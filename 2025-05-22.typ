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
#let amat = math.mat.with(augment: -1)
#let dmat = math.mat.with(delim: "|")
#let tab = $space space space space$


#maketitle(
  title: "אלגברה לינארית 1א",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 22, month: 5, year: 2025).display("[day].[month].[year]"),
)

= דטרמיננטה

$
  det I = 1 \
  |I| = sum_(i=1)^n [A]_(i j) dot |A_(i j)| dot (-1)^(i+j) = |A_(i j)| = |I_(n-1)| = 1
$

== דוגמא

$
  dmat(
    a, b, c;
    d, e, f;
    g, h, k;
  )
  &= a dot dmat(
    e, f;
    h, k;
  ) - d dot dmat(
    b, c;
    h, k;
  ) + g dot dmat(
    b, c;
    e, f;
  ) \
  &= a dot (e k - f h) - d dot (b k - c h) + g dot (b f - e c) \
  &= a e k - a f h - d b k + d c h + g b f - g e c \
$

== דוגמא

תהי:
$
  A = mat(
    a, b, b, ..., b;
    b, a, b, ..., b;
    dots.v, dots.down, dots.down, dots.down, dots.v;
    b, b, b, ..., a;
  )
$

חשבו את
$det A$.

נוסיף את כל השורות
$2$
עד
$n$
לשורה
$1$:

$
  abs(A) = dmat(
    a + b(n-1), a + b(n-1), a + b(n-1), ..., a + b(n-1);
    b, a, b, ..., b;
    dots.v, dots.down, dots.down, dots.down, dots.v;
    b, b, b, ..., a;
  )
$

נחסר מכל שורה את השורה הראשונה מוכפלת ב-$b$:

$
  &= (a + b(n-1)) dmat(
    1, 1, 1, ..., 1;
    b, a, b, ..., b;
    dots.v, dots.down, dots.down, dots.down, dots.v;
    b, b, b, ..., a;
  ) #h(11.5em) \
  &= (a + b(n-1)) dmat(
    1, 1, 1, ..., 1;
    0, a-b, 0, ..., 0;
    dots.v, dots.down, dots.down, dots.down, dots.v;
    0, 0, 0, ..., a-b;
  ) \
  &= (a + b(n-1)) dmat(
    1, 0, ..., 0;
    0, a-b, ..., 0;
    dots.v, dots.down, dots.down, dots.v;
    0, 0, ..., a-b;
  ) \
  &= (a-b)^(n-1) (a+b(n-1))
$

== הערה

תהי
$A in M_(n)(FF)$
משולשית עליונה/תחתונה אז:

$
  det(A) = [A]_(1 1) dot ... dot [A]_(n n)
$

== תרגיל

יהיו
$x_1, ..., x_n$
מס' ממשיים שונים. נגדיר:

$
  v_(n)(x) = mat(
    1, x, x^2, ..., x^n;
    1, x_1, x_1^2, ..., x_1^n;
    1, x_2, x_2^2, ..., x_2^n;
    dots.v, dots.v, dots.v, dots.down, dots.v;
    1, x_n, x_n^2, ..., x_n^n;
  )
$

ידוע ש-$p_(n)(x) = det(V_(n)(x))$
פולינום ממעלה
$n$.

+ מצאו את כל הערכים של
  $x$
  עבורם
  $V_1(x)$
  הפיכה.

  *פתרון:*
  $V_(n)(x)$
  הפיכה אם"ם
  $det(V_(n)(x)) != 0$.
  ל-$p_(n)(x)$
  יש לכל היותר
  $n$
  אפסים (פולינום ממעלה
  $n$).
  נשים לב ש-$p_(n)(x_1) = ... = p_(n)(x_n) = 0$
  כיוון שבכולם יהיו 2 שורות זהות במטריצה. לכן מצאנו את כל הערכים עבורם
  $det(V_(n)_(x)) = 0$,
  כלומר
  $v_(n)(x)$
  הפיכה אם"ם
  $x != x_1, x_2, ..., x_n$.

+ יהיו
  $x_0 < x_1 < x_2 < x_3$.
  הראו שלכל בחירה של מס' ממשיים
  $(y_0, y_1, y_2, y_3)$
  קיים פולינום יחיד
  $q_3 in RR_3[x]$
  כך שלכל
  $0 <= i <= 3$,
  $q_3(x_i) = y_i$,
  כאשר:

  $
    q_3(x) = a_0 + a_1 x + a_2 x^2 + a_3 x^3
  $

  / פתרון\::
    נרצה לפתור:

    $
      cases(
        a_0 + a_1 x_0 + a_2 x_0^2 + a_3 x_0^3 = y_0,
        a_0 + a_1 x_1 + a_2 x_1^2 + a_3 x_1^3 = y_1,
        a_0 + a_1 x_2 + a_2 x_2^2 + a_3 x_2^3 = y_2,
        a_0 + a_1 x_3 + a_2 x_3^2 + a_3 x_3^3 = y_3,
      )
    $

    כלומר לפתור את המשוואה:

    $
      V_3(x) dot mat(a_0; a_1; a_2; a) = mat(y_0; y_1; y_2; y_3)
    $

    לפי סעיף א'
    $V_3(x)$
    הפיכה לכן קיים פתרון יחיד.

= מטריצה מצורפת (Adjoint)

== הגדרה

תהי
$A in M_(n)(FF)$.
אז המטריצה המצורפת ל-$A$,
$adj(A) in M_4(FF)$:

$
  [adj(A)]_(i j) = (-1)^(i j) |A_(i j)|
$

== טענה

תהי
$A in M_(m times n)(FF)$.
אז:

$
  A dot adj(A) = adj(A) dot A = |A| dot I
$

בפרט, אם
$|A| != 0$
אז:

$
  A^(-1) = 1 / abs(A) adj(A)
$

=== הוכחה

יהיו
$1 <= i,j <= n$.
נמצא את
$[A dot adj(A)]_(i j)$.


$
  [A dot adj(A)]_(i j)
  &= sum_(k=1)^n [A]_(i k) dot [adj(A)]_(k j) \
  &= sum_(k=1)^n [A]_(i k) dot (-1)^(k + j) dot abs(A_(k j)) \
$

אם
$i = j$:

$
  [A dot adj(A)]_(i i)
  = sum_(k=1)^n (-1)^(k+i) [A]_(i k) abs(A_(i k))
  = det(A)
$

אם
$i != j$.
תהי
$A'$
המטריצה המתקבלת אם רושמים את השורה ה-$i$
של
$A$
במקום השורה ה-$j$.
אז מתקיים
$A'_(j k) = A_(i k)$
לכל
$k$'
אז נקבל:

$
  [A dot adj(A)]_(i j)
  = sum_(k=1)^n [A']_(j k) dot abs(A'_(j k)) dot (-1)^(j + k)
$

נסתכל על:

$
  (adj(A) dot A)^t = A^t dot adj(A)^t = A^t dot adj(A^t) dot I = abs(A) dot I = (abs(A) dot I)^t \
  arrow.b.double \
  adj(A) dot A = abs(A) dot I
$

== תרגיל

תהי
$A in M_(n)(FF)$,
הוכיחו:

+ אם
  $rank(A) <= n-2$
  אז
  $adj(A) = 0$.

+ אם
  $rank(A) = n - 1$
  אז
  $rank(adj(A)) = 1$.

=== פתרון

+ לכל
  $1 <= i,j <= n$
  הדרגה של
  $A_(i j)$
  היא לכל היותר
  $n-2$,
  כלומר
  $A_(i j)$
  אינה הפיכה ו-$abs(A_(i j)) = 0$.
  $adj(A) = 0$.

+ $rank(A) = n - 1$
  ולכן
  $abs(A) = 0$,
  כלומר כל עמודה של
  $adj(A)$
  היא ב-$Null(A)$.
  מכאן כל עמודה ב-$adj(A)$
  היא כפולה של וקטור
  $v in Null(A)$
  כלומר
  $rank(adj A) = -1$

== משפט (Cramer)

תהי
$A x = b$
מערכת משוואות לינארית מסדר
$n times n$.
נניח
$abs(A) != 0$.
אז הפתרון היחיד
$C = (C_1, ..., C_n)$
נתון ע"י:

$
  C_i = abs(A_i) / abs(A)
$

כאשר
$A_i$
המטריצה המתקבלת ע"י החלפת העמודה ה-$i$
של
$A$
c-$b$.

כאשר
$A_i$
המטריצה המתקבלת ע"י החלפת העמודה ה-$i$
של
$A$
ב-$b$.

== דוגמא

$
  cases(
    2 x + 3 y = 4,
    5 x + 6 y = 1,
  ) \
  arrow.b.double \
  A = mat(
    2, 3;
    5, 6;
  ) \
  arrow.b.double \
  x = dmat(
    4, 3;
    1, 6;
  ) / dmat(
    1, 3;
    5, 6;
  ) = 21 / (-3) = -7
$
