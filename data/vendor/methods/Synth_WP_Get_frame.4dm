// overload 0
var $v1 : Text
var $synthResult2 : Variant
$synthResult2:=WP Get frame(*;"synthText";$v1)
// overload 1
var $v3 : Variant
var $v4 : Text
var $synthResult5 : Variant
$synthResult5:=WP Get frame($v3;$v4)
// overload 1 union-sweep wpArea=Variable
var $v6 : Variant
var $v7 : Text
var $synthResult8 : Variant
$synthResult8:=WP Get frame($v6;$v7)
// overload 1 union-sweep wpArea=Field
var $v9 : Text
var $synthResult10 : Variant
$synthResult10:=WP Get frame([SynthTable]label;$v9)
