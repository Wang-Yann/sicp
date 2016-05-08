(load "2-5-1.scm")
(load "2-78.scm")

(install-scheme-number-package)
(install-rational-package)
(install-rectangular-package)
 (install-polar-package)
 (install-complex-package)
(define (=zero? x) (apply-generic '=zero? x  ))
