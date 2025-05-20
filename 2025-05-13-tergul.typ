#import "@preview/rubber-article:0.3.1": maketitle, article

#show: article.with(lang: "he")

#show math.equation.where(block: true): set block(breakable: true)
#show math.equation.where(block: false): box
#set text(font: "David CLM")

#let ds = $. space$
#let mtext = text.with(font: "David CLM")
#let Span = math.op[Span]
#let rank = math.op[rank]
#let Id = math.op[Id]
#let amat = math.mat.with(augment: -1)
#let Ker = math.op[Ker]
#let tab = $space space space space$

#maketitle(
  title: "אלגברה לינארית 1א - תרגול",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 13, month: 5, year: 2025).display("[day].[month].[year]"),
)

= משפט המימדים להעתקות

משפט - אם
$T: V -> U$
ה"ל אז מתקיים
$dim V = dim Im T + dim Ker T$.

מסקנות:

- אם
  $T$
  איזומורפיזם אז
  $dim U = dim V$.
- אם
  $dim U = dim V$
  אז
  $T$
  איזומורפיזם
  $<=>$
  חח"ע
  $<=>$
  על.

== תרגיל

יהיו
$V,U,W$
מ"ו מעל
$FF$
עם
$dim U = n$
ותהיינה
$T: V -> U, S: U -> W$.
הוכיחו שמתקיים:

$
  dim(S compose T) >= dim Im T + dim Im S - n \
$

#linebreak()

$
  dim(S compose T) = dim(S|_(Im T) compose T) \
  dim(Im(S|_(Im T) compose T)) >= dim Im(T) + dim Im(S) \
  dim Im(T) = dim Im(S|_(Im T)) + dim Ker(S|_(Im T)) \
  arrow.b.double \
  dim Im(S|_(Im T)) + dim Ker(S|_(Im T)) + dim(Im S) - n = dim Im T + dim Im S - n \
  dim Im(S|_(Im T)) = dim Im(S|_(Im T)) + underbrace(dim Ker S + dim Im S - n, 0)
$

== תרגיל
מצאו בסיסים לתמונה והגרעין של
$T: RR^5 -> RR_(<= 3)[x]$
המוגדרת:

$
  T mat(
    a;
    b;
    c;
    d;
    e;
  ) = (a + b) + (c + d - e)x^2 + (2a + 2b + c + d - e)x^3
$

כדי למצוא את הגרעין נפתור:

$
  amat(
    1, 1, 0, 0, 0, 0;
    0, 0, 1, 1, -1, 0;
    2, 2, 1, 1, -1, 0;
  )
  ~>
  amat(
    1, 1, 0, 0, 0, 0;
    0, 0, 1, 1, -1, 0;
    0, 0, 0, 0, 0, 0;
  ) \
  Ker T = { mat(a; b; c; d; e) in RR^5 | a = -b and c = e - d } = { mat(a; -a; a-d; d; e) | a,d,e in RR } = Span{mat(1; -1; 0; 0; 0), mat(0; 0; 1; 0; 1), mat(0; 0; -1; 1; 0)}
$

ממשפט המימדים
$dim Im T = dim RR^5 - dim Ker T$
לכן:

$
  T mat(1; 0; 0; 0; 0;) = 1 + 2x^3 \
  T mat(0; 0; 1; 0; 0;) = x^2 + x^3 \
  arrow.b.double \
  Im T = Span{ 1 + 2x^3, x^2 + x^3 }
$

= קואורדינטות

== תזכורת

יהי
$V$
מ"ו מעל
$FF$
ותהיינה
$B={b_1, ..., b_n}$
בסיס סדור ו-$v in V$
כלשהו. נגדיר איז'
$[ space space ]_B : B -> FF^n$
ע"י:

$
  [v]_B = [a_1 v_1 + ... +a_n v_n] = mat(a_1; dots.v; a_n)
$

בהנתן זוג בסיסים
$B,C$
נגדיר מטריצת מעבר בסיס
$[Id]_C^B$
המקיימת:

$
  [Id]_C^B [v]_B = [v]_C <=> [Id]_C^B = mat(
    |, , |;
    [b_1]_C, ..., [b_n]_C;
    |, , |;
  )
$

== תכונות

- $[Id]_C^B = ([Id]^C_B)^(-1)$

- $[Id]_D^B = [Id]_D^C [Id]_C^B$

- $I_n = [Id]_B^B$

== תרגיל

עבור הביסים
$B,C$
של
$RR^3$
חשבו את
$[Id]_C^B$.

$
  B = { mat(1; 0; 1), mat(1; 1; 2), mat(2; 2; 2) }, space
  C = { mat(1; 0; 0), mat(2; 2; 0), mat(1; 2; 3) }
$
