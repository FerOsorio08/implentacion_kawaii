#|
Implementation of a Deterministic Finite Automaton (DFA)
A function will receive the definition of a DFA and a string,
and return whether the string belongs in the language
A DFA is defined as a state machine, with 3 elements:
- Transition function
- Initial state
- List of acceptable states
The DFA in this file is used to identify valid arithmetic expressions
Examples:
> (evaluate-dfa (dfa delta-arithmetic 'start '(int float exp)) "-234.56")
'(float exp)
> (arithmetic-lexer "45.3 - +34 / none")
'(var spa)
Gilberto Echeverria
2023-03-30
|#

#lang racket

(require racket/trace)

(provide (all-defined-out))

; Declare the structure that describes a DFA
(struct dfa (func initial accept))

(define (arithmetic-lexer strng)
  (evaluate-dfa (dfa delta-arithmetic 'start '(int float exp var spa op com)) strng))


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
              [(eq? char #\;) (values 'comment #f)]
              [(eq? char #\space) (values 'spa #f)]
              [(eq? char #\( ) (values 'op_par #f)]
              [(eq? char #\) ) (values 'close_par #f)]
              [else (values 'inv #f )])]


    ['sign (cond
         [(char-numeric? char) (values 'int #f)]
         [else (values 'inv #f)])]

    ['int (cond
            [(char-numeric? char) (values 'int #f)]
            [(eq? char #\.) (values 'dot #f)]
            [(or (eq? char #\e) (eq? char #\E))  (values 'e #f)]
            [(char-operator? char) (values 'op 'int)]
            [(eq? char #\space) (values 'spa 'int)]
            [else (values 'inv #f )])]

    ['dot (cond
            [(char-numeric? char)  (values 'float #f)]
            [else (values 'inv #f )])]

    ['float (cond
              [(char-numeric? char) (values 'float #f)]
              [(or (eq? char #\e) (eq? char #\E)) (values 'e #f)]
              [(char-operator? char) (values 'op 'float )]
              [(and (eq? char #\\) (eq? (cadr char) #\;)) (values 'com #f)]
              [(eq? char #\space) (values 'spa 'float)]
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
            [else (values 'inv #f )])]

    ['var (cond
            [(char-alphabetic? char) (values 'var #f)]
            [(char-numeric? char) (values 'var #f)]
            [(eq? char #\_) (values 'var #f)]
            [(char-operator? char) (values 'op 'var)]
            [(eq? char #\space) (values 'spa 'var)]
            [else (values 'inv #f )])]

        ['op (cond
           [(char-numeric? char) (values 'int 'op)]
           [(or (eq? char #\+) (eq? char #\-)) (values 'sign 'op)]
           [(char-alphabetic? char) (values 'var 'op)]
           [(eq? char #\_) (values 'var 'op)]
           [(eq? char #\space) (values 'op_spa 'op)]
           [else (values 'inv #f)])]

    ['spa (cond
            [(char-operator? char) (values 'op #f )]
            [(eq? char #\space) (values 'spa #f )]
            [else (values 'inv #f )])]

    ['op_spa (cond
            [(char-numeric? char) (values 'int #f )]
            [(or (eq? char #\+) (eq? char #\-)) (values 'sign #f )]
            [(char-alphabetic? char) (values 'var #f )]
            [(eq? char #\_) (values 'var #f )]
            [(eq? char #\space) (values 'op_spa #f )]
            ;;; [(eq? char #\( ) (values 'op_paren #f )]
            [else (values 'inv #f )])]

    ['slash (cond
          [(eq? char #\/) (values 'com #f)]
          [else (values 'inv #f)])]


    ['comment (cond
                [(eq? char #\newline) (values 'start 'comment)]
                [else (values 'comment #f)])]
    
    ;;; ['open-paren (cond
    ;;;             [(eq? char #\)) (values 'close-paren #t)
    ;;;             [else (values 'inv #f)]])]

    ['op_par (cond
                [(eq? char #\() (values 'start 'op-paren)]
                [(or (eq? char #\+) (eq? char #\-)) (values 'sign #f)]
                [(eq? char #\space) (values 'op_spa #f)]
                [(char-numeric? char) (values 'int #f)]
                [(char-alphabetic? char) (values 'var #f)]
                [(eq? char #\_) (values 'var #f)]
                [else (values 'inv #f)])]

    ['close_par (cond
                [(eq? char #\) ) (values 'start' 'close_par #f)]
                [else (values 'inv #f)])]

))








(define result (arithmetic-lexer " d ;= a ^ b + 4 + 10 / 9"))
(displayln result)