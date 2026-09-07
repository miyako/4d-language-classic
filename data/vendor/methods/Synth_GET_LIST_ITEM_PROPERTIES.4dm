// overload 0
var $v1 : Boolean
var $v2 : Integer
var $v3 : Text
var $v4 : Integer
GET LIST ITEM PROPERTIES(*;"synthText";1;$v1;$v2;$v3;$v4)
// overload 0 flag-sweep omit-leading-thru:*
var $v5 : Boolean
var $v6 : Integer
var $v7 : Integer
var $v8 : Integer
GET LIST ITEM PROPERTIES(1;1;$v5;$v6;$v7;$v8)
// overload 0 union-sweep itemRef=Integer
var $v9 : Boolean
var $v10 : Integer
var $v11 : Text
var $v12 : Integer
GET LIST ITEM PROPERTIES(*;"synthText";1;$v9;$v10;$v11;$v12)
// overload 0 union-sweep itemRef=pseudo:Operator
var $v13 : Boolean
var $v14 : Integer
var $v15 : Text
var $v16 : Integer
GET LIST ITEM PROPERTIES(*;"synthText";*;$v13;$v14;$v15;$v16)
// overload 0 union-sweep icon=Text
var $v17 : Boolean
var $v18 : Integer
var $v19 : Text
var $v20 : Integer
GET LIST ITEM PROPERTIES(*;"synthText";1;$v17;$v18;$v19;$v20)
// overload 0 union-sweep icon=Integer
var $v21 : Boolean
var $v22 : Integer
var $v23 : Integer
var $v24 : Integer
GET LIST ITEM PROPERTIES(*;"synthText";1;$v21;$v22;$v23;$v24)
