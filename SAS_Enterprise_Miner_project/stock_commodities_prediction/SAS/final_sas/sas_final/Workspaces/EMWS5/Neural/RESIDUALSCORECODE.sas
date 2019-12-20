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
      F_Attrition  $ 1
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

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label I_Attrition = 'Into: Attrition' ;

      label F_Attrition = 'From: Attrition' ;

      label U_Attrition = 'Unnormalized Into: Attrition' ;

      label P_Attrition1 = 'Predicted: Attrition=1' ;

      label R_Attrition1 = 'Residual: Attrition=1' ;

      label P_Attrition0 = 'Predicted: Attrition=0' ;

      label R_Attrition0 = 'Residual: Attrition=0' ;

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
*** Writing the Node intvl ;
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
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -0.42221185081274 * S_Age  +     0.12286384142427 * 
        S_BusinessTravel  +    -1.04077310570392 * S_DailyRate
          +     0.36846159103824 * S_Department  +    -0.10395476260575 * 
        S_DistanceFromHome  +      0.3264058298312 * S_Education
          +    -0.41690759550758 * S_EducationFiled  +     0.14106889108094 * 
        S_EmployeeNumber  +     0.51980408613708 * S_EnvironmentSatisfaction
          +     0.08626885931984 * S_Gender  +     0.51745551391615 * 
        S_HourlyRate  +    -0.20098798833013 * S_JobInvolvement
          +     0.19001431616209 * S_JobLevel  +     0.19506516377216 * 
        S_JobRole  +    -0.37503023220722 * S_JobSatisfaction
          +    -0.65756063071422 * S_MartialStatus  +     0.17513300950899 * 
        S_MonthlyIncome  +    -0.68357196231627 * S_MonthlyRate
          +     0.20861347102825 * S_NumCompaniesWorked
          +    -0.79302332789846 * S_OverTime  +    -1.00375234685947 * 
        S_PercentSalaryHike  +     1.66438876841091 * S_PerformanceRating
          +    -0.89988935434255 * S_RelationshipSatisfaction
          +    -0.10487023151727 * S_StockOptionLevel
          +    -0.12665329073941 * S_TotalWorkingYears
          +     0.01591569617199 * S_TrainingTimesLastYear
          +     -0.1954579619934 * S_WorkLifeBalance
          +    -0.95391500740035 * S_YearsAtCompany  +     -0.6031751299791 * 
        S_YearsInCurrentRole  +    -0.54503544326067 * 
        S_YearsSinceLastPromotion  +     0.53334526053584 * 
        S_YearsWithCurrManager ;
   H12  =    -0.20403985096512 * S_Age  +     0.15386320917738 * 
        S_BusinessTravel  +     0.05426585485796 * S_DailyRate
          +    -0.36423719175938 * S_Department  +    -0.55061072134727 * 
        S_DistanceFromHome  +    -0.88281170849497 * S_Education
          +    -0.51303994768519 * S_EducationFiled  +     0.13612319707052 * 
        S_EmployeeNumber  +     -0.1912603113235 * S_EnvironmentSatisfaction
          +    -0.45544503086647 * S_Gender  +     -0.4159018436944 * 
        S_HourlyRate  +    -0.36532148437309 * S_JobInvolvement
          +    -0.25507588411961 * S_JobLevel  +     0.87246106519116 * 
        S_JobRole  +    -0.15088362828079 * S_JobSatisfaction
          +    -1.26186506765131 * S_MartialStatus  +     1.06529971938676 * 
        S_MonthlyIncome  +    -0.58642259650597 * S_MonthlyRate
          +    -2.13686818038854 * S_NumCompaniesWorked
          +     0.03413218303259 * S_OverTime  +    -0.06487951388912 * 
        S_PercentSalaryHike  +    -0.16315893513038 * S_PerformanceRating
          +     0.05530434074469 * S_RelationshipSatisfaction
          +    -0.10597454823199 * S_StockOptionLevel
          +     0.41459972166531 * S_TotalWorkingYears
          +      0.2819309609019 * S_TrainingTimesLastYear
          +     0.20985600599043 * S_WorkLifeBalance
          +     0.04902965147755 * S_YearsAtCompany  +     0.67409178558089 * 
        S_YearsInCurrentRole  +    -0.22568493266074 * 
        S_YearsSinceLastPromotion  +     0.07331963908446 * 
        S_YearsWithCurrManager ;
   H13  =    -0.32017208914242 * S_Age  +    -0.23243622494708 * 
        S_BusinessTravel  +     0.40426574965922 * S_DailyRate
          +    -0.23340560631615 * S_Department  +     0.27225271445562 * 
        S_DistanceFromHome  +    -0.71965691895948 * S_Education
          +     0.14056119681471 * S_EducationFiled  +    -0.23833134030546 * 
        S_EmployeeNumber  +    -1.12005710859044 * S_EnvironmentSatisfaction
          +     -0.5328278734822 * S_Gender  +    -0.44747356911977 * 
        S_HourlyRate  +    -0.65405883621465 * S_JobInvolvement
          +    -0.53526172630853 * S_JobLevel  +     0.52141470252512 * 
        S_JobRole  +    -0.46129993320411 * S_JobSatisfaction
          +     0.35179704904215 * S_MartialStatus  +    -0.28622942371842 * 
        S_MonthlyIncome  +     0.17787555669047 * S_MonthlyRate
          +    -0.24608522945391 * S_NumCompaniesWorked
          +    -0.87612139973935 * S_OverTime  +     0.04532457441793 * 
        S_PercentSalaryHike  +    -0.52627956910194 * S_PerformanceRating
          +     0.33514800610946 * S_RelationshipSatisfaction
          +    -0.33763844477388 * S_StockOptionLevel
          +     0.24347098025162 * S_TotalWorkingYears
          +    -0.09460295772134 * S_TrainingTimesLastYear
          +    -0.16284490795795 * S_WorkLifeBalance
          +     0.60838707134404 * S_YearsAtCompany  +    -0.19497432644957 * 
        S_YearsInCurrentRole  +     1.62249266256989 * 
        S_YearsSinceLastPromotion  +    -0.93925512034058 * 
        S_YearsWithCurrManager ;
   H11  =     0.01523650819521 + H11 ;
   H12  =    -0.56542256812855 + H12 ;
   H13  =    -0.69051897823093 + H13 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
