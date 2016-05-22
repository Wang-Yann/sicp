(define (sqrt-stream x)
    (cons-stream 1.0 (stream-map (lambda (guess) (sqrt-improve guess x)) (sqrt-stream x))))
  
  ;(display-stream (stream-section (sqrt-stream 2) 1 10))

