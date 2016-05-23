(load "3-5-4.scm")
(define (RLC R L C dt)
	(lambda (vC0 iL0)
	(define iL (integral (delay di) iL0 dt))
	(define vC (integral (delay dv) vC0 dt))
	(define di (add-streams (scale-stream vC (/ 1 L)) (scale-stream iL (/ R (* -1 L)))))
	(define dv (scale-stream iL (/ -1 C))) 
	(stream-map cons vC iL)))

(define RLC-1 (RLC 1 1 0.2 0.1))
;(stream-ref (RLC-1 10 0) 100)
;(display-stream (stream-section  (RLC-1 10 0) 0 10))

;;;;2016-05-24-00-42 一次运行模拟成功，特此留念，记录我的code学习历程
