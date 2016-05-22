(load "3-5-2.scm")
(define (merge s1 s2)
	(cond ((stream-null? s1) s2)
		  ((stream-null? s2) s1)
		  (else (let ((s1car (stream-car s1)) (s2car (stream-car s2)))
				(cond ((< s1car s2car) 
							(cons-stream s1car (merge (stream-cdr s1) s2)))
					  ((< s2car s1car)
							(cons-stream s2car (merge s1 (stream-cdr s2))))
					  (else (cons-stream s1car (merge (stream-cdr s1) (stream-cdr s2)))))))))

(define S (cons-stream 1
	 (merge (scale-stream S 2)  (scale-stream S 3) )))
(define SS (merge S (scale-stream S 5)))
(define SSS (cons-stream 1
	 (merge (scale-stream SSS 2) (merge(scale-stream SSS 5) (scale-stream SSS 3) ))))
;(display-stream (stream-section SSS 0 16))
