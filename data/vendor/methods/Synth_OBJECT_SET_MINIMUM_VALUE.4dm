// overload 0
OBJECT SET MINIMUM VALUE(*;"synthText";!2024-01-01!)
// overload 0 flag-sweep omit-leading-thru:asObjectName
var $v1 : Variant
OBJECT SET MINIMUM VALUE($v1;!2024-01-01!)
// overload 0 union-sweep minValue=Date
OBJECT SET MINIMUM VALUE(*;"synthText";!2024-01-01!)
// overload 0 union-sweep minValue=Time
OBJECT SET MINIMUM VALUE(*;"synthText";?00:00:00?)
// overload 0 union-sweep minValue=Real
OBJECT SET MINIMUM VALUE(*;"synthText";1)
