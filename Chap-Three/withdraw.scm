;;;; p151 withdraw
(define balance 100)
(define (withdraw amount)
	(if (<= amount balance) 
		(begin (set! balance (- balance amount)) balance)
	"Insufficient funds"))


(define new-withdraw
	(let ((balance 1000))
		(lambda(amount) 
		(if (<= amount balance)
         (begin (set! balance (- balance amount)) balance)
     "Insufficient funds"))))

