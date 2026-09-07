// overload 0
var $synthResult1 : Variant
$synthResult1:=Validate password(1;"synthText";True)
// overload 0 union-sweep userID=Integer
var $synthResult2 : Variant
$synthResult2:=Validate password(1;"synthText";True)
// overload 0 union-sweep userID=Text
var $synthResult3 : Variant
$synthResult3:=Validate password("synthText";"synthText";True)
