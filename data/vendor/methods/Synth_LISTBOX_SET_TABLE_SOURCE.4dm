// overload 0
LISTBOX SET TABLE SOURCE(*;"synthText";1;"synthText")
// overload 0 flag-sweep omit-leading-thru:*
var $object1 : Variant
LISTBOX SET TABLE SOURCE($object1;1;"synthText")
// overload 1
LISTBOX SET TABLE SOURCE(*;"synthText";"synthText";"synthText")
// overload 1 flag-sweep omit-leading-thru:*
var $object2 : Variant
LISTBOX SET TABLE SOURCE($object2;"synthText";"synthText")
