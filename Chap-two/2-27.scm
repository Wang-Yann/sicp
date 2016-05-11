(define sq (list  0  (list 1 4) 3 (list 9 16)))
(load "smplst.scm")
(define (reverse lst)
	(define( rev-iter remainlst L)
		 (if( null?  remainlst) L
		 (rev-iter (cdr remainlst) (cons  (car remainlst) L ))))
	 (rev-iter lst '()  ))
(define (deep-reverse-tree tree)
	(cond ((null? tree) '())
	((not (pair? tree)) tree)
	(else(reverse (cons (deep-reverse-tree (car tree)) (deep-reverse-tree (cdr tree)))))))



(define (deep-reverse items)
    (define (d-iter lst result)
	(if  (null? lst)
		 result 
		(d-iter (cdr lst) 
		 (cons
		   (if (pair? (car lst)) ( deep-reverse-tree (car lst) ) (car lst))
		    result))))
			 
    (d-iter items  '() ))

