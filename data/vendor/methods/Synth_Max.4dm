// overload 0
var $synthResult1 : Variant
$synthResult1:=Max([SynthTable]label;"synthText")
// overload 0 union-sweep series=Field
var $synthResult2 : Variant
$synthResult2:=Max([SynthTable]label;"synthText")
// overload 0 union-sweep series=Array
ARRAY LONGINT($arr3;0)
var $synthResult4 : Variant
$synthResult4:=Max($arr3;"synthText")
