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
  title: "אלגברה לינארית 1א - תרגיל בית 3",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 12, month: 4, year: 2025).display("[day].[month].[year]"),
)

= שאלה 1

הדבר שקול ללשאול אם יש 10 פתרונות למערכת המשוואות:

$
  amat(
    space A space , space b space;
    space B space , space c space;
  )
$

ממשפט שלמדנו בשיעור לכל מערכת משוואות מתקיים אחד מבין:

+ אין לה פתרונות

+ יש לה פתרון אחד

+ יש לה אינסוף פתרונות

לכן לא ייתכן שלמערכת יש 10 פתרונות, כלומר ל-$amat(A,b), amat(B,c)$
אין 10 פתרונות משותפים.


$
  cases(
    c_1 dot a_(1 1) + ... + c_n dot a_(1 n) = 0,
    dots.v,
    c_1 dot a_(m 1) + ... + c_n dot a_(m n) = 0,
  ) \
  cases(
    d_1 dot a_(1 1) + ... + d_n dot a_(1 n) = 0,
    dots.v,
    d_1 dot a_(m 1) + ... + d_n dot a_(m n) = 0,
  ) \
  arrow.b.double \
  cases(
    c_1 dot a_(1 1) + ... + c_n dot a_(1 n) = 0,
    d_1 dot a_(1 1) + ... + d_n dot a_(1 n) = 0,
    dots.v,
    c_1 dot a_(m 1) + ... + c_n dot a_(m n) = 0,
    d_1 dot a_(m 1) + ... + d_n dot a_(m n) = 0,
  ) \
  arrow.b.double \
  cases(
    (c_1 + d_1) dot a_(1 1) + ... + (c_n + d_n) dot a_(1 n) = 0,
    dots.v,
    (c_1 + d_1) dot a_(m 1) + ... + (c_n + d_n) dot a_(m n) = 0,
  ) \
$

לכן
$mat(c_1 + d_1; dots.v; c_n + d_n)$
פתרון.

= שאלה 3

== סעיף א

$
  cases(
    x_1 &= 3 - 2s,
    x_2 &= 1 - s - t,
    x_3 &= 2t
  ) \
  cases(
    x_1 - 3 &= -2s,
    x_2 &= 1 - s - t,
    x_3/2 &= t
  ) \
  cases(
    -x_1/2 + 3/2 &= s,
    x_2 &= 1 - s - x_3/2,
    x_3/2 &= t
  ) \
  cases(
    -x_1/2 + 3/2 &= s,
    x_2 &= 5/2 + x_1/2 - x_3/2,
    x_3/2 &= t
  ) \
  cases(
    x_1 &= 3 - 2s,
    x_2 &= 5/2 + x_1/2 - x_3/2,
    x_3 &= 2t
  ) \
  A = { (u, 5 / 2 + u / 2 - v / 2, v) | u in { 3-2s | s in RR }, v in { 2t | t in RR } } = { (u, 5 / 2 + u / 2 - v / 2, v) | u in RR, v in RR } \
  cases(
    x_1 = x_1,
    x_2 = 5/2 + x_1/2 - x_3/2,
    x_3 = x_3
  ) \
  cases(
    0 = 0,
    x_2 = 5/2 + x_1/2 - x_3/2,
    0 = 0,
  ) \
  cases(
    0 = 0,
    -x_1/2 + x_2 + x_3/2 = 5/2,
    0 = 0,
  ) \
$

לא קיימת סדרת מעברים אלמנטרית התהפוך מערכת משוואות זו להומוגנית לכן לא קיימת מערכת משוואות הומוגנית עם אותה קבוצת פתרונות.

== סעיף ב

לא, כייון שקבוצת פתרונות של מערכת משוואות הינו מרחב ווקטורי, ו-$A union {mat(0;0;0)}$
אינו סגור לכפל, לדוגמא
$mat(3;1;0) in A union {mat(0;0;0)}$,
אבל
$mat(6;2;0) in.not A union {mat(0;0;0)}$.

= שאלה 4

== תרגיל בית 2 שאלה 4

=== סעיף א

$
  { mat(u; v; -9/2 + 5/4u + 3/4v; 5/2 - 7/4u - 5/4v) | u,v in RR }
$

=== סעיף ב

$
  emptyset
$

=== סעיף ג

$
  { mat(-907/140; 3209/630; 71/420) }
$

== תרגיל בית 2 שאלה 5

=== סעיף א

$
  { mat(-v; 1 - 2u; u; v) | u, v in FF_5 }
$

=== סעיף ב

$
  { mat(0; 1 - u - v; u; v) | u,v in FF_7 }
$

=== סעיף ג

$
  { mat(
    (4-2i)/5 - (-1+8i)/5u - (6-6i)/5v;
    (-2+i)/5 - (8-4i)/5u - (7+6i)/5v;
    u;
    v;
  ) | u,v in CC }
$

=== סעיף ד

$
  { mat(1 + u; u + v; 1 + u + v; u; v) | u,v in FF_2 }
$

= שאלה 5

