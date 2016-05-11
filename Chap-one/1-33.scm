(define ( accumulate combiner null-value term a next b)
	(if (> a b) null-value 
	(combiner (term a) (accumulate combiner null-value term (next a) next b))))
(load "square.scm")
(load "prime.scm")
(load "gcd.scm")
(define ( accumulate-iter filter1 combiner null-value term a next b)
	(define( acc-iter  a result)
		(cond( (> a b) result)
		((filter1 a) (acc-iter (next a) (combiner result (term a))))
		(else( acc-iter (next a ) result))))
	(acc-iter a null-value))

(define (sumprime a b)
	(accumulate-iter prime?  + 0 (lambda (x) x)  a inc b))

(define (productprime  n)
	(define (gcd? x) (= (gcd n x) 1))
        (accumulate-iter gcd? * 1 (lambda (x) x)  1 inc n))

