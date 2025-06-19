#import "@preview/rubber-article:0.3.1": maketitle, article
#import "@preview/xarrow:0.3.1": xarrow
#import "@preview/delimitizer:0.1.0"
#import "@preview/icu-datetime:0.1.2": fmt-date

#show: article.with(heading-numbering: none)

#let hebrew-ord(
  number,
  map: (
    (1, "א"),
    (2, "ב"),
    (3, "ג"),
    (4, "ד"),
    (5, "ה"),
    (6, "ו"),
    (7, "ז"),
    (8, "ח"),
    (9, "ט"),
    (10, "י"),
    (20, "כ"),
    (30, "ל"),
    (40, "מ"),
    (50, "נ"),
    (60, "ס"),
    (70, "ע"),
    (80, "פ"),
    (90, "צ"),
    (100, "ק"),
    (200, "ר"),
    (300, "ש"),
    (400, "ת"),
  ),
) = {
  let number = number
  let ord = ""
  for (num, ch) in map.rev() {
    ord += calc.div-euclid(number, num) * ch
    number = calc.rem(number, num)
  }
  ord = ord.replace("יה", "טו").replace("יו", "טז")
  if ord.codepoints().len() > 1 {
    ord = ord.codepoints().slice(0, -1).join() + "\"" + ord.codepoints().last()
  }
  return ord
}

#set enum(numbering: num => hebrew-ord(num) + ".")
#show math.equation.where(block: true): set block(breakable: true)
#set text(font: "David CLM", lang: "he")
// #set enum(numbering: "(1.a)")
#let ds = $. space$
#let mtext = text.with(font: "David CLM")
#let Span = math.op[Span]
#let amat = math.mat.with(augment: -1)
#let dmat = math.mat.with(delim: "|")
#let tab = $space space space space$
#let Sym = math.op[Sym]
#let ASym = math.op[ASym]
#let Col = math.op[Col]
#let Row = math.op[Row]
#let Null = math.op[Null]
#let rank = math.op[rank]
#let Ker = math.op[Ker]
#let Im = math.op[Im]
#let Id = math.op[Id]
#let adj = math.op[adj]
#let sgn = math.op[sgn]

#let bcases(..cases) = math.cases(
  ..cases.named(),
  ..cases.pos().map(arr => arr.join($&tab$))
)

#maketitle(
  title: "אלגברה לינארית 1א - תרגיל בית 10",
  authors: ("דניאל פ.ח.",),
  date: fmt-date(datetime(day: 10, month: 6, year: 2025), locale: "he", length: "medium"),
)

= שאלה 1

