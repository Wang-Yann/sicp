(define (repeated1 f n)
	(if (= n 1) f
        (compose f (repeated1 f (- n 1)))))
(define (smooth f)
	(lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))
(define dx 0.0001)

(define (smooth-n f n) (if (= n 1) (smooth f) (smooth (smooth-n f (- n 1)))))

(define (compose f g) (lambda (x) (f (g x))))
