// overload 0
var $v1 : Picture
SET LIST ITEM ICON(*;"synthText";1;$v1)
// overload 0 flag-sweep omit-leading-thru:asObjectName
var $v2 : Picture
SET LIST ITEM ICON(1;1;$v2)
// overload 0 union-sweep itemRef=Integer
var $v3 : Picture
SET LIST ITEM ICON(*;"synthText";1;$v3)
// overload 0 union-sweep itemRef=pseudo:Operator
var $v4 : Picture
SET LIST ITEM ICON(*;"synthText";*;$v4)
// overload 0 union-sweep icon=Picture
var $v5 : Picture
SET LIST ITEM ICON(*;"synthText";1;$v5)
// overload 0 union-sweep icon=Pointer
var $v6 : Pointer
SET LIST ITEM ICON(*;"synthText";1;$v6)
