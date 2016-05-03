(define (acc-n op init seqs)
	(if (null? (car seqs))  '() 
		(cons (acc op init  (map car seqs)  )
			(acc-n op init (map cdr seqs )))))

(load "filter.scm")
(load "smplst.scm")
