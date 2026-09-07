// overload 0
var $v1 : Variant
var $synthResult2 : Variant
$synthResult2:=MAIL Convert from MIME($v1)
// overload 0 union-sweep mime=Blob
var $v3 : Variant
var $synthResult4 : Variant
$synthResult4:=MAIL Convert from MIME($v3)
// overload 0 union-sweep mime=Text
var $synthResult5 : Variant
$synthResult5:=MAIL Convert from MIME("synthText")
