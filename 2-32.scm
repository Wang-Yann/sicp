(define (subset s)
	(if (null? s) (list '()) 
	(let ((rset (subset (cdr s))))
		(append rset (map (lambda (sb) ( cons (car s) sb))   rset)))))