+ $
    cases(
      a_2 alpha_1^2 + a_1 alpha_1 + a_0 &= 0,
      a_2 alpha_2^2 + a_1 alpha_2 + a_0 &= 0,
    )
  $
  $
    (alpha_1^2 - alpha_1 alpha_2) a_2 + (1 - alpha_1/alpha_2) a_0 &= 0 \
    alpha_1 (alpha_1 - alpha_2) a_2 + (alpha_2 - alpha_1)/alpha_2 a_0 &= 0 \
    (alpha_2 - alpha_1)/alpha_2 a_0 &= alpha_1 (alpha_2 - alpha_1) a_2 \
    a_0 &= alpha_1 alpha_2 a_2 \
  $
  $
    a_2 alpha_2^2 + a_1 alpha_2 + alpha_1 alpha_2 a_2 &= 0 \
    a_2 alpha_2 + a_1 + alpha_1 a_2 &= 0 \
    (alpha_2 + alpha_1) a_2 + a_1 &= 0 \
    a_1 &= -(alpha_2 + alpha_1) a_2 \
  $

  בצורה דומה
  $b_0 = beta_1 beta_2 b_2$
  ו-$b_1 = -(beta_2 + beta_1) b_2$.

  $
    &dmat(
      a_2, a_1, a_0, 0;
      0, a_2, a_1, a_0;
      b_2, b_1, b_0, 0;
      0, b_2, b_1, b_0;
    ) \
    =& dmat(
      a_2, -(alpha_2 + alpha_1) a_2, alpha_1 alpha_2 a_2, 0;
      0, a_2, -(alpha_2 + alpha_1) a_2, alpha_1 alpha_2 a_2;
      b_2, -(beta_2 + beta_1) b_2, beta_1 beta_2 b_2, 0;
      0, b_2, -(beta_2 + beta_1) b_2, beta_1 beta_2 b_2;
    ) \
    =& a_2^2 b_2^2 dmat(
      1, -(alpha_2 + alpha_1), alpha_1 alpha_2, 0;
      0, 1, -(alpha_2 + alpha_1), alpha_1 alpha_2;
      1, -(beta_2 + beta_1), beta_1 beta_2, 0;
      0, 1, -(beta_2 + beta_1), beta_1 beta_2;
    ) \
    // =& sum_(i=1)^4 sum_(j=1)^4 (-1)^(i+j) [mat(
    //   1, -(alpha_2 + alpha_1), alpha_1 alpha_2, 0;
    //   0, 1, -(alpha_2 + alpha_1), alpha_1 alpha_2;
    //   1, -(beta_2 + beta_1), beta_1 beta_2, 0;
    //   0, 1, -(beta_2 + beta_1), beta_1 beta_2;
    // )]_(i j) det mat(
    //   1, -(alpha_2 + alpha_1), alpha_1 alpha_2, 0;
    //   0, 1, -(alpha_2 + alpha_1), alpha_1 alpha_2;
    //   1, -(beta_2 + beta_1), beta_1 beta_2, 0;
    //   0, 1, -(beta_2 + beta_1), beta_1 beta_2;
    // ) \
    // =& (-1)^(1+1) dot 1 dot dmat(
    //   a_2, -(alpha_2 + alpha_1) a_2, alpha_1 alpha_2 a_2;
    //   -(beta_2 + beta_1) b_2, beta_1 beta_2 b_2, 0;
    //   b_2, -(beta_2 + beta_1) b_2, beta_1 beta_2 b_2;
    // ) + (-1)^(1+2) dot 1 dot dmat(
    //   0, -(alpha_2 + alpha_1) a_2, alpha_1 alpha_2 a_2;
    //   b_2, beta_1 beta_2 b_2, 0;
    //   0, -(beta_2 + beta_1) b_2, beta_1 beta_2 b_2;
    // ) \
    =& a_2^2 b_2^2 dmat(
      1, -(alpha_2 + alpha_1), alpha_1 alpha_2, 0;
      0, 1, -(alpha_2 + alpha_1), alpha_1 alpha_2;
      0, alpha_1 + alpha_2 - beta_2 - beta_1, beta_1 beta_2 - alpha_1 alpha_2, 0;
      0, 1, -(beta_2 + beta_1), beta_1 beta_2;
    ) \
    =& a_2^2 b_2^2 dmat(
      1, 0, 0, 0;
      0, 1, -(alpha_2 + alpha_1), alpha_1 alpha_2;
      0, alpha_1 + alpha_2 - beta_2 - beta_1, beta_1 beta_2 - alpha_1 alpha_2, 0;
      0, 1, -(beta_2 + beta_1), beta_1 beta_2;
    ) \
    =& a_2^2 b_2^2 dmat(
      1, 0, 0, 0;
      0, 1, -(alpha_2 + alpha_1), alpha_1 alpha_2;
      0, 0, beta_1 beta_2 - alpha_1 alpha_2 + (alpha_1 + alpha_2)(alpha_1 + alpha_2 - beta_2 - beta_1), -alpha_1 alpha_2 (alpha_1 + alpha_2 - beta_2 - beta_1);
      0, 0, alpha_1 + alpha_2 - beta_2 - beta_1, beta_1 beta_2 - alpha_1 alpha_2;
    ) \
    =& a_2^2 b_2^2 dmat(
      1, 0, 0, 0;
      0, 1, 0,0;
      0, 0, beta_1 beta_2 - alpha_1 alpha_2 + (alpha_1 + alpha_2)(alpha_1 + alpha_2 - beta_2 - beta_1), -alpha_1 alpha_2 (alpha_1 + alpha_2 - beta_2 - beta_1);
      0, 0, alpha_1 + alpha_2 - beta_2 - beta_1, beta_1 beta_2 - alpha_1 alpha_2;
    ) \
    =& a_2^2 b_2^2 (beta_1 beta_2 - alpha_1 alpha_2 + (alpha_1 + alpha_2)(alpha_1 + alpha_2 - beta_2 - beta_1)) dmat(
      1, 0, 0, 0;
      0, 1, 0,0;
      0, 0, 1, (-alpha_1 alpha_2 (alpha_1 + alpha_2 - beta_2 - beta_1))/(beta_1 beta_2 - alpha_1 alpha_2 + (alpha_1 + alpha_2)(alpha_1 + alpha_2 - beta_2 - beta_1));
      0, 0, alpha_1 + alpha_2 - beta_2 - beta_1, beta_1 beta_2 - alpha_1 alpha_2;
    ) \
    =& a_2^2 b_2^2 (beta_1 beta_2 - alpha_1 alpha_2 + (alpha_1 + alpha_2)(alpha_1 + alpha_2 - beta_2 - beta_1)) dmat(
      1, 0, 0, 0;
      0, 1, 0,0;
      0, 0, 1, (-alpha_1 alpha_2 (alpha_1 + alpha_2 - beta_2 - beta_1))/(beta_1 beta_2 - alpha_1 alpha_2 + (alpha_1 + alpha_2)(alpha_1 + alpha_2 - beta_2 - beta_1));
      0, 0, 0, beta_1 beta_2 - alpha_1 alpha_2 + (alpha_1 alpha_2 (alpha_1 + alpha_2 - beta_2 - beta_1)^2)/(beta_1 beta_2 - alpha_1 alpha_2 + (alpha_1 + alpha_2)(alpha_1 + alpha_2 - beta_2 - beta_1));
    ) \
    =& a_2^2 b_2^2 (beta_1 beta_2 - alpha_1 alpha_2 + (alpha_1 + alpha_2)(alpha_1 + alpha_2 - beta_2 - beta_1)) dmat(
      1, 0, 0, 0;
      0, 1, 0,0;
      0, 0, 1, 0;
      0, 0, 0, beta_1 beta_2 - alpha_1 alpha_2 + (alpha_1 alpha_2 (alpha_1 + alpha_2 - beta_2 - beta_1)^2)/(beta_1 beta_2 - alpha_1 alpha_2 + (alpha_1 + alpha_2)(alpha_1 + alpha_2 - beta_2 - beta_1));
    ) \
    =& a_2^2 b_2^2 (beta_1 beta_2 - alpha_1 alpha_2 + (alpha_1 + alpha_2)(alpha_1 + alpha_2 - beta_2 - beta_1)) (beta_1 beta_2 - alpha_1 alpha_2 + (alpha_1 alpha_2 (alpha_1 + alpha_2 - beta_2 - beta_1)^2)/(beta_1 beta_2 - alpha_1 alpha_2 + (alpha_1 + alpha_2)(alpha_1 + alpha_2 - beta_2 - beta_1))) \
    =& a_2^2 b_2^2 ((beta_1 beta_2 - alpha_1 alpha_2 + (alpha_1 + alpha_2)(alpha_1 + alpha_2 - beta_2 - beta_1)) dot (beta_1 beta_2 - alpha_1 alpha_2) + alpha_1 alpha_2 (alpha_1 + alpha_2 - beta_2 - beta_1)^2) \
    =& a_2^2 b_2^2 ((beta_1 beta_2 cancel(- alpha_1 alpha_2) + alpha_1^2 + alpha_2 alpha_1 - beta_2 alpha_1 - beta_1 alpha_1 cancel(+ alpha_1 alpha_2) + alpha_2^2 - beta_2 alpha_2 - beta_1 alpha_2) dot (beta_1 beta_2 - alpha_1 alpha_2) + alpha_1 alpha_2 (alpha_1 + alpha_2 - beta_2 - beta_1)^2) \
    =& a_2^2 b_2^2 ((alpha_1^2 + alpha_2^2 + beta_1 beta_2 + alpha_2 alpha_1 - beta_2 alpha_1 - beta_1 alpha_1 - beta_2 alpha_2 - beta_1 alpha_2) dot (beta_1 beta_2 - alpha_1 alpha_2) \
    &tab + alpha_1 alpha_2 (alpha_1^2 + alpha_2 alpha_1 - beta_2 alpha_1 - beta_1 alpha_1 + alpha_1 alpha_2 + alpha_2^2 - beta_2 alpha_2 - beta_1 alpha_2 - alpha_1 beta_1 - alpha_2 beta_1 + beta_2 beta_1 + beta_1^2 - alpha_1 beta_2 - alpha_2 beta_2 + beta_2^2 + beta_1 beta_2 )) \
    =& a_2^2 b_2^2 ((alpha_1^2 + alpha_2^2 + beta_1 beta_2 + alpha_2 alpha_1 - beta_2 alpha_1 - beta_1 alpha_1 - beta_2 alpha_2 - beta_1 alpha_2) dot (beta_1 beta_2 - alpha_1 alpha_2) \
    &tab + alpha_1 alpha_2 (alpha_1^2 + alpha_2^2 + beta_1^2 + beta_2^2 + 2alpha_2 alpha_1 - 2beta_2 alpha_1 - 2beta_1 alpha_1 - 2beta_2 alpha_2 - 2beta_1 alpha_2 + 2beta_2 beta_1)) \
    =& a_2^2 b_2^2 ((alpha_1^2 + alpha_2^2 + beta_1 beta_2 + alpha_2 alpha_1 - beta_2 alpha_1 - beta_1 alpha_1 - beta_2 alpha_2 - beta_1 alpha_2) dot beta_1 beta_2 \
    &tab + (cancel(alpha_1^2) cancel(+ alpha_2^2) + beta_1^2 + beta_2^2 + 2alpha_2 alpha_1 - 2beta_2 alpha_1 - 2beta_1 alpha_1 - 2beta_2 alpha_2 - 2beta_1 alpha_2 + 2beta_2 beta_1 \
    &tab tab tab tab cancel(- alpha_1^2) cancel(- alpha_2^2) - beta_1 beta_2 - alpha_2 alpha_1 + beta_2 alpha_1 + beta_1 alpha_1 + beta_2 alpha_2 + beta_1 alpha_2) dot alpha_1 alpha_2) \
    =& a_2^2 b_2^2 ((alpha_1^2 + alpha_2^2 + beta_1 beta_2 + alpha_2 alpha_1 - beta_2 alpha_1 - beta_1 alpha_1 - beta_2 alpha_2 - beta_1 alpha_2) dot beta_1 beta_2 \
    &tab + (beta_1^2 + beta_2^2 + beta_2 beta_1 + alpha_2 alpha_1 - beta_2 alpha_1 - beta_1 alpha_1 - beta_2 alpha_2 - beta_1 alpha_2) dot alpha_1 alpha_2) \
    =& a_2^2 b_2^2 (alpha_1^2 beta_1 beta_2 + alpha_2^2 beta_1 beta_2 + beta_1^2 alpha_1 alpha_2 + beta_2^2 alpha_1 alpha_2 + (beta_1 beta_2 + alpha_2 alpha_1 - beta_2 alpha_1 - beta_1 alpha_1 - beta_2 alpha_2 - beta_1 alpha_2)(alpha_1 alpha_2 + beta_1 beta_2)) \
    =& a_2^2 b_2^2 (alpha_1^2 beta_1 beta_2 + alpha_2^2 beta_1 beta_2 + beta_1^2 alpha_1 alpha_2 + beta_2^2 alpha_1 alpha_2 + beta_1 beta_2 alpha_1 alpha_2 + alpha_2^2 alpha_1^2 - beta_2 alpha_1^2 alpha_2 - beta_1 alpha_1^2 alpha_2 - beta_2 alpha_2^2 alpha_1 - beta_1 alpha_2^2 alpha_1 \
      &tab tab tab tab tab tab tab tab tab tab tab tab tab tab space + beta_1^2 beta_2^2 + alpha_2 alpha_1 beta_1 beta_2 - beta_2^2 alpha_1 beta_1 - beta_1^2 alpha_1 beta_2 - beta_2^2 alpha_2 beta_1 - beta_1^2 alpha_2 beta_2) \
    =& a_2^2 b_2^2 (alpha_1^2 beta_1 beta_2 + alpha_2^2 beta_1 beta_2 + beta_1^2 alpha_1 alpha_2 + beta_2^2 alpha_1 alpha_2 + 2beta_1 beta_2 alpha_1 alpha_2 + alpha_2^2 alpha_1^2 - beta_2 alpha_1^2 alpha_2 - beta_1 alpha_1^2 alpha_2 - beta_2 alpha_2^2 alpha_1 - beta_1 alpha_2^2 alpha_1 \
      &tab tab tab tab tab tab tab tab tab tab tab tab tab tab tab tab tab tab tab + beta_1^2 beta_2^2 - beta_2^2 alpha_1 beta_1 - beta_1^2 alpha_1 beta_2 - beta_2^2 alpha_2 beta_1 - beta_1^2 alpha_2 beta_2) \
    =& a_2^2 b_2^2 product_(x in {alpha_1, -beta_1}) product_(y in {alpha_1, -beta_2}) product_(z in {alpha_2, -beta_1}) product_(w in {alpha_2, -beta_2}) x y z w \
    =& a_2^2 b_2^2 (alpha_1 - beta_1)(alpha_1 - beta_2)(alpha_2 - beta_1)(alpha_2 - beta_2) \
  $

