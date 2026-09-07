// overload 0
LISTBOX SET GRID COLOR(*;"synthText";"synthText";True;True)
// overload 0 flag-sweep omit-leading-thru:*
var $v1 : Variant
LISTBOX SET GRID COLOR($v1;1;True;True)
// overload 0 union-sweep color=Text
LISTBOX SET GRID COLOR(*;"synthText";"synthText";True;True)
// overload 0 union-sweep color=Integer
LISTBOX SET GRID COLOR(*;"synthText";1;True;True)
