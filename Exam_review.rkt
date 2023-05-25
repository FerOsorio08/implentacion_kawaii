#lang racket

(require racket/trace)

(provide (all-defined-out))

;;; (define lst '(1 2 3 4 5 6 7 8))

; Define a function 'double' which accepts a list as input
(define (double lst)
    ; Define an internal procedure 'loop' with 3 arguments: 
    ; List 'lst', integer variable 'index' initialized to 1, and empty list 'res'
    (let loop
        ([lst lst]
        [index 1]
        [res '()])
        ; Check if the input list is empty, if yes then reverse and return list 'res'
        (if (empty? lst)
            (reverse res)
            ; If the list is not empty, run the 'loop' procedure recursively
            ; Update the variables in each iteration of 'loop': 
            ; Increment 'index' by 1, multiply the first element of 'lst' by 'index'
            ; and add the result to the front of the list 'res'
            (loop (cdr lst) (+ index 1) (cons (* (car lst) index) res))
        )
    )
)

;;; '(7 3 5 4 1 2) = '(7 6 15 16 5 12)  resultado
;;; > (double '(7 3 5 4 1 2))
;;; '(7 6 15 16 5 12)

; Define a function 'fours' which accepts a list as input
(define (fours lst)
    ; Define an internal procedure 'loop' with 2 arguments: 
    ; List 'lst' and empty list 'res'
    (let loop
        ([lst lst]
        [res '()])
        ; Check if the input list is empty, if yes then reverse and return list 'res'
        (if (empty? lst)
            (reverse res)
            ; If the list is not empty, run the 'loop' procedure recursively
            ; Update the variables in each iteration of 'loop': 
            ; Take the first element of 'lst', check if the last digit of the number is 4
            ; If yes, prepend the number to the front of the list 'res'
            ; If no, keep the list 'res' unchanged
            (loop (cdr lst)
                (if (= (remainder(car lst)10)4)
                    (cons (car lst) res)
                    res
                )
            )
        )
    )
)

;;; '(2 14 0 4 380 404 13 84) = '(14 4 404 84) solo los que acabcan 4 
;;; > (fours '(2 14 0 4 380 404 13 84))
;;; '(14 4 404 84)
