(load "3-5-3.scm")
(define (random-in-range low high) 
         (let ((range (- high low))) 
                 (+ low (random range))))
 (define (random-number-pairs low1 high1 low2 high2) 
         (cons-stream (cons (random-in-range low1 high1) (random-in-range low2 high2)) 
                                 (random-number-pairs low1 high1 low2 high2))) 
  
 (define (monte-carlo experiment-stream passed failed) 
         (define (next passed failed) 
                 (cons-stream (/ passed (+ passed failed)) 
                                          (monte-carlo (stream-cdr experiment-stream) 
                                                                   passed 
                                                                   failed))) 
         (if (stream-car experiment-stream) 
                 (next (+ passed 1) failed) 
                 (next passed (+ failed 1)))) 
  
 (define (estimate-integral p x1 x2 y1 y2) 
         (let ((area (* (- x2 x1) (- y2 y1))) 
               (randoms (random-number-pairs x1 x2 y1 y2))) 
                 (scale-stream (monte-carlo (stream-map p randoms) 0 0) area))) 
  
 ;; test. get the value of pi 
 (define (sum-of-square x y) (+ (* x x) (* y y))) 
 (define f (lambda (x) (not (> (sum-of-square (- (car x) 1) (- (cdr x) 1)) 1)))) 
 (define pi-stream (estimate-integral f 0 2.0 0 2.0))

;;(display-stream (stream-section pi-stream 100 110))
