(load "common-agrithm-2.scm")

(define (adjoin-term term term-list)
	(if (=zero? (coeff term)) term-list (cons term term-list)));=zero?
(define (the-empty-list) '())
(define (first-term term-list) (car term-list))
(define (rest-terms term-list) (cdr term-list))
(define (empty-termlist? lst) (null? lst))

(define (make-term order coeff) (list order coeff))
(define (order term) (car term))
(define (coeff term) (cadr term))
(define (add-terms p1 p2)
       (cond ((empty-termlist? p1) p2)
             ((empty-termlist? p2) p1)
             (else (let((t1 (first-term p1)) (t2 (first-term p2)))
                   (cond ((> (order t1) (order t2))
                               (adjoin-term t1 (add-terms (rest-terms p1) p2)))
                         ((< (order t1) (order t2))
                              (adjoin-term t2 (add-terms p1 (rest-terms p2))))
                        ( else                         ;wrong!!!as (equ? (order p1) (order p2))
                              (adjoin-term (make-term (order t1) (+ (coeff t1) (coeff t2)));add
                                  (add-terms (rest-terms p1) (rest-terms p2)))))))))
(define (mul-terms L1 L2)
	(if (empty-termlist? L1) (the-empty-list)
		(add-terms (mul-term-by-all-terms (first-term L1) L2)
				   (mul-terms (rest-terms L1) L2))))
(define (mul-term-by-all-terms x L)
	(if (empty-termlist? L) (the-empty-list)
		(let (( y (first-term L)))
			 (adjoin-term (make-term (+ (order x) (order y)) (mul (coeff x) (coeff y)))
						 (mul-term-by-all-terms x (rest-terms L))))))
(define (negate-terms term-list)
             (map (lambda (t) (make-term (order t) (- (coeff t))))   term-list)) ;2-88++++


(define (sub-terms L1 L2)
	(if (empty-termlist? L2) L1 
		(add-terms L1 (negate-terms L2))))  ;2-91++++++++++++++++++++++++++++++++++
(define  (the-empty-termlist) '())

(define (div-terms L1 L2)                       ;2-91++++++++++++++++++++++++++++++++++
   (if (empty-termlist? L1) 
       (list (the-empty-termlist) (the-empty-termlist)) 
       (let ((t1 (first-term L1)) 
             (t2 (first-term L2))) 
         (if (> (order t2) (order t1)) 
             (list (the-empty-termlist) L1) 
             (let ((new-c (div (coeff t1) (coeff t2))) 
                   (new-o (- (order t1) (order t2)))) 
                 (let ((rest-of-result                       
                        (div-terms (sub-terms L1 
                                              (mul-terms L2 
                                                         (list (make-term new-o new-c)))) 
                                   L2))) 
                   (list (adjoin-term (make-term new-o new-c) 
                                      (car rest-of-result)) 
                         (cadr rest-of-result)))))))) 
 (define (remainder-terms p1 p2) ;;;;;;;;2-94++++++++++
   (cadr (div-terms p1 p2))) 
  
 (define (gcd-terms a b) 
   (if (empty-termlist? b) 
     a 
     (gcd-terms b (remainder-terms a b)))) 
  
;(define (pseudoremainder-terms a b)                ;;;2-96+++++++ !!!!FAILED!!!!!!!!
 ;  (let* ((o1 (order (first-term a))) 
  ;        (o2 (order (first-term b))) 
   ;       (c (coeff (first-term b))) 
    ;      (divident (mul-terms (make-term 0  
     ;                                     (expt c (+ 1 (- o1 o2)))) 
      ;                         a))) 
    ; (cadr (div-terms divident b)))) 
; (define (gcd-terms a b)                            ;;;;2-96+++++
 ;  (if (empty-termlist? b) 
  ;   (let* ((coeff-list (map cadr a)) 
   ;         (gcd-coeff (apply gcd coeff-list))) 
    ;   (div-terms a (make-term 0  gcd-coeff))) 
    ; (gcd-terms b (pseudoremainder-terms a b))))
