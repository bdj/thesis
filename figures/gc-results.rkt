#lang racket
(require plot)
(plot-file (list (discrete-histogram
             '(#(racket/base 209) #(racket 2047) #(XML 2750) #(plot 15868))
             #:skip 2.5 #:x-min 0
             #:label "Program bytecode size")
            (discrete-histogram
             '(#(racket/base .391) #(racket 265) #(XML 395) #(plot 3221))
             #:skip 2.5 #:x-min 1
             #:label "Dead code eliminated size" #:color 2 #:line-color 2))
      #:x-label "Benchmark" #:y-label "Size (KB)"
      "gc-results.pdf")