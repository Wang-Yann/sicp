 (load "3-3-4-simulation.scm")
(load "3-28.scm")
(define the-agenda (make-agenda))
(define inverter-delay 2)
(define and-gate-delay 3)
(define or-gate-delay 5)

 (define input-1 (make-wire))
 (define input-2 (make-wire))
 (define sum (make-wire))
 (define carry (make-wire))
 (define output (make-wire))
 ;(probe 'sum sum)
 ;(probe 'carry carry)
 
; (half-adder input-1 input-2 sum carry)
;(and-gate input-1 input-2 output)
(or-gate input-1 input-2 output)
