(load "3-5-3.scm")
(define (tripples s t u)
    (cons-stream (list (stream-car s) (stream-car t) (stream-car u ))
        (interleave
			 (stream-map (lambda (z) (cons  (stream-car s) z )) (stream-cdr (pairs t u)))
                    (tripples (stream-cdr s) (stream-cdr t)(stream-cdr u) ))))
;;;;(display-stream (stream-section (tripples integers  integers integers) 0 10))

(define STU (tripples integers  integers integers))
(define (gougu-test tripples)
	(let ((a (car tripples)) (b (cadr tripples))(c (caddr tripples)))
	 (= (+ (square a) (square b)) (square c))))
(define gougu-stream
	(stream-filter gougu-test STU))
;(display-stream (stream-section gougu-stream 0 6));;;;只能算到第六组数据
	
