// overload 0
ST FREEZE EXPRESSIONS(*;"synthText";1;1;*)
// overload 0 flag-sweep omit-leading-thru:asObjectName
var $object1 : Variant
ST FREEZE EXPRESSIONS($object1;1;1;*)
// overload 0 flag-sweep omit-trailing-from:updateBeforeFreezing
ST FREEZE EXPRESSIONS(*;"synthText";1;1)
