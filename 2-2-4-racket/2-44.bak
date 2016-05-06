
#lang racket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))
(define (up-split p n)
  (if (= n 0) p (let ((smaller (up-split p (- n 1)))) (below p (beside smaller smaller)))))
(provide up-split)