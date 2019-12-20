***********************************;
*** Begin Scoring Code for Neural;
***********************************;
DROP _DM_BAD _EPS _NOCL_ _MAX_ _MAXP_ _SUM_ _NTRIALS;
 _DM_BAD = 0;
 _NOCL_ = .;
 _MAX_ = .;
 _MAXP_ = .;
 _SUM_ = .;
 _NTRIALS = .;
 _EPS =                1E-10;
LENGTH _WARN_ $4 
;
      label S_Age = 'Standard: Age' ;

      label S_BusinessTravel = 'Standard: BusinessTravel' ;

      label S_DailyRate = 'Standard: DailyRate' ;

      label S_Department = 'Standard: Department' ;

      label S_DistanceFromHome = 'Standard: DistanceFromHome' ;

      label S_Education = 'Standard: Education' ;

      label S_EducationFiled = 'Standard: EducationFiled' ;

      label S_EmployeeNumber = 'Standard: EmployeeNumber' ;

      label S_EnvironmentSatisfaction = 'Standard: EnvironmentSatisfaction' ;

      label S_Gender = 'Standard: Gender' ;

      label S_HourlyRate = 'Standard: HourlyRate' ;

      label S_JobInvolvement = 'Standard: JobInvolvement' ;

      label S_JobLevel = 'Standard: JobLevel' ;

      label S_JobRole = 'Standard: JobRole' ;

      label S_JobSatisfaction = 'Standard: JobSatisfaction' ;

      label S_MartialStatus = 'Standard: MartialStatus' ;

      label S_MonthlyIncome = 'Standard: MonthlyIncome' ;

      label S_MonthlyRate = 'Standard: MonthlyRate' ;

      label S_NumCompaniesWorked = 'Standard: NumCompaniesWorked' ;

      label S_OverTime = 'Standard: OverTime' ;

      label S_PercentSalaryHike = 'Standard: PercentSalaryHike' ;

      label S_PerformanceRating = 'Standard: PerformanceRating' ;

      label S_RelationshipSatisfaction = 
