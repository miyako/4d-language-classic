// overload 0
var $attributes1 : Object
METHOD GET ATTRIBUTES("synthText";$attributes1;*)
// overload 0 flag-sweep omit-trailing-from:*
var $attributes2 : Object
METHOD GET ATTRIBUTES("synthText";$attributes2)
// overload 0 linked-union-sweep path=Text,attributes=Object
var $attributes3 : Object
METHOD GET ATTRIBUTES("synthText";$attributes3;*)
// overload 0 linked-union-sweep path=Text array,attributes=Object array
ARRAY TEXT($path4;0)
ARRAY OBJECT($attributes5;0)
METHOD GET ATTRIBUTES($path4;$attributes5;*)
