// overload 0
PRINT LABEL([SynthTable];"synthText";>;*)
// overload 0 flag-sweep omit-leading-thru:>
PRINT LABEL(*)
// overload 0 flag-sweep omit-trailing-from:>
PRINT LABEL([SynthTable];"synthText")
// overload 0 flag-sweep omit-leading-thru:*
PRINT LABEL()
// overload 0 flag-sweep omit-trailing-from:*
PRINT LABEL([SynthTable];"synthText";>)
