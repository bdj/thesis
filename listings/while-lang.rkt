#lang racket/base
(require (for-syntax racket/base
                     "obj.rkt")
         "obj.rkt")
(provide (except-out (all-from-out racket/base) #%module-begin)
         (rename-out [module-begin #%module-begin])
         while)

(define-syntax-rule (module-begin body ...)
  (#%module-begin
   (printf "This is a while program\n")
   body ...))

(define-syntax-rule (while test body ...)
  (let loop ()
    (if test
        (begin
          body ...
          (loop))
        (void))))

(set-val! 5)

(begin-for-syntax
  (set-val! 2)
  (printf "compile-time val is ~a\n" (get-val)))
