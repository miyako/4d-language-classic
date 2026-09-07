// overload 0
METHOD SET ATTRIBUTES("synthText";New object;*)
// overload 0 flag-sweep omit-trailing-from:*
METHOD SET ATTRIBUTES("synthText";New object)
// overload 0 linked-union-sweep path=Text,attributes=Object
METHOD SET ATTRIBUTES("synthText";New object;*)
// overload 0 linked-union-sweep path=Text array,attributes=Object array
ARRAY TEXT($arr1;0)
ARRAY OBJECT($arr2;0)
METHOD SET ATTRIBUTES($arr1;$arr2;*)
