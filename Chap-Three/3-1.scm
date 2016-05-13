(define (make-accumulator init)
	(lambda(x) (set! init (+ init x)) init))
