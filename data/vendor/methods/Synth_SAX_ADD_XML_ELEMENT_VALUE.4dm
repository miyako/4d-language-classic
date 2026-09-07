// overload 0
var $data1 : Variant
SAX ADD XML ELEMENT VALUE(?00:00:00?;$data1;*)
// overload 0 flag-sweep omit-trailing-from:*
var $data2 : Variant
SAX ADD XML ELEMENT VALUE(?00:00:00?;$data2)
// overload 0 union-sweep data=Text
SAX ADD XML ELEMENT VALUE(?00:00:00?;"synthText";*)
// overload 0 union-sweep data=Variable
var $data3 : Variant
SAX ADD XML ELEMENT VALUE(?00:00:00?;$data3;*)
// overload 0 union-sweep data=Field
SAX ADD XML ELEMENT VALUE(?00:00:00?;[SynthTable]label;*)
