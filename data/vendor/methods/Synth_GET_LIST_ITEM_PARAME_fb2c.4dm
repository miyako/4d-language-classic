// overload 0
ARRAY TEXT($arr1;0)
ARRAY TEXT($arr2;0)
GET LIST ITEM PARAMETER ARRAYS(*;"synthText";1;$arr1;$arr2)
// overload 0 flag-sweep omit-leading-thru:*
ARRAY TEXT($arr3;0)
ARRAY TEXT($arr4;0)
GET LIST ITEM PARAMETER ARRAYS(1;1;$arr3;$arr4)
// overload 0 union-sweep itemRef=Integer
ARRAY TEXT($arr5;0)
ARRAY TEXT($arr6;0)
GET LIST ITEM PARAMETER ARRAYS(*;"synthText";1;$arr5;$arr6)
// overload 0 union-sweep itemRef=pseudo:Operator
ARRAY TEXT($arr7;0)
ARRAY TEXT($arr8;0)
GET LIST ITEM PARAMETER ARRAYS(*;"synthText";*;$arr7;$arr8)
