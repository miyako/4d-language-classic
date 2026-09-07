// overload 0 multi-query chain
QUERY([SynthTable];[SynthTable]label="synthAny";*)
QUERY([SynthTable];|;[SynthTable]label="synthOther";*)
QUERY([SynthTable];&;[SynthTable]label="synthYetAnother";*)
QUERY([SynthTable];#;[SynthTable]label="synthFourth")
// overload 0 flag-sweep omit-trailing-from:*
QUERY([SynthTable];[SynthTable]label="synthAny")
// overload 1 multi-query chain
QUERY([SynthTable]label="synthAny";*)
QUERY(|;[SynthTable]label="synthOther";*)
QUERY(&;[SynthTable]label="synthYetAnother";*)
QUERY(#;[SynthTable]label="synthFourth")
// overload 1 flag-sweep omit-trailing-from:*
QUERY([SynthTable]label="synthAny")
// overload 2
QUERY([SynthTable];[SynthTable]label;"=";"synthAny";*)
// overload 2 flag-sweep omit-trailing-from:*
QUERY([SynthTable];[SynthTable]label;"=";"synthAny")
