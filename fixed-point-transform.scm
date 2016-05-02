(define (deriv g)
	(lambda (x) 
		(/ (- (g (+ x dx)) (g x)) dx)))

(define dx 0.0000001)
(load "square.scm")

(define (newton-transform g)
	(lambda (x) (- x (/ (g x) ((deriv g) x)))))
(define (fixed-point f first-guess)
        (define (close-enough?  a b) (< (abs ( - a b)) tolerance))
        (define (try guess)
                (let ((next ( f guess)))
                        (if (close-enough? guess next) next (try next))))
        (try first-guess))
(define tolerance 0.00001)
(define (fixed-point-of-transform g transform guess)
	(fixed-point (transform g) guess))


(define (sqrt x)
	 (fixed-point-of-transform
		 (lambda (y) (- (square y) x)) newton-transform 1.0))
