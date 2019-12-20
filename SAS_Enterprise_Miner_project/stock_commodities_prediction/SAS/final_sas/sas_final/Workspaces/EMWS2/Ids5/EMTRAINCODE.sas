*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS2 "F:\WQD7005\MalaysiaStockPrediction-master\SAS\Mildstone5\Milestone5-Insight\Workspaces\EMWS2";
*------------------------------------------------------------*;
* Ids5: Creating DATA data;
*------------------------------------------------------------*;
data EMWS2.Ids5_DATA (label="")
/ view=EMWS2.Ids5_DATA
;
set FINALIB.AIRASIA_CSV;
run;
