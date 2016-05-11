(define (foldleft op init seq)
        (define (iter result rest)
                (if (null? rest) result
                (iter (op result (car rest)) (cdr rest))))
        (iter init seq))
(load "filter.scm")
(define (foldright op init seq) (acc op init seq))

(define (reverse seq) (foldright (lambda(x y) (append y (list x)))  '() seq))

(define (reverse2 seq) (foldleft (lambda(x y) (cons y x  ))  '() seq))
