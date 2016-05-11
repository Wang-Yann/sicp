(define (make-interval a b) (cons a b))
(define (upper-bound ntv)  (cdr ntv))
(define (lower-bound ntv)  (car ntv))
(define (print-ntv x)
	(newline)
	(display "[")
	(display (lower-bound x))
	(display " ; ")
	(display (upper-bound x))
	(display "]"))