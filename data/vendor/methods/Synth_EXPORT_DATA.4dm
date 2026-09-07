// overload 0
var $project1 : Variant
EXPORT DATA("synthText";$project1;*)
// overload 0 flag-sweep omit-trailing-from:*
var $project2 : Variant
EXPORT DATA("synthText";$project2)
// overload 0 union-sweep project=Text
var $project3 : Text
EXPORT DATA("synthText";$project3;*)
// overload 0 union-sweep project=Blob
var $project4 : Variant
EXPORT DATA("synthText";$project4;*)
