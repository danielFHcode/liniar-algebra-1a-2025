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
#let amat = math.mat.with(augment: -1)
#let tab = $space space space space$

#maketitle(
  title: "אלגברה לינארית 1א",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 24, month: 4, year: 2025).display("[day].[month].[year]"),
)

= מרחב שורות

בהנתן מטריצה
$M_(m times n)(FF)$
ניתן להסתכל על שורות המטריצה כוקטורים ב-$FF^n$.

$
  A = mat(
    -, v_1, -;
    , dots.v, ;
    -, v_m, -;
  )
$

מרחב השורותת של
$A$:

$
  Row(A) = Span{v_1, ..., v_m} \
  dim Row(A) <= min(m,n)
$

== טענה

פעולות שורה אלמנטריות שומרות על מרחב השורות.

=== הוכחה

נוודא שהפעולה
$R_i -> R_i + lambda R_j$
לא משנה את המרחב.

לאחר הפעולה נקבל את הקבוצה
${v_1, ..., v_i + lambda v_i, v_(i+1), ..., v_m}$.
אם
$u in Span{v_1, ..., v_m}$
אז:

$
  u
  &= L_1 v_1 + ... + L_i v_i + L_(i+1) v_(i+1) + ... + L_m v_m \
  &= L_1 v_1 + ... + L_i(v_i + lambda v_j) + L_(i+1) V_(I+1) + ... + (L_j - L_i lambda)v_j + ... + L_m u_m \
  &in Span{v_1, ..., v_i + lambda v_i, v_(i+1), ..., v_m} \
$

הראינו ש-$Row(A) subset.eq Span{v_1, ..., v_i + lambda v_i, v_(i+1), ..., v_m}$.
נוכיח את הכיוון ההפוך:

$
  u
  &= L_1 v_1 + ... + L_i (v_i + lambda v_j) + ... + L_m v_m \
  &= L_1 v_1 + ... + L_i v_i + ... + (L_j + L_i lambda) v_j + ... + L_m v_m \
  &in Row(A)
$

=== מסקנה

אם
$A$
שקולת שורות ל-$B$
אז:

$
  Row(A) = Row(B)
$

=== מסקנה

כדי למצוא את בסיס ל-$Row(A)$
מספיק לדרג את
$A$
לצורה קנונית ולקחת שורות שאינן
$0$.

=== מסקנה

בהנתן תת-מרחב של
$FF^n$,
$V = Span{v_1, ..., v_m}$.
ניתן למצוא ל-$V$
בסיס ע"י דירוג מטריצה ששורתיה הן
$v_1, ..., v_m$.

=== דוגמא

$
  V = Span{mat(1;0;-3), mat(1;-2;-7), mat(1;2;1)} \
  A = mat(
    1, 0, -3;
    1, -2, -7;
    1, 2, 1;
  ) -> mat(
    1, 0, -3;
    0, -2, -4;
    0, 2, 4;
  ) -> mat(
    1, 0, -3;
    0, 1, 2;
    0, 0, 0;
  ) \
  V = Span{mat(1; 0; -3), mat(0; 1; 2)}
$

= מרחב עמודות

תהי
$A in M_(m times n)(FF)$.

$
  A = mat(
    |, , |;
    v_1, ..., v_n;
    |, , |;
  )
$

מרחב העמודות של
$A$:

$
  Col(A) = Span{v_1, ..., v_n} \
  dim Col(A) <= min(m,n) \
  Col(A) = Row(A^t) = { A u | u in FF^n } \
$

== דוגמא

$
  mat(
    1, 3, 2;
    0, -1, 1;
  ) dot mat(lambda_1; lambda_2; lambda_3)
  = mat(
    1lambda_1 + 3lambda_2 + 2lambda_3;
    0lambda_1 - 1lambda_2 + 1lambda_3;
  ) = lambda_1mat(1;0) + lambda_2mat(3;-1) + lambda_3mat(2;1)
$

== משפט הדרגה

תהי
$a in M_(m times n)(FF)$,
אז:

$
  dim Row(A) = dim Col(A)
$

=== הוכחה

יהי
$K <= min(m,n)$.
נראה שהטענות הבאות שקולות:

+ $dim Col(A) <= K$
+ ישנן
  $K$
  עמודות ב-$A$
  הפורשות את
  $Col(A)$.
+ קיימות
  $C in M_(m times K)(FF), R in M_(K times n)(FF)$
  כך ש-$A = C dot R$.
+ ישנן
  $K$
  שורות ב-$A$
  הפורשות את
  $Row(A)$.
+ $dim Row(A) <= K$

/ $1 => 2$\::
  $dim Col A <= K$.
  ניתן לבחור
  $dim Col A$
  עמודות הפורשות את
  $Col A$
  ולכן ניתן לבחור
  $K$
  עמודות הפורשות את
  $Col(A)$.

/ $2 => 3$\::
  נסמן
  $C_1, ..., C_k$
  את העמודות הפורשות את
  $Col(A)$.
  נסמן ב-$A_1, ..., A_n$
  את כל העמודות של
  $A$.

  קיימים
  $lambda_(i j)$
  כך ש-$A_j = sum_(i=1)^K lambda_(i j) C_i$,
  כלומר:

  $
    mat(
      |, , |;
      A_1, ..., A_n;
      |, , |;
    ) = mat(
      |, , |;
      C_1, ..., C_k;
      |, , |;
    ) dot mat(
      lambda_(1 1), ..., lambda_(1 n);
      dots.v, dots.down, dots.v;
      lambda_(K 1), ..., lambda_(K n);
    )
  $

