(load "2-61.scm")
(define (intersection-set s1 s2)
	(if (or (null? s1) (null? s2)) '()
		(let  ((x (car s1)) (y (car s2)) )
			(cond ((< x y) (intersection-set (cdr s1) s2))
				 ((= x y) (cons x (intersection-set (cdr s1) (cdr s2))))
				(else (intersection-set s1 (cdr s2)))))))
(define (union-set s1 s2)
	(cond ((null? s1) s2)
		((null? s2) s1)
		(else (let ((x (car s1)) (y (car s2)))
				(cond((< x y)(cons x (union-set (cdr s1) s2)))
					((= x y) (cons x (union-set (cdr s1) (cdr s2))))
					((> x y) (cons y (union-set s1 (cdr s2)) )))))))
