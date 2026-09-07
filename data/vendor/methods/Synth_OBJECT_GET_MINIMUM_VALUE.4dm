// overload 0
var $v1 : Date
OBJECT GET MINIMUM VALUE(*;"synthText";$v1)
// overload 0 flag-sweep omit-leading-thru:asObjectName
var $v2 : Variant
var $v3 : Date
OBJECT GET MINIMUM VALUE($v2;$v3)
// overload 0 union-sweep minValue=Date
var $v4 : Date
OBJECT GET MINIMUM VALUE(*;"synthText";$v4)
// overload 0 union-sweep minValue=Time
var $v5 : Time
OBJECT GET MINIMUM VALUE(*;"synthText";$v5)
// overload 0 union-sweep minValue=Real
var $v6 : Real
OBJECT GET MINIMUM VALUE(*;"synthText";$v6)
