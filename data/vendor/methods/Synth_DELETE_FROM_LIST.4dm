// overload 0
DELETE FROM LIST(*;"synthText";1;*)
// overload 0 flag-sweep omit-leading-thru:asObjectName
DELETE FROM LIST(1;1;*)
// overload 0 flag-sweep omit-trailing-from:eraseSublist
DELETE FROM LIST(*;"synthText";1)
// overload 0 union-sweep itemRef=Integer
DELETE FROM LIST(*;"synthText";1;*)
// overload 0 union-sweep itemRef=pseudo:Operator
DELETE FROM LIST(*;"synthText";*;*)
