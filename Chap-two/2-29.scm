(define (make-mobile left right)
	(list left right))
(define (make-branch length structure)
	(list length structure))
(define (left-branch M) (car M))
(define (right-branch M) (cadr M))
(define (branch-length BR) (car BR))
(define (branch-structure BR)(cadr BR))

(define (total-weight M)
	(+ (branch-weight (left-branch M)) (branch-weight (right-branch M))))
(define (branch-weight BR)
	(if (hang? BR) (total-weight (branch-structure BR)) (branch-structure BR)))
(define (hang? BR) (pair? (branch-structure BR)))

(define (FL BR)(* (branch-length BR) (branch-weight BR)))
(define (sameFL? M) (= (FL (left-branch M)) (FL (right-branch M))))
(define (balance M)
	(let ((left (left-branch M))
		(right (right-branch M)))
	(and (sameFL? M)
	     (branch-balance left)
	     (branch-balance right))))
(define (branch-balance BR)
	(if (hang? BR) (balance (branch-structure BR)) #t))
(define a1 (make-branch 10 11))
(define a2 (make-branch 50 3))
(define a3 (make-branch 4 10))
(define A (make-mobile a1 a3))
(define B (make-mobile (make-branch 50/7 A) a2)) 	