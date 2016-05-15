;;;p155
(define rand
	(let ((x 11 ))
	(lambda ( ) (set! x (rand-update x)) x)))
(define (rand-update x) (remainder (+ (* 167 x) 12345) 183647))

(define (estimate-pi trials) (sqrt (/ 6 (monte-carlo trials cesaro-test))))
(define (cesaro-test) (= (gcd (rand) (rand)) 1));;;!!!forget the "()" for func
(define (monte-carlo trials experiment)
	(define (iter remain passed)
		(cond ((= remain 0) (/ passed trials))
				((experiment) (iter (- remain 1) (+ passed 1)))
				(else (iter (- remain 1) passed))))
	(iter trials 0))
