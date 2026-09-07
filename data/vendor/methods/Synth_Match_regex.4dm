// overload 0
var $synthResult1 : Variant
$synthResult1:=Match regex("synthText";"synthText")
// overload 1
var $pos_found2 : Integer
var $length_found3 : Integer
var $synthResult4 : Variant
$synthResult4:=Match regex("synthText";"synthText";1;$pos_found2;$length_found3;*)
// overload 1 flag-sweep omit-trailing-from:*
var $pos_found5 : Integer
var $length_found6 : Integer
var $synthResult7 : Variant
$synthResult7:=Match regex("synthText";"synthText";1;$pos_found5;$length_found6)
// overload 2
ARRAY INTEGER($pos_found8;0)
ARRAY INTEGER($length_found9;0)
var $synthResult10 : Variant
$synthResult10:=Match regex("synthText";"synthText";1;$pos_found8;$length_found9;*)
// overload 2 flag-sweep omit-trailing-from:*
ARRAY INTEGER($pos_found11;0)
ARRAY INTEGER($length_found12;0)
var $synthResult13 : Variant
$synthResult13:=Match regex("synthText";"synthText";1;$pos_found11;$length_found12)
