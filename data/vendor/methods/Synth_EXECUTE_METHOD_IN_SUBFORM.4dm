// overload 0
var $return1 : Variant
EXECUTE METHOD IN SUBFORM("synthText";New object;$return1;"synthAny")
// overload 0 union-sweep formula=Object
var $return2 : Variant
EXECUTE METHOD IN SUBFORM("synthText";New object;$return2;"synthAny")
// overload 0 union-sweep formula=Text
var $return3 : Variant
EXECUTE METHOD IN SUBFORM("synthText";"synthText";$return3;"synthAny")
// overload 1
EXECUTE METHOD IN SUBFORM("synthText";New object;*;"synthAny")
// overload 1 flag-sweep omit-trailing-from:*
EXECUTE METHOD IN SUBFORM("synthText";New object)
// overload 1 union-sweep formula=Object
EXECUTE METHOD IN SUBFORM("synthText";New object;*;"synthAny")
// overload 1 union-sweep formula=Text
EXECUTE METHOD IN SUBFORM("synthText";"synthText";*;"synthAny")
