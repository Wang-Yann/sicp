;;;p152
(define (make-withdraw balance)
	(lambda (x) 
		(if (>= balance x) (begin (set! balance (- balance x)) balance)
		"Insufficeient funds")))


