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
Emilia Salazar
Fernanda Osorio
Ian Holender
2023-03-30
|#

#lang racket

(require racket/trace)

(provide (all-defined-out))

; Declare the structure that describes a DFA
(struct dfa (func initial accept))


; This is a function definition in Racket that takes a string as input.
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
          (if (eq? state 'spa)
            (reverse tokens)
            (reverse (cons (list state (list->string (reverse current-token))) tokens)))           
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
             [(char-alphabetic? char) (values 'var #f)]
             [(or (eq? char #\+) (eq? char #\-)) (values 'sign #f)]
             [(eq? char #\/) (values 'slash #f)]
             [(eq? char #\_)(values 'var #f)]
             [(eq? char #\;) (values 'comment #f)]
             [(eq? char #\space) (values 'spa #f)]
             [(eq? char #\( ) (values 'op_par #f)]
             [(eq? char #\) ) (values 'close_par #f)]
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
            [(eq? char #\( ) (values 'op_par 'int)]
            [(eq? char #\) ) (values 'close_par 'int)]
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
         [else (values 'inv #f)])]

    ['op (cond
           [(char-numeric? char) (values 'int 'op)]
           [(or (eq? char #\+) (eq? char #\-)) (values 'sign 'op)]
           [(char-alphabetic? char) (values 'var 'op)]
           [(eq? char #\_) (values 'var 'op)]
           [(eq? char #\space) (values 'op_spa 'op)]
           [(eq? char #\( ) (values 'op_par 'op)]
           [(eq? char #\) ) (values 'close_par 'op)]
           [else (values 'inv #f)])]

    ['spa (cond
            [(char-operator? char) (values 'op #f )]
            [(eq? char #\space) (values 'spa #f )]
            [(eq? char #\( ) (values 'op_par #f )]
            [(eq? char #\) ) (values 'close_par #f)]
            [else (values 'inv #f)])]

    ['op_spa (cond
            [(char-numeric? char) (values 'int #f )]
            [(or (eq? char #\+) (eq? char #\-)) (values 'sign #f )]
            [(char-alphabetic? char) (values 'var #f )]
            [(eq? char #\_) (values 'var #f )]
            [(eq? char #\space) (values 'op_spa #f )]
            
            [(eq? char #\( ) (values 'op_par #f )]
            [(eq? char #\) ) (values 'close_par #f )]
            ;;; [(eq? char #\( ) (values 'op_paren #f )]
            [else (values 'inv #f )])]

    ['slash (cond
          [(eq? char #\/) (values 'com #f)]
          [else (values 'inv #f)])]


    ['comment (cond
                [(eq? char #\newline) (values 'start 'comment)]
                [(char-numeric? char) (values 'int #f )]
                ;;; [else (values 'comment #f)])]
                [else (values 'inv #f)])]
    
    ;;; ['open-paren (cond
    ;;;             [(eq? char #\)) (values 'close-paren #t)
    ;;;             [else (values 'inv #f)]])]

    ; If the current symbol represents an opening parenthesis, we add it to the tokens list
    ['op_par (cond
                [(eq? char #\() (values 'start 'op_par)]
                [(or (eq? char #\+) (eq? char #\-)) (values 'sign 'op_par)]
                [(char-operator? char) (values 'op 'op_par)]
                [(char-numeric? char) (values 'int 'op_par)]
                [(char-alphabetic? char) (values 'var 'op_par)]
                [(eq? char #\space) (values 'op_spa 'op_par)]
                [(eq? char #\_) (values 'var 'op_par)]
                [(eq? char #\( ) (values 'op_par 'op_par)]
                [else (values 'inv 'op-par)])]

    ; If the current symbol represents a closing parenthesis, we update the counter and add its token to the list.
    ['close_par (cond
                [(eq? char #\) ) (values 'close_par 'close_par)]
                [(or (eq? char #\+) (eq? char #\-)) (values 'sign 'close_par)]
                [(char-numeric? char) (values 'int 'close_par)]
                [(char-alphabetic? char) (values 'var 'close_par)]
                [(char-operator? char) (values 'op 'close_par)]
                [(eq? char #\space) (values 'op_spa 'close_par)]
                [(eq? char #\_) (values 'var 'close_par)]
                [(eq? char #\( ) (values 'op_par 'close_par)]
                ;;; [else (values 'inv 'close_par)])]
                [else (values 'inv #f)])]

    [else (values 'inv #f)]

    
))



;;; (display-tokens result)

(define result (arithmetic-lexer ")( D = (a ^ B + 4 + 10 / 9 "))
(define result01 (arithmetic-lexer "2"))
(define result02 (arithmetic-lexer "97 /6 = 2 + 1"))
(define result03 (arithmetic-lexer "5.23"))
(define result04 (arithmetic-lexer "2 + 1"))
(define result05 (arithmetic-lexer "5.2+3.7"))
(define result06 (arithmetic-lexer "data"))
(define result07 (arithmetic-lexer "one+two"))

;;; (displayln (for/list ([token result]) (format "~a -> ~a" (car token) (cdr token))))
(displayln (for/list ([token result]) (format "~a ---> ~a\n" (car token) (cdr token))))


;;; (displayln result)
;;; (displayln result01)
;;; (displayln result02)
;;; (displayln result03)
;;; (displayln result04)
;;; (displayln result05)
;;; (displayln result06)
;;; (displayln result07)

