#lang sicp
;How many different ways can we make change for $1.00, given half-dollars, quarters, dimes, nickels, and pennies?


;The number of ways to change amount a using n kinds of coins is:
; 1. the number of ways to change amount a using all but the first kind of coin
; 2. the number of ways to change amount a-d using all n kinds of coins, where d is the denomination of the first kind of coin

;method:
;If a is exactly 0, we should count 1.
;If a is less than 0, we should return 0.
;If n is 0, we should return 0.

(define (count-change amount)
  (cc amount 1))

(define (cc amount kinds-of-coins)
  (cond   ((= amount 0)1)
          ((or (< amount 0) (= kinds-of-coins 0))0)
          (else (+ (cc amount 
                       (- kinds-of-coins 1))
                   (cc (- amount 
                          (first-denomination kinds-of-coins))
                       kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond   ((= kinds-of-coins 1) 1)
          ((= kinds-of-coins 2) 5)
          ((= kinds-of-coins 3) 10)
          ((= kinds-of-coins 4) 25)
          ((= kinds-of-coins 5) 50)))
