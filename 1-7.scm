(define (sqrt-iter old-guess x)
	(let ((new-guess (improve old-guess x)))
	(if (good-enough? old-guess new-guess)
		new-guess
		(sqrt-iter new-guess x))))
(define (good-enough? old-guess new-guess)
	(<(abs(/ (- new-guess old-guess ) old-guess)) 0.0001))

(define (improve guess x)
	(average guess (/ x guess)))

(define (average x y)
	(/ (+ x y) 2))
(define (square x) (* x x))

(define (sqrt x)
	 (sqrt-iter 1.0 x))
