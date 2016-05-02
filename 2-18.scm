(define sq (list 1 4 9 16))

(define (reverse lst)
	(define( rev-iter remainlst L)
		 (if( null?  remainlst) L
		 (rev-iter (cdr remainlst) (cons  (car remainlst) L ))))
	 (rev-iter lst '()  ))
