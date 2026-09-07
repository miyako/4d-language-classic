// overload 0
var $v1 : Variant
var $v2 : Variant
BASE64 DECODE($v1;$v2;*)
// overload 0 flag-sweep omit-trailing-from:*
var $v3 : Variant
var $v4 : Variant
BASE64 DECODE($v3;$v4)
// overload 0 union-sweep toDecode=Text
var $v5 : Text
var $v6 : Variant
BASE64 DECODE($v5;$v6;*)
// overload 0 union-sweep toDecode=Blob
var $v7 : Variant
var $v8 : Variant
BASE64 DECODE($v7;$v8;*)
// overload 0 union-sweep decoded=Text
var $v9 : Variant
var $v10 : Text
BASE64 DECODE($v9;$v10;*)
// overload 0 union-sweep decoded=Blob
var $v11 : Variant
var $v12 : Variant
BASE64 DECODE($v11;$v12;*)
