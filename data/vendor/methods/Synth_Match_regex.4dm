// overload 0
var $synthResult1 : Variant
$synthResult1:=Match regex("synthText";"synthText")
// overload 1
var $v2 : Integer
var $v3 : Integer
var $synthResult4 : Variant
$synthResult4:=Match regex("synthText";"synthText";1;$v2;$v3;*)
// overload 1 flag-sweep omit-trailing-from:*
var $v5 : Integer
var $v6 : Integer
var $synthResult7 : Variant
$synthResult7:=Match regex("synthText";"synthText";1;$v5;$v6)
// overload 2
ARRAY INTEGER($arr8;0)
ARRAY INTEGER($arr9;0)
var $synthResult10 : Variant
$synthResult10:=Match regex("synthText";"synthText";1;$arr8;$arr9;*)
// overload 2 flag-sweep omit-trailing-from:*
ARRAY INTEGER($arr11;0)
ARRAY INTEGER($arr12;0)
var $synthResult13 : Variant
$synthResult13:=Match regex("synthText";"synthText";1;$arr11;$arr12)
