// overload 0
var $icon1 : Picture
SET LIST ITEM ICON(*;"synthText";1;$icon1)
// overload 0 flag-sweep omit-leading-thru:asObjectName
var $icon2 : Picture
SET LIST ITEM ICON(1;1;$icon2)
// overload 0 union-sweep itemRef=Integer
var $icon3 : Picture
SET LIST ITEM ICON(*;"synthText";1;$icon3)
// overload 0 union-sweep itemRef=pseudo:Operator
var $icon4 : Picture
SET LIST ITEM ICON(*;"synthText";*;$icon4)
// overload 0 union-sweep icon=Picture
var $icon5 : Picture
SET LIST ITEM ICON(*;"synthText";1;$icon5)
// overload 0 union-sweep icon=Pointer
var $icon6 : Pointer
SET LIST ITEM ICON(*;"synthText";1;$icon6)
