(load "make-stream-version2")
(define (integers-starting-from n)
	(cons-stream n (integers-starting-from (+ n 1))))
(define integers (integers-starting-from 1))

(define odd-nums (stream-filter odd? integers))
(define (divisible? x y) (= (remainder x y) ) 0)
(define (not-div-7? x) (not (= (remainder x 7) 0)))
(define no-sevens (stream-filter not-div-7? integers))
;(stream-ref no-sevens 100)
;(define no-sevens2 (stream-filter (lambda (x) (not (divisible? x 7))) integers));;本形式的无穷流一直运行耗尽内存；经过对自然数流和奇数流的测试以及查找资料，怀疑是filter的问题，遂将测试过程写成函数，遂运行成功，期间经历 修改delay cons-stream种种艰辛过程不表

(define (fibgen a b) (cons-stream a (fibgen b (+ a b))))
(define fibs (fibgen 0 1))
;;;(stream-ref fibs 100)
(define (stream-section  stream a b )
	(cond ((stream-null? stream) the-empty-stream)
		  ((>= a b) the-empty-stream)
		  (else (cons-stream (stream-ref stream a) (stream-section stream (+ a 1) b)))))
;;;(display-stream (stream-section no-sevens 100 109))
(define (not-div? x y) (not (= (remainder x y)  0)));;;sieve运行也不成功，于是又把过滤函数修改一下，不过 也是stream-ref 3000就耗尽内存,只能到2000+
;;;;以上为使用delay force内置版本；后又在make-stream-version2修改delay，使用记忆版和普通版delay 均运行至1000+，未及内置版本delay
;;;本机采用Ubuntu 虚拟机，内存2G，解释器为mit-scheme
(define (sieve stream)
	(cons-stream (stream-car stream)
				(sieve (stream-filter (lambda (x) ( not-div?  x (stream-car stream)))
														(stream-cdr stream)))))
(define primes (sieve (integers-starting-from 2)))
;;(display-stream (stream-section primes 100 109))

(define ones (cons-stream 1 ones))
(define integers2 (cons-stream 1 (add-streams ones integers2)))
;(display-stream (stream-section integers2 1000 1010))


(define fibs2 (cons-stream 0 (cons-stream 1 (add-streams (stream-cdr fibs2) fibs2))))
;(display-stream (stream-section fibs2 1000 1010))

(define double (cons-stream 1 (scale-stream double 2)))

(LOAD "../Chap-one/prime.scm")
(define primes2 (cons-stream 2 (stream-filter prime? (integers-starting-from 3))))
;	(define (prime? n)
;		(define (iter ps)
;			(cond ((> (square (stream-car ps)) n) true)
;			  ((divisible? n (stream-car ps)) false)
;			  (else (iter (stream-cdr ps)))))
;	(iter primes2))
;;;;;;书本229页的prime?原理上可以工作，但是并未试验成功，所以采用了第一章的prime?函数，运行成功，但是与教材笨处目的不一致，先搁置此处，学习后面内容。
;(display-stream (stream-section primes2 100 109))


