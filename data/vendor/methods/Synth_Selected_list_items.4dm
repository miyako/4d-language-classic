// overload 0
ARRAY INTEGER($itemsArray1;0)
var $synthResult2 : Variant
$synthResult2:=Selected list items(*;"synthText";$itemsArray1;*)
// overload 0 flag-sweep omit-trailing-from:asReference
ARRAY INTEGER($itemsArray3;0)
var $synthResult4 : Variant
$synthResult4:=Selected list items(*;"synthText";$itemsArray3)
// overload 1
ARRAY INTEGER($itemsArray5;0)
var $synthResult6 : Variant
$synthResult6:=Selected list items(1;$itemsArray5;*)
// overload 1 flag-sweep omit-trailing-from:asReference
ARRAY INTEGER($itemsArray7;0)
var $synthResult8 : Variant
$synthResult8:=Selected list items(1;$itemsArray7)