+ אם
  $alpha_1$
  ו-$alpha_2$
  הם השורשים של
  $a_2 x^2 + a_1 x + a_0 = 0$
  ו-$beta_1$
  ו-$beta_2$
  הם השורשים של
  $b_2 x^2 + b_1 x + b_0 = 0$
  אז קיים פתרון למערכת המשוואות הנתונה אמ"מ
  ${alpha_1, alpha_2} inter {beta_1, beta_2} != emptyset$,
  כלומר אם:

  $
    & alpha_1 = beta_1 or alpha_1 = beta_2 or alpha_2 = beta_1 or alpha_2 = beta_2 \
    <==>& alpha_1 - beta_1 = 0 or alpha_1 - beta_2 = 0 or alpha_2 - beta_1 = 0 or alpha_2 - beta_2 = 0 \
    <==>& (alpha_1 - beta_1) (alpha_1 - beta_2) (alpha_2 - beta_1) (alpha_2 - beta_2) = 0 \
    mtext("כיוון שהם המקדם הראשון בפולינומים מדרגה שנייה") a_1,b_1 != 0 --> space <==>& a_1^2 b_1^2 (alpha_1 - beta_1) (alpha_1 - beta_2) (alpha_2 - beta_1) (alpha_2 - beta_2) = 0 \
    mtext("לפי הסעיף הקודם") --> space <==>& dmat(
      a_2, a_1, a_0, 0;
      0, a_2, a_1, a_0;
      b_2, b_1, b_0, 0;
      0, b_2, b_1, b_0;
    ) = 0
  $

