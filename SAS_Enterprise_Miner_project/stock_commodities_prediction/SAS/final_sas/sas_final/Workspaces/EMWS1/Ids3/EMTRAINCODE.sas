*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS1 "C:\Users\Administrator\Documents\SAS PROJECTS\Milestone5-Insight\Workspaces\EMWS1";
*------------------------------------------------------------*;
* Ids3: Creating DATA data;
*------------------------------------------------------------*;
data EMWS1.Ids3_DATA (label="")
/ view=EMWS1.Ids3_DATA
;
set MILEST5.CIMBDATASET;
run;
