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
	 (= (square a) (* (- c b) (+ c b)))));;此处过滤函数修改多次，包括让流两次过滤都只能运行到第六组原因还是三元组c增长太慢了
(define gougu-stream
	(stream-filter gougu-test STU))
;(display-stream (stream-section gougu-stream 0 6));;;;只能算到第六组数据
;;;;;正常速度运行版见 3-69-v2	
