// overload 0 multi-query chain
QUERY BY ATTRIBUTE([SynthTable];[SynthTable]label;"myFirstAttribute.mySecondAttribute";"synthText";1;*)
QUERY BY ATTRIBUTE([SynthTable];|;[SynthTable]label;"myFirstAttribute.mySecondAttribute";"synthText";1;*)
QUERY BY ATTRIBUTE([SynthTable];&;[SynthTable]label;"myFirstAttribute.mySecondAttribute";"synthText";1;*)
QUERY BY ATTRIBUTE([SynthTable];#;[SynthTable]label;"myFirstAttribute.mySecondAttribute";"synthText";1)
// overload 0 flag-sweep omit-leading-thru:conjOp
QUERY BY ATTRIBUTE([SynthTable]label;"myFirstAttribute.mySecondAttribute";"synthText";1;*)
// overload 0 flag-sweep omit-trailing-from:*
QUERY BY ATTRIBUTE([SynthTable];&;[SynthTable]label;"myFirstAttribute.mySecondAttribute";"synthText";1)
// overload 0 union-sweep queryOp=Text
QUERY BY ATTRIBUTE([SynthTable];&;[SynthTable]label;"myFirstAttribute.mySecondAttribute";"synthText";1;*)
// overload 0 union-sweep queryOp=>|<|>=|<=|#|=|||%
QUERY BY ATTRIBUTE([SynthTable];&;[SynthTable]label;"myFirstAttribute.mySecondAttribute";>;1;*)
// overload 0 union-sweep value=Text
QUERY BY ATTRIBUTE([SynthTable];&;[SynthTable]label;"myFirstAttribute.mySecondAttribute";"synthText";"synthText";*)
// overload 0 union-sweep value=Real
QUERY BY ATTRIBUTE([SynthTable];&;[SynthTable]label;"myFirstAttribute.mySecondAttribute";"synthText";1;*)
// overload 0 union-sweep value=Date
QUERY BY ATTRIBUTE([SynthTable];&;[SynthTable]label;"myFirstAttribute.mySecondAttribute";"synthText";!2024-01-01!;*)
// overload 0 union-sweep value=Time
QUERY BY ATTRIBUTE([SynthTable];&;[SynthTable]label;"myFirstAttribute.mySecondAttribute";"synthText";?00:00:00?;*)
