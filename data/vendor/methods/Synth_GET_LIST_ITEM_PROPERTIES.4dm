// overload 0
var $enterable1 : Boolean
var $styles2 : Integer
var $icon3 : Text
var $color4 : Integer
GET LIST ITEM PROPERTIES(*;"synthText";1;$enterable1;$styles2;$icon3;$color4)
// overload 0 flag-sweep omit-leading-thru:*
var $enterable5 : Boolean
var $styles6 : Integer
var $icon7 : Integer
var $color8 : Integer
GET LIST ITEM PROPERTIES(1;1;$enterable5;$styles6;$icon7;$color8)
// overload 0 union-sweep itemRef=Integer
var $enterable9 : Boolean
var $styles10 : Integer
var $icon11 : Text
var $color12 : Integer
GET LIST ITEM PROPERTIES(*;"synthText";1;$enterable9;$styles10;$icon11;$color12)
// overload 0 union-sweep itemRef=pseudo:Operator
var $enterable13 : Boolean
var $styles14 : Integer
var $icon15 : Text
var $color16 : Integer
GET LIST ITEM PROPERTIES(*;"synthText";*;$enterable13;$styles14;$icon15;$color16)
// overload 0 union-sweep icon=Text
var $enterable17 : Boolean
var $styles18 : Integer
var $icon19 : Text
var $color20 : Integer
GET LIST ITEM PROPERTIES(*;"synthText";1;$enterable17;$styles18;$icon19;$color20)
// overload 0 union-sweep icon=Integer
var $enterable21 : Boolean
var $styles22 : Integer
var $icon23 : Integer
var $color24 : Integer
GET LIST ITEM PROPERTIES(*;"synthText";1;$enterable21;$styles22;$icon23;$color24)
