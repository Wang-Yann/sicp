(define (square x) (* x x))

(define (expmod base exp m)
	(cond((= exp 0) 1)
	((even? exp)(remainder (square (expmod base (/ exp 2) m) )m))
	(else(remainder (* base (expmod base (- exp 1) m)) m))))

(define (Car-iter i  n) 
	(cond ((= i n) #t)
	((fermat-test i n) (Car-iter (+ i 1) n))
	(else #f)))



(define (fermat-test a n)
	(=(expmod a n n) a))
(define (carmichael n)
	(Car-iter 2 n))
