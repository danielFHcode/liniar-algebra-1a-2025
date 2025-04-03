#import "@preview/rubber-article:0.3.1": maketitle, article

#show: article.with(lang: "he")

#show math.equation.where(block: true): set block(breakable: true)
#show math.equation.where(block: false): box
#set text(font: "David CLM")

#let ds = $. space$
#let mtext = text.with(font: "David CLM")
#let Span = math.op[Span]
#let amat = math.mat.with(augment: -1)

#maketitle(
  title: "אלגברה לינארית 1א - תרגול",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 3, month: 4, year: 2025).display("[day].[month].[year]"),
)

= פרישה

$
  Span{v_1,...,v_n} = {sum_(i=1)^n a_i v_i | a_i in FF}
$

== תרגיל

+ יהי
  $U$
  תת"מ ו-$W$
  קבוצה סופית באותו מרחב. הוכיחו:

  $
    Span(S) subset.eq U <=> S subset.eq U
  $

+ נתונות זוג קבוצות ב-$RR^3$:

  $
    S_1 = { mat(0;7;4), mat(7;0;-2) } \
    S_2 = { mat(-1;3;2), mat(2;1;0) }
  $

  הוכיחו או הפריכו:
  $Span(S_1) = Span(S_2)$

  מספיק לבדוק
  $S_1 subset.eq Span(S_2)$
  וגם
  $S_2 subset.eq Span(S_1)$.

=== טכניקה ב-$FF^n$

הווקטור
$v in FF^n$
נמצא ב-$Span{v_1, ..., v_n}$
אםם ישנם
$a_1, ..., a_n in FF$
כך ש-$sum_(i=1)^n a_i v_i = v$
או במילים אחרות
$a_i$
פותרות את מערכת המשוואות:

$
  amat(
    |, , |, |;
    v_1, ..., v_n, v;
    |, , |, |;
  )
$

=== פתרון
