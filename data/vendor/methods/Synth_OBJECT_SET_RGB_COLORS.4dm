// overload 0
OBJECT SET RGB COLORS(*;"synthText";"synthText";"synthText";"synthText")
// overload 0 flag-sweep omit-leading-thru:asObjectName
var $v1 : Variant
OBJECT SET RGB COLORS($v1;1;1;1)
// overload 0 union-sweep foregroundColor=Text
OBJECT SET RGB COLORS(*;"synthText";"synthText";"synthText";"synthText")
// overload 0 union-sweep foregroundColor=Integer
OBJECT SET RGB COLORS(*;"synthText";1;"synthText";"synthText")
// overload 0 union-sweep backgroundColor=Text
OBJECT SET RGB COLORS(*;"synthText";"synthText";"synthText";"synthText")
// overload 0 union-sweep backgroundColor=Integer
OBJECT SET RGB COLORS(*;"synthText";"synthText";1;"synthText")
// overload 0 union-sweep altBackgrndColor=Text
OBJECT SET RGB COLORS(*;"synthText";"synthText";"synthText";"synthText")
// overload 0 union-sweep altBackgrndColor=Integer
OBJECT SET RGB COLORS(*;"synthText";"synthText";"synthText";1)