'Standard: RelationshipSatisfaction' ;

      label S_StockOptionLevel = 'Standard: StockOptionLevel' ;

      label S_TotalWorkingYears = 'Standard: TotalWorkingYears' ;

      label S_TrainingTimesLastYear = 'Standard: TrainingTimesLastYear' ;

      label S_WorkLifeBalance = 'Standard: WorkLifeBalance' ;

      label S_YearsAtCompany = 'Standard: YearsAtCompany' ;

      label S_YearsInCurrentRole = 'Standard: YearsInCurrentRole' ;

      label S_YearsSinceLastPromotion = 'Standard: YearsSinceLastPromotion' ;

      label S_YearsWithCurrManager = 'Standard: YearsWithCurrManager' ;

      label I_Attrition = 'Into: Attrition' ;

      label U_Attrition = 'Unnormalized Into: Attrition' ;

      label P_Attrition1 = 'Predicted: Attrition=1' ;

      label P_Attrition0 = 'Predicted: Attrition=0' ;

      label  _WARN_ = "Warnings"; 

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   Age , 
   BusinessTravel , 
   DailyRate , 
   Department , 
   DistanceFromHome , 
   Education , 
   EducationFiled , 
   EmployeeNumber , 
   EnvironmentSatisfaction , 
   Gender , 
   HourlyRate , 
   JobInvolvement , 
   JobLevel , 
   JobRole , 
   JobSatisfaction , 
   MartialStatus , 
   MonthlyIncome , 
   MonthlyRate , 
   NumCompaniesWorked , 
   OverTime , 
   PercentSalaryHike , 
   PerformanceRating , 
   RelationshipSatisfaction , 
   StockOptionLevel , 
   TotalWorkingYears , 
   TrainingTimesLastYear , 
   WorkLifeBalance , 
   YearsAtCompany , 
   YearsInCurrentRole , 
   YearsSinceLastPromotion , 
   YearsWithCurrManager   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node interval ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_Age  =    -3.96648171344841 +     0.10729385935769 * Age ;
   S_BusinessTravel  =    -3.98852527674866 +     1.52044505730515 * 
        BusinessTravel ;
   S_DailyRate  =    -2.03581493743502 +     0.00248791002022 * DailyRate ;
   S_Department  =    -4.22935075338097 +     1.86478062760554 * Department ;
   S_DistanceFromHome  =    -1.12213009828348 +     0.12455864548726 * 
        DistanceFromHome ;
   S_Education  =    -2.95311010038138 +     1.00512482332258 * Education ;
   S_EducationFiled  =    -2.45581173282343 +      0.7573282965549 * 
        EducationFiled ;
   S_EmployeeNumber  =    -1.73790544762251 +     0.00166578597057 * 
        EmployeeNumber ;
   S_EnvironmentSatisfaction  =    -2.56274984944022 +      0.9260553361842 * 
        EnvironmentSatisfaction ;
   S_Gender  =    -2.87359294064677 +     2.02585741181069 * Gender ;
   S_HourlyRate  =    -3.21805757171476 +     0.04878367809322 * HourlyRate ;
   S_JobInvolvement  =    -3.81262928932621 +     1.38402467547362 * 
        JobInvolvement ;
   S_JobLevel  =    -1.88691886163417 +      0.9276276069314 * JobLevel ;
   S_JobRole  =    -2.18694751575281 +       0.401549555469 * JobRole ;
   S_JobSatisfaction  =    -2.45055212713798 +     0.90790947661177 * 
        JobSatisfaction ;
   S_MartialStatus  =    -2.86554061608934 +     1.36709446762766 * 
        MartialStatus ;
   S_MonthlyIncome  =    -1.38513099702569 +     0.00021779308768 * 
        MonthlyIncome ;
   S_MonthlyRate  =    -2.00346649325312 +     0.00013945928825 * MonthlyRate
         ;
   S_NumCompaniesWorked  =    -1.05821643343845 +     0.39132734869089 * 
        NumCompaniesWorked ;
   S_OverTime  =    -1.58504742314363 +     2.21514578040037 * OverTime ;
   S_PercentSalaryHike  =    -4.18984052186548 +     0.27319791054287 * 
        PercentSalaryHike ;
   S_PerformanceRating  =    -8.75370015723674 +     2.77633393118454 * 
        PerformanceRating ;
   S_RelationshipSatisfaction
          =    -2.48983094024993 +     0.92246195491227 * 
        RelationshipSatisfaction ;
   S_StockOptionLevel  =    -0.93023934022251 +     1.18109039826004 * 
        StockOptionLevel ;
   S_TotalWorkingYears  =    -1.43216581644223 +     0.12877607830008 * 
        TotalWorkingYears ;
   S_TrainingTimesLastYear  =    -2.16888105917952 +     0.77698592292164 * 
        TrainingTimesLastYear ;
   S_WorkLifeBalance  =    -3.90838926245552 +     1.43126662342699 * 
        WorkLifeBalance ;
   S_YearsAtCompany  =    -1.16230904611766 +     0.16728283396635 * 
        YearsAtCompany ;
   S_YearsInCurrentRole  =    -1.19435031741564 +     0.28344767509024 * 
        YearsInCurrentRole ;
   S_YearsSinceLastPromotion  =    -0.68707718328579 +     0.30464016366539 * 
        YearsSinceLastPromotion ;
   S_YearsWithCurrManager  =    -1.17887032946267 +     0.28265729936495 * 
        YearsWithCurrManager ;
