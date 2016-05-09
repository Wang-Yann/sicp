(load "81coerciontable.scm")
(define (scheme-number->scheme-number n) n)
(put-coercion 'scheme-number 'scheme-number scheme-number->scheme-number)
(define (complex->complex z) z)
(put-coercion 'complex 'copmplex complex->complex)

