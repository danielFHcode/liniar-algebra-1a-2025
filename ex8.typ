#import "@preview/rubber-article:0.3.1": maketitle, article
#import "@preview/xarrow:0.3.1": xarrow

#show: article.with(lang: "he", heading-numbering: none)

// #show math.equation.where(block: true): set block(breakable: true)
#set text(font: "David CLM", lang: "he")
#set enum(numbering: "1.א.")
#let ds = $. space$
#let mtext = text.with(font: "David CLM")
#let Span = math.op[Span]
#let amat = math.mat.with(augment: -1)
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

#maketitle(
  title: "אלגברה לינארית 1א - תרגיל בית 8",
  authors: ("דניאל פ.ח.",),
  date: datetime(day: 26, month: 5, year: 2025).display("[day].[month].[year]"),
)

+ #show math.equation.where(block: false): box
  יהי
  $v in Im(T) inter Ker(T)$,
  אז קיים
  $u in V$
  כך ש-$T(u) = v$,
  ואז
  $T^5(u) = -v$,
  אבל
  $T^5(u) = T^4(T(u)) = T^4(v) = T^3(T(v)) = T^3(0) = 0$,
  לכן
  $v = 0$.
  סה"כ
  $Im(T) inter Ker(T) = {0}$,
  מה שאומר ש-$Im(T) plus.circle Ker(T)$
  מוגדר היטב.
  בנוסף יהיו
  $v_1, ..., v_n$
  ו-$u_1, ..., u_m$
  בסיסים ל-$Im(T)$
  ו-$Ker(T)$
  בהתאמה. יהיו
  $lambda_1, ..., lambda_(n+m)$
  לא כולם אפס כך ש-$lambda_1 v_1 + ... + lambda_(n+m) u_m = 0$, אז
  $lambda_1 v_1 + ... + lambda_n v_n = -lambda_(n+1) u_1 - ... - lambda_(n+m) u_m$
  מה שאומר ש-$lambda_1 v_1 + ... + lambda_n v_n in Ker(T)$,
  וכיוון ש-$lambda_1 v_1 + ... + lambda_n v_n in Im(T)$
  בהכרח
  $lambda_1 v_1 + ... + lambda_n v_n = 0$
  ולכן כיוון ש-$v_1, ..., v_n$
  מתקיים
  $lambda_1 = ... = lambda_n$
  ובצורה דומה
  $-lambda_(n+1) u_1 - ... - lambda_(n+m) u_m in Im(T)$
  לכן
  $lambda_(n+1) = ... = lambda_(n+m)$.
  סה"כ
  $lambda_1, ..., lambda_(n+m)$
  בת"ל, וכיוון ש-$v_1, ..., v_n, u_1, ..., u_m in V$
  וגם
  $dim V = dim Im(T) + dim Ker(T) = n+m$
  מתקיים ש-$v_1, ..., v_n, u_1, ..., u_m$
  פורש את $V$,
  כלומר:

  $
    V = Span{v_1, ..., v_n, u_1, ..., u_m} = Span{v_1,...,v_n} + Span{u_1,...,u_m} = Im(T) plus.circle Ker(T)
  $

+ + לא קיימת כי אז יתקיים:

    $
      3 = dim RR^3 = dim Im T + dim Ker T = dim Span{(1,1,1)} + dim Span{(1,2,1)} = 1 + 1 = 2
    $

  + לא קיימת כי אז ייתקיים:

    $
      4 = dim M_(2 times 2)(RR) = underbrace(dim Im T, <=2) + underbrace(dim Ker T, 1) \
      arrow.b.double \
      4 <= 3
    $

  + לא קיים כי אז יתקיים:

    $
      dim M_(2 times 2)(RR) &= dim Im T + dim Ker T \
      4 &= dim RR^5 + dim Ker T \
      4 &= 5 + dim Ker T \
      -1 &= dim Ker T \
    $

+ #show math.equation.where(block: false): box
  $v in Im T inter Ker S$,
  אז קיים
  $u in U$
  כך ש-$T(u) = v$,
  ומתקיים
  $S(v) = 0$,
  לכן
  $(S compose T)(u) = 0$,
  וכיוון ש-$S compose T$
  איזומורפיזם ובפרט חח"ע זה אומר ש-$u = 0$
  ולכן
  $T(u) = 0$
  כלומר
  $v = 0$.
  סה"כ
  $Im T inter Ker S = {0}$
  ולכן
  $Im T plus.circle Ker S$
  הינו סכום חוקי. יהי
  $v in V \\ Im T$,
  אז
  $S(v) in W$
  ולכן כיוון ש-$S compose T$
  איזומורפיזם ובפרט על קיים
  $u in U$
  כך ש-$(S compose T)(u) = S(v)$
  כלומר
  $S(T(u)) = S(v)$,
  לכן
  $S(T(u)) - S(v) = 0$,
  לכן
  $S(T(u) - v) = 0$,
  כלומר
  $T(u) - v in Ker T$,
  וכיוון ש-$Ker T$
  הינו מרחב ווקטורי מתקיים כי
  $v in Ker T$.
  סה"כ
  $V subset.eq Im T union Ker T subset.eq Im T plus.circle Ker T subset.eq V$,
  לכן
  $V = Im T plus.circle Ker T$.

