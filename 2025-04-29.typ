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
  date: datetime(day: 29, month: 4, year: 2025).display("[day].[month].[year]"),
)


= המרחב המאפס של מטריצה

תהי
$A in M_(m times n)(FF)$.
המרחב המאפס של
$A$:

$
  "Null"(A) = { v in F^n | A v = 0 }
$

== דוגמא

$
  A = mat(
    1, 2, 0;
    0, 1, 1;
  ) \
  rank(A) = 2 \
  amat(
    1, 2, 0, 0;
    0, 1, 1, 0;
  ) \
  cases(
    x + 2y = 0,
    y + z = 0,
  ) \
  cases(
    y = -z,
    x = -2y = 2z,
  ) \
  "Null"(A) = { mat(2z; -z; z) | z in RR } = Span{mat(2;-1;1)} \
  dim "Null"(A) = 1
$

== משפט

תהי
$A in M_(m times n)(FF)$,
אז:

$
  rank(A) + dim "Null"(A) = n
$

=== הוכחה

נסמן
$dim "Null"(A) = k$.
יהי
${v_1, ..., v_k}$
בסיס ל-$"Null"(A)$.
נשלים לבסיס של
$FF^n$:

$
  B = {v_1, ..., v_k, w_1, ..., w_(n-k)}
$

יהי
$A dot u in Col(A)$
ונרשום:

$
  u = lambda_1 v_1 + ... + lambda_k v_k + L_1 w_1 + ... + L_(n - k) w_(n-k)
$

אז:

$
  A u = underbrace(A lambda_1 v_1 + ... + A lambda_k v_k, 0) + A L_1 w_1 + ... + A L_(n - k) w_(n-k)
$

כלומר:

$
  Col(A) = Span{A w_1, ..., A w_(n-k)}
$

נותר לבדוק ש-${A w_1, ..., A w_(n-k)}$
בת"ל.

נניח
$beta_1 A w_1 + ... beta_(n-k) A w_(n - k) = 0$
$arrow.l.double$
$A dot (beta_1 w_1 + ... beta_(n-k) w_(n - k)) = 0$.
כלומר
$beta_1 w_1 + ... + beta_(n-k) w_(n-k) in "Null"(A)$
ולכן קיימים
$lambda_1, ..., lambda_k$
כך ש-$beta_1 w_1 + ... + beta_(n-k) w_(n-k) = lambda_1 v_1 + ... + lambda_k v_k$
$arrow.l.double$
$beta_1 w_1 + ... + beta_(n-k) w_(n-k) - lambda_1 v_1 - ... - lambda_k v_k = 0$
אבל
${v_1, ..., v_k, w_1, ..., w_(n-k)}$
בסיס ולכן
$beta_1 = ... = beta_(n-k) = lambda_1 = ... = lambda_k = 0$

קיבלנו שהקבוצה
${A w+1, ..., A w_(n-k)}$
היא בסיס ל-$Col(A)$
$arrow.l.double$
$rank(A) = dim Col(A) = n - k$.

= העתקות לינאריות

== הגדרה

יהיו
$V,W$
מרחבים וקטוריים מעל שדה
$FF$.
פונקציה
$T: V -> W$
($V ->^T W$)
נקראת העתקה לינארית אם:

+ לכל
  $v_1, v_2 in V$:

  $
    T(v_1 + v_2) = T(v_1) + T(v_2)
  $

+ לכל
  $lambda in FF$
  ולכל
  $v in V$:

  $
    T(lambda v) = lambda T(v)
  $

== דוגמאות

+ $
    T : RR^2 -> RR^2 \
    T mat(x;y) = mat(x;0) \
    T(mat(x_1;y_1) + mat(x_2;y_2)) = mat(x_1 + x_2; 0) = T mat(x_1; y_1) + T mat(x_2; y_2)
  $

+ $
    T : RR^n -> R_(n-1)[x] \
    T mat(a_0; dots.v; a_(n-1)) = a_0 + a_1 x + ... + a_(n-1)x^(n-1)
  $

+ תהי
  $A in M_(m times n)(FF)$.

  $
    T_A : FF^n -> FF^m \
    T_(A)(v) = A v
  $

  לדוגמא:

  $
    A = mat(
      1, 0;
      0, 0;
    ) \
    T_A mat(x;y) = mat(1,0; 0,0) mat(x;y) = mat(x;0)
  $

+ $
    T : RR_(n)[x] -> RR_(n-1)[x] \
    T(p(x)) = p'(x) \
    T(p(x) + q(x)) = (p(x) + q(x))' = p'(x) + q'(x) = T(p(x)) + T(q(x))
  $

+ יהי
  $V$
  מרחב ממימד
  $n$
  מעל
  $FF$
  ו-$B = (v_1, ..., v_n)$
  בסיס סדור ל-$V$.

  $
    T : V -> FF^n \
    T(v) = mat(d_1; dots.v; d_n)
  $

  כאשר
  $v = d_1 v_1 + ... + d_n v_n$.

  $mat(d_1; dots.v; d_n)$
  נקרא ווקטור הקורדינטות של
  $v$
  לפי בסיס
  $B$
  ומסומן ע"י
  $[v]_B$.
  אז:

  $
    [v + w]_B = [v]_B + [w]_B \
    [lambda dot v]_B = lambda dot [v]_B
  $

== טענה

תהי
$T: V -> W$
העתקה לינארית, אז:

+ $T(0) = 0$
+ $forall v in V ds T(-v) = -T(v)$

=== הוכחה

+ $T(0) = T(0 + 0) = T(0) + T(0) => T(0) = 0$
+ $0 = T(0) = T(v + (-v)) = T(v) + T(-v) => T(-v) = -T(v)$

== טענה

$T: V -> W$
העתרה לינארית אם"ם לכל
$u,w in V$
ולכל
$lambda, mu in FF$
מתקיים
$T(lambda u + mu w) = lambda T(u) + mu T(w)$.

=== מסקנה

לכל
$v_1, ..., v_m in V$
ולכל
$lambda_1, ..., lambda_m in FF$:

$
  T(lambda_1 v_1 + ... + lambda_m v_m) = lambda_1 T(v_1) + ... + lambda_m T(v_m)
$

