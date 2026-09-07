// overload 0
var $blob1 : Variant
var $offset2 : Variant
LONGINT TO BLOB(1;$blob1;1;$offset2)
// overload 1
var $blob3 : Variant
LONGINT TO BLOB(1;$blob3;1;*)
// overload 1 flag-sweep omit-trailing-from:*
var $blob4 : Variant
LONGINT TO BLOB(1;$blob4;1)