END;
ELSE DO;
   IF MISSING( Age ) THEN S_Age  = . ;
   ELSE S_Age  =    -3.96648171344841 +     0.10729385935769 * Age ;
   IF MISSING( BusinessTravel ) THEN S_BusinessTravel  = . ;
   ELSE S_BusinessTravel  =    -3.98852527674866 +     1.52044505730515 * 
        BusinessTravel ;
   IF MISSING( DailyRate ) THEN S_DailyRate  = . ;
   ELSE S_DailyRate  =    -2.03581493743502 +     0.00248791002022 * DailyRate
         ;
   IF MISSING( Department ) THEN S_Department  = . ;
   ELSE S_Department  =    -4.22935075338097 +     1.86478062760554 * 
        Department ;
   IF MISSING( DistanceFromHome ) THEN S_DistanceFromHome  = . ;
   ELSE S_DistanceFromHome  =    -1.12213009828348 +     0.12455864548726 * 
        DistanceFromHome ;
   IF MISSING( Education ) THEN S_Education  = . ;
   ELSE S_Education  =    -2.95311010038138 +     1.00512482332258 * Education
         ;
   IF MISSING( EducationFiled ) THEN S_EducationFiled  = . ;
   ELSE S_EducationFiled  =    -2.45581173282343 +      0.7573282965549 * 
        EducationFiled ;
   IF MISSING( EmployeeNumber ) THEN S_EmployeeNumber  = . ;
   ELSE S_EmployeeNumber  =    -1.73790544762251 +     0.00166578597057 * 
        EmployeeNumber ;
   IF MISSING( EnvironmentSatisfaction ) THEN S_EnvironmentSatisfaction  = . ;
   ELSE S_EnvironmentSatisfaction
          =    -2.56274984944022 +      0.9260553361842 * 
        EnvironmentSatisfaction ;
   IF MISSING( Gender ) THEN S_Gender  = . ;
   ELSE S_Gender  =    -2.87359294064677 +     2.02585741181069 * Gender ;
   IF MISSING( HourlyRate ) THEN S_HourlyRate  = . ;
   ELSE S_HourlyRate  =    -3.21805757171476 +     0.04878367809322 * 
        HourlyRate ;
   IF MISSING( JobInvolvement ) THEN S_JobInvolvement  = . ;
   ELSE S_JobInvolvement  =    -3.81262928932621 +     1.38402467547362 * 
        JobInvolvement ;
   IF MISSING( JobLevel ) THEN S_JobLevel  = . ;
   ELSE S_JobLevel  =    -1.88691886163417 +      0.9276276069314 * JobLevel ;
   IF MISSING( JobRole ) THEN S_JobRole  = . ;
   ELSE S_JobRole  =    -2.18694751575281 +       0.401549555469 * JobRole ;
   IF MISSING( JobSatisfaction ) THEN S_JobSatisfaction  = . ;
   ELSE S_JobSatisfaction  =    -2.45055212713798 +     0.90790947661177 * 
        JobSatisfaction ;
   IF MISSING( MartialStatus ) THEN S_MartialStatus  = . ;
   ELSE S_MartialStatus  =    -2.86554061608934 +     1.36709446762766 * 
        MartialStatus ;
   IF MISSING( MonthlyIncome ) THEN S_MonthlyIncome  = . ;
   ELSE S_MonthlyIncome  =    -1.38513099702569 +     0.00021779308768 * 
        MonthlyIncome ;
   IF MISSING( MonthlyRate ) THEN S_MonthlyRate  = . ;
   ELSE S_MonthlyRate  =    -2.00346649325312 +     0.00013945928825 * 
        MonthlyRate ;
   IF MISSING( NumCompaniesWorked ) THEN S_NumCompaniesWorked  = . ;
   ELSE S_NumCompaniesWorked  =    -1.05821643343845 +     0.39132734869089 * 
        NumCompaniesWorked ;
   IF MISSING( OverTime ) THEN S_OverTime  = . ;
   ELSE S_OverTime  =    -1.58504742314363 +     2.21514578040037 * OverTime ;
   IF MISSING( PercentSalaryHike ) THEN S_PercentSalaryHike  = . ;
   ELSE S_PercentSalaryHike  =    -4.18984052186548 +     0.27319791054287 * 
        PercentSalaryHike ;
   IF MISSING( PerformanceRating ) THEN S_PerformanceRating  = . ;
   ELSE S_PerformanceRating  =    -8.75370015723674 +     2.77633393118454 * 
        PerformanceRating ;
   IF MISSING( RelationshipSatisfaction ) THEN S_RelationshipSatisfaction
          = . ;
   ELSE S_RelationshipSatisfaction
          =    -2.48983094024993 +     0.92246195491227 * 
        RelationshipSatisfaction ;
   IF MISSING( StockOptionLevel ) THEN S_StockOptionLevel  = . ;
   ELSE S_StockOptionLevel  =    -0.93023934022251 +     1.18109039826004 * 
        StockOptionLevel ;
   IF MISSING( TotalWorkingYears ) THEN S_TotalWorkingYears  = . ;
   ELSE S_TotalWorkingYears  =    -1.43216581644223 +     0.12877607830008 * 
        TotalWorkingYears ;
   IF MISSING( TrainingTimesLastYear ) THEN S_TrainingTimesLastYear  = . ;
   ELSE S_TrainingTimesLastYear
          =    -2.16888105917952 +     0.77698592292164 * 
        TrainingTimesLastYear ;
   IF MISSING( WorkLifeBalance ) THEN S_WorkLifeBalance  = . ;
   ELSE S_WorkLifeBalance  =    -3.90838926245552 +     1.43126662342699 * 
        WorkLifeBalance ;
   IF MISSING( YearsAtCompany ) THEN S_YearsAtCompany  = . ;
   ELSE S_YearsAtCompany  =    -1.16230904611766 +     0.16728283396635 * 
        YearsAtCompany ;
   IF MISSING( YearsInCurrentRole ) THEN S_YearsInCurrentRole  = . ;
   ELSE S_YearsInCurrentRole  =    -1.19435031741564 +     0.28344767509024 * 
        YearsInCurrentRole ;
   IF MISSING( YearsSinceLastPromotion ) THEN S_YearsSinceLastPromotion  = . ;
   ELSE S_YearsSinceLastPromotion
          =    -0.68707718328579 +     0.30464016366539 * 
        YearsSinceLastPromotion ;
   IF MISSING( YearsWithCurrManager ) THEN S_YearsWithCurrManager  = . ;
   ELSE S_YearsWithCurrManager
          =    -1.17887032946267 +     0.28265729936495 * YearsWithCurrManager
         ;
