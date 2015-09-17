#lang racket/base
(provide val update-val)
(define x 0)
(define (val) x)
(define (update-val) (set! x (add1 x)))