END;
*** *************************;
*** Writing the Node Attrition ;
*** *************************;

*** Generate dummy variables for Attrition ;
drop Attrition1 Attrition0 ;
label F_Attrition = 'From: Attrition' ;
length F_Attrition $ 1;
F_Attrition = put( Attrition , BEST1. );
%DMNORMIP( F_Attrition )
if missing( Attrition ) then do;
   Attrition1 = .;
   Attrition0 = .;
end;
else do;
   if F_Attrition = '0'  then do;
      Attrition1 = 0;
      Attrition0 = 1;
   end;
   else if F_Attrition = '1'  then do;
      Attrition1 = 1;
      Attrition0 = 0;
   end;
   else do;
      Attrition1 = .;
      Attrition0 = .;
   end;
end;
IF _DM_BAD EQ 0 THEN DO;
   P_Attrition1  =     1.83702450218071 * H11  +    -1.67068274744078 * H12
          +     2.47718341102947 * H13 ;
   P_Attrition1  =    -2.83273607986064 + P_Attrition1 ;
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
*** *****************************;
*** Writing the Residuals  of the Node Attrition ;
*** ******************************;
IF MISSING( Attrition1 ) THEN R_Attrition1  = . ;
ELSE R_Attrition1  = Attrition1  - P_Attrition1 ;
IF MISSING( Attrition0 ) THEN R_Attrition0  = . ;
ELSE R_Attrition0  = Attrition0  - P_Attrition0 ;
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
