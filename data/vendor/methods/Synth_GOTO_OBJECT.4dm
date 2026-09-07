// overload 0
GOTO OBJECT(*;"synthText")
// overload 1
var $v1 : Variant
GOTO OBJECT($v1)
// overload 1 union-sweep object=Variable
var $v2 : Variant
GOTO OBJECT($v2)
// overload 1 union-sweep object=Field
GOTO OBJECT([SynthTable]label)
