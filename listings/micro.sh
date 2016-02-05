#!/bin/zsh
for x in 2 5 6 7 8 9 10 11 12; do 
  racket comp.rkt $x
  echo "No inline for: $x" 
  time racket m0.rkt
  rm -rf compiled
  raco make m0.rkt
  echo "Cross module inlining for: $x"
  time racket m0.rkt
  raco demod -O m0.rkt
  echo "Demodularized for: $x"
  time racket m0_rkt_merged.zo
done
rm m{0..11}.rkt
