*------------------------------------------------------------*;
* Reg4: Create decision matrix;
*------------------------------------------------------------*;
data WORK.stockprice(label="stockprice");
  length   stockprice                           8
           ;

 stockprice=2.83;
output;
 stockprice=3.17;
output;
 stockprice=3;
output;
;
run;
proc datasets lib=work nolist;
modify stockprice(type=PROFIT label=stockprice);
run;
quit;
data EM_DMREG / view=EM_DMREG;
set EMWS2.Part4_TRAIN(keep=
gasprice goldprice newspolarity oilprice polarity_cat silverprice stockprice);
run;
*------------------------------------------------------------* ;
* Reg4: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    polarity_cat(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg4: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    gasprice goldprice newspolarity oilprice silverprice stockprice
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg4: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg4_DMDB
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
* Reg4: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg4_DMDB
validata = EMWS2.Part4_VALIDATE
outest = EMWS2.Reg4_EMESTIMATE
outterms = EMWS2.Reg4_OUTTERMS
outmap= EMWS2.Reg4_MAPDS namelen=200
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
code file="C:\Users\amir_\OneDrive\Desktop\Mildstone5\Milestone5-Insight\Workspaces\EMWS2\Reg4\EMPUBLISHSCORE.sas"
group=Reg4
;
code file="C:\Users\amir_\OneDrive\Desktop\Mildstone5\Milestone5-Insight\Workspaces\EMWS2\Reg4\EMFLOWSCORE.sas"
group=Reg4
residual
;
run;
quit;
