(define (pairs s t)
          (interleave
              (stream-map (lambda (x) (list (stream-car s) x )) (stream-cdr t))
                      (pairs (stream-cdr s) (stream-cdr t))))
  (define (interleave s1 s2)
      (if (stream-null? s1) s2
           (cons-stream (stream-car s1) (interleave s2 (stream-cdr s1)))))
  ;;;;(display-stream (stream-section (pairs integers integers) 0 10))
;;;;;;;Aborting!: maximum recursion depth exceeded，没有delay 在(pairs (stream-cdr s) (stream-cdr t))里面，导致无穷递归，耗尽内存
