// overload 0
CALL WORKER("synthText";New object;"synthAny")
// overload 0 union-sweep process=Text
CALL WORKER("synthText";New object;"synthAny")
// overload 0 union-sweep process=Integer
CALL WORKER(1;New object;"synthAny")
// overload 0 union-sweep formula=Object
CALL WORKER("synthText";New object;"synthAny")
// overload 0 union-sweep formula=Text
CALL WORKER("synthText";"synthText";"synthAny")
