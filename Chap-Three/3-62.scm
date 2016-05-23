(load "3-61.scm")
(define (div-series s1 s2)
  (let ((c (stream-car s2))) 
	(if (= c 0) (error "s2 must not be 0")
		(mul-series s1  (solve-x s2)))))
(define tan-series (div-series sine-series cosine-series))
;(display-stream (stream-section tan-series 0 10))