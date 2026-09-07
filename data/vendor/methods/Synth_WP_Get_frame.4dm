// overload 0
var $textBoxID1 : Text
var $synthResult2 : Variant
$synthResult2:=WP Get frame(*;"synthText";$textBoxID1)
// overload 1
var $wpArea3 : Variant
var $textBoxID4 : Text
var $synthResult5 : Variant
$synthResult5:=WP Get frame($wpArea3;$textBoxID4)
// overload 1 union-sweep wpArea=Variable
var $wpArea6 : Variant
var $textBoxID7 : Text
var $synthResult8 : Variant
$synthResult8:=WP Get frame($wpArea6;$textBoxID7)
// overload 1 union-sweep wpArea=Field
var $textBoxID9 : Text
var $synthResult10 : Variant
$synthResult10:=WP Get frame([SynthTable]label;$textBoxID9)
