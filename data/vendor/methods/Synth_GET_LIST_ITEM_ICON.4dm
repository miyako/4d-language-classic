// overload 0
var $v1 : Picture
GET LIST ITEM ICON(*;"synthText";1;$v1)
// overload 0 flag-sweep omit-leading-thru:*
var $v2 : Picture
GET LIST ITEM ICON(1;1;$v2)
// overload 0 union-sweep itemRef=pseudo:Operator
var $v3 : Picture
GET LIST ITEM ICON(*;"synthText";*;$v3)
// overload 0 union-sweep itemRef=Integer
var $v4 : Picture
GET LIST ITEM ICON(*;"synthText";1;$v4)
