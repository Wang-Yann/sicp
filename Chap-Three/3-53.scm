(load "make-stream-version2.scm")
(define s (cons-stream 1 (add-streams  s s )))