$
  amat(
    1, 1, 1, 2;
    3, 1, 2, 1;
    1, 0, 3, 4;
  ) \
  R_1 => R_1 - R_3 \
  R_2 => R_2 - 3R_3 \
  amat(
    0, 1, 3, 3;
    0, 1, 3, 4;
    1, 0, 3, 4;
  ) \
  R_1 => R_1 - R_2 \
  amat(
    0, 0, 0, 1;
    0, 1, 3, 4;
    1, 0, 3, 4;
  ) \
  R_2 => R_2 - 4R_1 \
  R_3 => R_3 - 4R_1 \
  amat(
    0, 0, 0, 1;
    0, 1, 3, 0;
    1, 0, 3, 0;
  ) \
  cases(
    0 = 1,
    x_2 + 3x_3 = 0,
    x_1 + 3x_3 = 0,
  )
$

$0 != 1$
לכן אין פתרון.

$
  emptyset
$

= שאלה 6

קיימת מערכת משוואות עם 81 פתרונות, ניקח:

$
  amat(
    0, 0, 0, 0, 0;
  )
$

מעל
$FF_4$,
אז קבוצת הפתרונות היא:

$
  { mat(a;b;c;d) | a,b,c,d in FF_4 } = (FF_3)^4
$

ואז מתקיים:

$
  abs({ mat(a;b;c;d) | a,b,c,d in FF_3 })
  = abs((FF_3)^4)
  = abs(FF_3)^4
  = 3^4
  = 81
$


נניח בשלילה כי קיימת מטריצה
$A in M_(n times m)(FF)$
עם קבוצת פתרונות
$S$,
אז
$S$
תת"מ של
$FF^n$.
נסתכל על בסיס
${lambda_1, ..., lambda_k}$
של
$S$,
אז:

$
  S = { lambda_1 u_1 + ... lambda_k u_k | u_1, ..., u_k in FF }
$

כיוון ש-$u_1, ..., u_k$
בת"ל מתקיים:

$
  abs(S) = abs({ lambda_1 u_1 + ... lambda_k u_k | u_1, ..., u_k in FF  }) = abs({ (u_1, ..., u_k) | u_1, ..., u_k in FF  }) = abs(FF^k) = abs(FF)^k
$

מספר הפתרונות סופי לכן
$abs(S) = abs(FF)^k$
סופי לכן
$abs(FF)$
סופי, כלומר
$FF$
שדה סופי ולכן בהכרח קיים
$p$
ראשוני ו-$m in NN$
כך ש-$abs(FF) = p^m$,
ואז
$abs(S) = p^(m + k)$.
סה"כ קיים
$p$
ראשוני ו-$n'$
טבעי כך ש-$36 = abs(S) = p^n'$,
מה שאומר שבהכרח אין ל-$36$
2 מחלקים זרים
$arrow.l.double$
סתירה!

= שאלה 7

== סעיף א

נסמן
$m := abs(FF)$,
נניח בשלילה כי
$0 in.not { 1, 1+1, ..., underbrace(1+...+1, m "times") }$,
אז כיוו שב-$FF$
יש
$m$
איברים ובהכרח
$0, 1, 1+1, ..., underbrace(1+...+1, m "times") in FF$
מסגירות לחיבור, בהכרח קיימים שני איברים שווים בקבוצה
${ 1, 1+1, ..., underbrace(1+...+1, m "times") }$.
יהיו ב-$t!=k in NN$
כך ש-$underbrace(1+...+1, t "times") = underbrace(1+...+1, k "times")$,
ונניח בה"כ
$t < k$,
אז
$k - t > 0$
ומתקיים
$underbrace(1+...+1, k "times") - underbrace(1+...+1, t "times") = underbrace(1+...+1, k-t "times") = 0 in { 1, 1+1, ..., underbrace(1+...+1, m "times") }$
$arrow.l.double$
סתירה!

לכן קיים
$n in NN$
כך ש-$0 = underbrace(1+...+1, n "times")$.

== סעיף ב

נסמן
$q = abs(FF)$
ונקרא למציין הכי קטן
$p$,
ונניח בשלילה כי קיימים
$n,m < p$
שונים מאחד ואחד מהשני כך ש-$p = n dot m$,
אז:

$
  underbrace(1 + ... + 1, p "times") &= 0 \
  p_FF &= 0 \
  (n dot m)_FF &= 0 \
  n_FF dot m_FF &= 0 \
$
$
  arrow.b.double
$
$
  n_FF = 0 or m_FF = 0 \
  underbrace(1 + ... + 1, n "times") = 0 or underbrace(1 + ... + 1, m "times") = 0 \
$

לכן
$n$
או
$m$
הם המציינים של
$FF$
וזו סתירה, לכן
$p$
ראשוני.

== סעיף ג

נניח בשלילה כי קיים הופכי
$k$
ל-2
$mod 20$,
אז קיים
$q in NN$
כך ש-

$
  2k - q dot 20 &= 1 \
  2(k - q dot 10) &= 1 \
$

אז 1 זוגי
$arrow.l.double$
סתירה!
לכן ל-2 אין הופכי ב-$FF_20$
ולכן
$FF_20$
לא שדה.
