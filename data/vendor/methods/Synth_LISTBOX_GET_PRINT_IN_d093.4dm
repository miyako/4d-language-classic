// overload 0
var $v1 : Integer
LISTBOX GET PRINT INFORMATION(*;"synthText";1;$v1)
// overload 0 union-sweep info=Integer
var $v2 : Integer
LISTBOX GET PRINT INFORMATION(*;"synthText";1;$v2)
// overload 0 union-sweep info=Boolean
var $v3 : Boolean
LISTBOX GET PRINT INFORMATION(*;"synthText";1;$v3)
// overload 1
var $v4 : Variant
var $v5 : Integer
LISTBOX GET PRINT INFORMATION($v4;1;$v5)
// overload 1 union-sweep info=Integer
var $v6 : Variant
var $v7 : Integer
LISTBOX GET PRINT INFORMATION($v6;1;$v7)
// overload 1 union-sweep info=Boolean
var $v8 : Variant
var $v9 : Boolean
LISTBOX GET PRINT INFORMATION($v8;1;$v9)
