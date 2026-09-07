// overload 0
var $v1 : Variant
var $v2 : Integer
var $v3 : Integer
GET HIGHLIGHT(*;$v1;$v2;$v3)
// overload 0 flag-sweep omit-leading-thru:*
var $v4 : Variant
var $v5 : Integer
var $v6 : Integer
GET HIGHLIGHT($v4;$v5;$v6)
// overload 0 union-sweep object=Variable
var $v7 : Variant
var $v8 : Integer
var $v9 : Integer
GET HIGHLIGHT(*;$v7;$v8;$v9)
// overload 0 union-sweep object=Field
var $v10 : Integer
var $v11 : Integer
GET HIGHLIGHT(*;[SynthTable]label;$v10;$v11)
// overload 0 union-sweep object=pseudo:any
var $v12 : Integer
var $v13 : Integer
GET HIGHLIGHT(*;"synthAny";$v12;$v13)
