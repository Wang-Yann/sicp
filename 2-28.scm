(define (fringe tree)
   ; (define (iter tree lst) 
	(cond( (null? tree) '())
	((not (pair? tree)) (list tree))
	(else (append (fringe (car tree)) (fringe (cdr tree)))))) 
