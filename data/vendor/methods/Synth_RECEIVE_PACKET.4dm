// overload 0
var $v1 : Text
RECEIVE PACKET(?00:00:00?;$v1;"synthText")
// overload 0 union-sweep receiveVar=Text
var $v2 : Text
RECEIVE PACKET(?00:00:00?;$v2;"synthText")
// overload 0 union-sweep receiveVar=Blob
var $v3 : Variant
RECEIVE PACKET(?00:00:00?;$v3;"synthText")
// overload 1
var $v4 : Text
RECEIVE PACKET(?00:00:00?;$v4;1)
// overload 1 union-sweep receiveVar=Text
var $v5 : Text
RECEIVE PACKET(?00:00:00?;$v5;1)
// overload 1 union-sweep receiveVar=Blob
var $v6 : Variant
RECEIVE PACKET(?00:00:00?;$v6;1)
