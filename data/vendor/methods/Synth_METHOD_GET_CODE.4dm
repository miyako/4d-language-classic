// overload 0
var $v1 : Text
METHOD GET CODE("synthText";$v1;1;*)
// overload 0 flag-sweep omit-trailing-from:*
var $v2 : Text
METHOD GET CODE("synthText";$v2;1)
// overload 0 linked-union-sweep path=Text,code=Text
var $v3 : Text
METHOD GET CODE("synthText";$v3;1;*)
// overload 0 linked-union-sweep path=Text array,code=Text array
ARRAY TEXT($arr4;0)
ARRAY TEXT($arr5;0)
METHOD GET CODE($arr4;$arr5;1;*)
