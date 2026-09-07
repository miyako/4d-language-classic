// overload 0
var $v1 : Variant
var $v2 : Variant
ARRAY TEXT($arr3;0)
ARRAY TEXT($arr4;0)
var $synthResult5 : Variant
$synthResult5:=HTTP Request("synthText";"synthText";$v1;$v2;$arr3;$arr4;*)
// overload 0 flag-sweep omit-trailing-from:*
var $v6 : Variant
var $v7 : Variant
ARRAY TEXT($arr8;0)
ARRAY TEXT($arr9;0)
var $synthResult10 : Variant
$synthResult10:=HTTP Request("synthText";"synthText";$v6;$v7;$arr8;$arr9)
// overload 0 union-sweep contents=Text
var $v11 : Variant
ARRAY TEXT($arr12;0)
ARRAY TEXT($arr13;0)
var $synthResult14 : Variant
$synthResult14:=HTTP Request("synthText";"synthText";"synthText";$v11;$arr12;$arr13;*)
// overload 0 union-sweep contents=Blob
var $v15 : Variant
var $v16 : Variant
ARRAY TEXT($arr17;0)
ARRAY TEXT($arr18;0)
var $synthResult19 : Variant
$synthResult19:=HTTP Request("synthText";"synthText";$v15;$v16;$arr17;$arr18;*)
// overload 0 union-sweep contents=Picture
var $v20 : Picture
var $v21 : Variant
ARRAY TEXT($arr22;0)
ARRAY TEXT($arr23;0)
var $synthResult24 : Variant
$synthResult24:=HTTP Request("synthText";"synthText";$v20;$v21;$arr22;$arr23;*)
// overload 0 union-sweep contents=Object
var $v25 : Variant
ARRAY TEXT($arr26;0)
ARRAY TEXT($arr27;0)
var $synthResult28 : Variant
$synthResult28:=HTTP Request("synthText";"synthText";New object;$v25;$arr26;$arr27;*)
// overload 0 union-sweep contents=Collection
var $v29 : Variant
ARRAY TEXT($arr30;0)
ARRAY TEXT($arr31;0)
var $synthResult32 : Variant
$synthResult32:=HTTP Request("synthText";"synthText";New collection;$v29;$arr30;$arr31;*)
// overload 0 union-sweep response=Text
var $v33 : Variant
var $v34 : Text
ARRAY TEXT($arr35;0)
ARRAY TEXT($arr36;0)
var $synthResult37 : Variant
$synthResult37:=HTTP Request("synthText";"synthText";$v33;$v34;$arr35;$arr36;*)
// overload 0 union-sweep response=Blob
var $v38 : Variant
var $v39 : Variant
ARRAY TEXT($arr40;0)
ARRAY TEXT($arr41;0)
var $synthResult42 : Variant
$synthResult42:=HTTP Request("synthText";"synthText";$v38;$v39;$arr40;$arr41;*)
// overload 0 union-sweep response=Picture
var $v43 : Variant
var $v44 : Picture
ARRAY TEXT($arr45;0)
ARRAY TEXT($arr46;0)
var $synthResult47 : Variant
$synthResult47:=HTTP Request("synthText";"synthText";$v43;$v44;$arr45;$arr46;*)
// overload 0 union-sweep response=Object
var $v48 : Variant
var $v49 : Object
ARRAY TEXT($arr50;0)
ARRAY TEXT($arr51;0)
var $synthResult52 : Variant
$synthResult52:=HTTP Request("synthText";"synthText";$v48;$v49;$arr50;$arr51;*)
// overload 0 union-sweep response=Collection
var $v53 : Variant
var $v54 : Collection
ARRAY TEXT($arr55;0)
ARRAY TEXT($arr56;0)
var $synthResult57 : Variant
$synthResult57:=HTTP Request("synthText";"synthText";$v53;$v54;$arr55;$arr56;*)
