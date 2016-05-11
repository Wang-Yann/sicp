(define (for-each proc lst)
	(if (not (null? lst))
		(begin  (proc (car lst)) (for-each proc (cdr lst)))))

(define g (lambda (x) (newline) (display x)))
