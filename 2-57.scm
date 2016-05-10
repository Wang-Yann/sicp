(load "2-56.scm")
(define (single-op? x) (= (length x) 1))
(define (make-sum x . y)
  (if (single-op? y)
	(let ((y2 (car y)))
	(cond ((=number? x 0) y2)
	((=number? y2 0) x)
	((and (number? x) (number? y2)) (+ x y2))
	(else (list '+ x y2))))
  (cons '+ (cons x y))))
(define (augend x)
	 (let ((tail-op (cddr x))) (if (single-op? tail-op)(car tail-op ) (apply make-sum tail-op))))
(define(make-product x . y)
 (if (single-op? y)
	(let ((y2 (car y)))
	 (cond((or (=number? x 0) (=number? y2 0)) 0)
       ((=number? x 1) y2)
       ((=number? y2 1) x)
       ((and (number? x) (number? y2)) (* x y2))
       (else (list '* x y2))))
  (cons '* (cons x y))))
(define (multiplicand x) 
  (let ((tail-op (cddr x))) (if(single-op? tail-op)(car tail-op) (apply make-product tail-op))))