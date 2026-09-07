// overload 0
var $response1 : Variant
ARRAY TEXT($headerNames2;0)
ARRAY TEXT($headerValues3;0)
var $synthResult4 : Variant
$synthResult4:=HTTP Get("synthText";$response1;$headerNames2;$headerValues3;*)
// overload 0 flag-sweep omit-trailing-from:*
var $response5 : Variant
ARRAY TEXT($headerNames6;0)
ARRAY TEXT($headerValues7;0)
var $synthResult8 : Variant
$synthResult8:=HTTP Get("synthText";$response5;$headerNames6;$headerValues7)
// overload 0 union-sweep response=Text
var $response9 : Text
ARRAY TEXT($headerNames10;0)
ARRAY TEXT($headerValues11;0)
var $synthResult12 : Variant
$synthResult12:=HTTP Get("synthText";$response9;$headerNames10;$headerValues11;*)
// overload 0 union-sweep response=Blob
var $response13 : Variant
ARRAY TEXT($headerNames14;0)
ARRAY TEXT($headerValues15;0)
var $synthResult16 : Variant
$synthResult16:=HTTP Get("synthText";$response13;$headerNames14;$headerValues15;*)
// overload 0 union-sweep response=Picture
var $response17 : Picture
ARRAY TEXT($headerNames18;0)
ARRAY TEXT($headerValues19;0)
var $synthResult20 : Variant
$synthResult20:=HTTP Get("synthText";$response17;$headerNames18;$headerValues19;*)
// overload 0 union-sweep response=Object
var $response21 : Object
ARRAY TEXT($headerNames22;0)
ARRAY TEXT($headerValues23;0)
var $synthResult24 : Variant
$synthResult24:=HTTP Get("synthText";$response21;$headerNames22;$headerValues23;*)
// overload 0 union-sweep response=Collection
var $response25 : Collection
ARRAY TEXT($headerNames26;0)
ARRAY TEXT($headerValues27;0)
var $synthResult28 : Variant
$synthResult28:=HTTP Get("synthText";$response25;$headerNames26;$headerValues27;*)
