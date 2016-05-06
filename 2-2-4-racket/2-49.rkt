#lang racket/gui
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))
;(define (frame-paiter frame)
(define (start-segment seg)
  (car seg))
(define (end-segment seg)
  (cdr seg))
(define s (list
    (make-segment
      (make-vect 0.1 0.4)
      (make-vect 0.3 0.4))
    (make-segment
      (make-vect 0.5 0.4)
      (make-vect 0.7 0.4))
    (make-segment
      (make-vect 0.3 0.6)
      (make-vect 0.5 0.6))
    (make-segment
      (make-vect 0.8 0.3)
      (make-vect 0.8 0.55))
    (make-segment
      (make-vect 0.78 0.6)
      (make-vect 0.80 0.6))
    (make-segment
      (make-vect 0.9 0.3)
      (make-vect 0.9 0.55))
    (make-segment
      (make-vect 0.88 0.6)
      (make-vect 0.90 0.6))))
(define a (list
    (make-segment
      (make-vect 0 0)
      (make-vect 0 1))
    (make-segment
      (make-vect 0 1)
      (make-vect 1 1))
    (make-segment
      (make-vect 1 1)
      (make-vect 1 0))
    (make-segment
      (make-vect 1 0)
      (make-vect 0 0))))
(define b (list
    (make-segment
      (make-vect 0 0)
      (make-vect 1 1))
    (make-segment
      (make-vect 0 1)
      (make-vect 1 0))))
(define wave  (list
    (make-segment
      (make-vect 0 0.2)
      (make-vect 0.2 0.4))
    (make-segment
      (make-vect 0.2 0.4)
      (make-vect 0.3 0.3))
    (make-segment
      (make-vect 0.3 0.3)
      (make-vect 0.4 0.3))
    (make-segment
      (make-vect 0.4 0.3)
      (make-vect 0.35 0.2))
    (make-segment
      (make-vect 0.35 0.2)
      (make-vect 0.4 0))
    (make-segment
      (make-vect 0.6 0)
      (make-vect 0.65 0.2))
    (make-segment
      (make-vect 0.65 0.2)
      (make-vect 0.6 0.3))
     (make-segment
      (make-vect 0.6 0.3)
      (make-vect 0.75 0.3))
    (make-segment
      (make-vect 0.75 0.3)
      (make-vect 1 0.7))
    (make-segment
      (make-vect 1 0.8)
      (make-vect 0.6 0.55))
    (make-segment
      (make-vect 0.6 0.55)
      (make-vect 0.7 1))
    (make-segment
      (make-vect 0.6 1)
      (make-vect 0.5 0.7))
    (make-segment
      (make-vect 0.5 0.7)
      (make-vect 0.4 1))
    (make-segment
      (make-vect 0.3 1)
      (make-vect 0.4 0.5))
    (make-segment
      (make-vect 0.4 0.5)
      (make-vect 0.35 0.45))
    (make-segment
      (make-vect 0.35 0.45)
      (make-vect 0.2 0.65))
    (make-segment
      (make-vect 0.2 0.65)
      (make-vect 0 0.35))))
   
(define myFrame
  (make-frame
    (make-vect 100 100)
    (make-vect 200 0)
    (make-vect 0 200)))
(define red-pen (make-object pen% "BLACK" 3 'solid))
(define myWindow (new frame% [label "example window"] 
                   [width 600] [height 600]))
(define (draw-segment dc seg)
  (let ((v-start (start-segment seg))
        (v-end (end-segment seg)))
    (send dc draw-line
      (vector-xcor v-start)
      (vector-ycor v-start)
      (vector-xcor v-end)
      (vector-ycor v-end))))

(define (segments->painter dc segment-list)
  (lambda (frame)
    (for-each
      (lambda (segment)
        (let ((new-start-segment ((frame-coord-map frame) (start-segment segment)))
              (new-end-segment ((frame-coord-map frame) (end-segment segment))))
        (draw-segment
          dc
          (make-segment new-start-segment new-end-segment))))
      segment-list)))
;定义一个面板,附着在刚才的窗口上s
(define myCanvas (new canvas% 
                      [parent myWindow]
                      ;事件回调    
                      [paint-callback (lambda (canvas dc) 
                                        (begin 
                                          (send dc set-pen red-pen) 
                                          ((segments->painter dc wave) myFrame)))]))

(send myWindow show #t)



