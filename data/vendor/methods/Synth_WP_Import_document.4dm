// overload 0
var $synthResult1 : Variant
$synthResult1:=WP Import document("synthText";1)
// overload 0 union-sweep option=Integer
var $synthResult2 : Variant
$synthResult2:=WP Import document("synthText";1)
// overload 0 union-sweep option=Object
var $synthResult3 : Variant
$synthResult3:=WP Import document("synthText";New object)
// overload 1
var $fileObj4 : Variant
var $synthResult5 : Variant
$synthResult5:=WP Import document($fileObj4;1)
// overload 1 union-sweep option=Integer
var $fileObj6 : Variant
var $synthResult7 : Variant
$synthResult7:=WP Import document($fileObj6;1)
// overload 1 union-sweep option=Object
var $fileObj8 : Variant
var $synthResult9 : Variant
$synthResult9:=WP Import document($fileObj8;New object)
