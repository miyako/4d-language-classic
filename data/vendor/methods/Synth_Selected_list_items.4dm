// overload 0
ARRAY INTEGER($arr1;0)
var $synthResult2 : Variant
$synthResult2:=Selected list items(*;"synthText";$arr1;*)
// overload 0 flag-sweep omit-trailing-from:asReference
ARRAY INTEGER($arr3;0)
var $synthResult4 : Variant
$synthResult4:=Selected list items(*;"synthText";$arr3)
// overload 1
ARRAY INTEGER($arr5;0)
var $synthResult6 : Variant
$synthResult6:=Selected list items(1;$arr5;*)
// overload 1 flag-sweep omit-trailing-from:asReference
ARRAY INTEGER($arr7;0)
var $synthResult8 : Variant
$synthResult8:=Selected list items(1;$arr7)
