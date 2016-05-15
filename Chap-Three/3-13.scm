(define (make-circle x) (set-cdr! (last-pair x) x) x)
(load "3-12.scm")
(define zz (make-circle '(a b c d)))
