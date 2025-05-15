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
  date: datetime(day: 13, month: 5, year: 2025).display("[day].[month].[year]"),
)

= מטריצה מייצגת

בהנתן
$T: V -> W$
העתקה לינארית,
$B = (v_1, ..., v_n)$
בסיס ל-$V$,
$C = (w_1, ..., w_m)$
בסיס ל-$W$:

$
  [T]_C^B = mat(
    |, , |;
    [T v_1]_c, ..., [T v_n]_C;
    |, , |;
  )
$

== טענה

לכל
$v in V$
מתקיים:

$
  [T v]_C = [T]_C^B dot [v]_B
$

== טענה

$
  dim Im T = rank([T]_C^B) \
  dim Ker T = dim Null([T]_C^B) \
$

== משפט

יהיו
$U,V,W$
מרחבים ווקטוריים ממימד
$n,m,k$
בהתאמה. תהיינה
$S: U -> V, T: V -> W$
העתקות לינאריות. נסמן
$(u), (v), (w)$
בסיסים סדורים ל-$U,V,W$
בהתאמה. אז המטריצה המייצגת של
$T compose S : U -> W$:

$
  [T compose S]_((w))^((u)) = [T]_((w))^((v)) dot [S]_((v))^((u))
$

=== הוכחה

נסמן
$[S] = (b_(ell j))_(m times n), [T] = (a_i ell)_(k times m)$,
ו-$(w) = (w_1, ..., w_k), (u) = (u_1, ..., u_n), (v) = (v_1, ..., v_m)$.
אז לכל
$j$:

$
  S(u_j) = sum_(ell=1)^m b_(ell j) dot v_ell \
  arrow.b.double \
  T(S(u_j))
  = sum_(ell=1)^m b_(ell j) T(v_ell)
  = sum_(ell=1)^m b_(ell j) (sum_(i=1)^k a_(i ell) w_i)
  = sum_(ell=1)^m (sum_(i=1)^k a_(i ell) b_(ell j)) w_i \
  arrow.b.double \
  [T S (u_j)]_((w)) = mat(
    sum_(ell=1)^m a_(1 ell) dot b_(ell j);
    dots.v;
    sum_(ell=1)^m a_(k ell) dot b_(ell j);
  )
$

בפרט, בשורה מס'
$i$
ועמודה מס'
$j$
של
$[T S]$
רשום:

$
  sum_(ell=1)^m a_(i ell) b_(ell j) = ([T] dot [S])_(i j)
$


#[
  #import "@preview/mitex:0.2.5": mitext


  // @michael-ronin
  #mitext(```latex

  \subsection{דוגמא}

  \[
    T : \mathbb{R}^n \rightarrow \mathbb{R}^m \\
    S : \mathbb{R}^k \rightarrow \mathbb{R}^n \\
    A \in M_{n \times m}(\mathbb{R}) \\
    B \in M_{k \times n}(\mathbb{R}) \\
    T(x) = Ax \\
    S(y) = Ay \\
    [T] = A \\
    [S] = B \\
    T(S(y)) = A \cdot B \cdot y \\
    [TS] = A \cdot B
  \]

  ```)
]

= מטריצה מייצגת של העתקה הפכית

תהי
$T: V -> W$.
יהיו
$B$
בסיס ל-$V$
ו-$C$
בסיס ל-$W$.
אז מתקיים:

$
  [T^(-1)]_B^C = ([T]_C^B)^(-1)
$

== הוכחה

$
  I = [Id_v]_B^B = [T^(-1) compose T]_B^B = [T^(-1)]_B^C dot [T]_C^B
$

קבלנו ש-$[T^(-1)]_B^C = ([T]_C^B)^(-1)$.
