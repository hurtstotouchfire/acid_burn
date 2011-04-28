(define (a-plus-abs-b a b) 
  ( (if (> b 0)
	+
	-)
    a b)) ; zomfg, operators as operands decided from the if, then, due to 
          ; define placement, acting as operators on a and b
i
(define a 7)
(define b 5)
(define c 6)

(if (or (> a b) (> a c)) 
    (* a a)
    "not a")
(if (or (> b a) (> b c))  
    (* b b) 
    "not b")
(if (or (> c a) (> c b))
    (* c c)
    "not c")







