// overload 0
LISTBOX SET ROW COLOR(*;"synthText";1;"synthText";1)
// overload 0 flag-sweep omit-leading-thru:*
var $v1 : Variant
LISTBOX SET ROW COLOR($v1;1;1;1)
// overload 0 union-sweep color=Text
LISTBOX SET ROW COLOR(*;"synthText";1;"synthText";1)
// overload 0 union-sweep color=Integer
LISTBOX SET ROW COLOR(*;"synthText";1;1;1)
