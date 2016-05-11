
(define (attach-tag type-tag contents)
    (if (number? contents) contents (cons type-tag contents)))
(define (type-tag datum)
  (cond ((number? datum) 'scheme-number)
		( (pair? datum) (car datum))
        (else (error "Bad tagged"))))
(define (contents datum)
  (cond ((number? datum) datum)
		( (pair? datum) (cdr datum))
      	(else error "bad tagged")))


