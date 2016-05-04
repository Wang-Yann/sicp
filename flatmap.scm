(define (flatmap proc seq) (acc append '() (map proc seq)))

(define (acc op init seq)
        (if (null? seq) init (op (car seq) (acc op init (cdr seq)))))
(define (enumerate-interval low upper)
        (if (> low upper) '() (cons low ( enumerate-interval (+ low 1) upper))))
(define (enumerate-tree tree)
        (cond((null? tree) '())
        ((not(pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree))))))

