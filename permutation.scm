(load "filter.scm")
(load "nestmap.scm")
(define (permutation s)
	(if (null? s) (list '()) 
	(flatmap (lambda (x) (map (lambda (p) (cons x p)) (permutation (remove x s)))) s)))

(define (remove item seq) (filter (lambda(x) (not (= x item))) seq))
