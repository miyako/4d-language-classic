// overload 0
var $info1 : Integer
LISTBOX GET PRINT INFORMATION(*;"synthText";1;$info1)
// overload 0 union-sweep info=Integer
var $info2 : Integer
LISTBOX GET PRINT INFORMATION(*;"synthText";1;$info2)
// overload 0 union-sweep info=Boolean
var $info3 : Boolean
LISTBOX GET PRINT INFORMATION(*;"synthText";1;$info3)
// overload 1
var $object4 : Variant
var $info5 : Integer
LISTBOX GET PRINT INFORMATION($object4;1;$info5)
// overload 1 union-sweep info=Integer
var $object6 : Variant
var $info7 : Integer
LISTBOX GET PRINT INFORMATION($object6;1;$info7)
// overload 1 union-sweep info=Boolean
var $object8 : Variant
var $info9 : Boolean
LISTBOX GET PRINT INFORMATION($object8;1;$info9)
