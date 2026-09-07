// overload 0
METHOD SET ATTRIBUTES("synthText";New object;*)
// overload 0 flag-sweep omit-trailing-from:*
METHOD SET ATTRIBUTES("synthText";New object)
// overload 0 linked-union-sweep path=Text,attributes=Object
METHOD SET ATTRIBUTES("synthText";New object;*)
// overload 0 linked-union-sweep path=Text array,attributes=Object array
ARRAY TEXT($path1;0)
ARRAY OBJECT($attributes2;0)
METHOD SET ATTRIBUTES($path1;$attributes2;*)
