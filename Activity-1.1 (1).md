# Activity 3.1 - Regular languages

Reference for math symbols:
https://www.overleaf.com/learn/latex/List_of_Greek_letters_and_math_symbols

## Names:
- Fernanda Osorio
- Emilia Salazar
- Ian Holender


## Exercises:

1. Let $X$ be a finite set. Give a recursive definition of the set of subsets
    of $X$ (the Power set of $X$) $P(X)$.
    Use union as the operator on the definition

    _**SOLUTION:**_




2. Prove by induction on $n$ that:

    $\sum_{i=0}^{n}i^3 = \frac{n^2(n+1)^2}{4}$

    _**SOLUTION: Proof**_
    
    <span style="color:red">**Proof**</span>


    **Basis:** 
    
    *if* $n=0 \rightarrow \sum^1_{i=0}i^3=\frac{0^2(0+0)^2}{4}\newline 0^3 = \frac{0^2(0)^2}{4} \newline 0=0$
    
    Therefore proving that 0 = 0 is true and making it our basic case.

    **Inductive hypothesis:** 

    *if* $n=k$ thus holing  $\rightarrow \sum^k_{i=0} i^3= \frac{k^2(k+1)^2}{4}$ 

    **Inductive step:** 
    $$n=k+1$$
    $$ \sum^{k+1}_{i=0} i^3= \frac{(k+1)^2(k+1+1)^2}{4}$$

    We must solve the sum now in order to prove by induction:

    $$\sum^k_{i=0} i^3+(k+1)^3=\frac{(k+1)^2(k+2)^2}{4}$$
    - $(k+1)^3$ is raised to the third power due to $i^3$ power.
    - now, we replace $\sum^k_{i=0} i^3= \frac{k^2(k+1)^2}{4}$ using the *Inductive hypothesis* and solve:
    $$\frac{k^2(k+1)^2}{4}+(k+1)^3=\frac{(k+1)^2(k+2)^2}{4}$$
    $$\frac{k^2(k+1)^2+4(k+1)^3}{4}=\frac{(k+1)^2(k+2)^2}{4}$$
    $$\frac{(k+1)^2[k^2+4(k+1)]}{4}=\frac{(k+1)^2(k+2)^2}{4}$$
    $$\frac{(k+1)^2[k^2+4k+4]}{4}=\frac{(k+1)^2(k^2+4k+4)}{4}$$
    $$\frac{(k+1)^2[k^2+4k+4]}{4}=\frac{(k+1)^2(k^2+4k+4)}{4}$$

    This equivalency further proves the equiality by using *"prove by induction"*.




3. Using the tree below, give the values of each of the items:
![Tree image](/Screenshot%202023-02-22%20at%2018.40.26.png)


<!-- ![Alt text](https://media.geeksforgeeks.org/wp-content/cdn-uploads/binary-tree-to-DLL.png "a title") -->


    a. the depth of the tree

    ``

    b. the ancestors of x18

    ``

    c. the internal nodes of the tree

    ``

    d. the length of the path from x3 to x14

    ``

    e. the vertex that is the parent of x16

    ``

    f. the vertices children of x7

    ``
