#import "@preview/rubber-article:0.3.1": maketitle, article

#show: article.with(lang: "he")

#show math.equation.where(block: true): set block(breakable: true)
#show math.equation.where(block: false): box
#set text(font: "David CLM")

#let ds = $. space$
#let mtext = text.with(font: "David CLM")
#let Span = math.op[Span]
#let amat = math.mat.with(augment: -1)

#maketitle(
  title: "אלגברה לינארית 1א",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 27, month: 3, year: 2025).display("[day].[month].[year]"),
)

= מרחבים ווקטוריים

== הגדרה

מרחב ווקטורי מעל שדה
$FF$
הוא רביעיה
$(V, FF, dot, +)$
כאשר:

$
  + : V times V -> V \
  dot : FF times V -> V
$

נדרוש מספר אקסיומות:

/ עבור $+$:

- חילופיות:

  $
    v + u = u + v
  $

- קיבוציות:

  $
    (v + u) + w = v + (u + w)
  $

- $
    exists 0 in V ds (forall v in V ds (0 + v = v))
  $

- $
    forall v in V ds (exists v in V ds (v + (-v) = 0))
  $

/ עבור $dot$:

- קיבוציות:

  $
    lambda dot (mu dot v) = (lambda dot mu) dot v \
  $

- $
    1 dot v = v
  $

- פילוג:

  $
    lambda dot (v + u) = lambda dot v + lambda dot u \
    (lambda + mu) dot v = lambda dot v + mu dot v
  $

== דוגמאות חשובות

- $
    FF^n = { mat(x_1; dots.v; x_n) | x_1, ..., x_n in FF }
  $

  עם
  $+, dot$
  "איבר איבר".

- קבוצת הפונקציות
  $f: A -> FF$
  כאשר
  $A$
  קבוצה *שרירותית*
  והפעולות מוגדרות כך:

  $
    (lambda dot f)(x) = lambda dot f(x) \
    (f + g)(x) = f(x) + g(x)
  $

- $
    FF[x] = { mtext(FF "פולינומים מעל ") } \
    a\x^n + b\x^m + ...
  $

- $
    FF_(<=n)[x] = { n >= mtext("ממעלה") FF mtext("פולינומים מעל") } \
    x^(n-1) + x^(n-2) in FF_(<= n)[x] \
    x^(n+1) in.not FF_(<= n)[x] \
  $

== תרגיל

יהי
$V$
מ"ו מעל
$FF$,
הוכיחו:

+ $0 dot v = 0$
+ $lambda dot 0 = 0$
+ $lambda dot v = 0 => lambda = 0 or v = 0$

=== תשובה

+ $
    0 dot v + 0 dot v
    space underbrace(= (0 + 0) dot v, mtext("פילוג"))
    = 0 dot v \
    arrow.b.double \
    0 dot v + 0 dot v = 0 dot v \\ -(0 dot v) \
    0 dot v = 0
  $

+ $
    lambda dot 0 + lambda dot 0
    = lambda dot (0 + 0)
    = lambda dot 0 \
    lambda dot 0 = 0
  $

+ אם
  $lambda = 0$
  סיימנו, אחרת קיים
  $lambda^(-1)$:

  $
    lambda dot v &= 0 \
    lambda^(-1) dot (lambda dot v) &= lambda^(-1) dot 0 \
    (lambda^(-1) dot lambda) dot v &= 0 \
    1 dot v &= 0 \
    v &= 0 \
  $

= תת מרחב

== הגדרה

