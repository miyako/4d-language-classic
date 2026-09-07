// overload 0
var $synthResult1 : Variant
$synthResult1:=Get list item font(*;"synthText";1)
// overload 0 flag-sweep omit-leading-thru:*
var $synthResult2 : Variant
$synthResult2:=Get list item font(1;1)
// overload 0 union-sweep itemRef=Integer
var $synthResult3 : Variant
$synthResult3:=Get list item font(*;"synthText";1)
// overload 0 union-sweep itemRef=pseudo:Operator
var $synthResult4 : Variant
$synthResult4:=Get list item font(*;"synthText";*)
