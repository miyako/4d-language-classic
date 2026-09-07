// overload 0
OBJECT SET SUBFORM(*;"synthText";[SynthTable];"synthText";"synthText")
// overload 0 flag-sweep omit-leading-thru:asObjectName
var $v1 : Variant
OBJECT SET SUBFORM($v1;[SynthTable];New object;New object)
// overload 0 union-sweep detailSubform=Text
OBJECT SET SUBFORM(*;"synthText";[SynthTable];"synthText";"synthText")
// overload 0 union-sweep detailSubform=Object
OBJECT SET SUBFORM(*;"synthText";[SynthTable];New object;"synthText")
// overload 0 union-sweep listSubform=Text
OBJECT SET SUBFORM(*;"synthText";[SynthTable];"synthText";"synthText")
// overload 0 union-sweep listSubform=Object
OBJECT SET SUBFORM(*;"synthText";[SynthTable];"synthText";New object)
