// overload 0
ARRAY TEXT($menuTitlesArray1;0)
ARRAY TEXT($menuRefsArray2;0)
GET MENU ITEMS(1;$menuTitlesArray1;$menuRefsArray2)
// overload 0 union-sweep menu=Integer
ARRAY TEXT($menuTitlesArray3;0)
ARRAY TEXT($menuRefsArray4;0)
GET MENU ITEMS(1;$menuTitlesArray3;$menuRefsArray4)
// overload 0 union-sweep menu=Text
ARRAY TEXT($menuTitlesArray5;0)
ARRAY TEXT($menuRefsArray6;0)
GET MENU ITEMS("synthText";$menuTitlesArray5;$menuRefsArray6)
