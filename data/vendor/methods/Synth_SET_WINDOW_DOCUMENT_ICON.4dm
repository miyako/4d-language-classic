// overload 0
SET WINDOW DOCUMENT ICON(1)
// overload 1
var $image1 : Picture
SET WINDOW DOCUMENT ICON(1;$image1)
// overload 2
var $file2 : Variant
SET WINDOW DOCUMENT ICON(1;$file2)
// overload 2 union-sweep file=4D.File
var $file3 : Variant
SET WINDOW DOCUMENT ICON(1;$file3)
// overload 2 union-sweep file=4D.Folder
var $file4 : Variant
SET WINDOW DOCUMENT ICON(1;$file4)
// overload 3
var $image5 : Picture
var $file6 : Variant
SET WINDOW DOCUMENT ICON(1;$image5;$file6)
// overload 3 union-sweep file=4D.File
var $image7 : Picture
var $file8 : Variant
SET WINDOW DOCUMENT ICON(1;$image7;$file8)
// overload 3 union-sweep file=4D.Folder
var $image9 : Picture
var $file10 : Variant
SET WINDOW DOCUMENT ICON(1;$image9;$file10)
