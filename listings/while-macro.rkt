(define-syntax (while stx)
  (syntax-case stx ()
    [(while test body ...)
     #'(begin
         (define (while-loop)
           (when test
             body ...
             (while-loop)))
         (while-loop))]))
