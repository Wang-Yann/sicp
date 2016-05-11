(define( repeated f n)
        (if (= n 1) f
        (compose f (repeated f (- n 1)))))

(define (compose f g) (lambda (x) (f (g x))))
(load "fixed-point-transform.scm")
(define (sqrt4 x)
	(let (( g (lambda (y) (/ x (cube y)))))
	(fixed-point  ((repeated  average-damp  2) g) 1.1)))
(define (average-damp g)
	(lambda (x)(average x (g x)))) 

(define (average-damp-n f n) ((repeated average-damp n) f))
(define (damp-nth-root n damtimes)
	(lambda (x) (fixed-point
		 (average-damp-n  (lambda (y) (/ x (expt y (- n 1)))) damtimes) 		  1.0 )))
(define (lg n) (cond ((> (/ n 2) 1) (+ (lg (/ n 2)) 1))
		((< (/ n 2) 1) 0)
		(else 1)))
(define (nth-root n)  (damp-nth-root n (lg n)))

(define hroot (nth-root 100))
