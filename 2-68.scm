(load "2-67.scm")
(define (element-of-tree-symbols? x tree) ( element-of-set? x (symbols tree )))
(define ( element-of-set? x set)
     (cond ( (null? set) #f)
         ((equal? x (car set)) #t)
         (else (element-of-set? x (cdr  set)))))

(define (encode message tree)
	(if (null? message) '() 
		(append (encode-symbol (car message) tree) (encode (cdr message) tree))))
(define (encode-symbol x tree)
	(cond( (leaf? tree) '())
		  ((element-of-tree-symbols? x (left-branch tree))
				 (cons 0 (encode-symbol x (left-branch tree))))
		  ((element-of-tree-symbols? x (right-branch tree))
				(cons 1 (encode-symbol x (right-branch tree))))
		 (else (error "wrong code tree"))))

