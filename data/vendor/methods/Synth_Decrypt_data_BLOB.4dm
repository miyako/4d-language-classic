// overload 0
var $blobToDecrypt1 : Variant
var $decryptedBLOB2 : Variant
var $synthResult3 : Variant
$synthResult3:=Decrypt data BLOB($blobToDecrypt1;New object;1;$decryptedBLOB2)
// overload 1
var $blobToDecrypt4 : Variant
var $decryptedBLOB5 : Variant
var $synthResult6 : Variant
$synthResult6:=Decrypt data BLOB($blobToDecrypt4;"synthText";1;$decryptedBLOB5)
