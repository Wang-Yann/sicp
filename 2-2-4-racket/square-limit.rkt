#lang racket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))
(require "2-2-4.rkt")
(define (square-limit p n)
  (let((quarter (corner-split p n)))
    (let((half (beside (flip-horiz quarter) quarter)))
      (below (flip-vert half) half))))