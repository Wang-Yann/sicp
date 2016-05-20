;(load "make-serializer")
;(load "serialized-parallel-execute.scm")
(define (make-account balance)
    (let ((id (generate-account-id)))                       ; +

        (define (withdraw amount)
            (if (>= balance amount)
                (begin (set! balance (- balance amount))
                       balance)
                "Insufficient funds"))

        (define (deposit amount)
            (set! balance (+ balance amount))
            balance)

        (let ((balance-serializer (make-serializer)))
            (define (dispatch m)
                (cond
                    ((eq? m 'withdraw)
                        withdraw)
                    ((eq? m 'deposit)
                        deposit)
                    ((eq? m 'balance)
                        balance)
                    ((eq? m 'serializer)
                        balance-serializer)
                    ((eq? m 'id)                            ; +
                        id)                                 ; +
                    (else
                        (error "Unknown request -- MAKE-ACCOUNT" m))))

            dispatch)))

(define (counter)
    (let ((i 0))
        (lambda ()
            (set! i (+ 1 i))
            i)))

(define generate-account-id (counter))


;;; p214-exchange.scm

(define (exchange account1 account2)
  (let ((difference (- (account1 'balance)
                       (account2 'balance))))
    ((account1 'withdraw) difference)
    ((account2 'deposit) difference)))

(define (serialized-exchange acc-1 acc-2)
    ; 获取并对比两个帐号的 id 值
    ; 然后传给 serialize-and-exchange
    (if (< (acc-1 'id) (acc-2 'id))
        (serialize-and-exchange acc-1 acc-2)
        (serialize-and-exchange acc-2 acc-1)))

(define (serialize-and-exchange smaller-id-account bigger-id-account)
    ; 使用两个 let 结构
    ; 按顺序先后获取两个帐号的 serializer
    (let ((smaller-serializer (smaller-id-account 'serializer)))
        (let ((bigger-serializer (bigger-id-account 'serializer)))
            ((smaller-serializer (bigger-serializer exchange))
             smaller-id-account
             bigger-id-account))))
