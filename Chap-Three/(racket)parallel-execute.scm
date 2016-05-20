#lang racket
(define (parallel-execute . procs)
	(map thread-wait 
			(map (lambda(proc) (thread proc)) procs)))