+ + $
      [T]^B_C
      &= mat(
        |, |, |, |;
        [T mat(1, 0, 0, 0)]_C, [T mat(0, 1, 0, 0)]_C, [T mat(0, 0, 1, 0)]_C, [T mat(0, 0, 0, 1)]_C;
        |, |, |, |;
      ) \
      &= mat(
        |, |, |, |;
        [mat(1, 3, 4)]_C, [mat(1, 0, -2)]_C, [mat(2, 0, -3)]_C, [mat(0, -2, 1)]_C;
        |, |, |, |;
      ) \
      &= mat(
        |, |, |, |;
        mat(-5 / 3, -4 / 3, 8 / 3), mat(7 / 3, 8 / 3, -1 / 3), mat(4 / 3, 5 / 3, -1 / 3), mat(1 / 3, -4 / 3, -1 / 3);
        |, |, |, |;
      ) \
      &= mat(
        -5 / 3, 4 / 3, 7 / 3, 1 / 3;
        -4 / 3, 5 / 3, 8 / 3, -4 / 3;
        8 / 3, -1 / 3, -1 / 3, -1 / 3;
      ) \
    $

  + $
      [T]^B_C
      &= mat(
        |, |, |, |;
        [T mat(1, 0, 0, 0)]_C, [T mat(0, 1, 0, 0)]_C, [T mat(0, 0, 1, 0)]_C, [T mat(0, 0, 0, 1)]_C;
        |, |, |, |;
      ) \
      &= mat(
        |, |, |, |;
        [mat(a, 0, c, 0)]_C, [mat(0, a, 0, c)]_C, [mat(b, 0, d, 0)]_C, [mat(0, b, 0, d)]_C;
        |, |, |, |;
      ) \
      &= mat(
        |, |, |, |;
        mat(a, 0, c, 0), mat(0, a, 0, c), mat(b, 0, d, 0), mat(0, b, 0, d);
        |, |, |, |;
      ) \
      &= mat(
        a, 0, b, 0;
        0, a, 0, b;
        c, 0, d, 0;
        0, c, 0, d;
      ) \
    $

+ מתקיים:

  $
    [T]^B_C = mat(
      a_(1 1), a_(1 2), ..., a_(1 n);
      0, a_(2 2), ..., a_(2 n);
      dots.v, dots.down, dots.down, dots.v;
      0, 0, ..., a_(n n)
    )
  $

  נסמן
  $B = (b_1, ..., b_n)$,
  אז:

  $
    [T(b_1)]_C = mat(
      a_(1 1);
      0;
      0;
      dots.v;
      0;
    ), space
    [T(b_2)]_C = mat(
      a_(1 2);
      a_(2 2);
      0;
      dots.v;
      0;
    ), space
    dots, space
    [T(b_(n-1))]_C = mat(
      a_(1, n-1);
      dots.v;
      a_(n-1, n-1);
      0;
    ), space
    [T(b_n)]_C = mat(
      a_(1 n);
      dots.v;
      a_(n-1, n);
      a_(n n);
    )
  $

  נסמן
  $C = (c_1, ..., c_n)$,
  אז גם
  $C' = (c_n, ..., c_1)$
  בסיס ל-$V$,
  ומתקיים שלכל
  $v in V$,
  אם:

  $
    [v]_C = mat(v_1; dots.v; v_n)
  $

  אז:

  $
    [v]_C' = mat(v_n; dots.v; v_1)
  $

  ולכן:

  $
    [T(b_n)]_C' = mat(
      a_(n n);
      a_(n-1, n);
      dots.v;
      a_(1 n);
    ), space
    [T(b_(n-1))]_C' = mat(
      0;
      a_(n-1, n-1);
      dots.v;
      a_(1, n-1);
    ), space
    dots, space
    [T(b_2)]_C' = mat(
      0;
      dots.v;
      0;
      a_(2 2);
      a_(1 2);
    ), space
    [T(b_1)]_C' = mat(
      0;
      dots.v;
      0;
      0;
      a_(1 1);
    )
  $

  ולכן אם ניקח
  $B' = (b_n, ..., b_n)$
  נקבל:

  $
    [T]^B'_C' = mat(
      0, 0, ..., a_(n n);
      dots.v, dots.up, dots.up, dots.v;
      0, a_(2 2), ..., a_(2 n);
      a_(1 1), a_(1 2), ..., a_(1 n);
    )
  $

