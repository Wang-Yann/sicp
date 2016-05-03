(define (Miller-Rabin-test n)
    (let ((times (ceiling (/ n 2))))
        (test-iter n times)))

(define (test-iter n times)
    (cond ((= times 0)
            #t)
          ((= (expmod (+ 1 (random (- n 2))) (- n 1) n)
              1)
            (test-iter n (- times 1)))
          (else
            #f)))

(define (square x )(* x x))

(define (test-square a n)
	(if (and (not (= a 1)) (not (= a (- n 1))) (=( remainder (square a) n ) 1))
		0
	(square a)))

(define (expmod base exp m)
    (cond ((= exp 0)   1)
          ((even? exp)
            (remainder (test-square (expmod base (/ exp 2) m)m)
                       m))
          (else  (remainder (* base (expmod base (- exp 1) m))
                       m))))


