(define-syntax-rule (while test body ...)
  (let loop ()
    (if test
        (begin
          body ...
          (loop))
        (void))))