+ קיים פתרון אמ"מ:

  $
    dmat(
      2, 3.66, 1.66, 0;
      0, 2, 3.66, 1.66;
      3, 8.49, 5.49, 0;
      0, 3, 8.49, 5.29;
    ) &= 0 \
    2 dmat(
      1, 1.83, 0.83, 0;
      0, 2, 3.66, 1.66;
      3, 8.49, 5.49, 0;
      0, 3, 8.49, 5.29;
    ) &= 0 \
    2 dmat(
      1, 1.83, 0.83, 0;
      0, 2, 3.66, 1.66;
      0, 3, 3, 0;
      0, 3, 8.49, 5.29;
    ) &= 0 \
    4 dmat(
      1, 1.83, 0.83, 0;
      0, 1, 1.83, 0.83;
      0, 0, -2.49, -2.49;
      0, 0, 3, 3;
    ) &= 0 \
    -9.96 dmat(
      1, 1.83, 0.83, 0;
      0, 1, 1.83, 0.83;
      0, 0, 1, 1;
      0, 0, 3, 3;
    ) &= 0 \
    -9.96 dmat(
      1, 1.83, 0.83, 0;
      0, 1, 1.83, 0.83;
      0, 0, 1, 1;
      0, 0, 0, 0;
    ) &= 0 \
    -9.96 dot 0 &= 0 \
    0 &= 0 space <-- mtext("נכון!") \
  $

