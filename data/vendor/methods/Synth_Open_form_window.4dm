// overload 0
var $synthResult1 : Variant
$synthResult1:=Open form window([SynthTable];New object;1;1;1;*)
// overload 0 flag-sweep omit-trailing-from:*
var $synthResult2 : Variant
$synthResult2:=Open form window([SynthTable];New object;1;1;1)
// overload 0 union-sweep formName=Text
var $synthResult3 : Variant
$synthResult3:=Open form window([SynthTable];"synthText";1;1;1;*)
// overload 0 union-sweep formName=Object
var $synthResult4 : Variant
$synthResult4:=Open form window([SynthTable];New object;1;1;1;*)
