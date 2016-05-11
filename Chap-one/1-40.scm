(define (deriv g)
        (lambda (x)
                (/ (- (g (+ x dx)) (g x)) dx)))

(define dx 0.0000001)
(load "square.scm")

(define (newton-transform g)
        (lambda (x) (- x (/ (g x) ((deriv g) x)))))
(define (newton-method g guess)
	(fixed-point (newton-transform g) guess))
(define (fixed-point f first-guess)
        (define (close-enough?  a b) (< (abs ( - a b)) tolerance))
        (define (try guess)
                (let ((next ( f guess)))
                        (if (close-enough? guess next) next (try next))))
        (try first-guess))
(define tolerance 0.00001)

(define (cubic a b c) (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))

