// overload 0
var $synthResult1 : Variant
$synthResult1:=Document to text("synthText";"synthText";1)
// overload 0 union-sweep charSet=Text
var $synthResult2 : Variant
$synthResult2:=Document to text("synthText";"synthText";1)
// overload 0 union-sweep charSet=Integer
var $synthResult3 : Variant
$synthResult3:=Document to text("synthText";1;1)
