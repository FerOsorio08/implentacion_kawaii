# Activity 3.1 - Regular languages

Reference for math symbols:
https://www.overleaf.com/learn/latex/List_of_Greek_letters_and_math_symbols

## Names:
- Emilia Salazar Leipen
- Fernanda Osorio
- Ian Holender 


## Exercises:

1. Give a recursive definition of the set of strings over $\{a, b\}$ that
    contain at least one $b$ and have an even number of $a$’s before the
    first $b$.
    For example: $aab$, $bab$ and $aaaabbabababa$ are in the set,
    but $abb$, $aaab$ and $aa$ are not

    _**SOLUTION:**_



2. Let $X = \{aa, bb\}$ and $Y = \{\lambda, b, ab\}$.

    a. List the strings in set $XY$

    #|string|#|string|#|string
    -|-|-|-|-|-
    aa $\lambda$ || aab || aaab|| 
    bb $\lambda$ || bbb || bbab

    b. How many strings of length 6 are there in $X^*$?
    
    $X=\{aa, bb\}$

    $XX=$

    $XXX=\{aa, bb\}\{aa, bb\}\{aa, bb\}$


    - aaaaaa
    - aaaabb
    - aabbaa
    - aabbbb
    - bbaaaa
    - bbaabb
    - bbbbaa
    - bbbbbb

    There are 8 stringth with length 6 in $X^*$.

   

    c. List the strings in set $Y^*$ of length three or less

    
    #|string|#|string|#|string
    -|-|-|-|-|-
    $\lambda$ || $\lambda$ b|| $\lambda$ ab|| 
    b || b $\lambda$ || bab||
    ab || ab $\lambda$ || abb ||

    

    d. List the strings in set $X^* Y^*$ of length four or less

    #|string|#|string|#|string
    -|-|-|-|-|-



3. Give a recursive definition of the set $\{ a^ib^j | 0 ≤ i ≤ j ≤ 2i\}$

    _**SOLUTION:**_



4. Let $L$ be the set of strings over $\{a, b\}$ generated by the recursive
   definition

    **I. Basis:** $b \in L$

    **II. Recursive Step**: If $u \in L$ then $ub \in L$, $uab \in L$, $uba \in
    L$ and $bua \in L$

    **III. Closure**: A string $u \in L$ only if it can be obtained from the
    basis using a finite number of applications of the recursive step.

    **a.** List the elements in the sets $L_0, L_1, L_2$


    **b.** Is the string $bbaaba$ in $L$? If so, trace how it is produced.
    If not, explain why not.


    **c.** Is the string $bbaaaabb$ in $L$? If so, trace how it is produced.
    If not, explain why not


5. Prove, using induction on the length of a string, that $(w^R)^R = w$ for all
   string $w \in \Sigma$

    _**SOLUTION:**_
