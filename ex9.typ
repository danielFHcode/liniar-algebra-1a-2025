#import "@preview/rubber-article:0.3.1": maketitle, article
#import "@preview/xarrow:0.3.1": xarrow
#import "@preview/delimitizer:0.1.0"

#show: article.with(heading-numbering: none)

#show math.equation.where(block: true): set block(breakable: true)
// #set text(font: "David CLM", lang: "he")
#set enum(numbering: "(1.a)")
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
  title: "Linier Algebra 1A - Home Assignment 9",
  authors: ("Daniel F.H.",),
  date: datetime(day: 31, month: 5, year: 2025).display("[day].[month].[year]"),
)

+ We'll use $C$ and $B$ here as if they were ordered bases, that is:

  $
    B = (mat(1, 1; 1, 1), mat(-1, 1; 1, -1), mat(1, 1; 1, -1), mat(1, 1; -1, 1)) \
    C = (mat(1, 1; 1, 1), mat(-1, 1; 1, -1), mat(1, 1; 1, -1))
  $

  This means that for any $A in M_(2 times 2)(RR)$:

  $
    B dot [A]_B = A \
    C dot [A]_C = A \
  $

  / Helper Proof\::

  Let $T: V -> W$ be a linier transformation, and let $B$ and $C$ be ordered bases for $V$ and $W$ accordingly, then we want to prove that if $(b_1, ..., b_n)$ is an ordered base for $Col [T]^B_C$, then $(C dot b_1, ..., C dot b_n)$ is a base for $Im T$:

  Let $lambda_1, ..., lambda_n$ such that:

  $
    lambda_1 C b_1 + ... + lambda_n C b_n = 0 \
    C dot (lambda_1 b_1 + ... + lambda_n b_n) = 0
  $

  $C$ and $lambda_1 b_1 + ... + lambda_n b_n$ are both vectors (that is, they are both either of width $1$ or height $1$), so, because $C != 0$:

  $
    lambda_1 b_1 + ... + lambda_n b_n = 0
  $

  And so, because $b_1, ..., b_n$ is a base and more specifically linearly independent:

  $
    lambda_1 = ... = lambda_n = 0
  $

  So $C dot b_1, ..., C dot b_n$ is linearly independent.

  Also:

  $
    Im T
    &= { C dot ([T]^B_C dot [v]_B) | v in V } \
    &= { C dot ([T]^B_C dot v') | v' in { [v]_B | v in V } } \
    &= { C dot ([T]^B_C dot v') #delimitizer.Bigg($|$) v' in { [v]_B #delimitizer.Bigg($|$) v in { B dot mat(lambda_1; dots.v; lambda_n) #delimitizer.Bigg($|$) lambda_1, ..., lambda_n in FF } } } \
    &= { C dot ([T]^B_C dot v') #delimitizer.Bigg($|$) v' in { mat(lambda_1; dots.v; lambda_n) #delimitizer.Bigg($|$) lambda_1, ..., lambda_n in FF } } \
    &= { C dot ([T]^B_C dot v') | v' in FF^n } \
    &= { C dot v'' | v'' in { [T]^B_C dot v' | v' in FF^n} } \
    &= { C dot v'' | v'' in Col [T]^B_C } \
    &= { C dot v'' | v'' in Span{b_1, ..., b_n} } \
    &= Span{C dot b_1, ..., C dot b_n} \
  $

  Overall $(C dot b_1, ..., C dot b_n)$ is linearly independent and spans $Im T$ so it's a base for it.

  The proof that if $(b_1, ..., b_n)$ is a base for $Null [T]^B_C$ then $(B dot b_1, ..., B dot b_n)$ is a base for $Ker T$ is very similar.

  + We'll fined a base for:

    $
      Col mat(
        1, -2, 2, 1;
        2, -4, 3, 1;
        -1, 2, 4, 5;
      )
    $

    Firstly, we'll notice that:

    $
      -2 mat(1; 2; -1) = mat(-2; -4; 2)
    $

    And so:

    $
      Col mat(
        1, -2, 2, 1;
        2, -4, 3, 1;
        -1, 2, 4, 5;
      ) = Col mat(
        1, 2, 1;
        2, 3, 1;
        -1, 4, 5;
      )
    $

    Also:

    $
      mat(
        1, 2, 1;
        2, 3, 1;
        -1, 4, 5;
      )
      xarrow(R_2 => R_2-2R_1 \ R_3 => R_3 + R_1)
      mat(
        1, 2, 1;
        0, -1, -1;
        0, 6, 0;
      )
      xarrow(R_2 <=> R_3)
      mat(
        1, 2, 1;
        0, 6, 0;
        0, -1, -1;
      )
      xarrow(R_3 => R_3 / 6) \
      mat(
        1, 2, 1;
        0, 1, 0;
        0, -1, -1;
      )
      xarrow(R_1 => R_1 - 2R_2 \ R_3 => R_3 + R_1)
      mat(
        1, 0, 1;
        0, 1, 0;
        0, 0, -1;
      )
      xarrow(R_3 => -R_3 / 1)
      mat(
        1, 0, 1;
        0, 1, 0;
        0, 0, 1;
      )
      xarrow(R_1 => R_1 - R_3)
      mat(
        1, 0, 0;
        0, 1, 0;
        0, 0, 1;
      ) \
    $

    Which means:

    $
      mat(1; 2; 1;),
      mat(2; 3; 1;),
      mat(-1; 4; 5;)
    $

    Is linearly independent, and spans $Col mat(
      1, -2, 2, 1;
      2, -4, 3, 1;
      -1, 2, 4, 5;
    )$, so it's a base for it, which means:

    $
      {
        C dot mat(1; 2; 1;),
        C dot mat(2; 3; 1;),
        C dot mat(-1; 4; 5;)
      } = {
        mat(0, 4; 4, -2),
        mat(0, 6; 6, -2)
      }
    $

    Is a base for $Im(T)$.

  + $
      mat(
        1, -2, 2, 1;
        2, -4, 3, 1;
        -1, 2, 4, 5;
      )
      xarrow(R_2 => R_2-2R_1 \ R_3 => R_3 + R_1)
      mat(
        1, -2, 2, 1;
        0, 0, -1, -1;
        0, 0, 6, 0;
      )
      xarrow(R_2 <=> R_3)
      mat(
        1, -2, 2, 1;
        0, 0, 6, 0;
        0, 0, -1, -1;
      )
      xarrow(R_3 => R_3 / 6) \
      mat(
        1, -2, 2, 1;
        0, 0, 1, 0;
        0, 0, -1, -1;
      )
      xarrow(R_1 => R_1 - 2R_2 \ R_3 => R_3 + R_1)
      mat(
        1, -2, 0, 1;
        0, 0, 1, 0;
        0, 0, 0, -1;
      )
      xarrow(R_3 => -R_3 / 1)
      mat(
        1, -2, 0, 1;
        0, 0, 1, 0;
        0, 0, 0, 1;
      )
      xarrow(R_1 => R_1 - R_3)
      mat(
        1, -2, 0, 0;
        0, 0, 1, 0;
        0, 0, 0, 1;
      ) \
      arrow.b.double \
      Null mat(
        1, -2, 2, 1;
        2, -4, 3, 1;
        -1, 2, 4, 5;
      ) = { mat(2u; u; 0; 0) | u in RR }
    $

    So ${mat(2; 1; 0; 0)}$ is a base for $Null mat(
      1, -2, 2, 1;
      2, -4, 3, 1;
      -1, 2, 4, 5;
    )$, so:

    $
      { B dot mat(2; 1; 0; 0) } = { mat(-1, 3; 3, -1;) }
    $

    Is a base for $Ker T$.

  + \

    $
      [T]^B'_C'
      &= mat(
        |, |, |, |;
        [T mat(1, 1; -1, 1)]_C', [T mat(1, 1; 1, -1)]_C', [T mat(-1, 1; 1, -1)]_C', [T mat(1, 1; 1, 1)]_C';
        |, |, |, |;
      ) \
      &= mat(
        |, |, |, |;
        [C dot [T]^B_C [mat(1, 1; -1, 1)]_B]_C', [C dot [T]^B_C [mat(1, 1; 1, -1)]_B]_C', [C dot [T]^B_C [mat(-1, 1; 1, -1)]_B]_C', [C dot [T]^B_C [mat(1, 1; 1, 1)]_B]_C';
        |, |, |, |;
      ) \
      &= mat(
        |, |, |, |;
        [C dot [T]^B_C dot mat(0; 0; 0; 1)]_C', [C dot [T]^B_C dot mat(0; 0; 1; 0)]_C', [C dot [T]^B_C dot mat(0; 1; 0; 0)]_C', [C dot [T]^B_C dot mat(1; 0; 0; 0)]_C';
        |, |, |, |;
      ) \
      &= mat(
        |, |, |, |;
        [C dot mat(1; 1; 5)]_C', [C dot mat(2; 3; 4)]_C', [C dot mat(-2; -4; 2)]_C', [C dot mat(1; 2; -1)]_C';
        |, |, |, |;
      ) \
      &= mat(
        |, |, |, |;
        [mat(5, 7; 7, -5)]_C', [mat(3, 9; 9, -5)]_C', [mat(4, -4; -4, 0)]_C', [mat(-2, 2; 2, 0)]_C';
        |, |, |, |;
      ) \
      &= mat(
        -31/3, -17/3, -28/3, 14/3;
        10, 8, 4, -2;
        -7/3, -11/3, 8/3, -4/3;
      ) \
    $

+ + / Right side\::
      Let $T: FF^n -> FF^m$ be a linear transformation, $B$ be a base for $FF^n$, and $C_1, C_2$ be bases for $FF^m$, all such that $A_1 = [T]^B_C_1$ and $A_2 = [T]^B_C_2$. Then:
        
        $
          [T]^B_C_1 &= [Id]^(C_2)_C_1 [T]^B_C_2 \
          A_1 &= [Id]^(C_2)_C_1 A_2 \
        $

        $Id$ is an isomorphism which means $[Id]^(C_2)_(C_1)$ is invertible, so $A_1$ and $A_2$ are row equivalent.
    / Left side\::
      Assume $A_1$ and $A_2$ are row equivalent, then there exists an invertible matrix $P in M_(n times m)$ such that $A_1 = P A_2 => P^(-1) A_1 = A_2$.

      We'll create a new linier transformation as follows:

      $
        T : FF^n -> FF^m \
        T(v) = A_1 v
      $

      Now if we set $B$ and $C_1$ to be the standard bases, then $[T]^B_C_1 = A_1$. We'll mark the rows of $P$ with $p_1, ..., p_m$, then because $P$ is reversible it means that $p_1, ..., p_m$ are linearly independent, and so because they are $m$ items it means that they are necceseraly a base for $FF^m$, so we'll pick $C_2 = (p_1, ..., p_m)$, then:

      $
        [Id]^(C_2)_C_1
        = mat(
          |, , |;
          [Id(p_1)]_C_1, ..., [Id(p_m)]_C_1;
          |, , |;
        )
        = mat(
          |, , |;
          [p_1]_C_1, ..., [p_m]_C_1;
          |, , |;
        )
        = mat(
          |, , |;
          p_1, ..., p_m;
          |, , |;
        )
        = P
      $

      Now, because $[T]^B_C_1 = [Id]^(C_2)_C_1 [T]^B_C_2$:

      $
        A_1 &= P dot [T]^B_C_2 \
        P^(-1) dot A_1 &= [T]^B_C_2 \
        A_2 &= [T]^B_C_2 \
      $
  
  + / Left Side\:: Let $B_1,B_2$ and $C_1,C_2$ be bases of $V$ and $U$ accordingly such that $[S]^(B_2)_C_2 = [T]^(B_1)_C_1$, then $dim Col [S]^(B_2)_C_2 = dim Col [T]^(B_1)_C_1$, so using the helper proof from question (1) it follows that $dim Im(T) = dim Im(S)$.
    / Right Side\:: Assume $dim Im S = dim Im T$, then there exists an isomorphism $H : Im S -> Im T$, then