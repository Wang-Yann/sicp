;(define (f x) 	
 ;  (begin value	(set! value x) ) )
;o(define value 0)

(define f 
	(lambda (first-value) 
		  (set! f (lambda(second-value) 0)     )  first-value  ))
