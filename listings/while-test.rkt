#lang s-exp "while-lang.rkt"
(require (prefix-in o: "obj.rkt"))

(while (< (o:get-val) 7)
  (printf "loop runtime val is ~a\n" (o:get-val))
  (o:set-val! (add1 (o:get-val))))
