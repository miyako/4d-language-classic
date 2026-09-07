// overload 0
var $maxValue1 : Date
OBJECT GET MAXIMUM VALUE(*;"synthText";$maxValue1)
// overload 0 flag-sweep omit-leading-thru:asObjectName
var $object2 : Variant
var $maxValue3 : Date
OBJECT GET MAXIMUM VALUE($object2;$maxValue3)
// overload 0 union-sweep maxValue=Date
var $maxValue4 : Date
OBJECT GET MAXIMUM VALUE(*;"synthText";$maxValue4)
// overload 0 union-sweep maxValue=Time
var $maxValue5 : Time
OBJECT GET MAXIMUM VALUE(*;"synthText";$maxValue5)
// overload 0 union-sweep maxValue=Real
var $maxValue6 : Real
OBJECT GET MAXIMUM VALUE(*;"synthText";$maxValue6)
