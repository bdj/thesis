#lang racket/base
(require (for-syntax racket/base
                     "counter.rkt"))
(provide while)

(define-syntax (while stx)
  (syntax-case stx ()
    [(while test body ...)
     (begin
       (for-each count-up 
                 (syntax->list #'(body ...)))
       (printf "while loop contains ~a expressions\n"
               (get-counter-val))
       #'(begin
           (define (while-loop)
             (when test
               body ...
               (while-loop)))
           (while-loop)))]))
