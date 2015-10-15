(module hello '#%kernel
  (#%require racket/private/misc)
  (define-values (y) (random))
  (let-values ([(x) #f])
    (set! x 5)
    (displayln x)
    (displayln (+ x y))))