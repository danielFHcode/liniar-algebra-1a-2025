#import "@preview/rubber-article:0.3.1": maketitle, article

#show: article.with(lang: "he")

#show math.equation.where(block: true): set block(breakable: true)
#show math.equation.where(block: false): box
#set text(font: "David CLM")

#let ds = $. space$
#let mtext = text.with(font: "David CLM")
#let Span = math.op[Span]
#let amat = math.mat.with(augment: -1)
#let tab = $space space space space$

#maketitle(
  title: "אלגברה לינארית 1א - תרגול",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 29, month: 4, year: 2025).display("[day].[month].[year]"),
)


= השלמת חוב - השלמה, צמצום ומשפט המימדים

ראינו בהרצאה שכל קבוצה בת"ל אפשר להשלים לבסיס וכל קבוצה פורשת אפשר לצמצם לבסיס. בואו נעשה את זה בפועל.

== השלמה - דרך 1

תהי
$S$
קבוצה בת"ל של
$FF^n$.
נסדר את איברי
$S$
בתור השורות של מטריצה:

$
  A = mat(
    -, v_1^tack.b, -;
    , dots.v, ;
    -, v_k^tack.b, -;
  )
$

נזכר שדירוג לא משפיע על
$Span(S)$
ולכן נדרג את
$A$.
ראינו ש-$S$
בת"ל אם"ם צורה הקנונית של
$A$
אין שורות אפסים ופורשת אם"ם אין משתנים חופשיים.

$
  A --> mat(
    1, 2, 0, 0;
    0, 0, 1, 0;
    0, 0, 0, 1;
  ) --> mtext("בסיס") S union {e_2}
$

== השלמה - דרך 2

תהי
$S subset.eq FF^n$
בת"ל. נשים את וקטורי
$S$
בתור עמודות מטריצה
$B$:

$
  B = mat(
    |, , |;
    v_1, ..., v_k;
    |, , |;
  )
$

נדרג לצורה קנונית
$A = C B$,
ראינו ש-$S$
בת"ל אם"ם אין ב-$A$
משתנים חופשיים.
ראינו ש-$S$
פורשת אם"ם אין ב-$A$
שורת אפסים.

$
  A = mat(
    1, ..., 0, ..., 0;
    dots.v, dots.down, dots.v, dots.down, dots.v;
    0, ..., 1, ..., 0;
    dots.v, dots.down, dots.v, dots.down, dots.v;
    0, ..., 0, ..., 0;
  ) --> mat(A, |, e_(k+1), ..., e_n) -->^(times C^(-1)) mat(B, |, v_(k+1), ..., v_n) --> mtext("בסיס") S union {v_1, ..., v_n}
$

== צמצום

אם
$v_1, ..., v_k$
פורשת נדרג את
$A = mat(
  |, , |;
  v_1, ..., v_k;
  |, , |;
)$
לצורה קנונית. אם הוקטורים תלויים אז יש משתנים חופשיים.

=== טענה

אם
$i_1, ..., i_(k_n)$
העמודות בהן יש משתנים חופשיים בצורה הקנונית של
$A$
אז אם נסיר אותן נקבל בסיס.

=== דוגמאות

נמצא בסיס ל-$Span(S) + Span(T)$
כאשר
$T = {mat(-3;1;4), mat(1;1;1)}, S = {mat(1;-1;2), mat(-1;0;5)}$.
הקבוצה
$S union T$
פורשת את הסכום.

$
  A = mat(
    1, -1, -3, 1;
    -1, 0, 1, 1;
    2, 5, 4, 1;
  ) --> mat(
    1, 0, -5, 3;
    0, 1, 2, -2;
    0, 0, 4, 12;
  ) ==> { mat(1;-1;2), mat(-1;0;5), mat(-3;1;4) }
$

== צמצום - דרך 2

תהי
$FF^n supset S$
פורשת. נדרג את
$A = mat(v_1^tack.b; dots.v; v_k^tack.b)$
ונקבל שורות אפסים. אם נסיר אותן נקבל בסיס.

#line(length: 100%, stroke: (thickness: .025em))

ראתם בשיעור
$Span(S_1 union S_2) = Span(S_1) + Span(S_2)$
לכן בהנתן קבוצות פורשות לזוג מרחבים קל למצוא בסיס לסכום המרחבים לעומת זאת עבור חיתוך
$Span(S_1 inter S_2) != Span(S_1) inter Span(S_2)$
לכן צריך לעבור קשה.

נניח
$S_1 = {v_1, ..., v_k}, S_2 = {u_1, ..., u_ell}$
אז כל ווקטור בחיתוך ה-$Span$ים
יהיה מהצורה:

$
  v = sum_(i=1)^k a_i v_i
$

אך עלינו לדרוש שישנם
$b_i$
עבורם:

$
  v = sum_(i=1)^ell b_i u_i
$

נכתוב את התנאי להיות בחיתוך כמערכת:

$
  mat(
    |, , |, |, , |;
    v_1, ..., v_k, u_1, ..., u_ell;
    |, , |, |, , |;
  )
$

// == דוגמא

// נמצא קבוצה פורשת ל-$U inter W$
// כאשר
// $U = Span{mat(1;1;1), mat(1;-1;3)}, W = Span{mat(1;1;-1), mat(2;3;-1)}$.

// === פתרון

// $
//   mat(
//     1, 1, -1, -2;
//     1, -1, -1, -3;
//     1, 3, 1, 1;
//   ) --> mat(
//     1, 0, 0, -3/2;
//     0, 1, 0, 1/2;
//     0, 0, 1, 1;
//   )
// $

== משפט המימדים

יהיו
$U,W$
תת"מים של
$V$
ונניח ש-$V$
נ"ס אז:

$
  dim (U + W) = dim U + dim W - dim (U inter W)
$
