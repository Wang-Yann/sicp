(define (square-list lst)
	(define (iter items result)
		(if (null? items) result
		(iter (cdr items) (cons   (square (car items)) result ))))
	 (iter (reverse  lst) '() ))
