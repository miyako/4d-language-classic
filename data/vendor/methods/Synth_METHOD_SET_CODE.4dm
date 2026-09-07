// overload 0
METHOD SET CODE("synthText";"synthText";*)
// overload 0 flag-sweep omit-trailing-from:*
METHOD SET CODE("synthText";"synthText")
// overload 0 linked-union-sweep path=Text,code=Text
METHOD SET CODE("synthText";"synthText";*)
// overload 0 linked-union-sweep path=Text array,code=Text array
ARRAY TEXT($arr1;0)
ARRAY TEXT($arr2;0)
METHOD SET CODE($arr1;$arr2;*)
