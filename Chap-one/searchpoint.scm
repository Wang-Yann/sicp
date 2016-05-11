(load "square.scm")
(define (search f neg-point pos-point)
	(let ((mid-point (average neg-point pos-point)))
		(if (close-enough? neg-point pos-point) mid-point 
			(let ((test-value (f mid-point)))
				(cond ((positive? test-value) (search f neg-point mid-point))
				((negative? test-value) (search f mid-point pos-point))
				(else mid-point))))))

(define (close-enough? a b) ( < (abs (- a b)) 0.001))

(define (half-interval-method f a b)
	(let ((a-value (f a))
	      (b-value (f b)))
	(cond ((and (negative? a-value) (positive? b-value)) (search f a b))
		((and (negative? b-value)(positive? a-value)) (search f b a))
		(else (error "Values are not of opposite sign" a b)))))

(define (fixed-point f first-guess)
	(define (close-enough?  a b) (< (abs ( - a b)) tolerance))
	(define (try guess) 
		(let ((next ( f guess)))
			(if (close-enough? guess next) next (try next))))
	(try first-guess))

(define tolerance 0.0001)

(define (sqrt x)
	(fixed-point (lambda(y) (average y (/ x y))) 1.0))

