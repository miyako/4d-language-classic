// overload 0
var $itemRef1 : Integer
var $itemText2 : Text
var $sublist3 : Integer
var $expanded4 : Boolean
GET LIST ITEM(*;"synthText";1;$itemRef1;$itemText2;$sublist3;$expanded4)
// overload 0 flag-sweep omit-leading-thru:*
var $itemRef5 : Integer
var $itemText6 : Text
var $sublist7 : Integer
var $expanded8 : Boolean
GET LIST ITEM(1;1;$itemRef5;$itemText6;$sublist7;$expanded8)
// overload 0 union-sweep itemPos=Integer
var $itemRef9 : Integer
var $itemText10 : Text
var $sublist11 : Integer
var $expanded12 : Boolean
GET LIST ITEM(*;"synthText";1;$itemRef9;$itemText10;$sublist11;$expanded12)
// overload 0 union-sweep itemPos=pseudo:Operator
var $itemRef13 : Integer
var $itemText14 : Text
var $sublist15 : Integer
var $expanded16 : Boolean
GET LIST ITEM(*;"synthText";*;$itemRef13;$itemText14;$sublist15;$expanded16)
