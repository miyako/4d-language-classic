// overload 0
SEND PACKET(?00:00:00?;"synthText")
// overload 0 union-sweep packet=Text
SEND PACKET(?00:00:00?;"synthText")
// overload 0 union-sweep packet=Blob
var $packet1 : Variant
SEND PACKET(?00:00:00?;$packet1)
