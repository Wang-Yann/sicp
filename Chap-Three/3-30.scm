(load "simula.scm")
(define (ripple-carry-adder list-A list-B list-S C)
	(define (iter A B S value-of-C)
		(if(and  (null? A ) (null? B)(null? S)) 'ok
			(let ((Ak (car A)) (Bk (car B)) (Sk (car S)) (Ck (make-wire))
					(remain-A (cdr A)) (remain-B (cdr B)) (remain-S (cdr S)))
				(set-signal! Ck value-of-C)
				(full-adder Ak Bk Ck Sk C)
				(iter remain-A remain-B remain-S (get-signal C)))))
	(iter list-A list-B list-S (get-signal C)))
		
(define (ripple-carry-adder2 a b s c) 
   (let ((c-in (make-wire)))         ;;;;better solution 
         (if (null? (cdr a)) 
           (set-signal! c-in 0) 
           (ripple-carry-adder2 (cdr a) (cdr b) (cdr s) c-in)) 
         (full-adder (car a) (car b) c-in (car s) c))) 

(define A1 (make-wire))
(define B1 (make-wire))
(define S1 (make-wire))
(define C (make-wire))	
