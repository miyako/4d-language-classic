// overload 0
var $contents1 : Variant
var $response2 : Variant
ARRAY TEXT($headerNames3;0)
ARRAY TEXT($headerValues4;0)
var $synthResult5 : Variant
$synthResult5:=HTTP Request("synthText";"synthText";$contents1;$response2;$headerNames3;$headerValues4;*)
// overload 0 flag-sweep omit-trailing-from:*
var $contents6 : Variant
var $response7 : Variant
ARRAY TEXT($headerNames8;0)
ARRAY TEXT($headerValues9;0)
var $synthResult10 : Variant
$synthResult10:=HTTP Request("synthText";"synthText";$contents6;$response7;$headerNames8;$headerValues9)
// overload 0 union-sweep contents=Text
var $response11 : Variant
ARRAY TEXT($headerNames12;0)
ARRAY TEXT($headerValues13;0)
var $synthResult14 : Variant
$synthResult14:=HTTP Request("synthText";"synthText";"synthText";$response11;$headerNames12;$headerValues13;*)
// overload 0 union-sweep contents=Blob
var $contents15 : Variant
var $response16 : Variant
ARRAY TEXT($headerNames17;0)
ARRAY TEXT($headerValues18;0)
var $synthResult19 : Variant
$synthResult19:=HTTP Request("synthText";"synthText";$contents15;$response16;$headerNames17;$headerValues18;*)
// overload 0 union-sweep contents=Picture
var $contents20 : Picture
var $response21 : Variant
ARRAY TEXT($headerNames22;0)
ARRAY TEXT($headerValues23;0)
var $synthResult24 : Variant
$synthResult24:=HTTP Request("synthText";"synthText";$contents20;$response21;$headerNames22;$headerValues23;*)
// overload 0 union-sweep contents=Object
var $response25 : Variant
ARRAY TEXT($headerNames26;0)
ARRAY TEXT($headerValues27;0)
var $synthResult28 : Variant
$synthResult28:=HTTP Request("synthText";"synthText";New object;$response25;$headerNames26;$headerValues27;*)
// overload 0 union-sweep contents=Collection
var $response29 : Variant
ARRAY TEXT($headerNames30;0)
ARRAY TEXT($headerValues31;0)
var $synthResult32 : Variant
$synthResult32:=HTTP Request("synthText";"synthText";New collection;$response29;$headerNames30;$headerValues31;*)
// overload 0 union-sweep response=Text
var $contents33 : Variant
var $response34 : Text
ARRAY TEXT($headerNames35;0)
ARRAY TEXT($headerValues36;0)
var $synthResult37 : Variant
$synthResult37:=HTTP Request("synthText";"synthText";$contents33;$response34;$headerNames35;$headerValues36;*)
// overload 0 union-sweep response=Blob
var $contents38 : Variant
var $response39 : Variant
ARRAY TEXT($headerNames40;0)
ARRAY TEXT($headerValues41;0)
var $synthResult42 : Variant
$synthResult42:=HTTP Request("synthText";"synthText";$contents38;$response39;$headerNames40;$headerValues41;*)
// overload 0 union-sweep response=Picture
var $contents43 : Variant
var $response44 : Picture
ARRAY TEXT($headerNames45;0)
ARRAY TEXT($headerValues46;0)
var $synthResult47 : Variant
$synthResult47:=HTTP Request("synthText";"synthText";$contents43;$response44;$headerNames45;$headerValues46;*)
// overload 0 union-sweep response=Object
var $contents48 : Variant
var $response49 : Object
ARRAY TEXT($headerNames50;0)
ARRAY TEXT($headerValues51;0)
var $synthResult52 : Variant
$synthResult52:=HTTP Request("synthText";"synthText";$contents48;$response49;$headerNames50;$headerValues51;*)
// overload 0 union-sweep response=Collection
var $contents53 : Variant
var $response54 : Collection
ARRAY TEXT($headerNames55;0)
ARRAY TEXT($headerValues56;0)
var $synthResult57 : Variant
$synthResult57:=HTTP Request("synthText";"synthText";$contents53;$response54;$headerNames55;$headerValues56;*)