+ + ממשפט המימדים:

    $
      dim V = dim U + dim W + underbrace(dim U inter W, 0) \
      dim V = dim U + dim W' + underbrace(dim U inter W', 0) \
      arrow.b.double \
      dim U + dim W = dim U + dim W' \
      dim W = dim W' \
      k = l \
    $

  + יהי
    $V in {W',W}$
    ונניח בה"כ כי
    $V = W$,
    אז נוכיח כי
    $(u_1, ..., u_m, w_1, ..., w_k)$
    בסיס ל-$V$:

    מתקיים כי:

    $
      V = U + W = Span{u_1,...,u_m} + Span{w_1, ..., w_k} = Span{u_1,...,u_m,w_1,...,w_k}
    $

    לכן
    $(u_1,...,u_m,w_1,...,w_k)$
    פורש את
    $V$.

    יהיו
    $lambda_1, ..., lambda_(m+k) in FF$
    כך ש-

    $
      lambda_1 u_1 + ... + lambda_m u_m + lambda_(m+1) w_1 + ... + lambda_(m+k) w_k = 0 \
      arrow.b.double \
      U in.rev lambda_1 u_1 + ... + lambda_m u_m = -lambda_(m+1) w_1 - ... - lambda_(m+k) w_k in W
    $

    לכן:

    $
      lambda_1 u_1 + ... + lambda_m u_m, -lambda_(m+1) w_1 - ... - lambda_(m+k) w_k in U inter W = {0}
    $
    לכן:

    $
      lambda_1 u_1 + ... + lambda_m u_m = -lambda_(m+1) w_1 - ... - lambda_(m+k) w_k = 0
    $

    ולכן כיוון ש-$u_1, ..., u_m$
    ו-$w_1, ..., w_k$
    בסיסים, ובפרט בת"ל, מתקיים:

    $
      lambda_1 = ... = lambda_(m+k) = 0
    $

    סה"כ
    $u_1, ..., u_m, w_1, ..., w_k$
    בת"ל.

    אז
    $u_1, ..., u_m, w_1, ..., w_k$
    בת"ל ופורש את
    $V$
    לכן הוא בסיס של
    $V$,
    ומחוסר הכללת הכלליות גם
    $u_1, ..., u_m, w'_1, ..., w'_k$
    בסיס של
    $V$.

  + בהנתן ווקטור
    $mat(a_1; dots.v; a_n)$
    נסמן:

    $
      mat(a_1; dots.v; a_i; dots.v; a_j; dots.v; a_n)_(i : j) := mat(a_i; dots.v; a_j)
    $

    כעט:

    $
      [Id_V]^B_B'
      &= mat(
        |, , |, |, , |;
        [Id_(V)(u_1)]_B', ..., [Id_(V)(u_1)]_B', [Id_(V)(w_1)]_B', ..., [Id_(V)(w_k)]_B';
        |, , |, |, , |;
      ) \
      &= mat(
        |, , |, |, , |;
        [u_1]_B', ..., [u_1]_B', [w_1]_B', ..., [w_k]_B';
        |, , |, |, , |;
      ) \
      &= mat(
        |, , |, |, , |;
        mat(1, dots.v, 0, dots.v, 0), ..., mat(0, dots.v, 1, dots.v, 0), [w_1]_B', ..., [w_k]_B';
        |, , |, |, , |;
      ) \
      &= mat(
        1, ..., 0, |, , |;
        dots.v, dots.down, dots.v, ([w_1]_B')_(1 : m), ..., ([w_k]_B')_(1 : m);
        0, ..., 1, |, , |;
        dots.v, dots.down, dots.v, ([w_1]_B')_(m+1 : m+k), ..., ([w_k]_B')_(m+1 : m+k);
        0, ..., 0, |, , |;
      ) \
      &= mat(
        I_m, X;
        0, Y;
      )
    $

    כאשר:

    $
      X = mat(
        |, , |;
        ([w_1]_B')_(1 : m), ..., ([w_k]_B')_(1 : m);
        |, , |;
      ) in M_(m times k)(V) \
      Y = mat(
        |, , |;
        ([w_1]_B')_(m+1 : m+k), ..., ([w_k]_B')_(m+1 : m+k);
        |, , |;
      ) in M_(k times k)(V)
    $
