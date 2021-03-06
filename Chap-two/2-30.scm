(define (scale-tree tree factor)	
	(map (lambda (subtree) 
		(if (pair? subtree) (scale-tree subtree factor) (* subtree factor)))
	tree))

(define (square-tree tree)
	(cond ((null? tree) '())
	((not(pair? tree)) (square tree))
	(else (cons (square-tree (car tree)) (square-tree (cdr tree))))))

(define (square-tree-map tree)
	(map (lambda(subtree) (if (pair? subtree) (square-tree-map subtree) (square subtree)))
	tree))
(load "smplst.scm")
