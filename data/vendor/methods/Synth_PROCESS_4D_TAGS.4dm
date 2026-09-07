// overload 0
var $v1 : Variant
PROCESS 4D TAGS("synthText";$v1;"synthAny")
// overload 0 union-sweep inputTemplate=Text
var $v2 : Variant
PROCESS 4D TAGS("synthText";$v2;"synthAny")
// overload 0 union-sweep inputTemplate=Blob
var $v3 : Variant
var $v4 : Variant
PROCESS 4D TAGS($v3;$v4;"synthAny")
// overload 0 union-sweep outputResult=Variable
var $v5 : Variant
PROCESS 4D TAGS("synthText";$v5;"synthAny")
// overload 0 union-sweep outputResult=Text
var $v6 : Text
PROCESS 4D TAGS("synthText";$v6;"synthAny")
// overload 0 union-sweep outputResult=Blob
var $v7 : Variant
PROCESS 4D TAGS("synthText";$v7;"synthAny")
