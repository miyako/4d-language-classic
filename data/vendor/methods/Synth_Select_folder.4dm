// overload 0
var $synthResult1 : Variant
$synthResult1:=Select folder()
// overload 1
var $synthResult2 : Variant
$synthResult2:=Select folder("synthText";"synthText";1)
// overload 1 union-sweep defaultPath=Text
var $synthResult3 : Variant
$synthResult3:=Select folder("synthText";"synthText";1)
// overload 1 union-sweep defaultPath=Integer
var $synthResult4 : Variant
$synthResult4:=Select folder("synthText";1;1)
