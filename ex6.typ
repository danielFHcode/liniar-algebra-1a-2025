#import "@preview/rubber-article:0.3.1": maketitle, article

#show: article.with(lang: "he", heading-numbering: none)

#show math.equation.where(block: true): set block(breakable: true)
#show math.equation.where(block: false): box
#set text(font: "David CLM")

#let ds = $. space$
#let mtext = text.with(font: "David CLM")
#let Span = math.op[Span]
#let amat = math.mat.with(augment: -1)
#let tab = $space space space space$
#let Sym = math.op[Sym]
#let ASym = math.op[ASym]

#maketitle(
  title: "אלגברה לינארית 1א - תרגיל בית 6",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 13, month: 5, year: 2025).display("[day].[month].[year]"),
)

= שאלה 1

עבור
$Sym_(n)(RR)$:

+ $
    0^tack.b = 0
  $
+ $
    A = A^tack.b \
    B = B^tack.b \
    arrow.b.double \
    (A + B)^tack.b = A^tack.b + B^tack.b = A + B \
  $

+ $
    A = A^tack.b \
    arrow.b.double \
    (lambda dot A)^tack.b = lambda dot A^tack.b = lambda dot A
  $

$
  dim Sym_(n)(RR)
  &= dim { A in M_(n)(RR) | A = A^tack.b } \
  &= dim { mat(
      a_(1 1), ..., a_(1 n);
      dots.v, dots.down, dots.v;
      a_(n 1), ..., a_(n n);
    ) in M_(n)(RR) | forall 1 <= i, j <= n ds a_(i j) = a_(j i) } \
  &= dim { mat(
      a_(1 1), ..., a_(1 n);
      dots.v, dots.down, dots.v;
      a_(n 1), ..., a_(n n);
    ) in M_(n)(RR) | forall 1 <= i <= j <= n ds a_(i j) = a_(j i) } \
  &= dim { mat(
      a_(1 1), ..., a_(1 n);
      dots.v, dots.up, dots.v;
      a_(n 1), ..., a_(1 1);
    ) | a_(1 1), ..., a_(1 n), a_(2 1), ..., a_(2 space (n-1)), ......, a_(n n) in RR } \
  &= dim Span {
    mat(
      1, ..., 0;
      dots.v, dots.up, dots.v;
      0, ..., 1
    ), ..., mat(
      0, ..., 1, 0;
      dots.v, dots.up, dots.v, dots.v;
      1, 0, ..., 0;
      0, 0, ..., 0;
    ), mat(
      0, ..., 1;
      dots.v, dots.up, dots.v;
      0, ..., 0;
    ), ..., mat(
      0, ..., 0;
      dots.v, dots.up, dots.v;
      1, ..., 0;
    )
  } \
  &= (n-1) + (n-2) + ... + 1 + n \
  &= 1 + ... + n \
  &= (n(n+1)) / 2 \
$

עבור
$ASym_(n)(RR)$:

+ $
    0^tack.b = 0 = -0
  $

+ $
    A^tack.b = -A \
    B^tack.b = -B \
    arrow.b.double \
    (A + B)^tack.b = A^tack.b + B^tack.b = -A - B = -(A + B)
  $

+ $
    A^tack.b = -A \
    arrow.b.double \
    (lambda dot A)^tack.b = lambda dot A^tack.b = lambda dot (-A) = -(lambda dot A)
  $

$
  dim ASym_(n)(RR)
  &= dim { A in M_(n)(RR) | A = -A^tack.b } \
  &= dim { mat(
      a_(1 1), ..., a_(1 n);
      dots.v, dots.down, dots.v;
      a_(n 1), ..., a_(n n);
    ) in M_(n)(RR) | forall 1 <= i, j <= n ds a_(i j) = -a_(j i) } \
  &= dim { mat(
      a_(1 1), ..., a_(1 n);
      dots.v, dots.down, dots.v;
      a_(n 1), ..., a_(n n);
    ) in M_(n)(RR) | forall 1 <= i <= j <= n ds a_(i j) = -a_(j i) } \
  &= dim { mat(
      a_(1 1), ..., a_(1 n);
      dots.v, dots.up, dots.v;
      a_(n 1), ..., -a_(1 1);
    ) | a_(1 1), ..., a_(1 n), a_(2 1), ..., a_(2 space (n-1)), ......, a_(n n) in RR } \
  &= dim Span {
    mat(
      1, ..., 0;
      dots.v, dots.up, dots.v;
      0, ..., -1
    ), ..., mat(
      0, ..., 1, 0;
      dots.v, dots.up, dots.v, dots.v;
      -1, 0, ..., 0;
      0, 0, ..., 0;
    ), mat(
      0, ..., 1;
      dots.v, dots.up, dots.v;
      0, ..., 0;
    ), ..., mat(
      0, ..., 0;
      dots.v, dots.up, dots.v;
      1, ..., 0;
    )
  } \
  &= (n-1) + (n-2) + ... + 1 + n \
  &= 1 + ... + n \
  &= (n(n+1)) / 2 \
$

= שאלה 2

$
  dim{ x in FF^n | A x = 0 }
  &= dim{ mat(x_1; dots.v; x_n) in FF^n | v_1 x + ... + v_k x } \
$
