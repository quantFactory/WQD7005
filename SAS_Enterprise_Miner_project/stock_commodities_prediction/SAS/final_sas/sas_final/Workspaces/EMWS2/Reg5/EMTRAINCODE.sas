*------------------------------------------------------------*;
* Reg5: Create decision matrix;
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
set EMWS2.Part5_TRAIN(keep=
REP_gasprice REP_goldprice REP_newspolarity REP_oilprice REP_silverprice
polarity_cat stockprice);
run;
*------------------------------------------------------------* ;
* Reg5: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    polarity_cat(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg5: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    REP_gasprice REP_goldprice REP_newspolarity REP_oilprice REP_silverprice
   stockprice
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg5: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg5_DMDB
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
* Reg5: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg5_DMDB
validata = EMWS2.Part5_VALIDATE
outest = EMWS2.Reg5_EMESTIMATE
outterms = EMWS2.Reg5_OUTTERMS
outmap= EMWS2.Reg5_MAPDS namelen=200
;
class
polarity_cat
;
model stockprice =
REP_gasprice
REP_goldprice
REP_newspolarity
REP_oilprice
REP_silverprice
polarity_cat
/error=normal
coding=DEVIATION
nodesignprint
;
;
code file="F:\WQD7005\MalaysiaStockPrediction-master\SAS\Mildstone5\Milestone5-Insight\Workspaces\EMWS2\Reg5\EMPUBLISHSCORE.sas"
group=Reg5
;
code file="F:\WQD7005\MalaysiaStockPrediction-master\SAS\Mildstone5\Milestone5-Insight\Workspaces\EMWS2\Reg5\EMFLOWSCORE.sas"
group=Reg5
residual
;
run;
quit;
