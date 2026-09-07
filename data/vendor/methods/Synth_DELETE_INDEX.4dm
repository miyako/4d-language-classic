// overload 0
var $fieldPtr1 : Pointer
DELETE INDEX($fieldPtr1;*)
// overload 0 flag-sweep omit-trailing-from:*
var $fieldPtr2 : Pointer
DELETE INDEX($fieldPtr2)
// overload 0 union-sweep fieldPtr=Pointer
var $fieldPtr3 : Pointer
DELETE INDEX($fieldPtr3;*)
// overload 0 union-sweep fieldPtr=Text
DELETE INDEX("synthText";*)
// overload 1
var $indexName4 : Pointer
DELETE INDEX($indexName4;*)
// overload 1 flag-sweep omit-trailing-from:*
var $indexName5 : Pointer
DELETE INDEX($indexName5)
// overload 1 union-sweep indexName=Pointer
var $indexName6 : Pointer
DELETE INDEX($indexName6;*)
// overload 1 union-sweep indexName=Text
DELETE INDEX("synthText";*)
