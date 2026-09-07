// overload 0
PRINT SELECTION([SynthTable];*)
// overload 0 flag-sweep omit-leading-thru:*
PRINT SELECTION()
// overload 0 flag-sweep omit-trailing-from:*
PRINT SELECTION([SynthTable])
// overload 1
PRINT SELECTION([SynthTable];>)
// overload 1 flag-sweep omit-leading-thru:>
PRINT SELECTION()
// overload 1 flag-sweep omit-trailing-from:>
PRINT SELECTION([SynthTable])
