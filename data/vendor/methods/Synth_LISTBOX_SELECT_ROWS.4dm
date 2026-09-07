// overload 0
LISTBOX SELECT ROWS(*;"synthText";New object;1)
// overload 0 flag-sweep omit-leading-thru:*
var $object1 : Variant
LISTBOX SELECT ROWS($object1;New object;1)
// overload 0 union-sweep selection=Object
LISTBOX SELECT ROWS(*;"synthText";New object;1)
// overload 0 union-sweep selection=Collection
LISTBOX SELECT ROWS(*;"synthText";New collection;1)
