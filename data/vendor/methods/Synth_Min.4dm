// overload 0
var $synthResult1 : Variant
$synthResult1:=Min([SynthTable]label;"synthText")
// overload 0 union-sweep series=Field
var $synthResult2 : Variant
$synthResult2:=Min([SynthTable]label;"synthText")
// overload 0 union-sweep series=Array
ARRAY LONGINT($series3;0)
var $synthResult4 : Variant
$synthResult4:=Min($series3;"synthText")
