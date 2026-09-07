// overload 0
var $v1 : Integer
var $v2 : Text
var $v3 : Integer
var $v4 : Boolean
GET LIST ITEM(*;"synthText";1;$v1;$v2;$v3;$v4)
// overload 0 flag-sweep omit-leading-thru:*
var $v5 : Integer
var $v6 : Text
var $v7 : Integer
var $v8 : Boolean
GET LIST ITEM(1;1;$v5;$v6;$v7;$v8)
// overload 0 union-sweep itemPos=Integer
var $v9 : Integer
var $v10 : Text
var $v11 : Integer
var $v12 : Boolean
GET LIST ITEM(*;"synthText";1;$v9;$v10;$v11;$v12)
// overload 0 union-sweep itemPos=pseudo:Operator
var $v13 : Integer
var $v14 : Text
var $v15 : Integer
var $v16 : Boolean
GET LIST ITEM(*;"synthText";*;$v13;$v14;$v15;$v16)
