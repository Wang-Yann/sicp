(define (sum-term term a next b)
	(if (> a b) 0
	(+ (term a) (sum-term term (next a) next b))))
(define (inc a) (+ a 1))
(define (cube a ) (* a  a a))

(define (sum-cubes a b) (sum-term cube a inc b))



(define (integral f a b dx)
	(define (add-dx x)(+ x dx))
	(* (sum-term f (+ a (/ dx 2.0)) add-dx b) dx))

