(define (after-delay delay action) 
	(add-to-agenda! (+ delay (current-time the-agenda)) action the-agenda))
(define (propagate) 
	(if (empty-agenda? the-agenda) 'done
		(let ((first-item (first-agenda-item the-agenda)))
			( first-item)  (remove-first-agenda-item! the-agenda) (propagate))))
(define (probe name wire)
	(add-action! wire (lambda()
		(newline)
		(display name)
		(display "    ")
		(display (current-time the-agenda))
		(display "    new-value =       ")
		(display (get-signal wire)))))			




