*------------------------------------------------------------*;
* Reg2: Create decision matrix;
*------------------------------------------------------------*;
data WORK.stockprice(label="stockprice");
  length   stockprice                           8
           ;

 stockprice=2.9;
output;
 stockprice=3.55;
output;
 stockprice=3.225;
output;
;
run;
proc datasets lib=work nolist;
modify stockprice(type=PROFIT label=stockprice);
run;
quit;
data EM_DMREG / view=EM_DMREG;
set EMWS2.Part2_TRAIN(keep=
gasprice goldprice newspolarity oilprice polarity_cat silverprice stockprice);
run;
*------------------------------------------------------------* ;
* Reg2: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    polarity_cat(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg2: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    gasprice goldprice newspolarity oilprice silverprice stockprice
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg2: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg2_DMDB
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
* Reg2: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg2_DMDB
validata = EMWS2.Part2_VALIDATE
outest = EMWS2.Reg2_EMESTIMATE
outterms = EMWS2.Reg2_OUTTERMS
outmap= EMWS2.Reg2_MAPDS namelen=200
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
code file="C:\Users\amir_\OneDrive\Desktop\Mildstone5\Milestone5-Insight\Workspaces\EMWS2\Reg2\EMPUBLISHSCORE.sas"
group=Reg2
;
code file="C:\Users\amir_\OneDrive\Desktop\Mildstone5\Milestone5-Insight\Workspaces\EMWS2\Reg2\EMFLOWSCORE.sas"
group=Reg2
residual
;
run;
quit;
