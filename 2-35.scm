(define (acc op init seq)
        (if (null? seq) init (op (car seq) (acc op init (cdr seq)))))
(load "filter.scm")
(define (count-leaves t)
	(acc  (lambda (x y) (+ 1 y))      0   (enumerate-tree t))) 	

(define (cnt-leav t)
	(acc + 0 (map (lambda (subtree) (if (pair? subtree) (cnt-leav subtree) 1)) t)))

