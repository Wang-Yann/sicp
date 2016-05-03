(load "filter.scm")
(load "prime.scm")
(define (flatmap proc seq)
	(acc append '() (map proc seq)))
(define(prime-sum? pair) (prime? (+ (car pair) (cadr pair))))
(define (make-pair-sum pair) (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
(define (prime-sum-pairs n)
	(map make-pair-sum 
		(filter prime-sum? 
			(flatmap
				 (lambda(i)
					 (map (lambda (j) (list i j))(enumerate-interval 1 (- i 1))))
					(enumerate-interval 1 n)))))
