#lang racket/base
(require (for-syntax racket/base
                     "b.rkt"))

(define-syntax (m stx)
  (syntax-case stx ()
    [(m)
     y]))
(m)

