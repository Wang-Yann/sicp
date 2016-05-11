(define( fac n)
	(if (= n 1)
		1
	(* n (fac (- n 1)))))

(define (factorial n)
	(fact-iter 1 1 n))

(define (fact-iter product counter maxcount)
	(if (> counter maxcount)
		product
	    (fact-iter (* product counter)  (+  counter 1)  maxcount)))
