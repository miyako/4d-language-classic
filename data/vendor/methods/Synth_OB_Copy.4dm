// overload 0
var $synthResult1 : Variant
$synthResult1:=OB Copy(New object;True)
// overload 1
var $synthResult2 : Variant
$synthResult2:=OB Copy(New object;1;New collection)
// overload 1 union-sweep groupWith=Collection
var $synthResult3 : Variant
$synthResult3:=OB Copy(New object;1;New collection)
// overload 1 union-sweep groupWith=Object
var $synthResult4 : Variant
$synthResult4:=OB Copy(New object;1;New object)
