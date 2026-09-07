// overload 0
GOTO OBJECT(*;"synthText")
// overload 1
var $object1 : Variant
GOTO OBJECT($object1)
// overload 1 union-sweep object=Variable
var $object2 : Variant
GOTO OBJECT($object2)
// overload 1 union-sweep object=Field
GOTO OBJECT([SynthTable]label)
