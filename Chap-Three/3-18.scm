(define (circle? x)
	(define (detect pair mem-list)
		(cond ((not (pair? pair)) #f)
				((memq pair mem-list) #t)
				(else (detect (cdr pair) (cons pair mem-list)))))
	(detect x '()))
(load "3-13.scm")

