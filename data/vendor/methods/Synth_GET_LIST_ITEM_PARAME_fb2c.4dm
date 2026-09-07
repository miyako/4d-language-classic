// overload 0
ARRAY TEXT($arrSelection1;0)
ARRAY TEXT($arrValues2;0)
GET LIST ITEM PARAMETER ARRAYS(*;"synthText";1;$arrSelection1;$arrValues2)
// overload 0 flag-sweep omit-leading-thru:*
ARRAY TEXT($arrSelection3;0)
ARRAY TEXT($arrValues4;0)
GET LIST ITEM PARAMETER ARRAYS(1;1;$arrSelection3;$arrValues4)
// overload 0 union-sweep itemRef=Integer
ARRAY TEXT($arrSelection5;0)
ARRAY TEXT($arrValues6;0)
GET LIST ITEM PARAMETER ARRAYS(*;"synthText";1;$arrSelection5;$arrValues6)
// overload 0 union-sweep itemRef=pseudo:Operator
ARRAY TEXT($arrSelection7;0)
ARRAY TEXT($arrValues8;0)
GET LIST ITEM PARAMETER ARRAYS(*;"synthText";*;$arrSelection7;$arrValues8)
