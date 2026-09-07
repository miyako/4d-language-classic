// overload 0
var $destinationPtr1 : Pointer
SET QUERY DESTINATION(1;"synthText";$destinationPtr1)
// overload 0 union-sweep destinationObject=Text
var $destinationPtr2 : Pointer
SET QUERY DESTINATION(1;"synthText";$destinationPtr2)
// overload 0 union-sweep destinationObject=Variable
var $destinationObject3 : Variant
var $destinationPtr4 : Pointer
SET QUERY DESTINATION(1;$destinationObject3;$destinationPtr4)
