(load "3-5-3.scm")
(define sense-data sine-series)
;;;	 (cons-stream 1 (cons-stream 2 (cons-stream 1 (cons-stream -0.1 (cons-stream 0 sense-data))))))


(define (sign-change-detector x y) 
	(cond ( (> (* x y)  0) 0)
		  ((= x 0) (if (< y 0) -1 0))
		  ((= y 0) (if (< x 0) 1 0))
		  (else  (if (< x 0) 1 -1))))


(define zero-crossing
	(stream-map sign-change-detector sense-data (stream-cdr sense-data)))
;;;;(display-stream (stream-section zero-crossing 0 15))
