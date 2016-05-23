(load "3-5-2.scm")
(define (average x y) (* 0.5 (+ x y)))
(define (sqrt-improve guess x) (average guess (/ x guess)))
(define (sqrt-stream x) 
	(define guesses 
			(cons-stream 1.0 (stream-map (lambda (guess) (sqrt-improve guess x)) guesses)))
	guesses)

;(display-stream (stream-section (sqrt-stream 2) 1 10))

(load "3-55.scm")
(define (pi-summands n)
	(cons-stream (/ 1.0 n) (stream-map - (pi-summands (+ n 2)))))
(define pi-stream (scale-stream (partial-sums (pi-summands 1)) 4))
;;(display-stream (stream-section pi-stream  1 20))

(define (euler-transform s)
	(let((s0 (stream-ref s 0)) (s1 (stream-ref s 1)) (s2 (stream-ref s 2)))
		(cons-stream (- s2 (/  (square (- s2 s1)) (+ s0 (* -2 s1) s2)))
					 (euler-transform (stream-cdr s)))))
;;(display-stream (stream-section (euler-transform pi-stream)  1 20))

(define (make-tableau transform s)
	(cons-stream s (make-tableau transform (transform s))))
(define (accelerated-sequence transform s)
	(stream-map stream-car (make-tableau transform s)))
;;(display-stream (stream-section (accelerated-sequence  euler-transform pi-stream)  1 20))

;;;;p236 infinite stream of pairs
(define (pairs s t)
	(cons-stream (list (stream-car s) (stream-car t))
		(interleave
			(stream-map (lambda (x) (list (stream-car s) x )) (stream-cdr t))
					(pairs (stream-cdr s) (stream-cdr t)))))
(define (interleave s1 s2)
	(if (stream-null? s1) s2
		 (cons-stream (stream-car s1) (interleave s2 (stream-cdr s1)))))
;;;;(display-stream (stream-section (pairs integers integers) 0 10))

;;;p239 signal stream
(define (integral integerand initial-value dt)
	(define int
		(cons-stream initial-value 
			(add-streams (scale-stream integerand dt) int)))
	int)
(load "3-59.scm")  ;;;;sine-series 
;;(display-stream (stream-section (intgeral sine-series 100 0.001 ) 5 15))
















