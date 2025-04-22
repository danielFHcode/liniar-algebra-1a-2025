#import "@preview/rubber-article:0.3.1": maketitle, article

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
  title: "אלגברה לינארית 1א - תרגול",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 22, month: 4, year: 2025).display("[day].[month].[year]"),
)

= תרגיל

נתון
$T = {u,v,w}$
בסיס ל-$RR^3$.
האם
$S = {u, u+v, u+v+w}$
בהכרח בסיס?

== תשובה

$
  u in S => u in Span(S) \
  v = (u + v) - v => v in Span(S) \
  w = (w + u + v) - (u + v) => w in Span(S) \
  arrow.b.double \
  T subset.eq Span(S)
  arrow.b.double \
  RR^3 = Span(T) subset.eq Span(S) subset.eq RR^3 \
  arrow.b.double \
  Span(S) = RR^3
$

= מטריצות

נסמן לפעמים ב-$(A)_(i j)$
את האיבר ה-$i, j$
של
$A$.

נגדיר כמה פעולות על מטריצות:

- $A + B$
  היא המטריצה שהאיבר ה-$i, j$
  שלה הוא
  $a_(i j) + b_(i j)$.
- $lambda dot A$
  היא המטריצה שהאיבר ה-$i, j$
  שלה הוא
  $lambda a_(i j)$.
- $A^tack.b$
  היא המטריצה שהאיבר ה-$i, j$
  שלה הוא
  $a_(j i)$
  (מימדיה שונים).

  $
    mat(
      1,2;
      3,4;
    ) -->^((space)^tack.b) mat(
      1,3;
      2,4;
    ) \
    mat(
      1,2;
      3,4;
      5,6;
    ) -->^((space)^tack.b) mat(
      1,3,5;
      2,4,6;
    ) \
  $

== תכונות של פעולות
+ חילוף - $A + B = B + A$
+ $lambda(A+B) = lambda A + lambda B, (lambda + mu)A = lambda A + mu A$
+ קיבוציות - $A + (B + C) = (A + B) + C$
+ $(A + B)^tack.b = A^tack.b + B^tack.b, (lambda A)^tack.b = lambda A^tack.b, (A^tack.b)^tack.b = A$

הערה חשובה:
$M_(n times m)(FF)$
הוא מ"ו מעל
$FF$.

= תרגילים

== תרגיל 1

נגדיר מטריצה סימטרית
$A$
בתור מטריצה המקיימת
$A^tack.b = A$.


נגדיר מטריצה אנטי-סימטרית
$A$
בתור מטריצה המקיימת
$A^tack.b = -A$.

הוכיחו כי יש מטריצה אחת שהיא גם סימטרית וגם אנטי סימטרית.

=== תשובה

המטריצה היא 0. הוכחה:

$
  -A = A^tack.t = A \
  arrow.b.double \
  -a_(i j) = a_(i j)
$

= כפל מטריצות

יהיו
$A in M_(n times ell)(FF), B in M_(m times n)$.
נגדיר
$A\B$
בתור המטריצה שהאיבר ה-$i,j$
שלה הוא
$(A B)_(i j) = sum_(k=1)^n a_(i k) b_(k j)$.

== תכונות

+ $A(B C) = (A B) C$
+ $A (mu B + lambda C) = mu A B + lambda A C$, $(mu B + lambda C) A = mu B A + lambda C A$
+ $(A B)^tack.b = B^tack.b A^tack.b$
+ $A B != B A$
+ $I_m A = A I_n = A$,
  כאשר:

  $
    I_k = mat(
      1, ..., 0;
      dots.v, dots.down, dots.v;
      0, ..., 1;
    )
  $

הערה חשובה: כפל כל שתי מטריצות לא תמיד מוגדר ולפעמיםם מוגדר רק מצד אחד.

= תרגילים

== תרגיל 1

חשבו:

=== סעיף א

$
  mat(
    0, 1;
    2, 2;
    1, 0;
  ) dot mat(
    1, 4;
    2, 5;
    3, 6;
  )
  &=
  mat(
    0, 1;
    2, 2;
    1, 0;
  ) dot mat(
    1, 2, 3;
    4, 5, 6;
  )
  \ &=
  mat(
    0 dot 1 + 1 dot 4, 0 dot 2 + 1 dot 5, 0 dot 4 + 1 dot 6;
    2 dot 1 + 2 dot 4, 2 dot 2 + 2 dot 5, 2 dot 4 + 2 dot 6;
    1 dot 1 + 0 dot 4, 1 dot 2 + 0 dot 5, 1 dot 4 + 0 dot 6;
  )
  \ &=
  mat(
    4, 5, 6;
    2 + 8, 4 + 10, 8 + 12;
    1, 2, 4;
  )
  \ &=
  mat(
    4, 5, 6;
    10, 14, 20;
    1, 2, 4;
  )
$

=== סעיף ב

$
  mat(1,2; 3,4) dot mat(1,0; 0,1; 1,0)
$

לא מוגדר

=== סעיף ג

$
  (mat(1,1; 1,1) + mat(-2,-1; 0,1)) dot mat(2,1,0,3; -1,2,1,2)
$

== תרגיל 2

תהי
$A$
מטריצה ריבועית. הוכיחו
$(A^k)^tack.b = (A^tack.b)^k$
לכל
$k in NN$.

=== תושבה

$k=1$
טריוויאלי.

נניח שהטענה נכונה עבור
$k in NN$,
כלשהו. נוכיח ל-$k+1$.

$
  (A^tack.b)^(k+1) = (A^tack.b)^k dot A^tack.b = (A dot A^k)^tack.b = (A^(k+1))^tack.b
$

== תרגיל 3

נאמר שמטריצות ריבועיות
$A,B$
מתלחפות אם
$A B = B A$.

