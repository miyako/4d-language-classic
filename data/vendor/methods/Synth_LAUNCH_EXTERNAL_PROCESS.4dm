// overload 0
var $inputStream1 : Text
var $outputStream2 : Text
var $errorStream3 : Text
var $pid4 : Integer
LAUNCH EXTERNAL PROCESS("synthText";$inputStream1;$outputStream2;$errorStream3;$pid4)
// overload 0 union-sweep inputStream=Text
var $inputStream5 : Text
var $outputStream6 : Text
var $errorStream7 : Text
var $pid8 : Integer
LAUNCH EXTERNAL PROCESS("synthText";$inputStream5;$outputStream6;$errorStream7;$pid8)
// overload 0 union-sweep inputStream=Blob
var $inputStream9 : Variant
var $outputStream10 : Text
var $errorStream11 : Text
var $pid12 : Integer
LAUNCH EXTERNAL PROCESS("synthText";$inputStream9;$outputStream10;$errorStream11;$pid12)
// overload 0 union-sweep outputStream=Text
var $inputStream13 : Text
var $outputStream14 : Text
var $errorStream15 : Text
var $pid16 : Integer
LAUNCH EXTERNAL PROCESS("synthText";$inputStream13;$outputStream14;$errorStream15;$pid16)
// overload 0 union-sweep outputStream=Blob
var $inputStream17 : Text
var $outputStream18 : Variant
var $errorStream19 : Text
var $pid20 : Integer
LAUNCH EXTERNAL PROCESS("synthText";$inputStream17;$outputStream18;$errorStream19;$pid20)
// overload 0 union-sweep errorStream=Text
var $inputStream21 : Text
var $outputStream22 : Text
var $errorStream23 : Text
var $pid24 : Integer
LAUNCH EXTERNAL PROCESS("synthText";$inputStream21;$outputStream22;$errorStream23;$pid24)
// overload 0 union-sweep errorStream=Blob
var $inputStream25 : Text
var $outputStream26 : Text
var $errorStream27 : Variant
var $pid28 : Integer
LAUNCH EXTERNAL PROCESS("synthText";$inputStream25;$outputStream26;$errorStream27;$pid28)
