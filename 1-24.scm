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


(define (next-odd n)(if(odd? n) (+ n 2) (+ n 1)))
(define(continue-primes n count)
	(cond((= count 0) (display "are primes"))
	((fast-prime?  n 20 ) (display n)(newline)
		(continue-primes (next-odd n)(- count 1)))
	(else (continue-primes (next-odd n)  count ))))



(define (search-for-primes n)
	(let ((start-time (real-time-clock)))
	(continue-primes n 10)
	(- (real-time-clock) start-time)))






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
