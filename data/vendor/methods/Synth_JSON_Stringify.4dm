// overload 0
var $synthResult1 : Variant
$synthResult1:=JSON Stringify(New object;*)
// overload 0 flag-sweep omit-trailing-from:*
var $synthResult2 : Variant
$synthResult2:=JSON Stringify(New object)
// overload 0 union-sweep value=Object
var $synthResult3 : Variant
$synthResult3:=JSON Stringify(New object;*)
// overload 0 union-sweep value=pseudo:any
var $synthResult4 : Variant
$synthResult4:=JSON Stringify("synthAny";*)
