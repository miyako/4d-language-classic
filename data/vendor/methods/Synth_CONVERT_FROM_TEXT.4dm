// overload 0
var $convertedBLOB1 : Variant
CONVERT FROM TEXT("synthText";"synthText";$convertedBLOB1)
// overload 0 union-sweep charSet=Text
var $convertedBLOB2 : Variant
CONVERT FROM TEXT("synthText";"synthText";$convertedBLOB2)
// overload 0 union-sweep charSet=Integer
var $convertedBLOB3 : Variant
CONVERT FROM TEXT("synthText";1;$convertedBLOB3)
