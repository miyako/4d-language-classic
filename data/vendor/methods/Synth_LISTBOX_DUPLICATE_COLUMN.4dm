// overload 0
ARRAY LONGINT($colVariable1;0)
var $headerVar2 : Integer
var $footerVar3 : Variant
LISTBOX DUPLICATE COLUMN(*;"synthText";1;"synthText";$colVariable1;"synthText";$headerVar2;"synthText";$footerVar3)
// overload 0 union-sweep colVariable=Array
ARRAY LONGINT($colVariable4;0)
var $headerVar5 : Integer
var $footerVar6 : Variant
LISTBOX DUPLICATE COLUMN(*;"synthText";1;"synthText";$colVariable4;"synthText";$headerVar5;"synthText";$footerVar6)
// overload 0 union-sweep colVariable=Field
var $headerVar7 : Integer
var $footerVar8 : Variant
LISTBOX DUPLICATE COLUMN(*;"synthText";1;"synthText";[SynthTable]label;"synthText";$headerVar7;"synthText";$footerVar8)
// overload 0 union-sweep colVariable=Variable
var $colVariable9 : Variant
var $headerVar10 : Integer
var $footerVar11 : Variant
LISTBOX DUPLICATE COLUMN(*;"synthText";1;"synthText";$colVariable9;"synthText";$headerVar10;"synthText";$footerVar11)
// overload 0 union-sweep colVariable=Pointer
var $colVariable12 : Pointer
var $headerVar13 : Integer
var $footerVar14 : Variant
LISTBOX DUPLICATE COLUMN(*;"synthText";1;"synthText";$colVariable12;"synthText";$headerVar13;"synthText";$footerVar14)
// overload 0 union-sweep headerVar=Integer
ARRAY LONGINT($colVariable15;0)
var $headerVar16 : Integer
var $footerVar17 : Variant
LISTBOX DUPLICATE COLUMN(*;"synthText";1;"synthText";$colVariable15;"synthText";$headerVar16;"synthText";$footerVar17)
// overload 0 union-sweep headerVar=Pointer
ARRAY LONGINT($colVariable18;0)
var $headerVar19 : Pointer
var $footerVar20 : Variant
LISTBOX DUPLICATE COLUMN(*;"synthText";1;"synthText";$colVariable18;"synthText";$headerVar19;"synthText";$footerVar20)
// overload 0 union-sweep footerVar=Variable
ARRAY LONGINT($colVariable21;0)
var $headerVar22 : Integer
var $footerVar23 : Variant
LISTBOX DUPLICATE COLUMN(*;"synthText";1;"synthText";$colVariable21;"synthText";$headerVar22;"synthText";$footerVar23)
// overload 0 union-sweep footerVar=Pointer
ARRAY LONGINT($colVariable24;0)
var $headerVar25 : Integer
var $footerVar26 : Pointer
LISTBOX DUPLICATE COLUMN(*;"synthText";1;"synthText";$colVariable24;"synthText";$headerVar25;"synthText";$footerVar26)
// overload 1
var $object27 : Variant
ARRAY LONGINT($colVariable28;0)
var $headerVar29 : Integer
var $footerVar30 : Variant
LISTBOX DUPLICATE COLUMN($object27;1;"synthText";$colVariable28;"synthText";$headerVar29;"synthText";$footerVar30)
// overload 1 union-sweep colVariable=Array
var $object31 : Variant
ARRAY LONGINT($colVariable32;0)
var $headerVar33 : Integer
var $footerVar34 : Variant
LISTBOX DUPLICATE COLUMN($object31;1;"synthText";$colVariable32;"synthText";$headerVar33;"synthText";$footerVar34)
// overload 1 union-sweep colVariable=Field
var $object35 : Variant
var $headerVar36 : Integer
var $footerVar37 : Variant
LISTBOX DUPLICATE COLUMN($object35;1;"synthText";[SynthTable]label;"synthText";$headerVar36;"synthText";$footerVar37)
// overload 1 union-sweep colVariable=Variable
var $object38 : Variant
var $colVariable39 : Variant
var $headerVar40 : Integer
var $footerVar41 : Variant
LISTBOX DUPLICATE COLUMN($object38;1;"synthText";$colVariable39;"synthText";$headerVar40;"synthText";$footerVar41)
// overload 1 union-sweep colVariable=Pointer
var $object42 : Variant
var $colVariable43 : Pointer
var $headerVar44 : Integer
var $footerVar45 : Variant
LISTBOX DUPLICATE COLUMN($object42;1;"synthText";$colVariable43;"synthText";$headerVar44;"synthText";$footerVar45)
// overload 1 union-sweep headerVar=Integer
var $object46 : Variant
ARRAY LONGINT($colVariable47;0)
var $headerVar48 : Integer
var $footerVar49 : Variant
LISTBOX DUPLICATE COLUMN($object46;1;"synthText";$colVariable47;"synthText";$headerVar48;"synthText";$footerVar49)
// overload 1 union-sweep headerVar=Pointer
var $object50 : Variant
ARRAY LONGINT($colVariable51;0)
var $headerVar52 : Pointer
var $footerVar53 : Variant
LISTBOX DUPLICATE COLUMN($object50;1;"synthText";$colVariable51;"synthText";$headerVar52;"synthText";$footerVar53)
// overload 1 union-sweep footerVar=Variable
var $object54 : Variant
ARRAY LONGINT($colVariable55;0)
var $headerVar56 : Integer
var $footerVar57 : Variant
LISTBOX DUPLICATE COLUMN($object54;1;"synthText";$colVariable55;"synthText";$headerVar56;"synthText";$footerVar57)
// overload 1 union-sweep footerVar=Pointer
var $object58 : Variant
ARRAY LONGINT($colVariable59;0)
var $headerVar60 : Integer
var $footerVar61 : Pointer
LISTBOX DUPLICATE COLUMN($object58;1;"synthText";$colVariable59;"synthText";$headerVar60;"synthText";$footerVar61)
