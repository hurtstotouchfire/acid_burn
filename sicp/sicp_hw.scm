---Ex 1.1 - If left is given to interpreter, what is printed?
10  = 10
(+ 5 3 4) = 12
( - 9 1) = 8
(/ 6 2) = 3
(+ (* 2 4) (- 4 6)) = 6
(define a 3) =  3 (maybe a), wrong it was a
(define b (+ a 1)) = b?
(+ a b (* a b)) = 19
(= a b) = False instead, #f
(if (and (> b a) (< b (* a b)))
    b
    a) = b, or 4
(cond ((= a 4) 6) 
      ((= b 4) (+ 6 7 a)) 
      (else 25)) = 16
(+ 2 (if (> b a) b a)) = 6
(* (cond ((> a b) a) 
         ((< a b) b) 
         (else -1))
    (+ a 1)) = 16
-All correct! Outside the false thing

---Ex 1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 3))))) (* 3 (- 6 2) (- 2 7)) )

---Ex 1.3 - "Define a proc that takes 3 numbers as args and returns the sum of squares of the two larger numbers"
(define (ex1.3 a b c) 
    (+ (expt (max a b c) 2) (expt (- (+ a b c) (max a b c) (min a b c) ) 2) ))

---Ex 1.4 -"Describe beh of proc using 'our mdl of eval'"
(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))

---Ex 1.5 
(define (p) (p))
(define (test x y)
    (if (= x 0)
    0
    y))
(test 0 (p))

Identify behavior if using applicative-order or normal-order
-exa normal order, break everything down to primitive expressions? 
-"don't evalute the operands until their values are needed" aka "fully expand and reduce", way less efficient
(sum-of-squares (+ 5 1)                 (* 5 2)) = 
(+              (square (+ 5 1))        (square (* 5 2))) = 
(+              (* (+ 5 1) (+ 5 1))     (* (* 5 2) (* 5 2))) = actual evaluation:
(+              (* 6 6 )                (* 10 10))
(+              36                      100)
136
-exa applicative order, which is what the interpreter actually uses
-applicative is, when it encounters a primitive expression, even if the subfunctions aren't evaluated, the primitive expression is evaluated and then fed into successive subfunctions as necessary
-can think of it as evaluating a primitive expression as first in the order of operations?
(sum-of-squares (+ 5 1) (* 5 2)) = 
(+ (square 6) (square 10)) =
(+ (* 6 6) (* 10 10)) = 
(+ 36 100) = 136

applicative: (test 0 (p)) = 
             never evaluated b/c p is infinitely expaneded unto itself?
             (test 0 (p)) = (test 0 (p)) = ...
normal (test 0 (p)) = 
       (if (= 0 0) 0 (p)) = 
       (if #t 0 (p)) = 0
solution: normal never evalutes (p) since it never reaches it, as it returns 0, while applicative does since it tries to evaluate (p) infinitely before trying to "scale down" so to speak
/caveat: trying to evaluate (p) from (define (p) (p)), which defines it as itself, needing to be defined again, makes an infinite loop
