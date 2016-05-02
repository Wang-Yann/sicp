(load "gcd.scm")
(define (make-rat n d)
	(let ((a (gcd n d))
	     (sign (if (< (* n d) 0) -1 1)))
	(cons(* sign (abs ( / n a))) (abs (/ d a)))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
	(newline)
	(display (numer x))
	(display "/")
	(display (denom x)))
