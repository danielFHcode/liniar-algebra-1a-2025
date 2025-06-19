#import "@preview/rubber-article:0.3.1": article, maketitle
#import "@preview/delimitizer:0.1.0": *
#import "@preview/icu-datetime:0.1.2": fmt-date

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
#let adj = math.op[adj]
#let sign = math.op[sign]
#let amat = math.mat.with(augment: -1)
#let dmat = math.mat.with(delim: "|")
#let tab = $space space space space$

#let bcases(..cases) = math.cases(
  ..cases.named(),
  ..cases.pos().map(arr => arr.join($&tab$))
)

#maketitle(
  title: "אלגברה לינארית 1א",
  authors: ("דניאל פ.ח.",),
  date: fmt-date(datetime(day: 12, month: 6, year: 2025), locale: "he"),
)

= מרחבים $infinity$ מימדיים

== הגדרה: מימד אינסופי

מ"ו
$V$
הוא ממימד
$infinity$
אם לכל
$n in NN$
($0 in.not NN$)
יש ב-$V$
קבוצה בת"ל בגודל
$n$.

== דוגמאות

+ $
    V = { P : RR -> RR | mtext("פולינום") P }
  $

  ${x^n}^N_(n=0)$ - קבוצה בת"ל
  בגודל
  $N+1$ -
  עבור
  $i_1, ..., i_k in {0,...,N}$:

  $
    0 = underbrace(alpha_1 x^(i_1) + ... + alpha_k x^(i_k), mtext("פולינום")) <==> alpha_1 = ... = alpha_k = 0
  $

+ מרחב הסדרות הסופיות:

  $
    RR^infinity = { (a_1, ..., a_n, 0, ...) | a_1, ..., a_n in RR, n in NN }
  $

  נסתכל על המרחב הדואלי מעליו:

  $
    (RR^infinity)\* = { f: RR^infinity -> RR | mtext("לינארית") f }
  $

  תהי
  $(b_n)^infinity_(n=1)$
  סדרה (אינסופית). היא מגדירה פונקציונל
  $f_(b_n)$:

  $
    f_(b_n)(a_n) = sum_(n) a_n b_n
  $

  לכל
  *סדרה אינסופית*
  $b_n$
  בנינו
  $f_b_n in (R^infinity)\*$,
  אבל לא את כולם.

  נסתכל גם על קבוצת כל הסדרות:

  $
    RR^NN = { (a_1, a_2, a_3, ...) | a_1, a_2, a_3, ... in RR }
  $

  נשים לב כי המימד של
  $RR^infinity$
  והמימד של
  $RR^NN$
  שניהם
  $infinity$,
  אבל:

  $
    RR^infinity cancel(eq^tilde) RR^NN
  $

  המסקנה היא שלא כל הקבוצות עם מימד אינסופי איזומורפיות. ובפרט עבור
  $V$
  עם מימד אינסופי:

  $
    V\* cancel(=^tilde) V
  $

+ $V = RR$
  מעל
  $FF = QQ$.
  זה מרחב ממימד
  $infinity$.

  נניח בשלילה שזה מרחב ממימד
  $n$
  לאיזשהו
  $n in NN$,
  אז יש בסיס בגודל
  $n$:
  ${v_1, ..., v_n} subset.eq RR$.

  אז:

  $
    RR = union_(alpha_1, ..., alpha_n in QQ) {alpha_1 v_1 + ... + alpha_n v_n} \
    arrow.b.double \
    abs(RR) = abs(QQ^n) \
    2^aleph_0 = aleph_0 \
    arrow.b.double \
    mtext("סתירה!")
  $

== הגדרה: בסיס

קבוצה
$B = (v_i)_(i in I) subset.eq V$
נקראת בסיס אם לכל
$v in V$
קיימים ויחידים
$n in NN$,
$alpha_1, ..., alpha_n in FF$,
$i_1, ..., i_n in I$
ו-$v_i_1, ..., v_i_n in B$
כך ש-

$
  v = alpha_1 v_i_1 + ... + alpha_n v_i_n
$

== דוגמאות

+ $
    V = RR^infinity
  $

  קיים בסיס:

  $
    e_1 = (1, 0, 0, 0, ...) \
    e_2 = (0, 1, 0, 0, ...) \
    e_3 = (0, 0, 1, 0, ...) \
  $

+ כל בסיס של
  $RR$
  מעל
  $QQ$
  הינו בן מנייה משיקולי עוצמות.

== הגדרה: קבוצה אינסופית בת"ל

קבוצה אינסופית
$B subset.eq V$
בת"ל אם כל תת קבוצה שלה בת"ל.

== טענה

אם
$B subset.eq V$
בת"ל מקסימלית אז
$B$
בסיס.

=== הוכחה

יהי
$v in V$.

/ אם $v in B$\::
  $v = 1 dot v$.
  נניח בשלילה כי יש הצגה נוספת
  $v = alpha_1 v_i_1 + ... + alpha_n v_i_n$
  אז
  $0 = v + alpha_1 v_i_1 + ... + alpha_n v_i_n$
  ניתן ליצור צירוף לינארי שהוא אפס כשלא כל המקדמים אפס שזו סתירה לבלתי תליות לינארית.

/ אם $v in.not V$\::
  $B$
  תב"ל מקסימלית לכן
  $B union {v}$
  ת"ל לכן קיימים
  $v_i_1, ..., v_i_n in V$
  ו-$alpha, alpha_1, ..., alpha_n in FF$
  לא כולם אפס
  כך ש-$alpha v + alpha_1 v_i_1 + ... + alpha_n v_i_n$.
  
  / אם $alpha = 0$\::
    אז
    $alpha_i_1 = ... = alpha_i_n = 0$
    שזו סתירה.
  / אם $alpha != 0$\::
    
    $
      v = -1/alpha (alpha_1 v_i_1 + ... + alpha_n v_i_n)
    $
  
  אם יש עוד הצגה
  $v = beta_1 v_j_1 + ... beta_n v_j_n$
  אז משווים ומעבירים אגפים, סתירה לזה ש-$B$
  בת"ל.

== משפט

לכל מ"ו
$V$
יש בסיס
(ההוכחה מסתמכת על הלמה של צורן).

== מסקנה

$
  V\* != {0}
$

(בהנחה ש-$V != {0}$)

=== הוכחה

יש בסיס
$B = {v_i}_(i in I)$
אז ניקח
$v in B$
ונגדיר:

$
  f : B -> FF \
  f(u) = bcases(
    1, u = v;
    0, u != v;
  )
$

אפשר להרחיב את
$f$
באופן יחיד ל-$V$.
$f$
לא פונקציית האפס כי
$f(v) = 1$.

אז בעצם הגדרנו מיפוי
$e : V -> V\*\*$
${e_v}_(v in B)$
כאשר
$e_v = f$.
