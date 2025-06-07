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
    / Right Side\:: Assume $dim Im S = dim Im T$, then there exists an isomorphism $H : Im S -> Im T$, meaning for every $v in V$ there exists a $u in V$ such that $H(S(v)) = T(u)$

      #text(fill: red)[I DONT KNOW WHY THE HELL DO YOU HAVE 3 EXAMS QUESTIONS PER QUESTIONS??]

  + / Left Side\:: Assume there exist bases $B$ and $C$ for $V$ and $U$ accordingly such that $[T]^B_C = I$, then $[T]^B_C$ is invertible, which means $T$ is invertible, so $Ker T = {0}$. Because $[T]^B_C = I$, it means $[T]^B_C$ is square which means $dim V = dim U$, then:

      $
        dim U &= dim Ker T + dim Im T \
        dim V &= 0 + dim Im T \
        dim V &= dim Im T \
      $

      Ans so because $Im T subset.eq V$, it means $Im T = V$, which overall means $T$ is an isomorphism.
    
    / Right Side\:: Assume $T$ is an isomorphism, and let $B$ and $C'$ be a bases for $V$ and $U$ accordingly, then $[T]^B_C'$ is invertible, which means there exists a series of elementary matrixes $R_1, ..., R_n$ such that $R_1 dot ... dot R_n dot [T]^B_C' = I$. We'll prove using induction on $n$ that there exists a base $tilde(C)$ for $U$ such that $R_1 dot ... dot R_n = [Id]^C'_tilde(C)$:

      / Base\:: For $n=0$, $R_1 dot ... dot R_n = I$ so if we pick $tilde(C) := C'$ then $[Id]^C'_C' = I$.
      / Step\:: Assume there exists a base $tilde(C)' = (c_1, ..., c_k)$ such that $R_2 dot ... dot R_n = [Id]^C'_tilde(C)'$, we'll find a base $tilde(C)$ such that $R_1 = [Id]^tilde(C)'_tilde(C)$, then $R_1 dot ... dot R_n = [Id]^tilde(C)'_tilde(C) dot [Id]^C'_tilde(C)' = [Id]^C'_tilde(C)$:

        - If $R_1$ is a switch between lines $i$ and $j$, then, assuming WOLOG that $i < j$, we'll pick $tilde(C) = (c_1, ..., c_(i-1), c_j, c_(i+1), ..., c_(j-1), c_i, c_(j+1), ..., c_k)$, and then $[Id]^tilde(C)'_tilde(C) = R_1$.

        - If $R_1$ is a multiplication of the line $i$ by $lambda != 0$, then we'll pick $tilde(C) = (c_1, ..., c_(i-1), c_i/lambda, c_(i+1), ..., c_k)$, then $[Id]^tilde(C)'_tilde(C) =  R_1$.

        - If $R_1$ is an addition of the line $i$ to the line $j$ multiplied by $lambda$, then we'll pick $tilde(C) = (c_1, ..., c_(i-1), c_i, c_(i+1), ..., c_(j-1), c_j - lambda c_i, c_(j+1), ..., c_k)$, then $[Id]^tilde(C)'_tilde(C) =  R_1$.

      Overall:

      $
        I = R_1 dot ... dot R_n dot [T]^B_C' = [T]^C'_tilde(C) [T]^B_C' = [T]^tilde(C)_B
      $

