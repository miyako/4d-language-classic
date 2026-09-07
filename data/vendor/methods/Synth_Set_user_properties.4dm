// overload 0
var $userID1 : Integer
var $nbLogin2 : Integer
ARRAY INTEGER($memberships3;0)
var $groupOwner4 : Integer
var $synthResult5 : Variant
$synthResult5:=Set user properties($userID1;"synthText";"synthText";"synthText";$nbLogin2;!2024-01-01!;$memberships3;$groupOwner4)
// overload 0 union-sweep password=Text
var $userID6 : Integer
var $nbLogin7 : Integer
ARRAY INTEGER($memberships8;0)
var $groupOwner9 : Integer
var $synthResult10 : Variant
$synthResult10:=Set user properties($userID6;"synthText";"synthText";"synthText";$nbLogin7;!2024-01-01!;$memberships8;$groupOwner9)
// overload 0 union-sweep password=pseudo:Operator
var $userID11 : Integer
var $nbLogin12 : Integer
ARRAY INTEGER($memberships13;0)
var $groupOwner14 : Integer
var $synthResult15 : Variant
$synthResult15:=Set user properties($userID11;"synthText";"synthText";*;$nbLogin12;!2024-01-01!;$memberships13;$groupOwner14)
