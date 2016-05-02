(load "square.scm")
(define (cont-frac1 n d k)
	(define( cont-iter i result)
		(if (< i 0) result
		(cont-iter (dec i)  (/(n i)  (+( d i) result)))))
	(cont-iter k (/ (n k) (d k))))

(define (tan-frac n d  k)
	(define (tf i)
		(if (= i k) (/ (n k) (d k))
		(/ ( n i) (- ( d i)  (tf (inc i))))))
	(tf 1))

(define (tan-cf x k)
	 (tan-frac (lambda (i)(if (= i 1) x (square x)))  (lambda (i) (- (* i 2) 1))  k)) 

