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
#let amat = math.mat.with(augment: -1)
#let tab = $space space space space$

#maketitle(
  title: "אלגברה לינארית 1א",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 15, month: 5, year: 2025).display("[day].[month].[year]"),
)

= תזכורת

== הגדרה

מטריצות
$C,C' in M_(m times n)(FF)$
נקראות שקולות אם יש
$P in M_(n)(FF)$
ו-$Q in M_(m)(FF)$
כך ש-$C' = Q^(-1) dot C dot P$.

== משפט

מטריצות
$C, C' in M_(m times n)(FF)$
שקולות אם ורק אם
$rank(C) = rank(C')$.

בפרט אם
$rank(C) = r$
אז
$C$
שקולה ל-

$
  (e_1, ..., e_r, 0, ..., 0) = mat(
    I_r, 0;
    0, 0;
  )
$

=== הוכחה

נניח כי
$C' = Q^(-1) dot C dot P$
ו-$Q in M_(m times n)(FF), P in M_(n times n)(FF)$
הפיכות.

הכפלה במטריצה הפכיה אינה משנה את הדרגה ולכן:

$
  rank(C) = rank(C')
$

#text(fill: red)[להפך, נניח כי
  $rank(C) = rank(C')$,
  נרצה להוכיח כי
  $C$]

נתבוננן ב-$C^tack.b in M_(n times m)(FF)$.
קיימת
$P_1 in M_(n)(FF)$
הפכיה כך ש-$P_1 C^tack.b$
מדורגת קנונית. אז
$rank(P_1 C^tack.b) = rank(C^tack.b) = rank(C)$
ולכן ה-$n-r$
שורות האחרונות של
$P_1 C^tack.b$
הם שורות אפסים. לכן
$n-1$
העמודות האחרונות של
$(P_1 C^tack.b)^tack.b = C P_1^tack.b$
הן עמודות אפסים. מפה קיימת
$Q_1 in M_(m times m)(FF)$
הפכיה כך ש-$Q_1 C P_1^tack.b$
מדורדת קנונית. אם היא מדרגה
$r$
וגם
$n-r$
עמודות אפסים. לכן
$r$
העמודות הראשונות שלה הן מובילות. מכאן:

$
  Q dot C dot P_1^tack.b = (e_1, ..., e_r, 0, ..., 0)
$

נסמן
$P = P_1^tack.b$
ו-$Q = Q_1^tack.b$
והיראנו


$
  Q^(-1) C P = (e_1, ..., e_r, 0, ...,0) = mat(
    I_r, 0;
    0, 0;
  )
$

באותו אופן קיימות
$Q', P'$
הפיכות כך ש-
$Q'^(-1) C' P' = mat(I_r, 0; 0, 0)$.
לכן:

$
  Q'^(-1) C' P' = Q'^(-1) C P
$

נכפיל מימין ב-$P'^(-1)$
ומשמאל ב-$Q'$:

$
  C' = Q' Q^(-1) C P P'^(-1) = (Q' Q^(-1)) C (P P'^(-1))
$

כיוון ש-$P,P'^(-1), Q,Q'^(-1)$
הפיכות
$C,C'$
שקולות.

== משפט

יהי
$V$
מ"ו עם בסיס
$B$.
תהי
$T: V -> V$
העתקה לינארית ותהי
$C = [T]_B^B$.

+ יהי
  $B'$
  בסיס של
  $V$.
  אז
  $[T]_B^B'$
  דומה ל-$C$.

+ תהי
  $C' in M_(m times n)(FF)$
  דומה ל-$C$.
  אז יש בסיס
  $B'$
  של
  $V$
  כך ש-$C' = [T]_B^B'$.

== משפט סלבסטר

תהיינה
$U ->^S V ->^T W$
העתקות לינאריות של מרחבים ווקטורים מעל שדה
$FF$.
נניח ש-$U,V$
נוצרים סופית, אז:

+ $dim Ker(T compose S) <= dim Ker(T) + dim Ker(S)$
+ $rank(T compose S) >= rank(T) + rank(S) - dim U$

=== הוכחה

+
   // #set par(justify: false)

  אם
  $u in Ker(S)$
  אז מתקיים כי
  $u in Ker(T compose S)$
  כיוון ש-$(T compose S)(u) = T(S(u)) = T(0) = 0$
  לכן
  $Ker(S) subset.eq Ker(T compose S) subset.eq U$.
  הגרעינים הם תתי מרחבים של
  $U$
  ולכן גם הם נוצרים סופית. נבחר בסיס ל-$Ker(S)$
  $u_1, ..., u_r$
  נבחר בסיס ל-$Ker(T compose S)$
  $u_1, ..., u_r, ..., r_q$,
  נבחר בסיס ל-$U$
  $u_1, ..., u_r, ..., u_q, ..., u_m$.
  בהוכחה של משפט המימד (משפט 6.16 בספר) הראינו שהסדרה
  $S(u_(r+1)), ..., S(u_q), ..., S(u_m)$
  היא הבסיס ל-$Im S$.
  בפרט
  $S(u_(r+1)), ..., S(u_q)$
  בת"ל אבל איבריה בתוך
  $Ker(T)$
  כי:

  $
    u_(r+1), ..., u_q in Ker(T compose S)
  $

  ולכן:

  $
    dim Ker(T) >= q-r = dim Ker(T compose S) - dim Ker(S) \
    dim Ker(T) >= dim Ker(T compose S) - dim Ker(S) \
  $

+ ידוע:

  + $
      dim Ker(T compose S) = dim U - rank(T compose S)
    $

  + $
      dim Ker(S) = dim U - rank(S)
    $

  + $
      dim Ker(T) = dim V - rank(T)
    $

  לכן:

  $
    dim V - rank(T compose S) <= dim V - rank(T) + dim U - rank(S) \
    rank(T compose S) >= rank(T) + rank(S) - dim V
  $

== מסקנה

תהיינה
$A in M_(m times p), B in M_(p times n)(FF)$
אזי:

$
  rank(A dot B) >= rank(A) + rank(B) - p
$

=== הוכחה

נבחן מ"ו
$U,V,W$
מעל
$FF$
בעלי מימד
$n,p,m$
ובסיסים
$A,B,C$.
לפי משפט 6.27 יש העתקות לינאריות
$U ->^S V ->^T W$
כך ש-$[S]_B^A = B, [T]_C^B = A$.
לפי משפט 6.30
$[T compose S]_C^A = A B$
לכן:

$
  rank(T compose S) = rank(A B), space rank(S) = rank(B), space rank(T) = rank(A)
$

ולכן הטענה נובעת ממשפט
6.46:

$
  rank(T compose S) >= rank(T) + rank(S) - dim V
$

= דטרמיננטות

== פונקציית נפח

=== מוטיבציה

+ עבור זוג ווקטורים
  $v_1, v_2$
  במישור נסמן ב-$N(v_1,v_2)$
  את השטח המסומן של המקבילית הנוצרת על ידי
  $v_1, v_2$
  החצים מהראשית.

+ באופן דומה עבור שלושה ווקטורים
  $v_1, v_2,v_3$
  במרחב נסמן
  $N(v_1,v_2,v_3)$
  את הנפח של המקבילון המתקבל על ידי
  $v_1, v_2, v_3$
  החצים מהראשית

#grid(
  columns: (1fr, 1fr),
  column-gutter: 5em,
  image("15-05-2025-imgs/a.excalidraw.svg"), image("15-05-2025-imgs/b.excalidraw.svg"),
)

כיצד נחשב אותם? האם יש הכללות של המושגים האלו ל-$RR^n$,
ואולי אפילו ל-$FF^n$
כאשר
$FF$
שדה כלשהו.

תכונות של פונקציה כזו:

+ $N(v_1, v_2) + N(v_1, v'_2) = N(v_1, v_2+v'_2)$

+ $forall a in FF ds N(a v_1, v_2) = a N(v_1, v_2) = N(v_1, a v_2)$

+ אם
  $v_1 = v_2$
  אז
  $N(v_1, v_2) = 0$.

+ $N(e_1, e_2) = 1$

=== הגדרה

יהי
$FF$
שדה. פונקציה
$N$
שמתאימה לכל
$n$
ווקטורים
$v_1, ..., v_n in FF^n$
ערך בשדה
$FF$
($N(v_1, ..., v_n) in FF$)
נקראץ פונקצית נפח על
$FF^n$
אם:

+ $N$
  מולטילינארי. כלומר:

  + לכל
    $1 <= i <= n$
    ולכל
    $v_1, ..., v_n, v'_i in FF^n$:

    $
      N(v_1, ..., v_(i-1), v_i + v'_i, ..., v_n) = N(v_1, ..., v_(i-1), v_i, ..., v_n) + N(v_1, ..., v_(i-1), v'_i, ..., v_n)
    $

  + לכל
    $1 <= i <= n$,
    לכל
    $v_1, ..., v_n in FF^n$
    ולכל
    $a in FF$:

    $
      N(v_1, ..., v_(i-1), a dot v_i, ..., v_n) = a dot N(v_1, ..., v_i, ...., v_n)
    $

+ אם שניים (לפחות) מבין הווקטורים
  $v_1, ..., v_n$
  שווים אז:

  $
    N(v_1, ..., v_n) = 0
  $

+ $N$
  מנורמלת:

  $
    N(e_1, ..., e_n) = 1
  $

עבור
$A in M_(n)(FF)$
נגדיר:

$
  N(A) = N(v_1, ..., v_n)
$

כאשר:

$
  A = mat(
    -, v_1, -;
    , dots.v, ;
    -, v_n, -;
  )
$

ולכן התנאי האחרון יהיה בצעם:

$
  N(I_n) = 1
$

=== דוגמא

נניח
$n=2$.
נגדיר:

$
  N(mat(a; b), mat(c; d)) = a d - b c
$


ובכתיב מטריצות:

$
  N mat(a, b; c, d) = a d - b c
$

זוהי פונקציית נפח:


+ $
    N((a,b) + (a',b'), (c,d))
    =& N((a+a', b+b'), (c,d)) \
    =& (a + a') dot d - (b+b') dot c \
    =& a d - b c + a' b - b' c \
    =& N((a,b),(c,d)) + N((a',b'),(c,d)) \
  $

השאר נשאר כתרגיל לקורא.

=== טענה

תהי
$P$
פעולה אלמנטרית, אז
$N(P(A)) = beta N(A)$,
כאשר:

#let bcases(..args) = math.cases(..args.pos().map(((s, c)) => $#s\, &tab #c$))

$
  beta = bcases(
    -1, P = P_(k ell);
    alpha, P = P_(k)(alpha);
    1, P_(k ell)(lambda);
  )
$

כאשר
$P_(k ell)$
זה החלפלת השורה ה-$k$
וה-$ell$,
$P_(k)(alpha)$
זה כפל השורה ה-$k$
ב-$alpha$,
ו-$P_(k ell)(lambda)$
זה הוספת השורה ה-$k$
מוכפלת ב-$lambda$
ל-$ell$.

