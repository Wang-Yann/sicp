#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))
(require "2-2-4.rkt")
(define e einstein)
(define (square-of-four tl tr bl br)
  (lambda (p) (let((top (beside (tl p) (tr p))) (bottom (beside (bl p) (br p))))
                (below  bottom top))))
(define indentity (lambda(x) x))
(define flipped-pairs  ( square-of-four indentity flip-vert indentity flip-vert))
(define (square-limit p n) (let ((combine4 (square-of-four  flip-horiz indentity rotate180 flip-vert)))
                               (combine4( corner-split p n))))

(paint (square-limit e 3))