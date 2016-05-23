(load "3-70.scm")
(define (cube x) (* x x x))
(define weight3 (lambda (x) (+ (cube (car x)) (cube (cadr x)))))


 (define (Ramanujan s) 
          (define (stream-cadr s) (stream-car (stream-cdr s))) 
          (define (stream-cddr s) (stream-cdr (stream-cdr s))) 
          (let ((scar (stream-car s)) (scadr (stream-cadr s))) 
             (if (= (weight3 scar) (weight3  scadr))  
                (cons-stream (list (weight3 scar) scar scadr) (Ramanujan (stream-cddr s))) 
                         (Ramanujan (stream-cdr s))))) 

;(define (Ramanujan s) 
;     (let  ( (scar (stream-car s)) 
;           	 (scadr (stream-car(stream-cdr s))) ) 
;                 (if (= (weight3 scar) (weight3  scadr))  
;                         (cons-stream (list (weight3 scar) scar scadr) 
;                                                  (Ramanujan (stream-cdr(stream-cdr  s)))) 
;                         (Ramanujan (stream-cdr s))))) 
;
 (define Ramanujan-numbers 
        (Ramanujan (weighted-pairs integers integers weight3))) 

 ;(display-stream (stream-section Ramanujan-numbers 0 10))
