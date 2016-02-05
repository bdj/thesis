#lang racket
(require plot)

(define non-inlined
  '((2 .09)
    (5 .75)
    (6 1.55)
    (7 3.12)
    (8 6.33)
    (9 12.65)
    (10 25.98)
    (11 50.41)
    (12 104.26)))

(define inlined
  '((2 .03)
    (5 .40)
    (6 .82)
    (7 1.66)
    (8 3.32)
    (9 6.71)
    (10 13.41)
    (11 28.2)
    (12 55.58)))
(define demodularized
  '((2 .03)
    (5 .23)
    (6 .39)
    (7 .62)
    (8 1.2)
    (9 2.32)
    (10 4.54)
    (11 9.97)
    (12 18.39)))
(point-size 2)
(plot-x-ticks (linear-ticks #:number 10 #:divisors '(1)))
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
      #:x-min 2 #:x-max 12
      #:y-min 0 #:y-max 105
      #:x-label "Number of modules"
      #:y-label "Time (s)")