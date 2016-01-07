#lang racket
(require plot)
(plot-file (list (discrete-histogram
             '(#(XML 22.5) #(math 10) #(plot 10) #(redex 10))
             #:skip 2.5 #:x-min 0
             #:label "Demodularized")
            (discrete-histogram
             '(#(XML 25.5) #(math 11) #(plot 12) #(redex 13))
             #:skip 2.5 #:x-min 1
             #:label "Modular" #:color 2 #:line-color 2))
      #:x-label "Benchmark" #:y-label "Time (s)"
      #:y-max 30
      "macro-results.pdf")