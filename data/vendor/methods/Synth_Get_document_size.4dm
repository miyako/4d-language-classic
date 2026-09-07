// overload 0
var $synthResult1 : Variant
$synthResult1:=Get document size(?00:00:00?;*)
// overload 0 flag-sweep omit-trailing-from:*
var $synthResult2 : Variant
$synthResult2:=Get document size(?00:00:00?)
// overload 0 union-sweep document=Text
var $synthResult3 : Variant
$synthResult3:=Get document size("synthText";*)
// overload 0 union-sweep document=Time
var $synthResult4 : Variant
$synthResult4:=Get document size(?00:00:00?;*)
