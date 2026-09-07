// overload 0
var $v1 : Variant
var $synthResult2 : Variant
$synthResult2:=Generate digest($v1;1;*)
// overload 0 flag-sweep omit-trailing-from:*
var $v3 : Variant
var $synthResult4 : Variant
$synthResult4:=Generate digest($v3;1)
// overload 0 union-sweep param=Blob
var $v5 : Variant
var $synthResult6 : Variant
$synthResult6:=Generate digest($v5;1;*)
// overload 0 union-sweep param=Text
var $synthResult7 : Variant
$synthResult7:=Generate digest("synthText";1;*)
