*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_Attrition $ 1;
label I_Attrition = 'Into: Attrition' ;
*** Target Values;
array REGDRF [2] $1 _temporary_ ('1' '0' );
label U_Attrition = 'Unnormalized Into: Attrition' ;
format U_Attrition BEST1.;
*** Unnormalized target values;
ARRAY REGDRU[2]  _TEMPORARY_ (1 0);

drop _DM_BAD;
_DM_BAD=0;

*** Check Age for missing values ;
if missing( Age ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check BusinessTravel for missing values ;
if missing( BusinessTravel ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check DailyRate for missing values ;
if missing( DailyRate ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Department for missing values ;
if missing( Department ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check DistanceFromHome for missing values ;
if missing( DistanceFromHome ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Education for missing values ;
if missing( Education ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check EducationFiled for missing values ;
if missing( EducationFiled ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check EmployeeNumber for missing values ;
if missing( EmployeeNumber ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check EnvironmentSatisfaction for missing values ;
if missing( EnvironmentSatisfaction ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Gender for missing values ;
if missing( Gender ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check HourlyRate for missing values ;
if missing( HourlyRate ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check JobInvolvement for missing values ;
if missing( JobInvolvement ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check JobLevel for missing values ;
if missing( JobLevel ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check JobRole for missing values ;
if missing( JobRole ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check JobSatisfaction for missing values ;
if missing( JobSatisfaction ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check MartialStatus for missing values ;
if missing( MartialStatus ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check MonthlyIncome for missing values ;
if missing( MonthlyIncome ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check MonthlyRate for missing values ;
if missing( MonthlyRate ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check NumCompaniesWorked for missing values ;
if missing( NumCompaniesWorked ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check OverTime for missing values ;
if missing( OverTime ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PercentSalaryHike for missing values ;
if missing( PercentSalaryHike ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PerformanceRating for missing values ;
if missing( PerformanceRating ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check RelationshipSatisfaction for missing values ;
if missing( RelationshipSatisfaction ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check StockOptionLevel for missing values ;
if missing( StockOptionLevel ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check TotalWorkingYears for missing values ;
if missing( TotalWorkingYears ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check TrainingTimesLastYear for missing values ;
if missing( TrainingTimesLastYear ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check WorkLifeBalance for missing values ;
if missing( WorkLifeBalance ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check YearsAtCompany for missing values ;
if missing( YearsAtCompany ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check YearsInCurrentRole for missing values ;
if missing( YearsInCurrentRole ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check YearsSinceLastPromotion for missing values ;
if missing( YearsSinceLastPromotion ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check YearsWithCurrManager for missing values ;
if missing( YearsWithCurrManager ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.1618204804;
   _P1 = 0.8381795196;
   goto REGDR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: Age ;
_TEMP = Age ;
_LP0 = _LP0 + (   -0.03088273070744 * _TEMP);

***  Effect: BusinessTravel ;
_TEMP = BusinessTravel ;
_LP0 = _LP0 + (   -0.11244973859415 * _TEMP);

***  Effect: DailyRate ;
_TEMP = DailyRate ;
_LP0 = _LP0 + (   -0.00037868272292 * _TEMP);

***  Effect: Department ;
_TEMP = Department ;
_LP0 = _LP0 + (    0.07219499891684 * _TEMP);

***  Effect: DistanceFromHome ;
_TEMP = DistanceFromHome ;
_LP0 = _LP0 + (    0.03924041313516 * _TEMP);

***  Effect: Education ;
_TEMP = Education ;
_LP0 = _LP0 + (    0.06529174393704 * _TEMP);

***  Effect: EducationFiled ;
_TEMP = EducationFiled ;
_LP0 = _LP0 + (   -0.01048826163764 * _TEMP);

***  Effect: EmployeeNumber ;
_TEMP = EmployeeNumber ;
_LP0 = _LP0 + (   -0.00013869346236 * _TEMP);

***  Effect: EnvironmentSatisfaction ;
_TEMP = EnvironmentSatisfaction ;
_LP0 = _LP0 + (   -0.29931771398909 * _TEMP);

***  Effect: Gender ;
_TEMP = Gender ;
_LP0 = _LP0 + (   -0.37319098753253 * _TEMP);

***  Effect: HourlyRate ;
_TEMP = HourlyRate ;
_LP0 = _LP0 + (     0.0030160105269 * _TEMP);

***  Effect: JobInvolvement ;
_TEMP = JobInvolvement ;
_LP0 = _LP0 + (   -0.57732763382206 * _TEMP);

***  Effect: JobLevel ;
_TEMP = JobLevel ;
_LP0 = _LP0 + (   -0.02473633287696 * _TEMP);

***  Effect: JobRole ;
_TEMP = JobRole ;
_LP0 = _LP0 + (    0.03467241238938 * _TEMP);

***  Effect: JobSatisfaction ;
_TEMP = JobSatisfaction ;
_LP0 = _LP0 + (   -0.33132254687356 * _TEMP);

***  Effect: MartialStatus ;
_TEMP = MartialStatus ;
_LP0 = _LP0 + (    0.63011583999956 * _TEMP);

***  Effect: MonthlyIncome ;
_TEMP = MonthlyIncome ;
_LP0 = _LP0 + (   -0.00006989244005 * _TEMP);

***  Effect: MonthlyRate ;
_TEMP = MonthlyRate ;
_LP0 = _LP0 + ( -3.2834800571045E-6 * _TEMP);

***  Effect: NumCompaniesWorked ;
_TEMP = NumCompaniesWorked ;
_LP0 = _LP0 + (    0.13192237477329 * _TEMP);

***  Effect: OverTime ;
_TEMP = OverTime ;
_LP0 = _LP0 + (   -1.71025187119785 * _TEMP);

***  Effect: PercentSalaryHike ;
_TEMP = PercentSalaryHike ;
_LP0 = _LP0 + (   -0.08649023526078 * _TEMP);

***  Effect: PerformanceRating ;
_TEMP = PerformanceRating ;
_LP0 = _LP0 + (    0.80200906059342 * _TEMP);

***  Effect: RelationshipSatisfaction ;
_TEMP = RelationshipSatisfaction ;
_LP0 = _LP0 + (     -0.105632766064 * _TEMP);

***  Effect: StockOptionLevel ;
_TEMP = StockOptionLevel ;
_LP0 = _LP0 + (    -0.1761985034991 * _TEMP);

***  Effect: TotalWorkingYears ;
_TEMP = TotalWorkingYears ;
_LP0 = _LP0 + (   -0.03075316568845 * _TEMP);

***  Effect: TrainingTimesLastYear ;
_TEMP = TrainingTimesLastYear ;
_LP0 = _LP0 + (    -0.1674000741222 * _TEMP);

***  Effect: WorkLifeBalance ;
_TEMP = WorkLifeBalance ;
_LP0 = _LP0 + (    -0.1724347543064 * _TEMP);

***  Effect: YearsAtCompany ;
_TEMP = YearsAtCompany ;
_LP0 = _LP0 + (    0.01767181955154 * _TEMP);

***  Effect: YearsInCurrentRole ;
_TEMP = YearsInCurrentRole ;
_LP0 = _LP0 + (   -0.16943078975496 * _TEMP);

***  Effect: YearsSinceLastPromotion ;
_TEMP = YearsSinceLastPromotion ;
_LP0 = _LP0 + (    0.16962427681687 * _TEMP);

***  Effect: YearsWithCurrManager ;
_TEMP = YearsWithCurrManager ;
_LP0 = _LP0 + (   -0.07114347507885 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =     3.40150756546427 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

REGDR1:


*** Posterior Probabilities and Predicted Level;
label P_Attrition1 = 'Predicted: Attrition=1' ;
label P_Attrition0 = 'Predicted: Attrition=0' ;
P_Attrition1 = _P0;
_MAXP = _P0;
_IY = 1;
P_Attrition0 = _P1;
if (_P1 >  _MAXP + 1E-8) then do;
   _MAXP = _P1;
   _IY = 2;
end;
I_Attrition = REGDRF[_IY];
U_Attrition = REGDRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
