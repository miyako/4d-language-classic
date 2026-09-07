// overload 0
var $synthResult1 : Variant
$synthResult1:=List item parent(*;"synthText";1)
// overload 0 flag-sweep omit-leading-thru:*
var $synthResult2 : Variant
$synthResult2:=List item parent(1;1)
// overload 0 union-sweep itemRef=Integer
var $synthResult3 : Variant
$synthResult3:=List item parent(*;"synthText";1)
// overload 0 union-sweep itemRef=pseudo:Operator
var $synthResult4 : Variant
$synthResult4:=List item parent(*;"synthText";*)
