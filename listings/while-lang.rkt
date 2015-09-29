#lang racket/base
(require (for-syntax racket/base
                     "counter.rkt"))
(provide (all-from-out racket/base) 
         while)

(define-syntax (while stx)
  (syntax-case stx ()
    [(while test body ...)
     (begin
       (for-each count-up 
                 (syntax->list #'(body ...)))
       (printf "while loop contains ~a expressions\n"
               (get-counter-val))
       #'(let loop ()
           (if test
             (begin
               body ...
               (loop))
             (void))))]))
