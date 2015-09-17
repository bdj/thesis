#lang s-exp "while-lang.rkt"
(require (prefix-in o: "obj.rkt"))
(while (< (o:val) 4)
  (printf "runtime val is ~a\n" (o:val))
  (o:update-val))
