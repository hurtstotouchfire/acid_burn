(define (square x) (* x x))

(define (sum-of-squares i j) (+ (square i) (square j)))

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

; have to C-x C-e a couple times after each definition?

(f 5)

;case analyses using "cond"
; always run defns twice...
(define (abs x)
  (cond ((< x 0) (- x))
;	((= x 0) 0)
;	((< x 0) (- x))))
	(else x)))
