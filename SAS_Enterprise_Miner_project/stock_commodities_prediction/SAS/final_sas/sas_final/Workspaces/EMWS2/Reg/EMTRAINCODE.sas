*------------------------------------------------------------*;
* Reg: Create decision matrix;
*------------------------------------------------------------*;
data WORK.stockprice(label="stockprice");
  length   stockprice                           8
           ;

 stockprice=2.43;
output;
 stockprice=2.73;
output;
 stockprice=2.58;
output;
;
run;
proc datasets lib=work nolist;
modify stockprice(type=PROFIT label=stockprice);
run;
quit;
data EM_DMREG / view=EM_DMREG;
set EMWS2.Part_TRAIN(keep=
gasprice goldprice newspolarity oilprice polarity_cat silverprice stockprice);
run;
*------------------------------------------------------------* ;
* Reg: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    polarity_cat(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    gasprice goldprice newspolarity oilprice silverprice stockprice
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg_DMDB
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
* Reg: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg_DMDB
validata = EMWS2.Part_VALIDATE
outest = EMWS2.Reg_EMESTIMATE
outterms = EMWS2.Reg_OUTTERMS
outmap= EMWS2.Reg_MAPDS namelen=200
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
CovB
CorrB
nodesignprint
;
;
code file="C:\Users\amir_\OneDrive\Desktop\Mildstone5\Milestone5-Insight\Workspaces\EMWS2\Reg\EMPUBLISHSCORE.sas"
group=Reg
;
code file="C:\Users\amir_\OneDrive\Desktop\Mildstone5\Milestone5-Insight\Workspaces\EMWS2\Reg\EMFLOWSCORE.sas"
group=Reg
residual
;
run;
quit;