תת-מרחב
(תת"מ)
$U$
של
$V$
יוגדר כתת קבוצה
$U subset.eq V$
המקיימת:

$
  forall v,u in U, lambda, mu in FF ds (lambda v + mu u in U)
$

$arrow.l.double$
תת"מ הוא מ"ו בפני עצמו עם אותן פעולות ושדה.

== דוגמאות

- $
    forall V mtext("מ\"ו".) V mtext("תת\"מ של") {0}
  $

- קבוצת הפתרונות של מערכת הומוגנית ב-$n$
  מתשנים תת"מ של
  $FF^n$.

- $F_(<= n)[x]$
  תת"מ של
  $FF[x]$
  שהוא בעצמו תת"מ של אוסף הפונקציות
  $f: FF -> FF$.

- חיתוך של תתמי"ם הוא תמיד תת"מ.

== תרגילים

+ בדקו עבור הבאים האם מדובר במ"ו מעל $RR$:

  + $
      V = { mat(a_1; dots.v; a_n) | a_1, ..., a_n in RR^+ }
    $

    עם הפעולות:

    $
      mat(a_1; dots.v; a_n) + mat(b_1; dots.v; b_n) = mat(a_1 dot b_1; dots.v; a_n dot b_n) \
      lambda dot mat(a_1; dots.v; a_n) = mat(a_1^lambda; dots.v; a_n^lambda)
    $

  + $
      U = { mat(a; a^2; a^3; b) | a,b in RR^+ }
    $
    עם אותן פעולות כמו של
    $V$.

  + $
      V = { f in RR -> RR | exists T in QQ\\{0} ds forall x in RR ds f(x + T) = f(x) }
    $
    (קבוצת הפונקציות שקיים $T in QQ\\{0}$ כך שהן $T$ מחזוריות)

  + כמו קודם אבל עם
    $RR \\ {0}$.

  + $
      U = { p in RR[x] | p'(7) = 0 }
    $

  + $
      V = CC
    $
    מעל שדה
    $RR$.

+ יהי
  $V$
  מ"ו מעל
  $FF$
  ויהיו
  $V supset.eq U,W$
  תת"מים. הוכיח כי
  $U union W$
  תת"מ אם"ם
  $U subset W or W subset U$.

=== תשובות

+
  + נבדוק את כל האקסיומות:

    / קיבוציות\::
      נובעת מקיבוציות עבור הממשיים, בדומה עבור חילופיות.
    / קיום $0_V$\::
      $
        0_v = mat(1; dots.v; 1) \
        arrow.b.double \
        mat(1; dots.v; 1) + mat(a_1; dots.v; a_n) = mat(1 dot a_1; dots.v; 1 dot a_n) = mat(a_1; dots.v; a_n)
      $
    / קיום נגדי $-v$\::
      $
        -mat(a_1; dots.v; a_n) = mat(a_1^(-1); dots.v; a_n^(-1))
      $
    / כפל ב-1\::
      $
        1_FF dot mat(a_1; dots.v; a_n) = mat(a_1^1; dots.v; a_n^1) = mat(a_1; dots.v; a_n)
      $
    / פילוג\::
      $
        lambda dot (mat(a_1; dots.v; a_n) + mat(b_1; dots.v; b_n))
        = lambda dot mat(a_1 dot b_1; dots.v; a_n dot b_n)
        = mat(a_1^lambda dot b_1^lambda; dots.v; a_n^lambda dot b_n^lambda) \
        lambda dot mat(a_1; dots.v; a_n) + lambda dot mat(b_1; dots.v; b_n)
        = mat(a_1^lambda; dots.v; a_n^lambda) + mat(b_1^lambda; dots.v; b_n^lambda)
        = mat(a_1^lambda dot b_1^lambda; dots.v; a_n^lambda dot b_n^lambda) \
      $

  + זהו תת"מ של
    $V$:

    $
      mat(a; a^2; a^3; b) + mat(c; c^2; c^3; d)
      = mat(a c; (a c)^2; (a c)^3; b d) \
      lambda (a; a^2; a^3; b)
      = mat(a^lambda; (a^lambda)^2; (a^lambda)^3; b^lambda)
    $

    לכן
    $U$
    מ"ו.

  + זהו תת"מ של
    $RR -> RR$:

    / חיבור\::
      יהיו
      $f,g$
      שהן בהתאמה
      $T,K$
      מחזוריות, אז כיוון שהם רציונלים קיימים
      $a,b,c,d in ZZ$
      כך ש-$T = a/b, K = c/d$,
      אז:

      $
        (f + g)(x + a\c)
        = f(x + a\c) + g(x + a\c)
        = f\(x + underbrace(a/b, T) dot underbrace(b dot c, in ZZ)\) + g\(x + underbrace(c/d, K) dot underbrace(d dot a, in ZZ)\)
      $

      בנוסף:

      $
        (lambda dot f)(x + T)
        = lambda dot f(x + T)
        = lambda dot f(x)
        = (lambda dot f)(x)
      $

  + זהו אינו מ"ו, נגדיר:

    $
      f(x) := cases(
        1 &space x in ZZ,
        0 &space "else"
      ) \
      g(x) := cases(
        1 &space sqrt(2x) in ZZ,
        0 &space "else"
      )
    $

    נניח בשלילה שקיים
    $T in RR \\ {0}$
    כך ש-$f + g$
    היא
    $T$-מחזורית, אז:

    $
      (f+g)(T)
      = (f + g)(0)
      = f(0) + g(0)
      = 2
    $

    וזה מתקיים אמ"מ קיימים
    $n, m in ZZ$
    עבורם:

    $
      T = n, sqrt(2) dot T = m \
      arrow.b.double \
      sqrt(2) = n / m \
      arrow.b.double \
      mtext("סתירה!")
    $

  + $
      (lambda p_1 + mu p_2)'(7)
      = lambda p'_1(7) + mu p'_2(7)
      = lambda dot 0 + mu dot 0
      = 0
    $

  + כל התכונות מלבד קיום 0 ונגדי מתקיימות אוטומטית כי
    $CC$
    שדה. הנגדיים הרגילים יעבדו פה וגם ה-0 של
    $CC$.

    _הערה:_ זה נכון לכל $FF$ מעל $FF supset.eq FF'$.

+ נניח בשלילה אחרת, כלומר
  $U union W$
  תת"מ וגם ישנם
  $u in U\\W, w in W\\U$,
  אך אז מתקיים
  $u,w in U union W$
  ולכן
  $u + w in U union W$
  כלומר
  $u + w in U or u + w in W$.
  נניח בה"כ
  $u + w in W$
  אז נוסיף את
  $-w in W$
  לאיבר זה ונקבל
  $u in W$
  מסגירות חיבור
  $arrow.l.double$
  סתירה!

= הגדרה - צירוף לינארי

ווקטור
$v$
הוא צירוף לינארי של
${v_1, ..., v_n}$
אם ישנם
$a_1, ..., a_n in FF$
עבורם:

$
  sum_(i=1)^n a_i v_i = v
$

== סימון

נסמן ב-$Span(S)$
את אוסף הצירופים הלינאריים של
$S$
(הפרישה של $S$).

== טענה

$Span(S)$
הוא תת"מ, אם
$V = Span(S)$
נאמר ש-$S$
פורשת את
$V$.

=== הוכחה

עבור
$v = FF^n$
קל לבדוק מתי איבר
$v in FF^n$
נמצא ב-$Span(S)$
וגם האם
$Span(S) = FF^n$.

נעשה זאת בעזרת משוואות לינאריות. התנאי ל-$v in Span(S)$
הוא קיום של
$a_1, ..., a_n in FF$
עבורם
$sum_(i=1)^n v_i a_i = v$,
כלומר
$mat(a_1; dots.v; a_n)$
הוא הפתרון למערכת:

$
  mat(
    |, , |;
    v_1, ..., v_n;
    |, , |;
  )
$

כאשר בצורה הקנונית של
$mat(
  |, , |;
  v_1, ..., v_n;
  |, , |;
)$
אין שורת אפסים יש פתרון לכל
$v in FF^n$
כלומר
$FF^n = Span{v_1,...,v_n}$.

== תרגיל

קבעו האם:

$
  mat(1;2;3) in Span{mat(2;3;4), mat(3;4;5), mat(4;5;6)}
$

מעל
$ZZ_5$.

=== תשובה

נדרג:

$
  amat(
    2, 3, 4, 1;
    3, 4, 5, 2;
    4, 5, 6, 3;
  ) \
  arrow.b.double \
  dots.v \
  arrow.b.double \
  mat(
    1, 0, 6, 2;
    0, 1, 2, 6;
    0, 0, 0, 0;
  ) \
  arrow.b.double \
  2 dot mat(2;3;4) + 6 dot mat(3;4;5) = mat(1;2;3)
$

== תרגיל

הוכיחו או הפריחו:

+ $0 in S subset.eq V => mtext("ת\"ל") S$

  *פתרון:*
  $S$
  מהצורה
  $S = {0, v_1, ..., v_n}$
  לכן:

  $
    1 dot 0 + 0 dot v_1 + ... + 0 dot v_n = 0
  $

+ אם
  $U$
  תת"מ ו-$S$
  סופית אז
  $S subset.eq U$
  אם"ם
  $Span(S) subset.eq U$.
