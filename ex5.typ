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
  title: "אלגברה לינארית 1א - תרגיל בית 5",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 26, month: 4, year: 2025).display("[day].[month].[year]"),
)

= שאלה 1

== סעיף א

$
  amat(
    0, 1, 2, 7;
    2, 0, 1, 3;
    0, 0, 3, 6;
    0, 0, 7, 14;
  )
  -->^(R_4 => R_4 / 7 \ R_3 => R_3 / 3)
  amat(
    0, 1, 2, 7;
    2, 0, 1, 3;
    0, 0, 1, 2;
    0, 0, 1, 2;
  )
  -->^(R_1 => R_1 - 2R_3 \ R_2 => R_2 - R_3 \ R_4 => R_4 - R_3)
  amat(
    0, 1, 0, 3;
    2, 0, 0, 1;
    0, 0, 1, 2;
    0, 0, 0, 0;
  )
  -->^(R_2 => R_2 / 2)
  amat(
    0, 1, 0, 3;
    1, 0, 0, 1/2;
    0, 0, 1, 2;
    0, 0, 0, 0;
  )
  -->^(R_1 <=> R_2)
  amat(
    1, 0, 0, 1/2;
    0, 1, 0, 3;
    0, 0, 1, 2;
    0, 0, 0, 0;
  ) \
  arrow.b.double \
  mat(7; 3; 6; 14) = 1 / 2mat(0;2;0;0) + 3mat(1;0;0;0) + 2mat(2;1;3;7) in Span(S)
$

== סעיף ב

$
  amat(
    1, 0, 2;
    0, 1, 3;
    3, -2, 0;
    0, 1, 3;
  )
  -->^(R_3 => R_3 + 2R_2 \ R_4 => R_4 - R_2)
  amat(
    1, 0, 2;
    0, 1, 3;
    3, 0, 6;
    0, 0, 0;
  )
  -->^(R_3 => R_3 / 3)
  amat(
    1, 0, 2;
    0, 1, 3;
    1, 0, 2;
    0, 0, 0;
  )
  -->^(R_3 => R_3 - R_2)
  amat(
    1, 0, 2;
    0, 1, 3;
    0, 0, 0;
    0, 0, 0;
  ) \
  arrow.b.double \
  mat(2;3;0;3) = 2mat(1;0;3;0) + 3mat(0;1;-2;1)
$
