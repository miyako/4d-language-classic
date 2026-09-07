// overload 0
ARRAY TEXT($arr1;0)
var $synthResult2 : Variant
$synthResult2:=Select document("synthText";"synthText";"synthText";1;$arr1)
// overload 0 union-sweep directory=Text
ARRAY TEXT($arr3;0)
var $synthResult4 : Variant
$synthResult4:=Select document("synthText";"synthText";"synthText";1;$arr3)
// overload 0 union-sweep directory=Integer
ARRAY TEXT($arr5;0)
var $synthResult6 : Variant
$synthResult6:=Select document(1;"synthText";"synthText";1;$arr5)
