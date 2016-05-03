(define (acc-n op int seqs)
	(if (null? (car seqs))  '() 
		(cons (acc op init  (map (lambda (subtree) ()) (car seqs)  )
			(acc-n op init  (cdr seqs) ))))

(load "filter.scm")

