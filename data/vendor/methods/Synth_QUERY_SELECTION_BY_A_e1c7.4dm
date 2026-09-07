// overload 0 multi-query chain
QUERY SELECTION BY ATTRIBUTE([SynthTable];[SynthTable]label;"synthText";"synthText";1;*)
QUERY SELECTION BY ATTRIBUTE([SynthTable];|;[SynthTable]label;"synthText";"synthText";1;*)
QUERY SELECTION BY ATTRIBUTE([SynthTable];&;[SynthTable]label;"synthText";"synthText";1;*)
QUERY SELECTION BY ATTRIBUTE([SynthTable];#;[SynthTable]label;"synthText";"synthText";1)
// overload 0 flag-sweep omit-leading-thru:conjOp
QUERY SELECTION BY ATTRIBUTE([SynthTable]label;"synthText";"synthText";1;*)
// overload 0 flag-sweep omit-trailing-from:*
QUERY SELECTION BY ATTRIBUTE([SynthTable];&;[SynthTable]label;"synthText";"synthText";1)
// overload 0 union-sweep queryOp=>|<|>=|<=|#|=|||%
QUERY SELECTION BY ATTRIBUTE([SynthTable];&;[SynthTable]label;"synthText";>;1;*)
// overload 0 union-sweep queryOp=Text
QUERY SELECTION BY ATTRIBUTE([SynthTable];&;[SynthTable]label;"synthText";"synthText";1;*)
// overload 0 union-sweep value=Text
QUERY SELECTION BY ATTRIBUTE([SynthTable];&;[SynthTable]label;"synthText";"synthText";"synthText";*)
// overload 0 union-sweep value=Real
QUERY SELECTION BY ATTRIBUTE([SynthTable];&;[SynthTable]label;"synthText";"synthText";1;*)
// overload 0 union-sweep value=Date
QUERY SELECTION BY ATTRIBUTE([SynthTable];&;[SynthTable]label;"synthText";"synthText";!2024-01-01!;*)
// overload 0 union-sweep value=Time
QUERY SELECTION BY ATTRIBUTE([SynthTable];&;[SynthTable]label;"synthText";"synthText";?00:00:00?;*)
