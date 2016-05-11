(define (smallest-divisor n)(find-divisor n 2))
(define (find-divisor n test-divisor)
	(cond((> (square test-divisor) n) n)
	((divides? n test-divisor) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder a b ) 0))
(define (square x) (* x x))
(define (prime? n) (= (smallest-divisor n) n))


(define (expmod base exp m)
	(cond((= exp 0) 1)
	((even? exp)(remainder (square (expmod base (/ exp 2) m) )m))
	(else(remainder (* base (expmod base (- exp 1) m)) m))))
(define (fermat-test n)
	(define (try-it a)(=(expmod a n n) a))
	(try-it (+ 1 (random (- n 1)))))
(define (fast-prime? n times)
	(cond( (= times 0) true)
	((fermat-test n)(fast-prime? n (- times 1)))
	(else false)))