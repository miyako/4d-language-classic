// overload 0
ARRAY INTEGER($recordsArray1;0)
CREATE SET FROM ARRAY([SynthTable];$recordsArray1;"synthText")
// overload 0 union-sweep recordsArray=Integer array
ARRAY INTEGER($recordsArray2;0)
CREATE SET FROM ARRAY([SynthTable];$recordsArray2;"synthText")
// overload 0 union-sweep recordsArray=Boolean array
ARRAY BOOLEAN($recordsArray3;0)
CREATE SET FROM ARRAY([SynthTable];$recordsArray3;"synthText")
