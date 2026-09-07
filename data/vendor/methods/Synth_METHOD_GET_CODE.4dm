// overload 0
var $code1 : Text
METHOD GET CODE("synthText";$code1;1;*)
// overload 0 flag-sweep omit-trailing-from:*
var $code2 : Text
METHOD GET CODE("synthText";$code2;1)
// overload 0 linked-union-sweep path=Text,code=Text
var $code3 : Text
METHOD GET CODE("synthText";$code3;1;*)
// overload 0 linked-union-sweep path=Text array,code=Text array
ARRAY TEXT($path4;0)
ARRAY TEXT($code5;0)
METHOD GET CODE($path4;$code5;1;*)
