// overload 0
var $picture1 : Picture
var $synthResult2 : Variant
$synthResult2:=WP Insert picture(New object;$picture1;1;1)
// overload 1
var $pictureFile3 : Variant
var $synthResult4 : Variant
$synthResult4:=WP Insert picture(New object;$pictureFile3;1;1)
// overload 1 union-sweep pictureFile=4D.File
var $pictureFile5 : Variant
var $synthResult6 : Variant
$synthResult6:=WP Insert picture(New object;$pictureFile5;1;1)
// overload 1 union-sweep pictureFile=Text
var $synthResult7 : Variant
$synthResult7:=WP Insert picture(New object;"synthText";1;1)
