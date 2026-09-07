// overload 0
var $v1 : Variant
var $v2 : Variant
BASE64 ENCODE($v1;$v2;*)
// overload 0 flag-sweep omit-trailing-from:*
var $v3 : Variant
var $v4 : Variant
BASE64 ENCODE($v3;$v4)
// overload 0 union-sweep toEncode=Blob
var $v5 : Variant
var $v6 : Variant
BASE64 ENCODE($v5;$v6;*)
// overload 0 union-sweep toEncode=Text
var $v7 : Text
var $v8 : Variant
BASE64 ENCODE($v7;$v8;*)
// overload 0 union-sweep encoded=Blob
var $v9 : Variant
var $v10 : Variant
BASE64 ENCODE($v9;$v10;*)
// overload 0 union-sweep encoded=Text
var $v11 : Variant
var $v12 : Text
BASE64 ENCODE($v11;$v12;*)
