// overload 0
SET WINDOW DOCUMENT ICON(1)
// overload 1
var $v1 : Picture
SET WINDOW DOCUMENT ICON(1;$v1)
// overload 2
var $v2 : Variant
SET WINDOW DOCUMENT ICON(1;$v2)
// overload 2 union-sweep file=4D.File
var $v3 : Variant
SET WINDOW DOCUMENT ICON(1;$v3)
// overload 2 union-sweep file=4D.Folder
var $v4 : Variant
SET WINDOW DOCUMENT ICON(1;$v4)
// overload 3
var $v5 : Picture
var $v6 : Variant
SET WINDOW DOCUMENT ICON(1;$v5;$v6)
// overload 3 union-sweep file=4D.File
var $v7 : Picture
var $v8 : Variant
SET WINDOW DOCUMENT ICON(1;$v7;$v8)
// overload 3 union-sweep file=4D.Folder
var $v9 : Picture
var $v10 : Variant
SET WINDOW DOCUMENT ICON(1;$v9;$v10)