+ #let aamat = math.mat.with(augment: -2)
  $
    lambda_1 mat(0;2;0;0) + lambda_2 mat(1;0;0;0) + lambda_3 mat(2;1;3;7) = mu_1 mat(1;0;3;0) + mu_2 mat(0;1;-3;7) \
    aamat(
      0, 1, 2, 1, 0;
      2, 0, 1, 0, 1;
      0, 0, 3, 3, -3;
      0, 0, 7, 0, 7;
    )
    xarrow(R_1 <=> R_2)
    aamat(
      2, 0, 1, 0, 1;
      0, 1, 2, 1, 0;
      0, 0, 3, 3, -3;
      0, 0, 7, 0, 7;
    )
    xarrow(R_1 => R_1/2)
    aamat(
      1, 0, 1/2, 0, 1/2;
      0, 1, 2, 1, 0;
      0, 0, 3, 3, -3;
      0, 0, 7, 0, 7;
    )
    xarrow(R_3 => R_3/3) \
    aamat(
      1, 0, 1/2, 0, 1/2;
      0, 1, 2, 1, 0;
      0, 0, 1, 1, -1;
      0, 0, 7, 0, 7;
    )
    xarrow(R_1 => R_1 - R_3/2 \ R_2 => R_2 - 2R_3)
    aamat(
      1, 0, 0, -1/2, 1;
      0, 1, 0, -1, 2;
      0, 0, 1, 1, -1;
      0, 0, 7, 0, 7;
    )
    xarrow(R_4 => R_4 - 7R_3)
    aamat(
      1, 0, 0, -1/2, 1;
      0, 1, 0, -1, 2;
      0, 0, 1, 1, -1;
      0, 0, 0, -7, 0;
    )
    xarrow(R_4 => -R_4/7) \
    aamat(
      1, 0, 0, -1/2, 1;
      0, 1, 0, -1, 2;
      0, 0, 1, 1, -1;
      0, 0, 0, 1, 0;
    )
    xarrow(
      R_1 => R_1 + R_4/2 \
      R_2 => R_2 + R_4 \
      R_3 => R_3 - R_4
    )
    aamat(
      1, 0, 0, 0, 1;
      0, 1, 0, 0, 2;
      0, 0, 1, 0, -1;
      0, 0, 0, 1, 0;
    ) \
    cases(
      lambda_1 = mu_2,
      lambda_2 = 2mu_2,
      lambda_3 = -mu_2,
      mu_1 = 0
    )
  $
  $
    U inter W
    &= { lambda_1 mat(0;2;0;0) + lambda_2 mat(1;0;0;0) + lambda_3 mat(2;1;3;7) #delimitizer.Bigg($|$) lambda_1, lambda_2, lambda_3, mu_2, mu_1 in RR and lambda_1 = mu_2 and lambda_2 = 2mu_2 and lambda_3 = -mu_2 and mu_1 = 0 } \
    &= { mu_2 mat(0;2;0;0) + 2mu_2 mat(1;0;0;0) - mu_2 mat(2;1;3;7) #delimitizer.Bigg($|$) mu_2 in RR } \
    &= { mu_2 (mat(0;2;0;0) + 2mat(1;0;0;0) - mat(2;1;3;7)) #delimitizer.Bigg($|$) mu_2 in RR } \
    &= { mu_2 mat(0;1;-3;7) #delimitizer.Bigg($|$) mu_2 in RR } \
    &= Span{mat(0;1;-3;7)}
  $

+ #let aamat = math.mat.with(augment: -2)
  $
    aamat(
      0, 0, 0, 1, 5;
      1, 1, 1, 0, 5;
      1, 1, 2, 1, 3;
      2, 3, 4, 0, 2;
    )
    xarrow(R_1 <=> R_3)
    aamat(
      1, 1, 2, 1, 3;
      1, 1, 1, 0, 5;
      0, 0, 0, 1, 5;
      2, 3, 4, 0, 2;
    )
    xarrow(R_2 => R_2 - R_1 \ R_4 => R_4 - 2R_1)
    aamat(
      1, 1, 2, 1, 3;
      0, 0, -1, -1, 2;
      0, 0, 0, 1, 5;
      0, 1, 0, -2, -4;
    )
    xarrow(R_2 <=> R_4) \
    aamat(
      1, 1, 2, 1, 3;
      0, 1, 0, -2, -4;
      0, 0, 0, 1, 5;
      0, 0, -1, -1, 2;
    )
    xarrow(R_1 => R_1 - R_2)
    aamat(
      1, 0, 2, 3, 7;
      0, 1, 0, -2, -4;
      0, 0, 0, 1, 5;
      0, 0, -1, -1, 2;
    )
    xarrow(R_4 <=> R_3)
    aamat(
      1, 0, 2, 3, 7;
      0, 1, 0, -2, -4;
      0, 0, -1, -1, 2;
      0, 0, 0, 1, 5;
    )
    xarrow(R_3 => -R_3) \
    aamat(
      1, 0, 2, 3, 7;
      0, 1, 0, -2, -4;
      0, 0, 1, 1, -2;
      0, 0, 0, 1, 5;
    )
    xarrow(R_1 => R_1 - 2R_3)
    aamat(
      1, 0, 0, 1, 11;
      0, 1, 0, -2, -4;
      0, 0, 1, 1, -2;
      0, 0, 0, 1, 5;
    ) \
  $
  $
    U inter W
    =& { lambda_1 mat(0;1;1;2) + lambda_2 mat(0;1;1;3) + lambda_3 mat(0;1;2;4) #delimitizer.Bigg($|$) lambda_1, lambda_2, lambda_3, mu_1, mu_2 in ZZ_7 and lambda_1 = mu_1 + 11mu_2 \ &tab tab tab tab tab and lambda_2 = -mu_1 - 4mu_2 and lambda_3 = mu_1 - 2mu_1 and mu_1 + 5mu_2 = 0 } \
    =& { (mu_1 + 11mu_2) mat(0;1;1;2) + (-mu_1 - 4mu_2) mat(0;1;1;3) + (mu_1 - 2mu_2) mat(0;1;2;4) #delimitizer.Bigg($|$) mu_1, mu_2 in ZZ_7 and mu_1 + 5mu_2 = 0 } \
    =& { (-5mu_2 + 11mu_2) mat(0;1;1;2) + (5mu_2 - 4mu_2) mat(0;1;1;3) + (-5mu_2 - 2mu_2) mat(0;1;2;4) #delimitizer.Bigg($|$) mu_2 in ZZ_7 } \
    =& { 6mu_2 mat(0;1;1;2) + mu_2 mat(0;1;1;3) - 7mu_2 mat(0;1;2;4) #delimitizer.Bigg($|$) mu_2 in ZZ_7 } \
    =& { mu_2 (6 mat(0;1;1;2) + mat(0;1;1;3) - 7mat(0;1;2;4)) #delimitizer.Bigg($|$) mu_2 in ZZ_7 } \
    =& { mu_2 mat(0;0;-7;1) #delimitizer.Bigg($|$) mu_2 in ZZ_7 } \
    =& Span{mat(0;0;-7;1)}
  $

+ $
    &dim(Span{mat(1;0)} + Span{mat(0;1)} + Span{mat(1;1)}) \
    =& dim Span{mat(1;0), mat(0;1)} \
    =& 2 \
    !=& 3 \
    =& dim Span{mat(1;0)} + dim Span{mat(0;1)} + dim Span{mat(1;1)} - 0 - 0 - 0 + 0 \
    =& dim Span{mat(1;0)} + dim Span{mat(0;1)} + dim Span{mat(2;0)} - dim{0} - dim{0} - dim{0} + dim{0} \
    =& dim Span{mat(1;0)} + dim Span{mat(0;1)} + dim Span{mat(2;0)}
    \ &tab tab tab tab tab - dim(Span{mat(1;0)} inter Span{mat(0;1)})
    \ &tab tab tab tab tab - dim(Span{mat(1;0)} inter Span{mat(1;1)}) - dim(Span{mat(1;1)} inter Span{mat(0;1)})
    \ &tab tab tab tab tab + dim(Span{mat(1;0)} inter Span{mat(0;1)} inter Span{mat(1;1)}) \
  $

+ #set math.mat(delim: "|")
  + $
      mat(
        1, 2, 3;
        4, 5, 6;
        7, 8, 9;
      )
      = mat(
        1, 2, 3;
        0, -3, -6;
        0, -6, -12;
      )
      = 2 mat(
        1, 2, 3;
        0, -3, -6;
        0, -3, -6;
      )
      = 2 dot 0
      = 0
    $
  
  + $
      mat(
        1, 2, 3;
        2, 4, 5;
        -1, -2, -4;
      )
      = mat(
        1, 2, 3;
        0, 0, -1;
        0, 0, -1;
      )
      = 0
    $
  
  + $
      mat(
        0, 0, 4, 3;
        4, 0, 7, 5;
        -1, 4, 3, 1;
        0, 0, 0, 4;
      )
      = -mat(
        4, 0, 7, 5;
        0, 0, 4, 3;
        -1, 4, 3, 1;
        0, 0, 0, 4;
      )
      = -4mat(
        1, 0, 7/4, 5/4;
        0, 0, 4, 3;
        -1, 4, 3, 1;
        0, 0, 0, 4;
      )
      = -4mat(
        1, 0, 7/4, 5/4;
        0, 0, 4, 3;
        0, 4, 19/4, 9/4;
        0, 0, 0, 4;
      ) \
      = 4mat(
        1, 0, 7/4, 5/4;
        0, 4, 19/4, 9/4;
        0, 0, 4, 3;
        0, 0, 0, 4;
      )
      = 16mat(
        1, 0, 7/4, 5/4;
        0, 1, 19/16, 9/16;
        0, 0, 4, 3;
        0, 0, 0, 4;
      )
      = 64mat(
        1, 0, 7/4, 5/4;
        0, 1, 19/16, 9/16;
        0, 0, 1, 3/4;
        0, 0, 0, 4;
      )
      = 64mat(
        1, 0, 0, -1/16;
        0, 1, 0, 9/64;
        0, 0, 1, 3/4;
        0, 0, 0, 4;
      ) \
      = 256mat(
        1, 0, 0, -1/16;
        0, 1, 0, 9/64;
        0, 0, 1, 3/4;
        0, 0, 0, 1;
      )
      = 256mat(
        1, 0, 0, 0;
        0, 1, 0, 0;
        0, 0, 1, 0;
        0, 0, 0, 1;
      )
      = 256
    $
  
  + $
      mat(
        1, 2, 1, 2;
        2, 2, 2, 1;
        1, 1, 2, 1;
        2, 1, 1, 2;
      )
      = mat(
        1, 2, 1, 2;
        0, -2, 0, -3;
        0, -1, 1, -1;
        0, -3, -1, -2;
      )
      = -mat(
        1, 2, 1, 2;
        0, -1, 1, -1;
        0, -2, 0, -3;
        0, -3, -1, -2;
      )
      = mat(
        1, 2, 1, 2;
        0, 1, -1, 1;
        0, -2, 0, -3;
        0, -3, -1, -2;
      ) \
      = mat(
        1, 0, 3, 0;
        0, 1, -1, 1;
        0, 0, -2, -1;
        0, 0, -4, 1;
      )
      = -2mat(
        1, 0, 3, 0;
        0, 1, -1, 1;
        0, 0, 1, 1/2;
        0, 0, -4, 1;
      )
      = -2mat(
        1, 0, 0, -3/2;
        0, 1, 0, 3/2;
        0, 0, 1, 1/2;
        0, 0, 0, 3;
      )
      = -6mat(
        1, 0, 0, -3/2;
        0, 1, 0, 3/2;
        0, 0, 1, 1/2;
        0, 0, 0, 1;
      )
      = -6mat(
        1, 0, 0, 0;
        0, 1, 0, 0;
        0, 0, 1, 0;
        0, 0, 0, 1;
      )
      = -6
    $
  
  + $
      mat(
        1, 2, 3, 4;
        2, 2, 3, 4;
        3, 3, 3, 4;
        4, 4, 4, 4;
      )
      = mat(
        0, 1, 2, 3;
        1, 1, 2, 3;
        2, 1, 2, 3;
        4, 4, 4, 4;
      )
      = mat(
        0, 1, 2, 3;
        1, 0, 0, 0;
        2, 0, 0, 0;
        4, 4, 4, 4;
      )
      = 2 mat(
        0, 1, 2, 3;
        1, 0, 0, 0;
        1, 0, 0, 0;
        4, 4, 4, 4;
      )
      = 2 dot 0
      = 0
    $
  
  + $
      mat(
        1, 2, 3, 4, 5;
        -78, 13, -43, 111, 11;
        1, 1, 0, 0, 0;
        235, 14, 0, 0, 0;
        1, 89, 0, 0, 0;
      )
      &= mat(
        0, 1, 3, 4, 5;
        0, 91, -43, 111, 11;
        1, 1, 0, 0, 0;
        0, -221, 0, 0, 0;
        0, 88, 0, 0, 0;
      ) \
      &= -221 dot 88 dot mat(
        0, 1, 3, 4, 5;
        0, 91, -43, 111, 11;
        1, 1, 0, 0, 0;
        0, 1, 0, 0, 0;
        0, 1, 0, 0, 0;
      ) \
      &= -221 dot 88 dot 0 \
      &= 0
    $

+ #set math.mat(delim: "|")
  + $
      mat(
        a_1, 0, ..., 0, b_1;
        b_2, a_2, ..., 0, 0;
        0, b_3, a_3, ..., 0;
        dots.v, dots.v, dots.down, dots.down, dots.v;
        0, 0, ..., b_n, a_n;
      )
      &= mat(
        a_1, 0, ..., 0, b_1;
        0, a_2, ..., 0, -b_2/a_1 dot b_1;
        0, 0, a_3, ..., b_3/a_2 dot b_2/a_1 dot b_1;
        dots.v, dots.v, dots.down, dots.down, dots.v;
        0, 0, ..., a_(n-1), (-1)^(n-1) dot b_(n-1)/a_(n-2) dot ... dot b_2/a_1 dot b_1;
        0, 0, ..., 0, a_n;
      ) \
      &= mat(
        a_1, 0, ..., 0, 0;
        0, a_2, ..., 0, 0;
        0, 0, a_3, ..., 0;
        dots.v, dots.v, dots.down, dots.down, dots.v;
        0, 0, ..., a_(n-1), 0;
        0, 0, ..., 0, a_n;
      ) \
      &= a_1 dot ... dot a_n dot  mat(
        1, 0, ..., 0, 0;
        0, 1, ..., 0, 0;
        0, 0, 1, ..., 0;
        dots.v, dots.v, dots.down, dots.down, dots.v;
        0, 0, ..., 1, 1;
        0, 0, ..., 0, 1;
      ) \
      &= a_1 dot ... dot a_n
    $
  
  + $
      mat(
        a^2, (a+1)^2, (a+2)^2, (a+3)^2;
        b^2, (b+1)^2, (b+2)^2, (b+3)^2;
        c^2, (c+1)^2, (c+2)^2, (c+3)^2;
        d^2, (d+1)^2, (d+2)^2, (d+3)^2;
      )
      =& mat(
        a^2, a^2 + 2a + 1, a^2 + 4a + 4, a^2 + 6a + 9;
        b^2, b^2 + 2b + 1, b^2 + 4b + 4, b^2 + 6b + 9;
        c^2, c^2 + 2c + 1, c^2 + 4c + 4, c^2 + 6c + 9;
        d^2, d^2 + 2d + 1, d^2 + 4d + 4, d^2 + 6d + 9;
      ) \
      =& mat(
        a^2, 2a + 1, 4a + 4, 6a + 9;
        b^2, 2b + 1, 4b + 4, 6b + 9;
        c^2, 2c + 1, 4c + 4, 6c + 9;
        d^2, 2d + 1, 4d + 4, 6d + 9;
      ) \
      =& mat(
        a^2, 2a + 1, 2, 6;
        b^2, 2b + 1, 2, 6;
        c^2, 2c + 1, 2, 6;
        d^2, 2d + 1, 2, 6;
      ) \
      =& 3 dot mat(
        a^2, 2a + 1, 2, 2;
        b^2, 2b + 1, 2, 2;
        c^2, 2c + 1, 2, 2;
        d^2, 2d + 1, 2, 2;
      ) \
      =& 3 dot 0 \
      =& 0 \
    $