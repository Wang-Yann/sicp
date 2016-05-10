(load "put+get.scm")
(load "attach-tag.scm")

(define (install-scheme-number-package)
  (define (tag x)
    (attach-tag 'scheme-number x))    
  (put 'add '(scheme-number scheme-number)
       (lambda (x y) (tag (+ x y))))
  (put 'sub '(scheme-number scheme-number)
       (lambda (x y) (tag (- x y))))
  (put 'mul '(scheme-number scheme-number)
       (lambda (x y) (tag (* x y))))
  (put 'div '(scheme-number scheme-number)
       (lambda (x y) (tag (/ x y))))
  (put 'make 'scheme-number
       (lambda (x) (tag x)))
  (put 'equ? '(scheme-number scheme-number)
	   (lambda (x y) (= x y)))
  (put 'raise '(scheme-number)  
            (lambda (x) (make-rational x 1))) ;2-83++
  (put 'raise '(scheme-number)  
            (lambda (x) (make-complex-from-real-imag x 0))) ;2-84++
  ;(put 'exp '(scheme-number scheme-number) (lambda (x y) (tag (expt x y))))
   (put '=zero? '(scheme-number) (lambda(x) (= x 0)))
  'done)
(define (make-scheme-number n)
  ((get 'make 'scheme-number) n))


;(define (exp x y) (apply-generic 'exp x y))

