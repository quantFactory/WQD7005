*------------------------------------------------------------*;
* Part3: Create random partition;
*------------------------------------------------------------*;
data
EMWS1.Part3_TRAIN(label="")
EMWS1.Part3_VALIDATE(label="")
;
retain _seed_ 12345;
drop _seed_ _genvalue_;
call ranuni(_seed_, _genvalue_);
label _dataobs_ = "%sysfunc(sasmsg(sashelp.dmine, sample_dataobs_vlabel, NOQUOTE))";
_dataobs_ = _N_;
drop _c00:;
set EMWS1.Stat3_TRAIN;
if (21 +1-_n_)*_genvalue_ <= (17 - _C000001) then do;
_C000001 + 1;
output EMWS1.Part3_TRAIN;
end;
else do;
_C000002 + 1;
output EMWS1.Part3_VALIDATE;
end;
run;
run;
