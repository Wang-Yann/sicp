(define (make-monitored f)
	(let ((count-calls 0))
		(lambda (x) 
		(cond ((eq? x 'how-many-calls?) count-calls)
				((eq? x 'reset-count) (begin (set! count-calls 0) count-calls))
				(else (begin (set! count-calls (+ count-calls 1)) (f x)))))))
(define a (make-monitored sqrt))
