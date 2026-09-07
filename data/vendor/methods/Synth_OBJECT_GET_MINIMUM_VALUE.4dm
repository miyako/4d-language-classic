// overload 0
var $minValue1 : Date
OBJECT GET MINIMUM VALUE(*;"synthText";$minValue1)
// overload 0 flag-sweep omit-leading-thru:asObjectName
var $object2 : Variant
var $minValue3 : Date
OBJECT GET MINIMUM VALUE($object2;$minValue3)
// overload 0 union-sweep minValue=Date
var $minValue4 : Date
OBJECT GET MINIMUM VALUE(*;"synthText";$minValue4)
// overload 0 union-sweep minValue=Time
var $minValue5 : Time
OBJECT GET MINIMUM VALUE(*;"synthText";$minValue5)
// overload 0 union-sweep minValue=Real
var $minValue6 : Real
OBJECT GET MINIMUM VALUE(*;"synthText";$minValue6)
