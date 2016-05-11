(load "driv.scm")
(define( make-exp x n)
	(cond((= n 0) 1)
	((= n 1) x)
	(else (list '** x n))))

(define (exp? x) (and (pair? x) (eq? (car x) '**)))
(define (base x) (cadr x))
(define (exponent x) (caddr x))

(define (derive exp var)
        (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum (derive (addend exp) var) (derive (augend exp) var)))
        ((product? exp) (make-sum       
                (make-product (multiplier exp) (derive (multiplicand exp) var))
                (make-product  (derive (multiplier exp) var ) (multiplicand exp)  )))
        ((exp? exp) (let ((u (base exp)) (n (exponent exp)))
	  (make-product n (make-product (make-exp u (- n 1)) (derive u var)))))
	 (else (error "unknown expression type" exp ))))
	 
