(define (sum-term term a next b)
       (define (iter a result)
		(if (>= a b) result
       		(iter (next a) (+ result (term a)))))
	(iter a 0))

(define (cube a ) (* a  a a))
(define (inc a) (+ a 2))


(define (sinpusen f a b n)
	(define h (/ (- b a) n))
        (define (next x) (+ x (* h 2)))
	(define (integ x) 
		(+ (f x) (* 4 (f (+ x h))) (f (+ x (* h 2)))))
	(if (odd? n) (error "n not can be read") (* (sum-term integ a  next b) (/ h 3))))

