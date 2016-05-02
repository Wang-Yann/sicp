(define (same-parity x . y)
	(define (sp? i) (= (remainder i 2) (remainder x 2)))
	(define (sp-iter lst L)
		(cond ( (null? lst) L)
		((sp? (car lst))(sp-iter (cdr lst) (cons L  (car lst)  )))
		(else (sp-iter (cdr lst) L))))
	(cons x (sp-iter y   '() )))


