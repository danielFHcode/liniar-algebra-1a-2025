#import "@preview/rubber-article:0.3.1": maketitle, article

#show: article.with(lang: "he")

#show math.equation.where(block: true): set block(breakable: true)
#show math.equation.where(block: false): box
#set text(font: "David CLM")

#let ds = $. space$
#let mtext = text.with(font: "David CLM")
#let Span = math.op[Span]
#let rank = math.op[rank]
#let amat = math.mat.with(augment: -1)
#let tab = $space space space space$

#maketitle(
  title: "אלגברה לינארית 1א - תרגול",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 6, month: 5, year: 2025).display("[day].[month].[year]"),
)

= משפט

תהי
$A in M_(m times n)(FF)$,
הוכיחו:

$
  rank(A) = min{ k in NN | exists B in M_(m times k)(FF), C in M_(k times n)(FF) ds A = B C }
$

כלומר:

$
  A_(i j) = sum_ell B_(i ell) C_(ell j)
$

== פתרון

אם
$rank(A) = r$
אז קיים בסיס
${v_1, ..., v_r} subset.eq F^m$
ל-$C(A)$.
נסמן ב-$A_i$
את העמודה ה-$i$
של
$A$.
מכיוון שהבסיס פורש את
$C(A)$
ישנם
$alpha_(i 1), ..., alpha_(i r)$
כך ש-$sum_(j=1)^r alpha_(i j) v_j = A_i$
אם נסמן ב-$B$
את המטריצה שעמודותיה הן
$v_1, ..., v_r$,
אז מתקיים:

$
  forall i ds B dot mat(alpha_(i 1); dots.v; alpha_(i r)) = A_i => B mat(
    alpha_(1 1), ..., alpha_(r 1);
    dots.v, dots.down, dots.v;
    alpha_(1 n), ..., alpha_(r n);
  ) = mat(
    |, , |;
    A_1, ..., A_n;
    |, , |;
  ) = A
$

נראה כעט ש-$r$
הוא אכן המינימלי. נניח בשלילה שישנן
$B in M_(m times k)(FF), C in M_(k times n)(FF)$
כך ש-$A = B C$
וגם
$k < r$.
אז מתקיים:

$
  rank(A) = rank(B C) <= rank(B) <= k
$

== תרגיל

תהי
$A in M_(n)(FF)$
כך ש-$rank(A) = 1$.
הוכיחו שקיים
$lambda in FF$
כך ש-$A^2 = lambda A$.

=== פתרון

מהטענה הקודמת ישנן
$B M_(n times 1)(FF), C in M_(1 times n)(FF)$
כך ש-$A = B C$,
לכן:

$
  B underbrace(C dot B, := lambda) C = lambda B C = lambda A
$

= משפט הדרגה

תהי
$A in M_(m times n)$
ונסמן ב-$N(A)$
את מרחב הפתרונות של
$amat(A, 0)$,
אז מתקיים:

$
  dim N(A) + rank(A) = n
$

== תרגיל

הוכיחו שאם
$A in M_(m times n)(RR), B in M_(n times k)(RR)$
ומתקיים
$A B = 0$
אז
$rank(A) + rank(B) <= n$.

=== פתרון

מהנתון עמודות
$B$
נמצאות ב-$N(A)$
לכן
$C(B) subset.eq N(A)$.
ממשפט הדרגה:

$
  n - rank(A) = dim(N(A)) >= dim(C(B)) = rank(B)
$

== תרגיל

הוכיחו שלכל
$A in M_(m times n)(RR)$
מתקיים
$rank(A) = rank(A^tack.b A)$.

=== פתרון

ידוע כבר כי
$rank(A^tack.b A) <= rank(A)$
לכן נשאר להוכיח
$rank(A^tack.b A) >= rank(A)$.

גם ל-$A$
וגם ל-$A^tack.b A$
יש
$n$
עמודות, לכן ממשפט הדרגה מספיק להוכיח
$dim(N(A)) = dim(N(A^tack.b A))$.
כדי להוכיח את אי השוויון מספיק להראות
$N(A) supset.eq N(A^tack.b A)$.
יהי
$V in N(A^tack.b A)$
כלומר
$(A^tack.b A)V = 0$,
נרצה להראות
$v in N(A)$
כלומר
$A V = 0$.
טריק - נכפול משמאל ב-$V^tack.b$
ונקבל
$RR in.rev (A V)^tack.b (A V) = V^tack.b A^tack.b A V = 0$.

$
  [(A V)^tack.b (A V)]_(1 1) = sum_ell [(A V)^tack]_(1 ell) [(A V)]_(ell 1) = sum_(ell) [A V]_(ell 1) [A V]_(ell 1) = sum_ell [A V]^2_(ell 1) = 0
$


_הערה:_
עבור
$v in FF^n$
מתקיים
$v^tack.b v = sum_ell v_(ell 1)^2 = |v|^2$.

= העתרות לינאריות

תזכורת - יהי
$U,V$
מ"ו מעל אותו
$FF$
ו-$T: V -> U$.
נאמר ש-$T$
"העתקה לינארית"
אם היא מקיימת:

$
  forall v_1, v_2 in V ds forall a,b in FF ds T(a v_1 + b v_2) = a T(v_1) + b T(v_2)
$

מיידית נובע מכך ש-$T(0) = 0$.
