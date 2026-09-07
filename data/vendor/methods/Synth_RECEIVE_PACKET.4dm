// overload 0
var $receiveVar1 : Text
RECEIVE PACKET(?00:00:00?;$receiveVar1;"synthText")
// overload 0 union-sweep receiveVar=Text
var $receiveVar2 : Text
RECEIVE PACKET(?00:00:00?;$receiveVar2;"synthText")
// overload 0 union-sweep receiveVar=Blob
var $receiveVar3 : Variant
RECEIVE PACKET(?00:00:00?;$receiveVar3;"synthText")
// overload 1
var $receiveVar4 : Text
RECEIVE PACKET(?00:00:00?;$receiveVar4;1)
// overload 1 union-sweep receiveVar=Text
var $receiveVar5 : Text
RECEIVE PACKET(?00:00:00?;$receiveVar5;1)
// overload 1 union-sweep receiveVar=Blob
var $receiveVar6 : Variant
RECEIVE PACKET(?00:00:00?;$receiveVar6;1)
