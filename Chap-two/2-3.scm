(load "2-2.scm")
(define ( make-rect1 p1 p3)
	(attach-tag 'p-p (cons p1 p3)))
(define (geta1 R1)
	 (abs (- (x-point (cdr(contents R1))) (x-point (car(contents R1))))))
(define (getb1 R1)
	 (abs (- (y-point (cdr(contents R1))) (y-point (car (contents R1))))))

(define (make-rect2 p a b)
	(define scale (cons a b))
 	(attach-tag 'p-ab (cons p scale)))
(define (geta2 R)(cdr (car (contents R))))
(define (geta2 R) (cdr(cdr (contents R))))
(define (attach-tag type-tag contents)
	(cons type-tag contents))
(define (type-tag datum) (if (pair? datum) (car datum) (error "bad datum")))
(define (contents datum) (if (pair? datum) (cdr datum) (error "bad datum")))
(define (p-p? R) (eq? (type-tag R) 'p-p))
(define (p-ab? R) (eq? (type-tag R) 'p-ab))

(define (geta R)(cond ( (p-p? R) (geta1 R)) ((p-ab? R) (geta2 R))))
(define (getb R)(cond ( (p-p? R) (geta1 R)) ((p-ab? R) (geta2 R))))

(define (perimeter Rect)
	(* 2 (+ (geta Rect) (getb Rect))))
(define (area Rect) (* (geta Rect) (getb Rect)))

(define p1 (make-point 1.1 2.1))
(define p3 (make-point 9.8 19.6))
(define A1 (make-rect1 p1 p3))
(define A2 (make-rect2 p1 3 5.6))	
