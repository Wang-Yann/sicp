(load "square.scm")
(define (cont-frac1 n d k)
	(define( cont-iter i result)
		(if (= i 0) result
		(cont-iter (dec i)  (/(n i)  (+( d i) result)))))
	(cont-iter k (/ (n k) (d k))))

(define (cont-frac n d i  k)
	(if (= i k) (/ (n k) (d k))
		(/ ( n i) (+ ( d i)  (cont-frac n d  (inc i) k)))))
(define (cf-e k)(+ 2 (cont-frac (lambda (i) 1.0) D 1 k)) )

(define (cf-e1 k)(+ 2 (cont-frac1 (lambda (i) 1.0) D  k)) )
(define (D n) (if (= (remainder n 3) 2)  (* 2 (/ (+ n 1) 3))  1))
