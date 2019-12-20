****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;
 
******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH I_Attrition  $    1;
LENGTH _WARN_  $    4;
 
******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_Attrition1 = 'Predicted: Attrition=1' ;
label P_Attrition0 = 'Predicted: Attrition=0' ;
label Q_Attrition1 = 'Unadjusted P: Attrition=1' ;
label Q_Attrition0 = 'Unadjusted P: Attrition=0' ;
label V_Attrition1 = 'Validated: Attrition=1' ;
label V_Attrition0 = 'Validated: Attrition=0' ;
label I_Attrition = 'Into: Attrition' ;
label U_Attrition = 'Unnormalized Into: Attrition' ;
label _WARN_ = 'Warnings' ;
 
 
******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_1 $      1; DROP _ARBFMT_1;
_ARBFMT_1 = ' '; /* Initialize to avoid warning. */
 
 
******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(TotalWorkingYears ) AND
  TotalWorkingYears  <                  1.5 THEN DO;
  IF  NOT MISSING(OverTime ) AND
    OverTime  <                  0.5 THEN DO;
    _NODE_  =                    4;
    _LEAF_  =                    1;
    P_Attrition1  =     0.84615384615384;
    P_Attrition0  =     0.15384615384615;
    Q_Attrition1  =     0.84615384615384;
    Q_Attrition0  =     0.15384615384615;
    V_Attrition1  =     0.66666666666666;
    V_Attrition0  =     0.33333333333333;
    I_Attrition  = '1' ;
    U_Attrition  =                    1;
    END;
  ELSE DO;
    _NODE_  =                    5;
    _LEAF_  =                    2;
    P_Attrition1  =     0.46666666666666;
    P_Attrition0  =     0.53333333333333;
    Q_Attrition1  =     0.46666666666666;
    Q_Attrition0  =     0.53333333333333;
    V_Attrition1  =                  0.2;
    V_Attrition0  =                  0.8;
    I_Attrition  = '0' ;
    U_Attrition  =                    0;
    END;
  END;
ELSE DO;
  _NODE_  =                    3;
  _LEAF_  =                    3;
  P_Attrition1  =     0.13770053475935;
  P_Attrition0  =     0.86229946524064;
  Q_Attrition1  =     0.13770053475935;
  Q_Attrition0  =     0.86229946524064;
  V_Attrition1  =     0.14779874213836;
  V_Attrition0  =     0.85220125786163;
  I_Attrition  = '0' ;
  U_Attrition  =                    0;
  END;
 
****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
 
drop _LEAF_;
