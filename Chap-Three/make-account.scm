;;;p153
(define (make-account balance)
	(define (withdraw x)
		(if (>= balance x) (begin (set! balance (- balance x) ) balance)	        	"unsufficient funds"))
	(define (deposit x) 
		  (set! balance (+ balance x) )balance)
	(define (dispatch m)
		(cond ((eq? m 'withdraw) withdraw)
			 ((eq? m 'deposit ) deposit)
			(else (error "Unknown request"))))
	dispatch)

