(load "3-71.scm")


 (define (Ramanujan3 s) 
          (define (stream-cadr s) (stream-car (stream-cdr s))) 
          (define (stream-cddr s) (stream-cdr (stream-cdr s))) 
          (define (stream-cdddr s) (stream-cdr (stream-cdr (stream-cdr s)))) 
          (let ((scar (stream-car s)) (scadr (stream-cadr s))(scaddr (stream-car(stream-cddr s ))) ) 
             (if (= (weight3 scar) (weight3  scadr) (weight3 scaddr))
							;;;;此处使用=的扩张形式，（= a b c) ,不过效率并没有提高
                (cons-stream (list (weight3 scar) scar scadr scaddr ) (Ramanujan3 (stream-cdddr s))) 
                         (Ramanujan3 (stream-cdr s))))) 

; (define Ramanujan3-numbers 
 ;      (Ramanujan3 (weighted-pairs integers integers weight3))) 
;;;此上Ramanujan3-numbers 流生成第一组数较慢，导入时解释器会一直等待

 ;(display-stream (stream-section Ramanujan3-numbers 0 10))

;;;(87539319 (167 436) (228 423) (255 414))
;;(119824488 (11 493) (90 492) (346 428))
;;(143604279 (111 522) (359 460) (408 423))
;;(175959000 (70 560) (198 552) (315 525))
;;(327763000 (300 670) (339 661) (510 580))
;;没有看清问题，此是立方数版本，可以运行，速度较慢,以上为几组结果，用时10分钟

(define sum-square (lambda(x) (+ (square (car x)) (square (cadr x)) )))
 (define (square3 s) 
          (define (stream-cadr s) (stream-car (stream-cdr s))) 
          (define (stream-cddr s) (stream-cdr (stream-cdr s))) 
          (define (stream-cdddr s) (stream-cdr (stream-cdr (stream-cdr s)))) 
          (let ((scar (stream-car s)) (scadr (stream-cadr s))(scaddr (stream-car(stream-cddr s ))) ) 
             (if (and (= (sum-square scar) (sum-square  scadr)) 
					  (= (sum-square scar) (sum-square scaddr)))
                (cons-stream (list (sum-square scar) scar scadr scaddr ) (square3 (stream-cdddr s))) 
                         (square3 (stream-cdr s))))) 

 (define square3-numbers 
       (square3 (weighted-pairs integers integers sum-square))) 

 ;(display-stream (stream-section square3-numbers 0 10))


;;;平方形式比立方形式运行快的多，是结果本身的分布导致
