// overload 0
var $v1 : Variant
var $v2 : Variant
TEXT TO BLOB("synthText";$v1;1;$v2)
// overload 1
var $v3 : Variant
TEXT TO BLOB("synthText";$v3;1;*)
// overload 1 flag-sweep omit-trailing-from:*
var $v4 : Variant
TEXT TO BLOB("synthText";$v4;1)
