(load "filter.scm")
(load "2-36.scm")
(define (dot-product v m) (acc + 0 (map * v m)))

(define (matrix*vector m v) (map (lambda ( x ) (dot-product x v )) m))
(define (transpose mat) (acc-n cons '()   mat))
(define (matrix*matrix m n) 
	(let ((cols (transpose n)))	
	(map (lambda(x)  (matrix*vector cols x  ))  m)))
(define V ( list 4 3 2 0))
(define M
 (list (list 1 2 3 4) (list 5 6 7 8) (list 9 10 11 12) ))

(define L (list (list 10 10 11 11)))
