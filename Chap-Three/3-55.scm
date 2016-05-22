(load "make-stream-version2.scm")
(define (partial-sums s)
   (cons-stream (stream-car s)	(add-streams (stream-cdr s) (partial-sums s))))
;(display-stream (stream-section (partial-sums integers) 0 7))
