// overload 0
var $comments1 : Text
METHOD GET COMMENTS("synthText";$comments1;*)
// overload 0 flag-sweep omit-trailing-from:*
var $comments2 : Text
METHOD GET COMMENTS("synthText";$comments2)
// overload 0 linked-union-sweep path=Text,comments=Text
var $comments3 : Text
METHOD GET COMMENTS("synthText";$comments3;*)
// overload 0 linked-union-sweep path=Text array,comments=Text array
ARRAY TEXT($path4;0)
ARRAY TEXT($comments5;0)
METHOD GET COMMENTS($path4;$comments5;*)