מצאו את כל המטריצות שמתחלפות עם
$mat(1,1; 0,1)$.

=== פתרון

ניקח מטריצה
$2 times 2$
כלשהי
$B = mat(a,b; c,d)$
ונדרוש
$A B = B A$.

$
  A B = mat(1,1; 0,1) mat(a,b; c,d) = mat(
    1 dot a + 1 dot c, 1 dot b + a dot d;
    0 dot a + 1 dot c, 0 dot b + 1 dot d;
  ) = mat(a+c,b+d; c,d) \
  B A = mat(a,b; c,d) mat(1,1; 0,1) = mat(
    a dot 1 + 0, a dot 1 + b dot 1;
    c dot 1 + 0, c dot 1 + d dot 1;
  ) = mat(a,a+b; c,c+d) \
  cases(
    a + c = a => c = 0,
    b + d = a + b => a = d,
    c = c,
    d = d+c => c = 0,
  ) \
  B = mat(
    a, b;
    0, a;
  )
$

== תרגיל 4

הוכיחו:

$
  A B = B A <==> (A + B) (A - B) = A^2 - B^2
$

=== פתרון

$
  underbrace(A^2 - B^2 = A(A-B), <==> B A - A B = 0 <==> B A = A B) + B(A-B) = A^2 - A B + B A - B^2 = A^2 + B^2 + (B A - A B)
$

== תרגיל 5

הוכיחו:

$B A = A B$
אם"ם
$A^tack.b, B^tack.b$
מתחלפות.

=== פתרון

/ $=>$\::

  $
    A B = B A \
    (A B)^tack.b = (B A)^tack.b \
    B^tack.b A^tack.b = A^tack.b B^tack.b
  $

הכיוון השני נובע מכך ש-$(A^tack.b)^tack.b = A$.

== תרגיל 6

הוכיחו כי מטריצה מתחפלת עם כל מטריצה ריבועית אמ"מ היא סקלרית.

=== פתרון

מצד אחד:

$
  A B = lambda I_n dot B = lambda B \
  B A = B lambda I_n = lambda dot B I_n = lambda dot B \
$

מצד שני, נגדיר את
$E_(i j)$
להיות המטריצה שכולה אינדקסים חוץ מהאיבר ה-$i,j$
שהוא $1$.

$
  (A E_(i j))_(ell k)
  = sum_(m=1)^n a_(ell m) (E_(i j))_(m k)
  = a_(ell i) (E_(i j))_(i k)
  = cases(
    a_(ell i) dot 1\, &tab k = j,
    a_(ell i) dot 0\, &tab "else"
  )
  = cases(
    a_(ell i)\, &tab k = j,
    0\, &tab "else"
  ) \
  (E_(i j) A)_(ell k)
  = sum_(m=1)^n (E_(i j))_(ell m) a_(m k)
  = (E_(i j))_(ell j) a_(k j)
  = cases(
    a_(j k)\, &tab ell = i,
    0\, &tab "else"
  ) \
$

לכל
$i,j$,
$a_(i,i) = a_(i,j)$,
לכל
$m != n$
$a_(m,n) = 0$

$
  arrow.b.double \
  A = mat(
    a_(11), ..., 0;
    dots.v, dots.down, dots.v;
    0, ..., a_(1 1);
  )
$

= מטריצה הפכיה

מטריצה
$A$
היא הפיכה אם קיימת מטריצה
$B$
עבורה
$A B = B A = I$.
נסמן לרוב
$A^(-1) := B$.

הוכחנו בהרצאה:

- אם
  $A,B$
  ריבועיות, אז
  $A B = I <=> B A = I$.
- אם
  $A,B$
  ריבועיות והפיכות אז
  $A B$
  מתחלפת עם
  $(A B)^(-1) = B^(-1) A^(-1)$
- $A = (A^(-1))^(-1), (A^tack.b)^(-1) = (A^(-1))^tack.b$

= תרגילים

// #counter(heading).step(level: 2)

== תרגיל 1

יהיו
$A B$
ריבועיות כך ש-$A B$
הפיכה. הוכיחו
$A,B$
הפיכות.

=== פתרון

נסמן ב-$C$
את ההפכי של
$A B$.

$
  I = A B dot C = A dot B C => A^(-1) = B C \
  I = C dot A B = C A dot B => B^(-1) = C A \
$

== תרגיל 2

תהי
$A$
ריבועית ו-$p$
פולינום כלשהו המקיים
$p(0) != 0, p(A) = 0$.
הוכיחו ש-$A$
הפיכה.

=== פתרון

נכתוב
$p(x) = sum_(i=0)^k a_i x^i$
ומהנתון
$a_0 != 0$.

נשתמש בנתון השני:

$
  0 = p(A) = a_0 I + sum_(i=1)^k a_i A^i \
  -a_0 I = sum_(i=1)^k a_i A^i \
  -a_0 I = A sum_(i=1)^k a_i A^(i-1) \
  I = A sum_(i=1)^k (a_i A^(i-1)) / (-a_0) \
  arrow.b.double \
  A^(-1) = sum_(i=1)^k (a_i A^(i-1)) / (-a_0)
$

== תרגיל 3

נגדיר מטריצה ניפוטנטית בתור
$A in M_(n)(RR)$
המקיימת
$A^k = 0$
עבור
$0 != k in NN$.

הוכיחו כי מטריצה ניפוטנטית איננה הפיכה.

=== הוכחה


$
  A^k = 0 \\ dot A^(-1) \
  A^(k-1) = 0 \\ dot A^(-1) \
  A^(k-2) = 0 \\ dot A^(-1) \
  dots.v \
  A = 0 \
  arrow.b.double \
  "controdiction"
$
