

(load "raw-apply-generic-2.scm")
;(load "2-82-apply-generic-coercion.scm")
(load "polynomial-package.scm")
(install-polynomial-package)
(load "coercion-package.scm")
(install-coercion-package)

(define (negate x) (apply-generic 'negate x))
(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))
(define (=zero? x) (apply-generic '=zero? x )) 
(define A (make-polynomial 'x (list (list 10 20) (list 3 2) (list 2 1))))
(define B (make-polynomial 'x '((9 2) (4 1) (0 6))))
(define C (make-polynomial 'x '((9 3) (4 3) (0 4))))
