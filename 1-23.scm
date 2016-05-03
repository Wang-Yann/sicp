(define (smallest-divisor n)(find-divisor n 2))
(define (find-divisor n test-divisor)
	(cond((> (square test-divisor) n) n)
	((divides? n test-divisor) test-divisor)
	(else (find-divisor n (next test-divisor)))))

(define (divides? a b) (= (remainder a b ) 0))
(define (square x) (* x x))
(define (prime? n) (= (smallest-divisor n) n))

(define (next x) (if(even? x) (+ x 1) (+ x 2)))
