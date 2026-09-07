// overload 0
var $fileToZip1 : Variant
var $destinationFile2 : Variant
var $synthResult3 : Variant
$synthResult3:=ZIP Create archive($fileToZip1;$destinationFile2)
// overload 1
var $folderToZip4 : Variant
var $destinationFile5 : Variant
var $synthResult6 : Variant
$synthResult6:=ZIP Create archive($folderToZip4;$destinationFile5;1)
// overload 2
var $destinationFile7 : Variant
var $synthResult8 : Variant
$synthResult8:=ZIP Create archive(New object;$destinationFile7)
