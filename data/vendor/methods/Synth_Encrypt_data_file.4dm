// overload 0
var $synthResult1 : Variant
$synthResult1:=Encrypt data file("synthText";"synthText";"synthText";"synthText";"synthText";"synthText")
// overload 0 union-sweep archiveFolder=Text
var $synthResult2 : Variant
$synthResult2:=Encrypt data file("synthText";"synthText";"synthText";"synthText";"synthText";"synthText")
// overload 0 union-sweep archiveFolder=4D.Folder
var $v3 : Variant
var $synthResult4 : Variant
$synthResult4:=Encrypt data file("synthText";"synthText";"synthText";$v3;"synthText";"synthText")
// overload 1
var $synthResult5 : Variant
$synthResult5:=Encrypt data file("synthText";"synthText";New object;"synthText";New object;"synthText")
// overload 1 union-sweep archiveFolder=Text
var $synthResult6 : Variant
$synthResult6:=Encrypt data file("synthText";"synthText";New object;"synthText";New object;"synthText")
// overload 1 union-sweep archiveFolder=4D.Folder
var $v7 : Variant
var $synthResult8 : Variant
$synthResult8:=Encrypt data file("synthText";"synthText";New object;$v7;New object;"synthText")
// overload 2
var $synthResult9 : Variant
$synthResult9:=Encrypt data file("synthText";"synthText";"synthText";"synthText";New object;"synthText")
// overload 2 union-sweep archiveFolder=Text
var $synthResult10 : Variant
$synthResult10:=Encrypt data file("synthText";"synthText";"synthText";"synthText";New object;"synthText")
// overload 2 union-sweep archiveFolder=4D.Folder
var $v11 : Variant
var $synthResult12 : Variant
$synthResult12:=Encrypt data file("synthText";"synthText";"synthText";$v11;New object;"synthText")
