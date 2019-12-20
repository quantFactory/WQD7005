*------------------------------------------------------------*;
* Part: Retrieving stratification variable(s) levels;
*------------------------------------------------------------*;
proc freq data=EMWS5.Stat_TRAIN noprint;
format
Attrition BEST1.0
;
table
Attrition
/out=WORK.Part_FREQ(drop=percent);
run;
proc sort data=WORK.Part_FREQ;
by descending count;
run;
* Part: Retrieving levels that meet minimum requirement;
data WORK.Part_FREQ2(keep = count);
set WORK.Part_FREQ;
where (.01 * 53.8461538461538 * count) >= 3;
run;
*------------------------------------------------------------*;
* Part: Create stratified partitioning;
*------------------------------------------------------------*;
data
EMWS5.Part_TRAIN(label="")
EMWS5.Part_VALIDATE(label="")
EMWS5.Part_TEST(label="")
;
retain _seed_ 12345;
drop _seed_ _genvalue_;
call ranuni(_seed_, _genvalue_);
label _dataobs_ = "%sysfunc(sasmsg(sashelp.dmine, sample_dataobs_vlabel, NOQUOTE))";
_dataobs_ = _N_;
drop _c00:;
set EMWS5.Stat_TRAIN;
length _Pformat1 $58;
drop _Pformat1;
_Pformat1 = strip(put(Attrition, BEST1.0));
if
_Pformat1 = '0'
then do;
if (1233+1-_C000004)*_genvalue_ <= (664 - _C000001) then do;
_C000001 + 1;
output EMWS5.Part_TRAIN;
end;
else do;
if (1233+1-_C000004)*_genvalue_ <= (664 - _C000001 + 285 - _C000002) then do;
_C000002 + 1;
output EMWS5.Part_VALIDATE;
end;
else do;
_C000003 + 1;
output EMWS5.Part_TEST;
end;
end;
_C000004+1;
end;
else if
_Pformat1 = '1'
then do;
if (237+1-_C000008)*_genvalue_ <= (128 - _C000005) then do;
_C000005 + 1;
output EMWS5.Part_TRAIN;
end;
else do;
if (237+1-_C000008)*_genvalue_ <= (128 - _C000005 + 55 - _C000006) then do;
_C000006 + 1;
output EMWS5.Part_VALIDATE;
end;
else do;
_C000007 + 1;
output EMWS5.Part_TEST;
end;
end;
_C000008+1;
end;
run;
