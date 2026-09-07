// overload 0
var $picture1 : Picture
var $metaContents2 : Variant
var $metaContents3 : Variant
SET PICTURE METADATA($picture1;"synthText";$metaContents2;"synthText";$metaContents3)
// overload 0 union-sweep metaContents=Variable
var $picture4 : Picture
var $metaContents5 : Variant
var $metaContents6 : Variant
SET PICTURE METADATA($picture4;"synthText";$metaContents5;"synthText";$metaContents6)
// overload 0 union-sweep metaContents=pseudo:Expression
var $picture7 : Picture
SET PICTURE METADATA($picture7;"synthText";"synthAny";"synthText";"synthAny")
