// overload 0
ARRAY TEXT($array1;0)
ARRAY INTEGER($countArray2;0)
DISTINCT VALUES([SynthTable]label;$array1;$countArray2)
// overload 0 union-sweep countArray=Integer array
ARRAY TEXT($array3;0)
ARRAY INTEGER($countArray4;0)
DISTINCT VALUES([SynthTable]label;$array3;$countArray4)
// overload 0 union-sweep countArray=Real array
ARRAY TEXT($array5;0)
ARRAY REAL($countArray6;0)
DISTINCT VALUES([SynthTable]label;$array5;$countArray6)
