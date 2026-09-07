// overload 0
var $v1 : Variant
ARRAY TEXT($arr2;0)
ARRAY TEXT($arr3;0)
var $synthResult4 : Variant
$synthResult4:=HTTP Get("synthText";$v1;$arr2;$arr3;*)
// overload 0 flag-sweep omit-trailing-from:*
var $v5 : Variant
ARRAY TEXT($arr6;0)
ARRAY TEXT($arr7;0)
var $synthResult8 : Variant
$synthResult8:=HTTP Get("synthText";$v5;$arr6;$arr7)
// overload 0 union-sweep response=Text
var $v9 : Text
ARRAY TEXT($arr10;0)
ARRAY TEXT($arr11;0)
var $synthResult12 : Variant
$synthResult12:=HTTP Get("synthText";$v9;$arr10;$arr11;*)
// overload 0 union-sweep response=Blob
var $v13 : Variant
ARRAY TEXT($arr14;0)
ARRAY TEXT($arr15;0)
var $synthResult16 : Variant
$synthResult16:=HTTP Get("synthText";$v13;$arr14;$arr15;*)
// overload 0 union-sweep response=Picture
var $v17 : Picture
ARRAY TEXT($arr18;0)
ARRAY TEXT($arr19;0)
var $synthResult20 : Variant
$synthResult20:=HTTP Get("synthText";$v17;$arr18;$arr19;*)
// overload 0 union-sweep response=Object
var $v21 : Object
ARRAY TEXT($arr22;0)
ARRAY TEXT($arr23;0)
var $synthResult24 : Variant
$synthResult24:=HTTP Get("synthText";$v21;$arr22;$arr23;*)
// overload 0 union-sweep response=Collection
var $v25 : Collection
ARRAY TEXT($arr26;0)
ARRAY TEXT($arr27;0)
var $synthResult28 : Variant
$synthResult28:=HTTP Get("synthText";$v25;$arr26;$arr27;*)
