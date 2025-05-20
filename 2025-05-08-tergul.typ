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
  date: datetime(day: 8, month: 5, year: 2025).display("[day].[month].[year]"),
)

= תזכורת

פונקציה בין מ"ו מעל אותו שדה
$T: V -> U$
תקרא "העתקה לינארית" אם היא מקיימת:

$
  forall v_1, v_2 in V ds forall a,b in FF ds T(a v_1 + b v_2) = a T(v_1) + b T(v_2)
$

הגדרנו:

$
  Ker T := { v in V | T(v) = 0 } \
  Im T := { u in U | exists v in V ds} \
$

- אמרנו ש-$T$
  על אם
  $Im T = U$.

- אמרנו ש-$T$
  חח"ע אם לכל
  $v_1 != v_2$
  מתקיים
  $T(v_1) != T(v_2)$.

- אמרנו ש-$T$
  איזומורפיזם אם היא חח"ע ועל.

ראיתם בהרצאה:

- $Ker T = {0} <=> mtext("ע" "\"" "חח") T$

- עבור
  $T$
  בין מ"ו מאותו המימד שלושת התכונות שקולות
  (חח"ע, על, איזומורפיזם).

- ה"ל נקבעת לחלוטין ע"י התמונה של הבסיס ולכל סט תמונות:

  $
    T(v_1) = u_1 \
    dots.v \
    T(v_n) = u_n
  $

  ישנה ויחידה
  $T$
  שמקיימת סט משוואות זה.


= תרגיל

קבעו האם קיימת ה"ל
$T: RR_(<= 3)[x] -> <_(2 times 3)(RR)$
כך ש-

$
  T(x) = mat(
    1, 2, 3;
    0, 0, 0;
  ) \
  T(2 + x^3) = mat(
    1, 0, 3;
    0, 2, 0;
  ) \
  T(2 + x^3) = mat(
    1, 0, 3;
    0, 2, 0;
  ) \
  T(4 - x + 2x^3) = mat(
    1, 2, 3;
    0, 2, 0
  ) \
  T(x^2) = mat(
    1, 0, 0;
    0, 0, 0;
  )
$

== פתרון

$
  -1 dot x + 2 dot (2x + x^3) - 2 dot (4 - x + 2x^3) = 0 \
  -1 T(x) + 2 T(2x+x^3) - 2T(4-x+2x^3) = -1mat(
    1, 2, 3;
    0, 0, 0;
  ) + 2mat(
    1, 0, 3;
    0, 2, 0;
  ) - 2mat(
    1, 0, 3;
    0, 2, 0;
  ) = mat(
    -1, square.dotted, square.dotted;
    square.dotted, square.dotted, square.dotted;
  ) != 0
$

= שאלה ממועד א' 2020

תהי
$T: RR_2[x] arrow.turn.l$
המוגדרת להיות
$T(p) = a p'' + b p' + c p$.
מצאו את כל הערכים
$a,b,c$
עבורם
$T$
חח"ע.

== פתרון

נבדוק עבור איזה
$p(x) = A x^2 + B x + C$
מתקיים
$T(p) = 0$:

$
  T(p) = a dot 2A + b dot (2A x + B) + c dot (A x^2 + B x + C) = (C A)x^2 + (2b A + c B) + (c C + b B + 2a A)
$

$
  mat(
    c, b, 2a;
    0, c, 2b;
    0, 0, c;
  ) mat(
    A;
    B;
    C;
  ) = 0
$
#grid(
  columns: (1fr, 1fr),
  $
    arrow.br c = 0 \
    mat(
      0, b, 2a;
      0, 0, 2b;
      0, 0, 0;
    )
  $,
  $
    arrow.bl c != 0 \
    mat(
      c, b, 2a;
      0, c, 2b;
      0, 0, c;
    ) mat(
      1, b / c, 2a / c;
      0, 1, 2b / c;
      0, 0, 1;
    ) --> mat(1, 0, 0; 0, 1, 0; 0, 0, 1)&\
  $,
)

$arrow.l.double$
$T$
חח"ע אם"ם
$c != 0$.

= שאלה ממועד ב'

נסמן
${v_1,...,v_(2n)}$
בסיס של מ"ו
$V$.
הוכיחו כי קיים איזומורפיזם
$T : V arrow.turn$
המקיים
$T compose T = T^2 = -Id_V$.

== פתרון

$
  T(v_1) = -v_2 \
  T(v_2) = v_1 \
  T(v_3) = -v_4 \
  T(v_4) = v_3 \
  dots.v \
  T(v_(2n-1)) = -v_(2n) \
  T(v_(2n)) = -v_(2n-1) \
$


$T^2, Id_V$
ה"ל המקיימות:

$
  underbrace(S)(v_(2n))
$
