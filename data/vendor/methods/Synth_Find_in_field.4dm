// overload 0
var $synthResult1 : Variant
$synthResult1:=Find in field([SynthTable]label;[SynthTable]label)
// overload 0 union-sweep value=Field
var $synthResult2 : Variant
$synthResult2:=Find in field([SynthTable]label;[SynthTable]label)
// overload 0 union-sweep value=Variable
var $v3 : Variant
var $synthResult4 : Variant
$synthResult4:=Find in field([SynthTable]label;$v3)
