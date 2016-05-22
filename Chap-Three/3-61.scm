(load "3-60.scm")
(define c0 1)
(define (sub-streams s1 s2) (stream-map - s1 s2))
(define (solve-x s)
	(cons-stream 1 (scale-stream (mul-series (solve-x s) (stream-cdr s)) -1)))
;(display-stream (stream-section (solve-x pow-series) 0 10))

	
	
