(load "square.scm")
(define (product term a next b)
       (define (iter a result)
                (if (> a b) result
                (iter (next a) (* result (term a)))))
        (iter a 1))

(define (product2 term a next b)
	(if (> a b) 1
	(* (term a) (product2 term (next a) next b))))

(define (factorial n) 
	(define (term x) (* x 1))
	(product term 1 inc n))

(define (findpi n)
	(define (term n) (/ (* ( * n 2)(+ (* n 2) 2)) (square (+ (* n 2) 1))))
	(*  (product term 1 inc n)  4.0 ))
(define (findpi2 n)
        (define (term n) (/ (* ( * n 2)(+ (* n 2) 2)) (square (+ (* n 2) 1))))
        (*  (product2 term 1 inc n)  4.0 ))

