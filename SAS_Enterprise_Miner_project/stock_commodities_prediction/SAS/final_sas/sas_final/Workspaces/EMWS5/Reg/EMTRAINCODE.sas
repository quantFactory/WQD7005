*------------------------------------------------------------*;
* Reg: Create decision matrix;
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
data EM_DMREG / view=EM_DMREG;
set EMWS5.Trans_TRAIN(keep=
Age Attrition BusinessTravel DailyRate Department DistanceFromHome Education
EducationFiled EmployeeNumber EnvironmentSatisfaction Gender HourlyRate
JobInvolvement JobLevel JobRole JobSatisfaction MartialStatus MonthlyIncome
MonthlyRate NumCompaniesWorked OverTime PercentSalaryHike PerformanceRating
RelationshipSatisfaction StockOptionLevel TotalWorkingYears
TrainingTimesLastYear WorkLifeBalance YearsAtCompany YearsInCurrentRole
YearsSinceLastPromotion YearsWithCurrManager );
run;
*------------------------------------------------------------* ;
* Reg: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Attrition(DESC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg: DMDBVar Macro ;
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
* Reg: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
Attrition
;
run;
quit;
*------------------------------------------------------------*;
* Reg: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg_DMDB
validata = EMWS5.Trans_VALIDATE
outest = EMWS5.Reg_EMESTIMATE
outterms = EMWS5.Reg_OUTTERMS
outmap= EMWS5.Reg_MAPDS namelen=200
;
class
Attrition
;
model Attrition =
Age
BusinessTravel
DailyRate
Department
DistanceFromHome
Education
EducationFiled
EmployeeNumber
EnvironmentSatisfaction
Gender
HourlyRate
JobInvolvement
JobLevel
JobRole
JobSatisfaction
MartialStatus
MonthlyIncome
MonthlyRate
NumCompaniesWorked
OverTime
PercentSalaryHike
PerformanceRating
RelationshipSatisfaction
StockOptionLevel
TotalWorkingYears
TrainingTimesLastYear
WorkLifeBalance
YearsAtCompany
YearsInCurrentRole
YearsSinceLastPromotion
YearsWithCurrManager
/error=binomial link=LOGIT
coding=DEVIATION
nodesignprint
;
;
score data=EMWS5.Trans_TEST
out=_null_
outfit=EMWS5.Reg_FITTEST
role = TEST
;
code file="F:\WQD7005\MalaysiaStockPrediction-master\SAS\Mildstone5\Milestone5-Insight\Workspaces\EMWS5\Reg\EMPUBLISHSCORE.sas"
group=Reg
;
code file="F:\WQD7005\MalaysiaStockPrediction-master\SAS\Mildstone5\Milestone5-Insight\Workspaces\EMWS5\Reg\EMFLOWSCORE.sas"
group=Reg
residual
;
run;
quit;
