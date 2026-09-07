// overload 0
var $modDate1 : Date
var $modTime2 : Time
METHOD GET MODIFICATION DATE("synthText";$modDate1;$modTime2;*)
// overload 0 flag-sweep omit-trailing-from:*
var $modDate3 : Date
var $modTime4 : Time
METHOD GET MODIFICATION DATE("synthText";$modDate3;$modTime4)
// overload 0 linked-union-sweep path=Text,modDate=Date,modTime=Time
var $modDate5 : Date
var $modTime6 : Time
METHOD GET MODIFICATION DATE("synthText";$modDate5;$modTime6;*)
// overload 0 linked-union-sweep path=Text array,modDate=Date array,modTime=Integer array
ARRAY TEXT($path7;0)
ARRAY DATE($modDate8;0)
ARRAY INTEGER($modTime9;0)
METHOD GET MODIFICATION DATE($path7;$modDate8;$modTime9;*)
