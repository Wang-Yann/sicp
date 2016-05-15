(define  new-rand 
	(let ((rand-int 1))
	(define (dispatch m)
         (cond ((eq? m 'generate) ( set! rand-int (rand-update rand-int)) rand-int)
          ((eq? m 'reset ) (lambda (x) (set! rand-int x) x))
          (else (error "Unknown request"))))
 dispatch))
(define rand
      (let ((x rand-int ))
      (lambda ( ) (set! x (rand-update x)) x)))
(define (rand-update x) (remainder (+ (* 167 x) 12345) 183647))
