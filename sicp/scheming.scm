(define (square x) (* x x))

(define (sum-of-squares i j) (+ (square i) (square j)))

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

; have to C-x C-e a couple times after each definition?

(f 5)
