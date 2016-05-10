(load "scheme-number-package.scm")
(load "rational-package.scm")
(load "complex-driver.scm")
(load "raw-apply-generic.scm")
(install-rectangular-package)
(install-polar-package)
(install-complex-package)

(install-scheme-number-package)
(install-rational-package)

(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))
(define (raise x) (apply-generic 'raise x)) 

