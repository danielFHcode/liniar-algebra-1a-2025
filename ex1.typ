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

#maketitle(
  title: "אלגברה לינארית 1א - תרגיל בית 1",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 29, month: 4, year: 2025).display("[day].[month].[year]"),
)

= שאלה 1

== סעיף א

$
  overline(z dot w)
  =& overline((a + b i)(x + y i)) \
  =& overline(a x + a y i + b x i - b y) \
  =& a x - a y i - b x i - b y \
  =& a(x - y i) - b(x i + y) \
  =& a(x - y i) - b i(x - y i) \
  =& (a - b i)(x - y i) \
  =& overline(a + b i) dot overline(x + y i) \
  =& overline(z) dot overline(w) \
$

== סעיף ב

$
  z &= overline(z) \
  a + b i &= overline(a + b i) \
  cancel(a) + b i &= cancel(a) - b i \
  2 b i &= 0 \
  b &= 0 \
$
$
  arrow.b.double \
  z = a in RR
$

== סעיף ג

$
  Re(z)
  &= Re(a + b i) \
  &= a \
  &= (2a) / 2 \
  &= (2a + b - b) / 2 \
  &= (a + b + a - b) / 2 \
  &= (z + overline(z)) / 2 \
$
