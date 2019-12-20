*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS2 "C:\Users\amir_\OneDrive\Desktop\Mildstone5\Milestone5-Insight\Workspaces\EMWS2";
*------------------------------------------------------------*;
* Ids3: Creating DATA data;
*------------------------------------------------------------*;
data EMWS2.Ids3_DATA (label="")
/ view=EMWS2.Ids3_DATA
;
set MILD5.PETRONAS;
run;
