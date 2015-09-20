#lang racket/base
(provide get-val set-val!)
(define x 0)
(define (get-val) x)
(define (set-val! v) (set! x v))