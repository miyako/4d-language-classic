// overload 0
var $blob1 : Variant
var $offset2 : Variant
TEXT TO BLOB("synthText";$blob1;1;$offset2)
// overload 1
var $blob3 : Variant
TEXT TO BLOB("synthText";$blob3;1;*)
// overload 1 flag-sweep omit-trailing-from:*
var $blob4 : Variant
TEXT TO BLOB("synthText";$blob4;1)
