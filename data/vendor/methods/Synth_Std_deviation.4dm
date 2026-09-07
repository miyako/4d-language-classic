// overload 0
var $synthResult1 : Variant
$synthResult1:=Std deviation([SynthTable]label)
// overload 0 union-sweep series=Field
var $synthResult2 : Variant
$synthResult2:=Std deviation([SynthTable]label)
// overload 0 union-sweep series=Array
ARRAY LONGINT($arr3;0)
var $synthResult4 : Variant
$synthResult4:=Std deviation($arr3)