= שאלה 2

+ אם שניים מבין
  $a$, $b$, $c$, $d$
  שווים אז יהיו שתי שורות שוות ואז הדטרמיננטה אפס.
  אם אחד מביניהם אפס אז יש שורת אפסים ואז הדטרמיננטה אפס. אחרת:

  $
    dmat(
      1, a, a^2, a^3;
      1, b, b^2, b^3;
      1, c, c^2, c^3;
      1, d, d^2, d^3;
    )
    &= dmat(
      1, a, a^2, a^3;
      0, b-a, b^2-a^2, b^3-a^3;
      0, c-a, c^2-a^2, c^3-a^3;
      0, d-a, d^2-a^2, d^3-a^3;
    ) \
    &= (b-a)(c-a)(d-a) dmat(
      1, a, a^2, a^3;
      0, 1, b+a, b^2+b\a+a^2;
      0, 1, c+a, c^2+a\c+a^2;
      0, 1, d+a, d^2+d\a+a^2;
    ) \
    &= (b-a)(c-a)(d-a) dmat(
      1, a, a^2, a^3;
      0, 1, b+a, b^2+b\a+a^2;
      0, 0, c-b, c^2+a\c-b\a-b^2;
      0, 0, d-b, d^2+d\a-b\a-b^2;
    ) \
    &= (b-a)(c-a)(d-a)(c-b)(d-b) dmat(
      1, a, a^2, a^3;
      0, 1, b+a, b^2+b\a+a^2;
      0, 0, 1, c+b+a;
      0, 0, 1, d+b+a;
    ) \
    &= (b-a)(c-a)(d-a)(c-b)(d-b) dmat(
      1, a, a^2, a^3;
      0, 1, b+a, b^2+b\a+a^2;
      0, 0, 1, c+b+a;
      0, 0, 0, d-c;
    ) \
    &= (b-a)(c-a)(d-a)(c-b)(d-b)(d-c) dmat(
      1, a, a^2, a^3;
      0, 1, b+a, b^2+b\a+a^2;
      0, 0, 1, c+b+a;
      0, 0, 0, 1;
    ) \
    &= (b-a)(c-a)(d-a)(c-b)(d-b)(d-c) dmat(
      1, 0, 0, 0;
      0, 1, 0, 0;
      0, 0, 1, 0;
      0, 0, 0, 1;
    ) \
    &= (b-a)(c-a)(d-a)(c-b)(d-b)(d-c)\
  $
  \

