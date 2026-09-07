// overload 0
var $synthResult1 : Variant
$synthResult1:=Print form([SynthTable];"synthText";New object;1;1)
// overload 0 union-sweep form=Text
var $synthResult2 : Variant
$synthResult2:=Print form([SynthTable];"synthText";New object;1;1)
// overload 0 union-sweep form=Object
var $synthResult3 : Variant
$synthResult3:=Print form([SynthTable];New object;New object;1;1)
