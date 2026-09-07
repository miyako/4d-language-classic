// overload 0
var $project1 : Variant
IMPORT DATA("synthText";$project1;*)
// overload 0 flag-sweep omit-trailing-from:*
var $project2 : Variant
IMPORT DATA("synthText";$project2)
// overload 0 union-sweep project=Text
var $project3 : Text
IMPORT DATA("synthText";$project3;*)
// overload 0 union-sweep project=Blob
var $project4 : Variant
IMPORT DATA("synthText";$project4;*)