/ $1 => 3$\::
  נניח
  $A = C dot R$.
  כל עמודה של
  $A$
  היא צירוף לינארי של העמודות של
  $C$
  וב-$C$
  יש
  $K$
  עמודות ולכן
  $dim Col A <= K$.

באותו אופן נוכיח ש-$3,4,5$
שקולים.

סה"כ
$1 <=> 5$,
לכן לכל
$K <= min(n,m)$:

$
  dim Row A <= K <=> dim Col A <= K
$

ולכן:

$
  dim Row(A) = dim Col(A)
$

=== מסקנה

אם
$A ~ B$
אז:

$
  dim Col A = dim Col B
$

= דרגה

== הגדרה

תהי
$A in M_(m times n)(FF)$,
אז הדרגה של
$A$
היא:

$
  rank A = dim Row A = dim Col A
$

== תכונות של דרגה

+ אם
  $A ~ B$
  אז
  $rank A = rank B$.
+ $rank(A) = rank(A^t)$
+ $rank(A)$
  $=$
  מספר האיברים הפותחים בצורה הקנונית של $A$
  $=$
  מספר השורות שאינן שורות אפס במטריצה המדורגת.
+ $rank(A) <= min(m,n)$
+ תהי
  $A in M_n (FF)$,
  $A$
  הפיכה
  $<=>$
  $rank(A) = n$
+ $rank(A) = 0 <=> A = 0$
+ $rank(A B) <= min(rank(A), rank(B))$
+ $rank(A) <= rank(A) + rank(B)$

=== הוכחה

7. כל עמודה ב-$A B$
  היא (צירוף לינארי של העמודות של
  $A$
  כלומר כל עמודה ב-$A B$
  שייכת ל-$Col(A)$
  ולכן
  $Col(A B) subset.eq Col(A)$
  ומכאן
  $rank(A B) = dim Col(A B) <= dim Col(A) = rank(A)$.

  $
    Col((A B)^t) = Col(B^t A^t) subset.eq Col(B^t) \
    arrow.b.double \
    Row(A B) subset.eq Row(B) \
    arrow.b.double \
    rank(A B) = dim Row(A B) <= dim Row(B) = rank(B) \
  $

8. $A, B in M_n(m times n)(FF)$,
  נגדיר
  $C in M_(2m times 2n)(FF)$:

  $
    C = mat(
      A, |, 0;
      -, +, -;
      0, |, B;
     )
  $

  נסתכל על המכפלה:

  $
    mat(I_m, |, I_m) mat(
      A, |, 0;
      -, +, -;
      0, |, B;
     ) mat(I_m; -; I_m)
  $

  נשים לב ש-$rank mat(I_m, |, I_m) <= m, rank mat(I_n, |, I_n) <= n$.
  נפעיל על
  $m$
  השורות הראשונות ב-$C$
  את פעולות השורה הנדרשות בכדי לדרג את
  $A$
  לצורה הקנונית.
  נפעיל על
  $m$
  השורות האחרונות ב-$C$
  את פעולות השורה הנדרשות בכדי לדרג את
  $B$
  לצורה הקנונית.
  נקבל ש-$C$
  שקולת שורות למטריצה:

  $
    tilde(C) = mat(
      tilde(A), |, 0;
      -, +, -;
      0, |, tilde(B);
     )
  $

  כאשר
  $tilde(A), tilde(B)$
  הן הצורות הקנונית של
  $A, B$
  בהתאמה.
  ב-$tilde(A)$
  יש
  $rank(A)$
  שורות שונות מ-0.
  ב-$tilde(B)$
  יש
  $rank(B)$
  שורות שונות מ-0.
  לכן מספר השורות השנונות מ-0 ובת"ל ב-$C$
  הוא
  $rank(A) + rank(B)$.
  לפי תכונות של דרגה:

  $
    rank(mat(I_n | I_n) C mat(I_m; -; I_m)) <= min(m,n,rank(A) + rank(B)) \
    mat(
      A, |, 0;
      -, +, -;
      0, |, B;
    ) mat(I_n; -; I_n) = mat(
      A I_n + 0 I_n;
      #line(length: 4.5em, stroke: (thickness: .05em));;
      0 I_n + B I_n;
    ) = mat(A; -; B) \
    C = mat(I_n, |, I_n) mat(A; -; B) = I_n A + I_n B = A + B
  $

=== מסקנה

תהיינה
$A, in M_(m times n)(FF), B in M_(n times n)(FF)$,
אם
$B$
הפיכה אז
$rank(A B) = rank(A)$.

==== הוכחה

לפי תכונות של דרגה:

$
  rank(A B) <= rank(A)
$

מצד שני:

$
  rank(A) = rank(A B B^(-1)) = rank((A B) B^(-1)) <= rank(A B)
$

$
  arrow.b.double \
  rank(A) = rank(A B)
$
