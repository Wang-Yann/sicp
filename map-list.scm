(define (scale-list lst factor)
	(if (null? lst) '()
	(cons (* (car lst) factor) (scale-list (cdr lst) factor))))

(define (map proc lst)
	(if (null? lst) '() 
	(cons (proc (car lst)) (map proc (cdr lst)))))
