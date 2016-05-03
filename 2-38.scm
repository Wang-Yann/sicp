(define (foldleft op init seq)
	(define (iter result rest)
		(if (null? rest) result
		(iter (op result (car rest)) (cdr rest))))
	(iter init seq))
(load "filter.scm")
(define (foldright op init seq) (acc op init seq))
