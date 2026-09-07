// overload 0
var $v1 : Variant
GET LIST ITEM PARAMETER(*;"synthText";1;"synthText";$v1)
// overload 0 flag-sweep omit-leading-thru:*
var $v2 : Variant
GET LIST ITEM PARAMETER(1;1;"synthText";$v2)
// overload 0 union-sweep itemRef=Integer
var $v3 : Variant
GET LIST ITEM PARAMETER(*;"synthText";1;"synthText";$v3)
// overload 0 union-sweep itemRef=pseudo:Operator
var $v4 : Variant
GET LIST ITEM PARAMETER(*;"synthText";*;"synthText";$v4)
