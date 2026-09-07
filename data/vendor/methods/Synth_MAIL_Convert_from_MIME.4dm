// overload 0
var $mime1 : Variant
var $synthResult2 : Variant
$synthResult2:=MAIL Convert from MIME($mime1)
// overload 0 union-sweep mime=Blob
var $mime3 : Variant
var $synthResult4 : Variant
$synthResult4:=MAIL Convert from MIME($mime3)
// overload 0 union-sweep mime=Text
var $synthResult5 : Variant
$synthResult5:=MAIL Convert from MIME("synthText")
