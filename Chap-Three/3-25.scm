(define (lookup key-list table)
	(if (list? key-list)
		(let((current-key (car key-list)) (remain-key (cdr key-list)))
			(let ((record (assoc current-key (cdr table))))
				(if record 
					(if (null? remain-key) (cdr record) (lookup remain-key record))
					#f)))
	(lookup (list key-list) table)))
(define (make-table . table-name)
	(if (null? table-name) (list '*table*) table-name))
(define (join-in-table new-record table)
	(set-cdr! table (cons new-record (cdr table))))
(define (insert! key-list value table)
	(if (list? key-list)
		(let((current-key (car key-list)) (remain-key (cdr key-list)))
			(let((record (assoc current-key (cdr table))))
				(cond((and record (null? remain-key))
							(set-cdr! record value) table);;;有记录，且没有其他关键字
					 ((and record remain-key)
							(insert! remain-key value record)table );;有记录，且还有其他关键字
					 ((and (not record) (not(null? remain-key)))
							(join-in-table
							 (insert! remain-key value (make-table current-key))
							 table) table)   ;;;;无记录，且有其他关键字
					 ((and (not record) (null? remain-key));;;无记录，无关键字
							(let((new-record (cons current-key value)))
							(join-in-table new-record table) table)))))
	(insert! (list key-list) value table)))
