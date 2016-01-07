if [ ! -f "nasa.xml" ];
then
  curl -O http://www.cs.washington.edu/research/xmldatasets/data/nasa/nasa.xml
fi
racket xml.rkt < nasa.xml
raco demod -O xml.rkt
racket xml_rkt_merged.zo < nasa.xml
