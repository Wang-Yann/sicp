(define (append! x y)
	(set-cdr! (last-pair x) y) x)
(define (last-pair x) 
	(if (null? (cdr x)) x (last-pair (cdr x))))
(define x '( a b))
(define y '( c d))
(define z (append x y))
;(define w (append! x y))
