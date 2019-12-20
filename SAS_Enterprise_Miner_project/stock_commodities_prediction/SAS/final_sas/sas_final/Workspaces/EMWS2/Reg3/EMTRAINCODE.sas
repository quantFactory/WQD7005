*------------------------------------------------------------*;
* Reg3: Create decision matrix;
*------------------------------------------------------------*;
data WORK.stockprice(label="stockprice");
  length   stockprice                           8
           ;

 stockprice=6.53;
output;
 stockprice=6.81;
output;
 stockprice=6.67;
output;
;
run;
proc datasets lib=work nolist;
modify stockprice(type=PROFIT label=stockprice);
run;
quit;
data EM_DMREG / view=EM_DMREG;
set EMWS2.Part3_TRAIN(keep=
gasprice goldprice newspolarity oilprice polarity_cat silverprice stockprice);
run;
*------------------------------------------------------------* ;
* Reg3: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    polarity_cat(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg3: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    gasprice goldprice newspolarity oilprice silverprice stockprice
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg3: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg3_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
stockprice
;
run;
quit;
*------------------------------------------------------------*;
* Reg3: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg3_DMDB
validata = EMWS2.Part3_VALIDATE
outest = EMWS2.Reg3_EMESTIMATE
outterms = EMWS2.Reg3_OUTTERMS
outmap= EMWS2.Reg3_MAPDS namelen=200
;
class
polarity_cat
;
model stockprice =
gasprice
goldprice
newspolarity
oilprice
polarity_cat
silverprice
/error=normal
coding=DEVIATION
nodesignprint
;
;
code file="C:\Users\amir_\OneDrive\Desktop\Mildstone5\Milestone5-Insight\Workspaces\EMWS2\Reg3\EMPUBLISHSCORE.sas"
group=Reg3
;
code file="C:\Users\amir_\OneDrive\Desktop\Mildstone5\Milestone5-Insight\Workspaces\EMWS2\Reg3\EMFLOWSCORE.sas"
group=Reg3
residual
;
run;
quit;
