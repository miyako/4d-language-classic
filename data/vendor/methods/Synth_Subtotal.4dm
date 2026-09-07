// overload 0
var $synthResult1 : Variant
$synthResult1:=Subtotal([SynthTable]label;1)
// overload 0 union-sweep data=Field
var $synthResult2 : Variant
$synthResult2:=Subtotal([SynthTable]label;1)
// overload 0 union-sweep data=Variable
var $v3 : Variant
var $synthResult4 : Variant
$synthResult4:=Subtotal($v3;1)
