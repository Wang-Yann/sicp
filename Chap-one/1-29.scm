(define (sum-term term a next b)
        (if (>= a b) 0
        (+ (term a) (sum-term term (next a) next b))))
(define (cube a ) (* a  a a))
(define (inc a) (+ a 2))


(define (sinpusen f a b n)
	(define h (/ (- b a) n))
        (define (next x) (+ x (* h 2)))
	(define (integ x) 
		(+ (f x) (* 4 (f (+ x h))) (f (+ x (* h 2)))))
	(if (odd? n) (error "n not can be read") (* (sum-term integ a  next b) (/ h 3))))

