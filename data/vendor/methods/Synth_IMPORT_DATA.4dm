// overload 0
var $v1 : Variant
IMPORT DATA("synthText";$v1;*)
// overload 0 flag-sweep omit-trailing-from:*
var $v2 : Variant
IMPORT DATA("synthText";$v2)
// overload 0 union-sweep project=Text
var $v3 : Text
IMPORT DATA("synthText";$v3;*)
// overload 0 union-sweep project=Blob
var $v4 : Variant
IMPORT DATA("synthText";$v4;*)
