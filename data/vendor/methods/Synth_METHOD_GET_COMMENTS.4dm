// overload 0
var $v1 : Text
METHOD GET COMMENTS("synthText";$v1;*)
// overload 0 flag-sweep omit-trailing-from:*
var $v2 : Text
METHOD GET COMMENTS("synthText";$v2)
// overload 0 linked-union-sweep path=Text,comments=Text
var $v3 : Text
METHOD GET COMMENTS("synthText";$v3;*)
// overload 0 linked-union-sweep path=Text array,comments=Text array
ARRAY TEXT($arr4;0)
ARRAY TEXT($arr5;0)
METHOD GET COMMENTS($arr4;$arr5;*)