+ $
    dmat(
      1, 1, 1, 1;
      1, -1, 1, -1;
      1, 3, 9, 27;
      1, 7, 49, 343;
    )
    = dmat(
      1, 1, 1, 1;
      0, -2, 0, -2;
      0, 2, 8, 26;
      0, 6, 48, 342;
    )
    = -2 dmat(
      1, 1, 1, 1;
      0, 1, 0, 1;
      0, 2, 8, 26;
      0, 6, 48, 342;
    ) \
    = -2 dmat(
      1, 0, 1, 0;
      0, 1, 0, 1;
      0, 0, 8, 24;
      0, 0, 48, 336;
    )
    = -16 dmat(
      1, 0, 1, 0;
      0, 1, 0, 1;
      0, 0, 1, 3;
      0, 0, 48, 336;
    )
    = -16 dmat(
      1, 0, 0, -3;
      0, 1, 0, 1;
      0, 0, 1, 3;
      0, 0, 0, 192;
    ) \
    = -3,072 dmat(
      1, 0, 0, -3;
      0, 1, 0, 1;
      0, 0, 1, 3;
      0, 0, 0, 1;
    )
    = -3,072 dmat(
      1, 0, 0, 0;
      0, 1, 0, 0;
      0, 0, 1, 0;
      0, 0, 0, 1;
    )
    = -3,072
  $


= שאלה 3

$rank A = n-1$
ולכן השורות של
$A$
תלויות לינארית ולכן
$det A = 0$,
ולכן
$A dot adj A = 0$
אז
$Col adj A subset.eq Null A$
לכן
$rank adj A <= dim Null A = n-rank A = 1$.

בנוסף
$rank A = n-1$
לכן ניתן לבחור
$n-1$
מתוך שורותיו שיהיו בת"ל, ובפרט נאכל להוציא שורה אחת מ-$A$
כך ששורותיו יהיו בת"ל, אז נעשה זאת ונקבל מטריצה חדשה
$B$.
ל-$B$
יש
$n-1$
שורות והן בת"ל לכן
$rank B = n-1$,
לכן ניתן להוציא מ-$B$
עמודה אחת כך שעמודותיה יהיו בת"ל, נעשה זאת ונקבל מטריצה
$C$.
כיוון שעמודותיה של
$C$
בת"ל
$det C != 0$,
לכן כיוון ש-$C$
מינור של
$A$
אחד מערכיה של
$adj A$
לא יהיה
$0$
מה שאומר ש-$dim Null adj A < n$
ולכן
$rank adj A >= 1$
ולכן סה"כ
$rank adj A = 1$.

= שאלה 4

// $
//   A = mat(
//     a_(1 1), ..., a_(1 n);
//     dots.v, dots.down, dots.v;
//     a_(n 1), ..., a_(n n);
//   )
// $

// $dim Col A = dim Row A = rank A = n-1$
// לכן ניתן לצמצם את:

// $
//   mat(a_(1 1); dots.v; a_(n 1)), ..., mat(a_(1 n); dots.v; a_(n n))
// $

// לבסיס:

// $
//   mat(a_(1 1); dots.v; a_(n 1)), ..., mat(a_(1,j-1); dots.v; a_(n,j-1)), mat(a_(1,j+1); dots.v; a_(n,j+1)), ..., mat(a_(1 n); dots.v; a_(n n))
// $

// של
// $Col A$.
// בצורה דומה ניתן לצמצם את:

// $
//   mat(a_(1 1), ..., a_(1 n)), ..., mat(a_(n 1), ..., a_(n n))
// $

// לבסיס:

// $
//   mat(a_(1 1), ..., a_(1 n)), ..., mat(a_(i-1, 1), ..., a_(i-1, n)), mat(a_(i+1, 1), ..., a_(i+1, n)), ..., mat(a_(n 1), ..., a_(n n))
// $

// יהיו
// $t,k$,
// אז:

// $
//   mat(
//     a_(1 1);
//     dots.v;
//     a_(t-1, 1);
//     a_(t+1, 1);
//     dots.v;
//     a_(n 1);
//   ), ..., mat(
//     a_(1 n);
//     dots.v;
//     a_(t-1, n);
//     a_(t+1, n);
//     dots.v;
//     a_(n n);
//   )
// $

// גם ת"ל.

// = שאלה 4

// $
//   [A]_(i j) = bcases(
//     a_(i j), i <= j;
//     0, i > j;
//   ) \
//   abs(A) = a_(1 1) dot ... dot a_(n n) \
//   A^(-1) = adj(A)/abs(A) = adj(A)/(a_(1 1) dot ... dot a_(n n)) \
//   [adj(A)]_(i j) = (-1)^(i j) abs(A_(i j)) = bcases(
//     a_(i' j'), i' < i and j' < j;
//     a_(i'+1, j'), i' >= i and j' < j;
//     a_(i', j'+1), i' < i and j' >= j;
//     a_(i'+1, j'+1), i' >= i and j' >= j;
//   )
// $

// $
//   [A]_(i j) = bcases(
//     a_(i j), i <= j;
//     0, i > j;
//   ) \
// $
// $
//   [A_(i j)]_(i' j')
//   = bcases(
//     a_(i' j'), i' < i and j' < j;
//     a_(i'+1, j'), i' >= i and j' < j;
//     a_(i', j'+1), i' < i and j' >= j;
//     a_(i'+1, j'+1), i' >= i and j' >= j;
//   ) \

