#lang racket
(require plot)

(define non-inlined
  '((2 7.71)
    (3 11.13)
    (10 47.07)
    (20 118.12)))

(define inlined
  '((2 2.36)
    (3 2.35)
    (10 2.37)
    (20 2.34)))
(define demodularized
  '((2 2.25)
    (3 2.27)
    (10 2.24) 
    (20 2.27)))
(point-size 2)
(plot-file (list
       (lines non-inlined
              #:label "Non-inlined"
              #:style 'long-dash)
       (points non-inlined)
       (lines inlined
              #:label "Inlined")
       (points inlined)
       (lines demodularized
              #:label "Demodularized"
              #:style 'dot)
       (points demodularized))
           "micro-results.pdf"
      #:x-min 0 #:x-max 20
      #:y-min 0 #:y-max 120
      #:x-label "Number of modules"
      #:y-label "Time (s)")