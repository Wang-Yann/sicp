(load "3-5-2.scm")
(define (mul-streams s1 s2) (stream-map * s1 s2))
(define (div-streams s1 s2) (stream-map / s1 s2))
(define (integrate-series s) (div-streams s integers))
(define c0 1000)
(define pow-series  (cons-stream c0 (integrate-series ones)))
;(display-stream (stream-section pow-series 0 10))	

(define exp-series (cons-stream 1 (integrate-series exp-series)))
;(display-stream (stream-section exp-series 0 10))


(define cos-ones (cons-stream 0 (cons-stream -1 (scale-stream cos-ones -1))))
(define sin-ones (cons-stream 0 (cons-stream 1 (scale-stream sin-ones -1))))
(define cosine-series (cons-stream 1 (mul-streams (stream-cdr exp-series) cos-ones)))  
(define sine-series  (mul-streams sin-ones  exp-series))

;;(display-stream (stream-section cosine-series  0  10))

;;(display-stream (stream-section sine-series  0  10))
