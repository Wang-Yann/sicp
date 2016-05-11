(define ( accumulate combiner null-value term a next b)
	(if (> a b) null-value 
	(combiner (term a) (accumulate combiner null-value term (next a) next b))))
(load "square.scm")

(define (sum term a next b)
	(accumulate + 0 term a next b))

(define (sumint a b) (sum (lambda (x) x) a inc b))

(define (product term a next b)
	(accumulate * 1 term a next b))

(define (productint a b) (product (lambda (x ) x) a inc b))

(define ( accumulate-iter combiner null-value term a next b)
	(define( acc-iter  a result)
		(if (> a b) result
		(acc-iter (next a) (combiner result (term a)))))
	(acc-iter a null-value))

(define (sum2 term a next b)
	(accumulate-iter + 0 term a next b))
