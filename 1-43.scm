(define (repeated f n)
	 (lambda (x)
		( (cond( (= n 1) f ) 
			((= n 2) (compose f f))
			(else( (compose f f) (repetead f (- n 2))))) x)  ))
(define (compose f g) (lambda (x) (f (g x))))

(define (repeated1 f n)
	(if (= n 1) f
	(compose f (repeated1 f (- n 1)))))

