(define (f1 n)
	(if (< n 3) n
	(+ (f1 (- n 1)) (* 2 ( f1 (- n 2 ))) (* 3 (f1 (- n 3))))))


(define (f2 n)
	(if (< n 3) n
	(f2-iter  2 1 0 3 n)))

(define (f2-iter a b c counter n)
	(if (> counter n) a
	 (f2-iter (+ (* 3 c) (* 2 b) a)  a  b (+ counter 1) n )))
