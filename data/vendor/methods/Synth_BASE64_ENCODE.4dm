// overload 0
var $toEncode1 : Variant
var $encoded2 : Variant
BASE64 ENCODE($toEncode1;$encoded2;*)
// overload 0 flag-sweep omit-trailing-from:*
var $toEncode3 : Variant
var $encoded4 : Variant
BASE64 ENCODE($toEncode3;$encoded4)
// overload 0 union-sweep toEncode=Blob
var $toEncode5 : Variant
var $encoded6 : Variant
BASE64 ENCODE($toEncode5;$encoded6;*)
// overload 0 union-sweep toEncode=Text
var $toEncode7 : Text
var $encoded8 : Variant
BASE64 ENCODE($toEncode7;$encoded8;*)
// overload 0 union-sweep encoded=Blob
var $toEncode9 : Variant
var $encoded10 : Variant
BASE64 ENCODE($toEncode9;$encoded10;*)
// overload 0 union-sweep encoded=Text
var $toEncode11 : Variant
var $encoded12 : Text
BASE64 ENCODE($toEncode11;$encoded12;*)
