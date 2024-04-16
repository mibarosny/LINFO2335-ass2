#lang r5rs

; Students: Rosny Miba, Paquet Timothé
(define (format-method method)
  (let* ((name (caadr method)) (proc method) (lambda-expr `(lambda ,(cdadr method) ,(caddr method))))
    ;`(,name . ,(lambda (x y) (+ x y)))
    `(,name . ,lambda-expr))
    ;(eval 'method (null-environment 5))
    )
  )
(define-syntax define-class
  (syntax-rules ()
    ((define-class (class . class-args) . body)
     (let* ((methodlist `body) (dispatcherlist (map format-method methodlist)))
       (display dispatcherlist))
     )))


(define-class (bank-account balance)
  ; init self and super
  ; ...
  (define (get-balance) balance)
  (define (withdraw n) (set! balance (- balance n)))
  (define (type) 'bank-account)
  ; ...
  ; no need to define a dispatcher function manually,
  ; this should be generated by your define-class macro
)