//   j < i => [A_(i j)]_(j j) = [A]_(j, j+1) = 0 => mtext("לא לכסין")
// $

נסתכל על
$A_(i j)$:

- אם
  $j < i$
  אז
  $[A_(i j)]_(j j) = [A]_(j, j+1) = 0$.
  לכן יהיו במטריצה שתי שורות ברצף עם
  $j+1$
  אפסים מובילים (השורות ה-$j$
  ו-$j+1$)
  ואף שורה עם
  $j$
  אפסים מובילים (ב-$A$
  $j$
  היא השורה היחידה עם
  $j$
  אפסים מובילים אבל כעט היא כבר לא) לכן לא ניתן לדרג את המטריצה ל-$I$
  ולכן
  $det A_(i j) = 0$

- אם
  $i <= j$
  אז לכל
  $1 <= k <= n-1$:

  $
    [A_(i j)]_(k k)
    &= bcases(
      [A]_(k k), k <= i and k <= j;
      [A]_(k-1, k), k > i and k <= j;
      [A]_(k, k-1), k <= i and k > j;
      [A]_(k-1, k-1), k > i and k > j;
    ) \
    &= bcases(
      [A]_(k k), k <= i and k <= j;
      [A]_(k-1, k), k > i and k <= j;
      [A]_(k, k-1), k <= i and k > j >= i;
      [A]_(k-1, k-1), k > i and k > j;
    ) \
    &= bcases(
      [A]_(k k), k <= i and k <= j;
      [A]_(k-1, k), k > i and k <= j;
      [A]_(k-1, k-1), k > i and k > j;
    ) \
    &= bcases(
      a_(k k), k <= i and k <= j;
      a_(k-1, k), k > i and k <= j;
      a_(k-1, k-1), k > i and k > j;
    ) \
    &> 0 \
  $

  לכן המטריצה עדיין משולשית עליונה ולכן
  $det A_(i j) = [A_(i j)]_(1 1) dot ... dot [A_(i j)]_(n-1,n-1) > 0$.

סה"כ לכל
$1 <= i, j <= n-1$
מתקיים ש-$[A^(-1)]_(i j) = [adj(A)]_(i j)/(det A)$
הינו אפס אמ"מ
$j < i$,
כלומר
$A^(-1)$
משולשית עליונה.

// אם אחד מבין
// $a_(1 1), ..., a_(n n)$
// אז יש במטריצה שורת אפסים ואז היא לא הפיכה שזו סתירה, לכן נאכל לחלק בהם.

// נשים לב כי לכל
// $i,j$,
// אם
// $i = j$:

// $
//   det A_(i j)
//   &= det A_(i i) \
//   &= dmat(
//     a_(1 1), ..., ..., ..., ..., a_(1 n);
//     dots.v, dots.down, , , , dots.v;
//     0, ..., a_(i-1, i-1), ..., ..., a_(i-1, n);
//     0, ..., 0, a_(i+1,i+1), ..., a_(i-1, n);
//     dots.v, , , dots.down, , dots.v;
//     dots.v, , , , dots.down, dots.v;
//     0, ..., ..., ..., ..., a_(n n);
//   ) \
//   &= dmat(
//     a_(1 1), 0, ..., ..., ..., 0;
//     dots.v, dots.down, , , , dots.v;
//     0, ..., a_(i-1, i-1), 0, ..., 0;
//     0, ..., 0, a_(i+1,i+1), ..., 0;
//     dots.v, , , dots.down, , dots.v;
//     dots.v, , , , dots.down, dots.v;
//     0, ..., ..., ..., ..., a_(n n);
//   ) \
//   &= a_(1 1) dot ... dot a_(i-1, i-1) dot a_(i+1,i+1) dot ... dot a_(n n) dot dmat(
//     1, ..., 0;
//     dots.v, dots.down, dots.v;
//     0, ..., 1;
//   ) \
//   &= a_(1 1) dot ... dot a_(i-1, i-1) dot a_(i+1,i+1) dot ... dot a_(n n) \
// $

// ואם
// $i<j$:

// $
//   det A_(i j)
//   &= dmat(
//     a_(1 1), ..., ..., ..., a_(1, j-1), a_(1, j+1), ..., a_(1 n);
//     dots.v, dots.down, , , dots.v, dots.v, dots.down, dots.v;
//     0, ..., a_(i i), ..., a_(i, j-1), a_(i, j+1), ..., a_(i n);
//     dots.v, , , , dots.v;
//     0, ..., ..., ..., a_(n, j-1), a_(), a_(n n);
//   ) \
// $

= שאלה 5

