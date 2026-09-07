// overload 0 multi-query chain
QUERY SELECTION([SynthTable];[SynthTable]label="synthAny";*)
QUERY SELECTION([SynthTable];|;[SynthTable]label="synthOther";*)
QUERY SELECTION([SynthTable];&;[SynthTable]label="synthYetAnother";*)
QUERY SELECTION([SynthTable];#;[SynthTable]label="synthFourth")
// overload 0 flag-sweep omit-trailing-from:*
QUERY SELECTION([SynthTable];[SynthTable]label="synthAny")
// overload 1 multi-query chain
QUERY SELECTION([SynthTable]label="synthAny";*)
QUERY SELECTION(|;[SynthTable]label="synthOther";*)
QUERY SELECTION(&;[SynthTable]label="synthYetAnother";*)
QUERY SELECTION(#;[SynthTable]label="synthFourth")
// overload 1 flag-sweep omit-trailing-from:*
QUERY SELECTION([SynthTable]label="synthAny")
// overload 2
QUERY SELECTION([SynthTable];[SynthTable]label;"=";"synthAny";*)
// overload 2 flag-sweep omit-trailing-from:*
QUERY SELECTION([SynthTable];[SynthTable]label;"=";"synthAny")
