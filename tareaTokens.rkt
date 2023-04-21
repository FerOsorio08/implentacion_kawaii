

#lang racket

(require racket/trace)

(provide (all-defined-out))

; Declare the structure that describes a DFA
(struct dfa (func initial accept))


(define (arithmetic-lexer strng)
  (trace evaluate-dfa)
  (evaluate-dfa (dfa delta-arithmetic 'start '(int float exp var spa op com lparen rparen)) strng))



(define (evaluate-dfa dfa-to-evaluate strng)
  " This function will verify if a string is acceptable by a DFA "
  (let loop
    ([chars (string->list strng)]
     [state (dfa-initial dfa-to-evaluate)]
     [tokens '()]
     [current-token '()])
    (cond
      [(empty? chars)
       (if (member state (dfa-accept dfa-to-evaluate))
           (reverse (cons (cons state (list->string (reverse current-token))) tokens))
           'inv)]
      [else
       (let-values
           ([(new-state found) ((dfa-func dfa-to-evaluate) state (car chars))])
         (loop (cdr chars)
               new-state
               (cond
                 [found (cons (cons found (list->string (reverse current-token))) tokens)]
                 [else tokens])
               (cond
                 [found '()]
                 [else (cons (car chars) current-token)])))])))


(define (char-operator? char)
  " Identify caracters that represent arithmetic operators "
  (member char '(#\+ #\- #\* #\/ #\= #\^)))

(define (delta-arithmetic state char)
  " Transition function to validate numbers
  Initial state: start
  Accept states: int float exp "
  (case state
    ['start (cond
         [(char-numeric? char) (values 'int #f)]
         [(or (eq? char #\+) (eq? char #\-)) (values 'sign #f)]
         [(char-alphabetic? char)(values 'var #f)]
         [(eq? char #\/) (values 'slash #f)]
         [(eq? char #\_)(values 'var #f)]
         [(eq? char #\;) (values 'com #f)]
         [(eq? char #\() (values 'spa 'lparen)] 
         [(eq? char #\)) (values 'spa 'rparen)] 

         [else (values 'inv #f)])]

        

    ['sign (cond
         [(char-numeric? char) (values 'int #f)]
         [else (values 'inv #f)])]

    ['int (cond
            [(char-numeric? char) (values 'int #f)]
            [(eq? char #\.) (values 'dot #f)]
            [(or (eq? char #\e) (eq? char #\E))  (values 'e #f)]
            [(char-operator? char) (values 'op 'int)]
            [(eq? char #\space) (values 'spa 'int)]
            [(eq? char #\() (values 'lparen 'int)]
            [(eq? char #\)) (values 'rparen 'int)]
            [else (values 'inv #f )])]

    ['dot (cond
            [(char-numeric? char)  (values 'float #f)]
            [else (values 'inv #f )])]

    ;;; ['float (cond
    ;;;           [(char-numeric? char) (values 'float #f)]
    ;;;           [(or (eq? char #\e) (eq? char #\E)) (values 'e #f)]
    ;;;           [(char-operator? char) (values 'op 'float )]
    ;;;           [(and (eq? char #\\) (eq? (cadr char) #\;)) (values 'com #f)]
    ;;;           [(eq? char #\space) (values 'spa 'float)]
    ;;;           [(eq? char #\() (values 'lparen 'float)]
    ;;;           [(eq? char #\)) (values 'rparen 'float)]
    ;;;           [else (values 'inv #f )])]
    
    ['float (cond
          [(char-numeric? char) (values 'float #f)]
          [(or (eq? char #\e) (eq? char #\E)) (values 'e #f)]
          [(char-operator? char) (values 'op 'float )]
          [(eq? char #\;) (values 'com #f)]
          [(eq? char #\() (values 'lparen 'float)]
          [(eq? char #\)) (values 'rparen 'float)]
          [else (values 'inv #f )])]



    ['e (cond
          [(char-numeric? char) (values 'exp #f)]
          [(or (eq? char #\+) (eq? char #\-)) (values 'e_sign #f)]
          [else (values 'inv #f )])]

    ['e_sign (cond
               [(char-numeric? char) (values 'exp #f)]
               [else (values 'inv #f )])]

    ['exp (cond
            [(char-numeric? char) (values 'exp #f)]
            [(char-operator? char) (values 'op 'exp)]
            [(eq? char #\space) (values 'spa 'exp)]
            [(eq? char #\() (values 'lparen 'exp)]
            [(eq? char #\)) (values 'rparen 'exp)]
            [else (values 'inv #f )])]

    ['var (cond
            [(char-alphabetic? char) (values 'var #f)]
            [(char-numeric? char) (values 'var #f)]
            [(eq? char #\_) (values 'var #f)]
            [(char-operator? char) (values 'op 'var)]
            [(eq? char #\space) (values 'spa 'var)]
            [(eq? char #\() (values 'lparen 'var)]
            [(eq? char #\)) (values 'rparen 'var)]
            [else (values 'inv #f )])]

    ;;;     ['op (cond
    ;;;        [(char-numeric? char) (values 'int 'op)]
    ;;;        [(or (eq? char #\+) (eq? char #\-)) (values 'sign 'op)]
    ;;;        [(char-alphabetic? char) (values 'var 'op)]
    ;;;        [(eq? char #\_) (values 'var 'op)]
    ;;;        [(eq? char #\space) (values 'op_spa 'op)]
    ;;;        [(eq? char #\() (values 'lparen 'op)]
    ;;;        [(eq? char #\)) (values 'rparen 'op)]
    ;;;        [else (values 'inv #f)])]

    ;;; ['spa (cond
    ;;;         [(char-operator? char) (values 'op #f )]
    ;;;         [(eq? char #\space) (values 'spa #f )]
    ;;;         [(eq? char #\() (values 'lparen #f )]
    ;;;         [(eq? char #\)) (values 'rparen #f )]
    ;;;         [else (values 'inv #f )])]

    ;;; ['op_spa (cond
    ;;;         [(char-numeric? char) (values 'int #f )]
    ;;;         [(or (eq? char #\+) (eq? char #\-)) (values 'sign #f )]
    ;;;         [(char-alphabetic? char) (values 'var #f )]
    ;;;         [(eq? char #\_) (values 'var #f )]
    ;;;         [(eq? char #\space) (values 'op_spa #f )]
    ;;;         [else (values 'inv #f )])]

      ['op (cond
           [(char-numeric? char) (values 'int 'op)]
           [(or (eq? char #\+) (eq? char #\-)) (values 'sign 'op)]
           [(char-alphabetic? char) (values 'var 'op)]
           [(eq? char #\_) (values 'var 'op)]
           [(eq? char #\space) (values 'spa 'op)] ; Return 'spa' instead of 'op_spa'
           [(eq? char #\() (values 'lparen 'op)]
           [(eq? char #\)) (values 'rparen 'op)]
           [else (values 'inv #f)])]

    ['spa (cond
            [(char-operator? char) (values 'op 'spa)] ; Return 'op' and 'spa'
            [(eq? char #\space) (values 'spa 'spa)] ; Return 'spa' and 'spa'
            [(eq? char #\() (values 'lparen 'spa)] ; Return 'lparen' and 'spa'
            [(eq? char #\)) (values 'rparen 'spa)] ; Return 'rparen' and 'spa'
            [else (values 'inv #f)])]

    ['op_spa (cond
            [(char-numeric? char) (values 'int 'spa)] ; Return 'int' and 'spa'
            [(or (eq? char #\+) (eq? char #\-)) (values 'sign 'spa)] ; Return 'sign' and 'spa'
            [(char-alphabetic? char) (values 'var 'spa)] ; Return 'var' and 'spa'
            [(eq? char #\_) (values 'var 'spa)] ; Return 'var' and 'spa'
            [(eq? char #\space) (values 'spa 'spa)] ; Return 'spa' and 'spa'
            [else (values 'inv #f)])]
    
    ['slash (cond
          [(eq? char #\/) (values 'com #f)]
          [else (values 'inv #f)])]
    
    ['com (cond
        [(eq? char #\newline) (values 'start 'com)]
        [else (values 'com #f)])]
    
    
    

))





(displayln (arithmetic-lexer "d = a ^ b + 4 + 10 / 9 ;This is a comment (3 + 5)"))

