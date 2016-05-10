(load "attach-tag.scm")      ;from gws
(define (apply-generic-r op . args)
  (define (no-method type-tags)
    (error "No method for these types" 
      (list op type-tags)))      
  (define (raise-into s t)
   ; "Tries to raise s into the type of t. On success, 
    ;returns the raised s. Otherwise, returns #f" 
    (let ((s-type (type-tag s))
          (t-type (type-tag t)))
      (cond 
        ((equal? s-type t-type) s)
        ((get 'raise (list s-type))
          (raise-into ((get 'raise (list s-type)) (contents s)) t))
        (t #f))))

  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
            (let ((o1 (car args))
                  (o2 (cadr args)))
              (cond 
                ((raise-into o1 o2)
                  (apply-generic-r op (raise-into o1 o2) o2))
                ((raise-into o2 o1)
                  (apply-generic-r op o2 (raise-into o2 o1)))
                (t (no-method type-tags))))
            (no-method type-tags))))))
