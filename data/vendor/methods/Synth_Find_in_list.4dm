// overload 0
ARRAY INTEGER($arr1;0)
var $synthResult2 : Variant
$synthResult2:=Find in list(*;"synthText";"synthText";1;$arr1;*)
// overload 0 flag-sweep omit-leading-thru:asObjectName
ARRAY INTEGER($arr3;0)
var $synthResult4 : Variant
$synthResult4:=Find in list(1;"synthText";1;$arr3;*)
// overload 0 flag-sweep omit-trailing-from:asReference
ARRAY INTEGER($arr5;0)
var $synthResult6 : Variant
$synthResult6:=Find in list(*;"synthText";"synthText";1;$arr5)
