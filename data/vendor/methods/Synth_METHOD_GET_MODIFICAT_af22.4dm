// overload 0
var $v1 : Date
var $v2 : Time
METHOD GET MODIFICATION DATE("synthText";$v1;$v2;*)
// overload 0 flag-sweep omit-trailing-from:*
var $v3 : Date
var $v4 : Time
METHOD GET MODIFICATION DATE("synthText";$v3;$v4)
// overload 0 linked-union-sweep path=Text,modDate=Date,modTime=Time
var $v5 : Date
var $v6 : Time
METHOD GET MODIFICATION DATE("synthText";$v5;$v6;*)
// overload 0 linked-union-sweep path=Text array,modDate=Date array,modTime=Integer array
ARRAY TEXT($arr7;0)
ARRAY DATE($arr8;0)
ARRAY INTEGER($arr9;0)
METHOD GET MODIFICATION DATE($arr7;$arr8;$arr9;*)
