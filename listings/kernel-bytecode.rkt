(module hello
  (prefix (y (module-variable racket/private/misc displayln 7)))
  (requires #%kernel racket/private/misc)
  (def-values (toplevel 0)
    (app (primval 273)))
  (let-one
   (box-env
    (install-value 0 5
      (seq
       (app (toplevel 1) (local 1))
       (app (toplevel 1)
            (app (primval 247) (local 3) (toplevel 0))))))))
 