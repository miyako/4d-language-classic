// overload 0
var $icon1 : Picture
GET LIST ITEM ICON(*;"synthText";1;$icon1)
// overload 0 flag-sweep omit-leading-thru:*
var $icon2 : Picture
GET LIST ITEM ICON(1;1;$icon2)
// overload 0 union-sweep itemRef=pseudo:Operator
var $icon3 : Picture
GET LIST ITEM ICON(*;"synthText";*;$icon3)
// overload 0 union-sweep itemRef=Integer
var $icon4 : Picture
GET LIST ITEM ICON(*;"synthText";1;$icon4)
