// overload 0
OBJECT SET MAXIMUM VALUE(*;"synthText";!2024-01-01!)
// overload 0 flag-sweep omit-leading-thru:asObjectName
var $object1 : Variant
OBJECT SET MAXIMUM VALUE($object1;!2024-01-01!)
// overload 0 union-sweep maxValue=Date
OBJECT SET MAXIMUM VALUE(*;"synthText";!2024-01-01!)
// overload 0 union-sweep maxValue=Time
OBJECT SET MAXIMUM VALUE(*;"synthText";?00:00:00?)
// overload 0 union-sweep maxValue=Real
OBJECT SET MAXIMUM VALUE(*;"synthText";1)
