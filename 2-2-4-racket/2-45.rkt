#lang racket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))
(require "2-2-4.rkt")
(define e einstein)
(define indentity (lambda(x) x))
(define (split h1 h2)
  (lambda (p) (h1 p (h2 p p))))
(define right-split (split beside below))
(define up-split (split below beside))
