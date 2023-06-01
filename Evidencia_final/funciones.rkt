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

  ; define a named let for looping through characters in the input string
  (let loop ([chars (string->list strng)] ; remaining characters to process
             [state (dfa-initial dfa-to-evaluate)] ; current state of the DFA
             [tokens '()] ; list of tokens found so far
             [current-token '()]) ; current token being built from characters

    ; conditional expression to handle end of input string
    (cond
      [(empty? chars)
       ; check if final state is an accept state
       (if (member state (dfa-accept dfa-to-evaluate))
           ; build final token list in reverse order
           (if (eq? state 'spa)
               (reverse tokens)
               (let ([result (cons (list state (list->string (reverse current-token))) tokens)])
                 (reverse result)))
           ; return 'inv if not in an accept state
           'inv)]

; otherwise, process the next character in the input string
      [else
       (let-values ([(new-state found) ((dfa-func dfa-to-evaluate) state (car chars))])

        ; if the character is part of the alphabet, update the state and current token
         (if found
             (loop (cdr chars)
                   new-state
                   (cons (list found (list->string (reverse current-token))) tokens)
                    (if (eq? #\space (car chars))
                    '() ; start building a new token for spaces
                       (list (car chars)))) ; add character to current token
        
             ; if the character is not part of the alphabet, continue to next character
             (loop (cdr chars)
                   new-state
                   tokens
                   (if (eq? #\space (car chars))
                       current-token ; save the current token for spaces
                       (cons (car chars) current-token)))))])))
(define (char-operator? char)
  " Identify caracters that represent arithmetic operators "
  (member char '(#\+ #\- #\* #\/ #\= #\^)))

(define (delta-arithmetic state char)
(case state
    ['start
     (cond
       [(char-numeric? char) (values 'int #f)]
       [(char-alphabetic? char) (values 'var #f)]
       [(or (eq? char #\+) (eq? char #\-)) (values 'sign #f)]
       [(eq? char #\/) (values 'slash #f)]
       [(eq? char #\_) (values 'var #f)]
       [(eq? char #\;) (values 'comment #f)]
       [(eq? char #\space) (values 'spa #f)]
       [(eq? char #\() (values 'op_par #f)]
       [(eq? char #\)) (values 'close_par #f)]
       [else (values 'inv #f)])]
      

    ['sign
     (cond
       [(char-numeric? char) (values 'int #f)]
       [else (values 'inv #f)])]
['int
     (cond
       [(char-numeric? char) (values 'int #f)]
       [(eq? char #\.) (values 'dot #f)]
       [(or (eq? char #\e) (eq? char #\E)) (values 'e #f)]
       [(char-operator? char) (values 'op 'int)]
       [(eq? char #\space) (values 'spa 'int)]
       [(eq? char #\() (values 'op_par 'int)]
       [(eq? char #\)) (values 'close_par 'int)]
       [else (values 'inv #f)])]

    ['dot
     (cond
       [(char-numeric? char) (values 'float #f)]
       [else (values 'inv #f)])]

    ['float
     (cond
       [(char-numeric? char) (values 'float #f)]
       [(or (eq? char #\e) (eq? char #\E)) (values 'e #f)]
       [(char-operator? char) (values 'op 'float)]
       [(and (eq? char #\\) (eq? (cadr char) #\;)) (values 'com #f)]
       [(eq? char #\space) (values 'spa 'float)]
       [else (values 'inv #f)])]
 ['e
     (cond
       [(char-numeric? char) (values 'exp #f)]
       [(or (eq? char #\+) (eq? char #\-)) (values 'e_sign #f)]
       [else (values 'inv #f)])]

    ['e_sign
     (cond
       [(char-numeric? char) (values 'exp #f)]
       [else (values 'inv #f)])]

     ['exp
     (cond
       [(char-numeric? char) (values 'exp #f)]
       [(char-operator? char) (values 'op 'exp)]
       [(eq? char #\space) (values 'spa 'exp)]
       [else (values 'inv #f)])]

    ['var
     (cond
       [(char-alphabetic? char) (values 'var #f)]
       [(char-numeric? char) (values 'var #f)]
       [(eq? char #\_) (values 'var #f)]
       [(char-operator? char) (values 'op 'var)]
       [(eq? char #\space) (values 'spa 'var)]
       [else (values 'inv #f)])]

    ['op
     (cond
       [(char-numeric? char) (values 'int 'op)]
       [(or (eq? char #\+) (eq? char #\-)) (values 'sign 'op)]
       [(char-alphabetic? char) (values 'var 'op)]
       [(eq? char #\_) (values 'var 'op)]
       [(eq? char #\space) (values 'op_spa 'op)]
       [(eq? char #\() (values 'op_par 'op)]
       [(eq? char #\)) (values 'close_par 'op)]
       [else (values 'inv #f)])]
    

    ['spa
     (cond
       [(char-operator? char) (values 'op #f)]
       [(eq? char #\space) (values 'spa #f)]
       [(eq? char #\() (values 'op_par #f)]
       [(eq? char #\)) (values 'close_par #f)]
       [else (values 'inv #f)])]
(define result (arithmetic-lexer ")( D = (a ^ B + 4 + 10 / 9 "))