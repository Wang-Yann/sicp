;(define (delay exp) (lambda() exp));;;;;; ( (memo-proc (lambda() x)));;;;;;;;;;;;
(define (force x) (x))
;;;此处force 为普通形式，特殊形式意义为宏，而不是过程，如delay 和cons-stream;;如果在drracket实现的话可以定义delay ;;;;最后，要利用好stackflow,好几处遇到问题都是在此解决，百度就是垃圾，遇到严肃问题不要百度，必应 都要比他强

(define-syntax cons-stream
	(syntax-rules()
			 (  (cons-stream a b)   (cons a (memo-proc (lambda() b))) )   )) 
			 ;;;;;;;;;也可以采用 (cons a (lambda() b))形式；此处采用memo-proc过程
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
		 (begin (proc (stream-car s)) (stream-for-each proc (stream-cdr s)))));;;此处两过程括号加得不正确，导致浪费时间调试display-stream
(define (display-line x)
	 (newline) (display x))
(define (display-stream s) (stream-for-each display-line s))