END;
*** *************************;
*** Writing the Node Attrition ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_Attrition1  =    -0.29377152153706 * S_Age  +    -0.07080233918042 * 
        S_BusinessTravel  +    -0.15193818218447 * S_DailyRate
          +     0.04226375743137 * S_Department  +     0.31473407222741 * 
        S_DistanceFromHome  +      0.0660545265502 * S_Education
          +    -0.01073127719735 * S_EducationFiled  +    -0.07302853224708 * 
        S_EmployeeNumber  +    -0.33001046190038 * S_EnvironmentSatisfaction
          +    -0.18227807855931 * S_Gender  +     0.05818335901084 * 
        S_HourlyRate  +    -0.42210975268493 * S_JobInvolvement
          +    -0.02780222136562 * S_JobLevel  +     0.08227968144226 * 
        S_JobRole  +    -0.36801124244892 * S_JobSatisfaction
          +     0.46217653321787 * S_MartialStatus  +    -0.30187219054466 * 
        S_MonthlyIncome  +    -0.02183082334009 * S_MonthlyRate
          +      0.3356766248035 * S_NumCompaniesWorked
          +    -0.78627361837061 * S_OverTime  +    -0.32202160903214 * 
        S_PercentSalaryHike  +     0.29028518807436 * S_PerformanceRating
          +    -0.11346061737281 * S_RelationshipSatisfaction
          +    -0.15174879505757 * S_StockOptionLevel
          +    -0.24569123671249 * S_TotalWorkingYears
          +    -0.21421199293408 * S_TrainingTimesLastYear
          +    -0.12783177378577 * S_WorkLifeBalance
          +     0.09872867215359 * S_YearsAtCompany  +    -0.58007611547298 * 
        S_YearsInCurrentRole  +     0.53798916818585 * 
        S_YearsSinceLastPromotion  +    -0.24404035516564 * 
        S_YearsWithCurrManager ;
   P_Attrition1  =    -2.31407863057983 + P_Attrition1 ;
   P_Attrition0  = 0; 
   _MAX_ = MAX (P_Attrition1 , P_Attrition0 );
   _SUM_ = 0.; 
   P_Attrition1  = EXP(P_Attrition1  - _MAX_);
   _SUM_ = _SUM_ + P_Attrition1 ;
   P_Attrition0  = EXP(P_Attrition0  - _MAX_);
   _SUM_ = _SUM_ + P_Attrition0 ;
   P_Attrition1  = P_Attrition1  / _SUM_;
   P_Attrition0  = P_Attrition0  / _SUM_;
END;
ELSE DO;
   P_Attrition1  = .;
   P_Attrition0  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_Attrition1  =     0.16182048040455;
   P_Attrition0  =     0.83817951959544;
END;
*** *************************;
*** Writing the I_Attrition  AND U_Attrition ;
*** *************************;
_MAXP_ = P_Attrition1 ;
I_Attrition  = "1" ;
U_Attrition  =                    1;
IF( _MAXP_ LT P_Attrition0  ) THEN DO; 
   _MAXP_ = P_Attrition0 ;
   I_Attrition  = "0" ;
   U_Attrition  =                    0;
END;
********************************;
*** End Scoring Code for Neural;
********************************;
