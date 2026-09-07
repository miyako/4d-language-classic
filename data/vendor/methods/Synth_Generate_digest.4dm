// overload 0
var $param1 : Variant
var $synthResult2 : Variant
$synthResult2:=Generate digest($param1;1;*)
// overload 0 flag-sweep omit-trailing-from:*
var $param3 : Variant
var $synthResult4 : Variant
$synthResult4:=Generate digest($param3;1)
// overload 0 union-sweep param=Blob
var $param5 : Variant
var $synthResult6 : Variant
$synthResult6:=Generate digest($param5;1;*)
// overload 0 union-sweep param=Text
var $synthResult7 : Variant
$synthResult7:=Generate digest("synthText";1;*)
