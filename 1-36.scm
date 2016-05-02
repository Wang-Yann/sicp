(define (fixed-point f first-guess)
        (define (close-enough?  a b) (< (abs ( - a b)) tolerance))
        (define (try guess)
               ( newline)
                (display guess)
		(let ((next ( f guess)))
	        (if (close-enough? guess next)
			 next
			 (try next))))
        (try first-guess))

(define tolerance 0.0001)
(load "square.scm")

(define (sqrt1 x)
        (fixed-point (lambda(y) (average y (/ x y))) 1.0))
(define xyx (lambda (y) (/ (log 1000) (log y))))
(define (average-damp f)(lambda (x) (average x  (f  x))))
(define xyx2 (average-damp xyx)) 
