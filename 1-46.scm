(define (iterative-improve good? transform)
	(lambda (first-guess)
	(define (try guess)
                (let ((next ( transform guess)))
                        (if (good? guess next) next (try next))))
	(try first-guess)))
(load "square.scm")
(define (good? guess x)
        (<(abs (- guess x)) 0.0001))
(define (sqrt x)
	(define improve  (lambda (y) (average y (/ x y)))) 
	((iterative-improve good?
		  improve) 1.0))



