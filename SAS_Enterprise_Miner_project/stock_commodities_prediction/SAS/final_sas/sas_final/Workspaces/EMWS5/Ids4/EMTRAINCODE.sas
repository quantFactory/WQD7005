*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS5 "F:\WQD7005\MalaysiaStockPrediction-master\SAS\Mildstone5\Milestone5-Insight\Workspaces\EMWS5";
*------------------------------------------------------------*;
* Ids4: Creating DATA data;
*------------------------------------------------------------*;
data EMWS5.Ids4_DATA (label="")
/ view=EMWS5.Ids4_DATA
;
set FINALIB.GAS_MYSQL;
run;
