// overload 0
ARRAY LONGINT($colVariable1;0)
var $headerVar2 : Integer
var $footerVar3 : Variant
LISTBOX INSERT COLUMN(*;"synthText";1;"synthText";$colVariable1;"synthText";$headerVar2;"synthText";$footerVar3)
// overload 0 flag-sweep omit-leading-thru:*
var $object4 : Variant
ARRAY LONGINT($colVariable5;0)
var $headerVar6 : Integer
var $footerVar7 : Variant
LISTBOX INSERT COLUMN($object4;1;"synthText";$colVariable5;"synthText";$headerVar6;"synthText";$footerVar7)
// overload 0 union-sweep colVariable=Array
ARRAY LONGINT($colVariable8;0)
var $headerVar9 : Integer
var $footerVar10 : Variant
LISTBOX INSERT COLUMN(*;"synthText";1;"synthText";$colVariable8;"synthText";$headerVar9;"synthText";$footerVar10)
// overload 0 union-sweep colVariable=Field
var $headerVar11 : Integer
var $footerVar12 : Variant
LISTBOX INSERT COLUMN(*;"synthText";1;"synthText";[SynthTable]label;"synthText";$headerVar11;"synthText";$footerVar12)
// overload 0 union-sweep colVariable=Variable
var $colVariable13 : Variant
var $headerVar14 : Integer
var $footerVar15 : Variant
LISTBOX INSERT COLUMN(*;"synthText";1;"synthText";$colVariable13;"synthText";$headerVar14;"synthText";$footerVar15)
// overload 0 union-sweep colVariable=Pointer
var $colVariable16 : Pointer
var $headerVar17 : Integer
var $footerVar18 : Variant
LISTBOX INSERT COLUMN(*;"synthText";1;"synthText";$colVariable16;"synthText";$headerVar17;"synthText";$footerVar18)
// overload 0 union-sweep headerVar=Integer
ARRAY LONGINT($colVariable19;0)
var $headerVar20 : Integer
var $footerVar21 : Variant
LISTBOX INSERT COLUMN(*;"synthText";1;"synthText";$colVariable19;"synthText";$headerVar20;"synthText";$footerVar21)
// overload 0 union-sweep headerVar=Pointer
ARRAY LONGINT($colVariable22;0)
var $headerVar23 : Pointer
var $footerVar24 : Variant
LISTBOX INSERT COLUMN(*;"synthText";1;"synthText";$colVariable22;"synthText";$headerVar23;"synthText";$footerVar24)
// overload 0 union-sweep footerVar=Variable
ARRAY LONGINT($colVariable25;0)
var $headerVar26 : Integer
var $footerVar27 : Variant
LISTBOX INSERT COLUMN(*;"synthText";1;"synthText";$colVariable25;"synthText";$headerVar26;"synthText";$footerVar27)
// overload 0 union-sweep footerVar=Pointer
ARRAY LONGINT($colVariable28;0)
var $headerVar29 : Integer
var $footerVar30 : Pointer
LISTBOX INSERT COLUMN(*;"synthText";1;"synthText";$colVariable28;"synthText";$headerVar29;"synthText";$footerVar30)
