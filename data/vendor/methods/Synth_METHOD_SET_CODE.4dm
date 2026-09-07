// overload 0
METHOD SET CODE("synthText";"synthText";*)
// overload 0 flag-sweep omit-trailing-from:*
METHOD SET CODE("synthText";"synthText")
// overload 0 linked-union-sweep path=Text,code=Text
METHOD SET CODE("synthText";"synthText";*)
// overload 0 linked-union-sweep path=Text array,code=Text array
ARRAY TEXT($path1;0)
ARRAY TEXT($code2;0)
METHOD SET CODE($path1;$code2;*)
