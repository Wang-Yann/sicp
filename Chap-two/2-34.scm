(define (horner-eval x c-seq)
	(acc (lambda (this-coeff higher-terms)  (+  (* x higher-terms) this-coeff ))  0 c-seq))



(define (acc op init seq)
        (if (null? seq) init (op (car seq) (acc op init (cdr seq)))))
