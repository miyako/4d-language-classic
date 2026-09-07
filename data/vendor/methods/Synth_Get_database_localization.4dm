// overload 0
var $synthResult1 : Variant
$synthResult1:=Get database localization(1;*)
// overload 0 flag-sweep omit-leading-thru:*
var $synthResult2 : Variant
$synthResult2:=Get database localization()
// overload 0 flag-sweep omit-trailing-from:*
var $synthResult3 : Variant
$synthResult3:=Get database localization(1)
