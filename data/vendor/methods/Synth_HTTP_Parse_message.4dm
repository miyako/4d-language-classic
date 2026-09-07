// overload 0
var $synthResult1 : Variant
$synthResult1:=HTTP Parse message("synthText")
// overload 0 union-sweep data=Text
var $synthResult2 : Variant
$synthResult2:=HTTP Parse message("synthText")
// overload 0 union-sweep data=Blob
var $v3 : Variant
var $synthResult4 : Variant
$synthResult4:=HTTP Parse message($v3)
