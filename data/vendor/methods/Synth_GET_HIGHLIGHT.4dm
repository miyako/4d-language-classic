// overload 0
var $object1 : Variant
var $startSel2 : Integer
var $endSel3 : Integer
GET HIGHLIGHT(*;$object1;$startSel2;$endSel3)
// overload 0 flag-sweep omit-leading-thru:*
var $object4 : Variant
var $startSel5 : Integer
var $endSel6 : Integer
GET HIGHLIGHT($object4;$startSel5;$endSel6)
// overload 0 union-sweep object=Variable
var $object7 : Variant
var $startSel8 : Integer
var $endSel9 : Integer
GET HIGHLIGHT(*;$object7;$startSel8;$endSel9)
// overload 0 union-sweep object=Field
var $startSel10 : Integer
var $endSel11 : Integer
GET HIGHLIGHT(*;[SynthTable]label;$startSel10;$endSel11)
// overload 0 union-sweep object=pseudo:any
var $startSel12 : Integer
var $endSel13 : Integer
GET HIGHLIGHT(*;"synthAny";$startSel12;$endSel13)
