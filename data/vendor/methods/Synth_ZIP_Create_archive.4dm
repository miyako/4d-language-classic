// overload 0
var $v1 : Variant
var $v2 : Variant
var $synthResult3 : Variant
$synthResult3:=ZIP Create archive($v1;$v2)
// overload 1
var $v4 : Variant
var $v5 : Variant
var $synthResult6 : Variant
$synthResult6:=ZIP Create archive($v4;$v5;1)
// overload 2
var $v7 : Variant
var $synthResult8 : Variant
$synthResult8:=ZIP Create archive(New object;$v7)
