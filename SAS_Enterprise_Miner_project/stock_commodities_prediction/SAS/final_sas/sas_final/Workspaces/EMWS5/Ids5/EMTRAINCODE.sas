*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS5 "F:\WQD7005\MalaysiaStockPrediction-master\SAS\Mildstone5\Milestone5-Insight\Workspaces\EMWS5";
*------------------------------------------------------------*;
* Ids5: Creating DATA data;
*------------------------------------------------------------*;
data EMWS5.Ids5_DATA (label="")
/ view=EMWS5.Ids5_DATA
;
set FINALIB.PETRONAS_CSV;
run;
