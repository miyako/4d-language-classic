// overload 0
var $blobToEncrypt1 : Variant
var $encryptedBLOB2 : Variant
var $synthResult3 : Variant
$synthResult3:=Encrypt data BLOB($blobToEncrypt1;New object;1;$encryptedBLOB2)
// overload 1
var $blobToEncrypt4 : Variant
var $encryptedBLOB5 : Variant
var $synthResult6 : Variant
$synthResult6:=Encrypt data BLOB($blobToEncrypt4;"synthText";1;$encryptedBLOB5)
