(load "make-stream-version2.scm")
(define (mul-streams s1 s2) (stream-map * s1 s2))
(define factorials (cons-stream 1 (mul-streams (stream-cdr integers) factorials)))
;(display-stream (stream-section factorials 1 6))
