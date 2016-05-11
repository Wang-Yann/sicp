(define (fast-exp b n)
	(cond ((= n 0) 1)
	((even? n) (square (fast-exp b (/ n 2))))
	(else (* b (fast-exp b (- n 1))))))

(define (even? n)
	(= (remainder n 2 ) 0))

