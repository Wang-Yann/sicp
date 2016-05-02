(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))


(define (maxsquare x y z) 
	(cond((< x y)
		(if(< x z)(sum-of-squares y z)(sum-of-squares x y)))
	(else
		(if(< y z)(sum-of-squares y z)(sum-of-squares x y)))))

		
