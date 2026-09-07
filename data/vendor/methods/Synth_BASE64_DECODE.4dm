// overload 0
var $toDecode1 : Variant
var $decoded2 : Variant
BASE64 DECODE($toDecode1;$decoded2;*)
// overload 0 flag-sweep omit-trailing-from:*
var $toDecode3 : Variant
var $decoded4 : Variant
BASE64 DECODE($toDecode3;$decoded4)
// overload 0 union-sweep toDecode=Text
var $toDecode5 : Text
var $decoded6 : Variant
BASE64 DECODE($toDecode5;$decoded6;*)
// overload 0 union-sweep toDecode=Blob
var $toDecode7 : Variant
var $decoded8 : Variant
BASE64 DECODE($toDecode7;$decoded8;*)
// overload 0 union-sweep decoded=Text
var $toDecode9 : Variant
var $decoded10 : Text
BASE64 DECODE($toDecode9;$decoded10;*)
// overload 0 union-sweep decoded=Blob
var $toDecode11 : Variant
var $decoded12 : Variant
BASE64 DECODE($toDecode11;$decoded12;*)
