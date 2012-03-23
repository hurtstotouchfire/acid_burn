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

---Ex 1.4 
