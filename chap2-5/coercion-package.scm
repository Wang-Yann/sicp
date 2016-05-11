
(load "raw-apply-generic-2.scm")



 (define (install-coercion-package) 
 (define (scheme-number->complex n) 
   (make-complex-from-real-imag (contents n) 0)) 
 (define (scheme-number->rational n) 
   (make-rational (contents n) 1)) 
 (put-coercion 'scheme-number 'rational scheme-number->rational) 
 (put-coercion 'scheme-number 'complex scheme-number->complex) 
 'done) 
  
 


