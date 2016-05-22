(load "3-5-3.scm")
(define (ln2-series n) (cons-stream (/ 1 n) (stream-map - (ln2-series (+ n 1)))))
(define ln2 (scale-stream (partial-sums (ln2-series 1)) 1.00))






;(display-stream (stream-section ln2 0 10))
;(display-stream (stream-section (euler-transform ln2) 0 10))
;(display-stream (stream-section (accelerated-sequence euler-transform ln2) 0 10))

