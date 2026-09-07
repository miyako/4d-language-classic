// overload 0
var $v1 : Date
OBJECT GET MAXIMUM VALUE(*;"synthText";$v1)
// overload 0 flag-sweep omit-leading-thru:asObjectName
var $v2 : Variant
var $v3 : Date
OBJECT GET MAXIMUM VALUE($v2;$v3)
// overload 0 union-sweep maxValue=Date
var $v4 : Date
OBJECT GET MAXIMUM VALUE(*;"synthText";$v4)
// overload 0 union-sweep maxValue=Time
var $v5 : Time
OBJECT GET MAXIMUM VALUE(*;"synthText";$v5)
// overload 0 union-sweep maxValue=Real
var $v6 : Real
OBJECT GET MAXIMUM VALUE(*;"synthText";$v6)
