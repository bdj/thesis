(while (< x 10)
  (printf "x is ~a\n" x)
  (set! x (add1 x)))

=>

(begin
  (define (while-loop)
    (when (< x 10)
      (printf "x is ~a\n" x)
      (set! x (add1 x)
      (while-loop))))
  (while-loop))

