(define (count-leaves lst)
	(cond ( (null? lst) 0)
	((not (pair? lst)) 1)
	(else (+ (count-leaves (car lst)) (count-leaves (cdr lst)))))



