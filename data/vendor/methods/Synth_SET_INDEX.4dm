// overload 0
SET INDEX([SynthTable]label;True;*)
// overload 0 flag-sweep omit-trailing-from:*
SET INDEX([SynthTable]label;True)
// overload 0 union-sweep index=Boolean
SET INDEX([SynthTable]label;True;*)
// overload 0 union-sweep index=Integer
SET INDEX([SynthTable]label;1;*)
