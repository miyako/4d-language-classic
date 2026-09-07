// overload 0
var $v1 : Variant
SAX ADD XML ELEMENT VALUE(?00:00:00?;$v1;*)
// overload 0 flag-sweep omit-trailing-from:*
var $v2 : Variant
SAX ADD XML ELEMENT VALUE(?00:00:00?;$v2)
// overload 0 union-sweep data=Text
SAX ADD XML ELEMENT VALUE(?00:00:00?;"synthText";*)
// overload 0 union-sweep data=Variable
var $v3 : Variant
SAX ADD XML ELEMENT VALUE(?00:00:00?;$v3;*)
// overload 0 union-sweep data=Field
SAX ADD XML ELEMENT VALUE(?00:00:00?;[SynthTable]label;*)
