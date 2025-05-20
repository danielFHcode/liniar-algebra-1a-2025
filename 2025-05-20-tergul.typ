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
  title: "אלגברה לינארית 1א - (חצי) תרגול",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 20, month: 5, year: 2025).display("[day].[month].[year]"),
)

= דטאמיננטה

== תרגיל

תהי
$A in M_(n)(FF)$
ויהי
$lambda in FF$,
הוכיחו
$lambda^n det A = det(lambda A)$.

=== פתרון

הכפלנו כל שורה ב-$lambda$
לכן ה-$det$
הוכפלה ב-$lambda$
$n$
פעמים.

== תרגיל

תהי
$A in M_(2n+1)(FF)$
אנטיסימטרית, הוכיחו שהיא לא הפיכה.

=== פתרון

מספיק להראות
$det A = 0$.

$
  det A = det A^t = det(-A)
$
