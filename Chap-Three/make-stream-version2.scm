;;;stream-version2 for infinite stream 3.5.2
;(define-syntax delay
;	(syntax-rules()
;		( (_ exp)  (lambda()  exp))) )
;		( (_ exp) (memo-proc (lambda()  exp))) ))
;(define (force exp) (exp))
;;;;本为无穷流出现问题修改流文件，遂知delay force 有内置版，无须造轮，只有cons-stream过程须实现,以上过程注释了不影响流的实现，为增强记忆，方便后来人少走弯路保留之
(define-syntax cons-stream
	(syntax-rules()
			 (  (cons-stream  a b) (cons a  (delay b))  )))  ;;本行中cons-stream处为—也可
(define (stream-car s) (car s))
(define (stream-cdr s) (force (cdr s)))
(define (memo-proc proc) (let((already-run? false) (result false))
	(lambda() (if (not already-run?) 
				(begin (set! result (proc)) (set! already-run? true) result)
			result))))

(define (stream-null? s) (null? s))
(define the-empty-stream '())
(define (stream-ref s n)
	(if (= n 0) (stream-car s)
		 (stream-ref (stream-cdr s) (- n 1))));;;;此处ctrl n 笔误stream-car,导致运行不成功
(define (stream-map proc s)
	(if (stream-null? s) the-empty-stream
		(cons-stream (proc (stream-car s)) (stream-map proc (stream-cdr s)))))
(define (stream-for-each proc s)
	(if (stream-null? s) 'done
		 (begin (proc (stream-car s)) (stream-for-each proc (stream-cdr s)))))
(define (display-line x)
	 (newline) (display x))
(define (display-stream s) (stream-for-each display-line s))

(define (stream-enumerate-interval low high)
     (if (> low high) '()
         (cons-stream low
             (stream-enumerate-interval (+ low 1) high))))
(define (stream-filter pred stream)
     (cond ((stream-null? stream) the-empty-stream)
           ((pred (stream-car stream))
              (cons-stream (stream-car stream)(stream-filter pred (stream-cdr stream))))
           (else (stream-filter pred (stream-cdr stream)))))

