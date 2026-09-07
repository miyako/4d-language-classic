// overload 0
var $v1 : Pointer
DELETE INDEX($v1;*)
// overload 0 flag-sweep omit-trailing-from:*
var $v2 : Pointer
DELETE INDEX($v2)
// overload 0 union-sweep fieldPtr=Pointer
var $v3 : Pointer
DELETE INDEX($v3;*)
// overload 0 union-sweep fieldPtr=Text
DELETE INDEX("synthText";*)
// overload 1
var $v4 : Pointer
DELETE INDEX($v4;*)
// overload 1 flag-sweep omit-trailing-from:*
var $v5 : Pointer
DELETE INDEX($v5)
// overload 1 union-sweep indexName=Pointer
var $v6 : Pointer
DELETE INDEX($v6;*)
// overload 1 union-sweep indexName=Text
DELETE INDEX("synthText";*)
