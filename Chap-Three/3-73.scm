(load "3-5-3.scm")
(define (RC  R C dt)
	(lambda ( v0 i ) 
		(cons-stream v0
		 (add-streams (integral (scale-stream i (/ 1 C)) 0 dt)  
					 (scale-stream  i R )))))
(define RC1 (RC 5 1 0.5))
;(display-stream (stream-section (RC1 220 sine-series ) 0 15))
