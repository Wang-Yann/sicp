#lang racket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))
(define (frame-coord-map frame)
  (lambda (v)(vector-add (frame-origin frame)
                       (vector-add(vector-scale (vector-xcor v) (frame-edge1 frame))
                                (vector-scale(vector-ycor v) (frame-edge2 frame))))))

(define oe (make-vect 10 -3))
(define e1 (make-vect 0 1))
(define e2 (make-vect 1 0))
(define a-frame (make-frame oe e1 e2))
((frame-coord-map a-frame) (make-vect 6 0))