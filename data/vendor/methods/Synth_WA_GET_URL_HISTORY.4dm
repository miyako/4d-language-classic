// overload 0
ARRAY TEXT($urlsArr1;0)
ARRAY TEXT($titlesArr2;0)
WA GET URL HISTORY(*;"synthText";$urlsArr1;1;$titlesArr2)
// overload 0 flag-sweep omit-leading-thru:*
var $object3 : Variant
ARRAY TEXT($urlsArr4;0)
ARRAY TEXT($titlesArr5;0)
WA GET URL HISTORY($object3;$urlsArr4;1;$titlesArr5)