נוסיף את השורה הראשונה ב-$A$
לשאר השורות, כעט כל האיברים בשורה הראשונה הם
$1$
או
$-1$
בעוד שהאיברים בשאר השורות הם
$2$, $-2$
או
$0$,
אז נאכל לחלק את כל השורות חוץ מהראשונה ב-$2$
וכעט כל הערכים במטריצה יהיו
$1$, $-1$
או
$0$.
כעט אם המטריצה החדשה היא
$A'$
אז
$det A = 2^n det A'$,
ובנוסף מתקיים:

$
  det A
  = underbrace(sum_(sigma in S_(n+1)) underbrace(product_(i=1)^(n+1) underbrace([A']_(i, sigma(i)), in {-1,0,1} subset.eq ZZ), in ZZ), in ZZ)
$

ולכן קיים
$k in ZZ$
כך ש-$det A = 2^n k$
כלומר
$2^n | det A$.

= שאלה 6

$
  adj mat(
    1, 0, 3;
    4, 2, 1;
    2, 1, 1;
  )
  &= mat(
    (-1)^2 dmat(2, 1; 1, 1),
      (-1)^3 dmat(4, 1; 2, 1),
      (-1)^4 dmat(4,2; 2,1);
    (-1)^3 dmat(0, 3; 1, 1),
      (-1)^4 dmat(1, 3; 2, 1),
      (-1)^5 dmat(1, 0; 2, 1);
    (-1)^4 dmat(0, 3; 2, 1),
      (-1)^5 dmat(1, 3; 4, 1),
      (-1)^6 dmat(1, 0; 4, 2);
  ) \
  &= mat(
    dmat(2, 1; 1, 1),
      -dmat(4, 1; 2, 1),
      dmat(4,2; 2,1);
    -dmat(0, 3; 1, 1),
      dmat(1, 3; 2, 1),
      -dmat(1, 0; 2, 1);
    dmat(0, 3; 2, 1),
      -dmat(1, 3; 4, 1),
      dmat(1, 0; 4, 2);
  ) \
  &= mat(
    dmat(1, 1; 0, 1),
      -dmat(2, 1; 0, 1),
      dmat(4,2; 0,0);
    -dmat(-3, 0; 1, 1),
      dmat(1, 3; 0, -5),
      -dmat(1, 0; 0, 1);
    -dmat(2, 1; 0, 3),
      -dmat(1, 3; 0, -11),
      dmat(1, 0; 0, 2);
  ) \
  &= mat(
    1, -2, 0;
    3, -5, -1;
    -6, 11, 2;
  ) \
$

= שאלה 7

#let perm = math.op[perm]

+ $
    perm(A^t)
    =& sum_(sigma in S_n) product_(i=1)^n [A^t]_(i,sigma(i)) \
    =& sum_(sigma in S_n) product_(i=1)^n [A]_(sigma(i),i) \
    =& sum_(sigma in S_n) product_(i=1)^n [A]_(i,sigma^(-1)(i)) \
    =& sum_(sigma in { sigma'^(-1) | sigma' in S_n}) product_(i=1)^n [A]_(i,sigma(i)) \
    =& sum_(sigma in S_n) product_(i=1)^n [A]_(i,sigma(i)) \
    =& perm(A) \
  $

+ $
    perm mat(
      a_(1 1), ..., a_(1 n);
      dots.v, dots.down, dots.v;
      a_(i-1, 1), ..., a_(i-1, n);
      lambda a_(i, 1), ..., lambda a_(i, n);
      a_(i+1, 1), ..., a_(i+1, n);
      dots.v, dots.down, dots.v;
      a_(m 1), ..., a_(m n);
    )
    =& sum_(sigma in S_n) a_(1, sigma(1)) dot ... dot a_(i-1, sigma(i-1)) dot a_(i, sigma(i)) dot a_(i+1, sigma(i+1)) dot ... dot a_(n, sigma(n)) \
    =& lambda dot sum_(sigma in S_n) a_(1, sigma(1)) dot ... dot a_(i-1, sigma(i-1)) dot a_(i, sigma(i)) dot a_(i+1, sigma(i+1)) dot ... dot a_(n, sigma(n)) \
    =& lambda dot perm mat(
      a_(1 1), ..., a_(1 n);
      dots.v, dots.down, dots.v;
      a_(m 1), ..., a_(m n);
    )
  $

+ תהי פרמוטציה
  $sigma in S_n$
  שהיא לא פרמוטציית הזהות, אז בהכרח קיימת
  $i$
  קח ש-$sigma(i) < i$,
  ואז
  $[A]_(i, sigma(i)) = 0$
  כיוון ש-$A$
  משולשית לכן
  $product_(i=1)^n [A]_(i, sigma(i)) = 0$.
  סה"כ:

  $
    perm(A) = sum_(sigma in S_n) product_(i=1)^n [A]_(i, sigma(i)) = sum_(sigma in {Id}) product_(i=1)^n [A]_(i, sigma(i)) = product_(i=1)^n a_(i i)
  $
