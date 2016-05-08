(load "2-62.scm")
(load "2-63.scm")
(load "2-64.scm")
(define (union-tree t1 t2)
	(list->tree (union-set (tree->list2  t1) (tree->list2 t2))))                                                                         




(define (intersection-tree t1 t2)
	(list->tree (intersection-set (tree->list2 t1) (tree->list2 t2))))
 
 
