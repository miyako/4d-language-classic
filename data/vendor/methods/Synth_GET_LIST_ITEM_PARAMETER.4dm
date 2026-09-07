// overload 0
var $value1 : Variant
GET LIST ITEM PARAMETER(*;"synthText";1;"synthText";$value1)
// overload 0 flag-sweep omit-leading-thru:*
var $value2 : Variant
GET LIST ITEM PARAMETER(1;1;"synthText";$value2)
// overload 0 union-sweep itemRef=Integer
var $value3 : Variant
GET LIST ITEM PARAMETER(*;"synthText";1;"synthText";$value3)
// overload 0 union-sweep itemRef=pseudo:Operator
var $value4 : Variant
GET LIST ITEM PARAMETER(*;"synthText";*;"synthText";$value4)
