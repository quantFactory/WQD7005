*------------------------------------------------------------*;
* Neural: Create decision matrix;
*------------------------------------------------------------*;
data WORK.Attrition(label="Attrition");
  length   Attrition                        $  32
           COUNT                                8
           DATAPRIOR                            8
           TRAINPRIOR                           8
           DECPRIOR                             8
           DECISION1                            8
           DECISION2                            8
           ;

  label    COUNT="Level Counts"
           DATAPRIOR="Data Proportions"
           TRAINPRIOR="Training Proportions"
           DECPRIOR="Decision Priors"
           DECISION1="1"
           DECISION2="0"
           ;
Attrition="1"; COUNT=128; DATAPRIOR=0.16182048040455; TRAINPRIOR=0.16182048040455; DECPRIOR=.; DECISION1=1; DECISION2=0;
output;
Attrition="0"; COUNT=663; DATAPRIOR=0.83817951959544; TRAINPRIOR=0.83817951959544; DECPRIOR=.; DECISION1=0; DECISION2=1;
output;
;
run;
proc datasets lib=work nolist;
modify Attrition(type=PROFIT label=Attrition);
label DECISION1= '1';
label DECISION2= '0';
run;
quit;
data EM_Neural;
set EMWS5.AutoNeural_TRAIN(keep=
Age Attrition BusinessTravel DailyRate Department DistanceFromHome Education
EducationFiled EmployeeNumber EnvironmentSatisfaction Gender HourlyRate
JobInvolvement JobLevel JobRole JobSatisfaction MartialStatus MonthlyIncome
MonthlyRate NumCompaniesWorked OverTime PercentSalaryHike PerformanceRating
RelationshipSatisfaction StockOptionLevel TotalWorkingYears
TrainingTimesLastYear WorkLifeBalance YearsAtCompany YearsInCurrentRole
YearsSinceLastPromotion YearsWithCurrManager );
run;
*------------------------------------------------------------* ;
* Neural: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Attrition(DESC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Neural: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Age BusinessTravel DailyRate Department DistanceFromHome Education
   EducationFiled EmployeeNumber EnvironmentSatisfaction Gender HourlyRate
   JobInvolvement JobLevel JobRole JobSatisfaction MartialStatus MonthlyIncome
   MonthlyRate NumCompaniesWorked OverTime PercentSalaryHike PerformanceRating
   RelationshipSatisfaction StockOptionLevel TotalWorkingYears
   TrainingTimesLastYear WorkLifeBalance YearsAtCompany YearsInCurrentRole
   YearsSinceLastPromotion YearsWithCurrManager
%mend DMDBVar;
*------------------------------------------------------------*;
* Neural: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_Neural
dmdbcat=WORK.Neural_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
Attrition
;
run;
quit;
*------------------------------------------------------------* ;
* Neural: Interval Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    Age BusinessTravel DailyRate Department DistanceFromHome Education
   EducationFiled EmployeeNumber EnvironmentSatisfaction Gender HourlyRate
   JobInvolvement JobLevel JobRole JobSatisfaction MartialStatus MonthlyIncome
   MonthlyRate NumCompaniesWorked OverTime PercentSalaryHike PerformanceRating
   RelationshipSatisfaction StockOptionLevel TotalWorkingYears
   TrainingTimesLastYear WorkLifeBalance YearsAtCompany YearsInCurrentRole
   YearsSinceLastPromotion YearsWithCurrManager
%mend INTINPUTS;
*------------------------------------------------------------* ;
* Neural: Binary Inputs Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;

%mend BININPUTS;
*------------------------------------------------------------* ;
* Neural: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;

%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Neural: Ordinal Inputs Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* Neural Network Training;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural dmdbcat=WORK.Neural_DMDB
validdata = EMWS5.AutoNeural_VALIDATE
random=12345
;
nloptions
;
performance alldetails noutilfile;
netopts
decay=0;
input %INTINPUTS / level=interval id=intvl
;
target Attrition / level=NOMINAL id=Attrition
bias
;
arch MLP
Hidden=3
;
Prelim 5 preiter=10
pretime=3600
Outest=EMWS5.Neural_PRELIM_OUTEST
;
save network=EMWS5.Neural_NETWORK.dm_neural;
train Maxiter=50
maxtime=14400
Outest=EMWS5.Neural_outest estiter=1
Outfit=EMWS5.Neural_OUTFIT
;
run;
quit;
proc sort data=EMWS5.Neural_OUTFIT(where=(_iter_ ne . and _NAME_="OVERALL")) out=fit_Neural;
by _VAVERR_;
run;
%GLOBAL ITER;
data _null_;
set fit_Neural(obs=1);
call symput('ITER',put(_ITER_, 6.));
run;
data EMWS5.Neural_INITIAL;
set EMWS5.Neural_outest(where=(_ITER_ eq &ITER and _OBJ_ ne .));
run;
*------------------------------------------------------------*;
* Neural Network Model Selection;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural dmdbcat=WORK.Neural_DMDB
validdata = EMWS5.AutoNeural_VALIDATE
network = EMWS5.Neural_NETWORK.dm_neural
random=12345
;
nloptions noprint;
performance alldetails noutilfile;
initial inest=EMWS5.Neural_INITIAL;
train tech=NONE;
code file="F:\WQD7005\MalaysiaStockPrediction-master\SAS\Mildstone5\Milestone5-Insight\Workspaces\EMWS5\Neural\SCORECODE.sas"
group=Neural
;
;
code file="F:\WQD7005\MalaysiaStockPrediction-master\SAS\Mildstone5\Milestone5-Insight\Workspaces\EMWS5\Neural\RESIDUALSCORECODE.sas"
group=Neural
residual
;
;
score data=EMWS5.AutoNeural_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS5.Neural_OUTKEY;
score data=EMWS5.AutoNeural_VALIDATE out=_NULL_
outfit=WORK.FIT2
role=VALID
outkey=EMWS5.Neural_OUTKEY;
score data=EMWS5.AutoNeural_TEST out=_NULL_
outfit=WORK.FIT3
role=TEST
outkey=EMWS5.Neural_OUTKEY;
run;
quit;
data EMWS5.Neural_OUTFIT;
merge WORK.FIT1 WORK.FIT2 WORK.FIT3;
run;
data EMWS5.Neural_EMESTIMATE;
set EMWS5.Neural_outest;
if _type_ ^in('HESSIAN' 'GRAD');
run;
proc datasets lib=work nolist;
delete EM_Neural;
run;
quit;
