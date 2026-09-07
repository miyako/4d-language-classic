// overload 0
METHOD SET COMMENTS("synthText";"synthText";*)
// overload 0 flag-sweep omit-trailing-from:*
METHOD SET COMMENTS("synthText";"synthText")
// overload 0 linked-union-sweep path=Text,comments=Text
METHOD SET COMMENTS("synthText";"synthText";*)
// overload 0 linked-union-sweep path=Text array,comments=Text array
ARRAY TEXT($arr1;0)
ARRAY TEXT($arr2;0)
METHOD SET COMMENTS($arr1;$arr2;*)
