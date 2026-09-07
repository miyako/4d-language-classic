// overload 0
var $outputResult1 : Variant
PROCESS 4D TAGS("synthText";$outputResult1;"synthAny")
// overload 0 union-sweep inputTemplate=Text
var $outputResult2 : Variant
PROCESS 4D TAGS("synthText";$outputResult2;"synthAny")
// overload 0 union-sweep inputTemplate=Blob
var $inputTemplate3 : Variant
var $outputResult4 : Variant
PROCESS 4D TAGS($inputTemplate3;$outputResult4;"synthAny")
// overload 0 union-sweep outputResult=Variable
var $outputResult5 : Variant
PROCESS 4D TAGS("synthText";$outputResult5;"synthAny")
// overload 0 union-sweep outputResult=Text
var $outputResult6 : Text
PROCESS 4D TAGS("synthText";$outputResult6;"synthAny")
// overload 0 union-sweep outputResult=Blob
var $outputResult7 : Variant
PROCESS 4D TAGS("synthText";$outputResult7;"synthAny")
