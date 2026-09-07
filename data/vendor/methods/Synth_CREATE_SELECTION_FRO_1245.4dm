// overload 0
ARRAY INTEGER($recordArray1;0)
CREATE SELECTION FROM ARRAY([SynthTable];$recordArray1;"synthText")
// overload 0 union-sweep recordArray=Integer array
ARRAY INTEGER($recordArray2;0)
CREATE SELECTION FROM ARRAY([SynthTable];$recordArray2;"synthText")
// overload 0 union-sweep recordArray=Boolean array
ARRAY BOOLEAN($recordArray3;0)
CREATE SELECTION FROM ARRAY([SynthTable];$recordArray3;"synthText")
