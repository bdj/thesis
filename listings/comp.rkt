#lang racket

(define (compile-without-optimizations filename)
  (parameterize ([current-namespace (make-base-namespace)]
                 [compile-context-preservation-enabled #t])
    (with-output-to-file (format "compiled/~a" (path-add-suffix filename ".zo"))
      #:exists 'truncate
      (lambda ()
        (write (compile (read (open-input-file filename))))))))

(define (write-module n)
  (with-output-to-file (format "m~a.rkt" n)
    #:exists 'truncate
    (lambda ()
      (printf
"(module m~a '#%kernel
  (#%require \"m~a.rkt\")
  (#%provide f~a)
  (define-values (f~a) (lambda (x)
                       (if (f~a x)
                           (f~a x)
                           (begin
                             (random) (random) (random) (random) (random)
                             (random) (random) (random) (random) (random)
                             )))))
"
n (add1 n) n n (add1 n) (add1 n)))))

(define (write-first-module)
  (with-output-to-file "m0.rkt"
    #:exists 'truncate
    (lambda ()
      (printf
"(module m0 '#%kernel
  (#%require \"m1.rkt\")
  (letrec-values ([(loop)
                   (values (lambda (x)
                             (if (= x 0)
                                 'done
                                 (begin
                                   (f1 x)
                                   (loop (sub1 x))))))])
    (loop 10000000)))
"))))

(define (write-last-module n)
  (with-output-to-file (format "m~a.rkt" n)
    #:exists 'truncate
    (lambda ()
      (printf
"(module m~a '#%kernel
  (#%provide f~a)
  (define-values (f~a) (lambda (x)
                           (add1 x))))
                         
"
n n n))))

(define num-modules
  (sub1 (string->number (vector-ref (current-command-line-arguments) 0))))
(write-first-module)
(for ([i (in-range 1 num-modules)])
  (write-module i))
(write-last-module num-modules)

(for ([i (in-range (add1 num-modules))])
  (compile-without-optimizations (format "m~a.rkt" i)))


