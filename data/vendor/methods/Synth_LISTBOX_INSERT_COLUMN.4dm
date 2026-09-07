// overload 0
ARRAY LONGINT($arr1;0)
var $v2 : Integer
var $v3 : Variant
LISTBOX INSERT COLUMN(*;"synthText";1;"synthText";$arr1;"synthText";$v2;"synthText";$v3)
// overload 0 flag-sweep omit-leading-thru:*
var $v4 : Variant
ARRAY LONGINT($arr5;0)
var $v6 : Integer
var $v7 : Variant
LISTBOX INSERT COLUMN($v4;1;"synthText";$arr5;"synthText";$v6;"synthText";$v7)
// overload 0 union-sweep colVariable=Array
ARRAY LONGINT($arr8;0)
var $v9 : Integer
var $v10 : Variant
LISTBOX INSERT COLUMN(*;"synthText";1;"synthText";$arr8;"synthText";$v9;"synthText";$v10)
// overload 0 union-sweep colVariable=Field
var $v11 : Integer
var $v12 : Variant
LISTBOX INSERT COLUMN(*;"synthText";1;"synthText";[SynthTable]label;"synthText";$v11;"synthText";$v12)
// overload 0 union-sweep colVariable=Variable
var $v13 : Variant
var $v14 : Integer
var $v15 : Variant
LISTBOX INSERT COLUMN(*;"synthText";1;"synthText";$v13;"synthText";$v14;"synthText";$v15)
// overload 0 union-sweep colVariable=Pointer
var $v16 : Pointer
var $v17 : Integer
var $v18 : Variant
LISTBOX INSERT COLUMN(*;"synthText";1;"synthText";$v16;"synthText";$v17;"synthText";$v18)
// overload 0 union-sweep headerVar=Integer
ARRAY LONGINT($arr19;0)
var $v20 : Integer
var $v21 : Variant
LISTBOX INSERT COLUMN(*;"synthText";1;"synthText";$arr19;"synthText";$v20;"synthText";$v21)
// overload 0 union-sweep headerVar=Pointer
ARRAY LONGINT($arr22;0)
var $v23 : Pointer
var $v24 : Variant
LISTBOX INSERT COLUMN(*;"synthText";1;"synthText";$arr22;"synthText";$v23;"synthText";$v24)
// overload 0 union-sweep footerVar=Variable
ARRAY LONGINT($arr25;0)
var $v26 : Integer
var $v27 : Variant
LISTBOX INSERT COLUMN(*;"synthText";1;"synthText";$arr25;"synthText";$v26;"synthText";$v27)
// overload 0 union-sweep footerVar=Pointer
ARRAY LONGINT($arr28;0)
var $v29 : Integer
var $v30 : Pointer
LISTBOX INSERT COLUMN(*;"synthText";1;"synthText";$arr28;"synthText";$v29;"synthText";$v30)
