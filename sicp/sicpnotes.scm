Lisp usage: 

Typical expression:
	(+ 2 2) ' (operator operand operand ...)
	
Special expressions:
	(define facet 7)

One of the main points of Lisp (& therefore Scheme) is function recursion
	(define (square x) (* x x)) ' (define (function parameter[s]) ("body" or					the defn of the function)

'1.1.5
What is called 'Normal-order evaluation' is 'Fully expand and reduce' like
elementary breaking down of the problem into it's fundamental operators/ands

Lisp interpreter actually uses 'Applicative-order Evaluation' which is more of
the 'tree' structure, with terminal nodes either basic operators or numbers,
and the EVALUATION (Lisp's term for processing, applying the operator to the
operand[s]) of the EXPRESSIONS (Lisp's term for something contained parentheses)
accumulating at each linked node in the tree. I don't yet understand how this
is different than Normal-order, other than maybe it goes left to right and only
goes as deep as it has to in order to be able to evaluate the top-most expr

'1.1.6
Conditionals, like abs, are defined as funcs in which the body is 
cond 	(<p1> <e1>) 'where w/in () is called a CLAUSE, and <pn> is PREDICATE
	(<p2> <e2>) 'number n, which is an expression whose VALUE (result)
	(<pn> <en>) 'is interpreted as true/false, and thus <en> is applied
So, predicates have an implicit 'if', and (else x) is a valid clause as well.

'if' by itself can be used as an extremely limited conditional replacement,
and it is used as (if <predicate> <consequent expr> <alternative>)

Logical operations can also be used as predicate clauses, like 'and, or, not'

exa. (define (a-plus-abs-b a b)
       	( (if (> b 0)
	    	+
		-)
	 a b)) ; if treats operators as *ands, decides b/w for use of a & b

This seems like some pretty advanced stuff. Should probably do ALL nontrivial 
exercises.



