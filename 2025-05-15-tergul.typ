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
#let Sym = math.op[Sym]
#let ASym = math.op[ASym]
#let tab = $space space space space$

#maketitle(
  title: "אלגברה לינארית 1א - תרגול",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 13, month: 5, year: 2025).display("[day].[month].[year]"),
)

= מטריצות מייצגות

יהיו
$U,V$
מ"ו מעל
$FF$
ממימדים
$m,n$
בהתאמה ותהי
$T: V -> U$
ה"ל. והיהיו
$B,C$
בסיסים
($B = {b_1, ..., b_n}$).

$
  [T]^B_C = mat(
    |, , |;
    [T(b_1)]_C, ..., [T(b_n)]_C;
    |, , |;
  )
$

== תרגיל

$T: Sym_2(RR) -> RR_(<= 2)[x]$
המוגדרת
$T mat(a, b; c, d) = a x^2 + b x + c$
מצאו את
$[T]_C^B$
עבור:

$
  B = { mat(1, 0; 0, 1), mat(1, 3; 3, 2), mat(4, 5; 5, 6) } \
  C = { 1+2x+3x^2, 4+5x+6x^2, 2+3x+2x^2 } \
$

=== פתרון

$
  E = {1,x,x^2} \
  [c_1]_E = mat(1; 2; 3) \
  E' = { mat }
$
