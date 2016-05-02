(define (square-list lst)
	(if (null? lst) '()
	(cons (square (car lst) ) (square-list (cdr lst)))))

(define (square-list2 lst)
	(map square lst))

(load "map-list.scm")
