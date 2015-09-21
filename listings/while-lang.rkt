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

(printf "runtime val was ~a " (get-val))
(set-val! 5)
(printf "and is now ~a\n" (get-val))

(begin-for-syntax
  (printf "compile-time val was ~a " (get-val))
  (set-val! 2)
  (printf "and is now ~a\n" (get-val)))
