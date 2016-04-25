(define (new-if predicate then-clause else-clause)
	(cond (predicate then-clause)
	(else-clause)))




(define (sqrt-iter guess x)
	(new-if (good-enough? guess x)
		guess
		(sqrt-iter (improve guess x) x)))
(define (good-enough? guess x)
	(<(abs (- (square guess) x)) 0.01))

(define (improve guess x)
	(average guess (/ x guess)))

(define (average x y)
	(/ (+ x y) 2.0))
(define (square x) ( * x x))
(define (sqrt x) ( sqrt-iter 1.0 x))
