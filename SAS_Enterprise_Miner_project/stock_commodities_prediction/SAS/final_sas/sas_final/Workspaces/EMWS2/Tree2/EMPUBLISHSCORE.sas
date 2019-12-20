****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;
 
******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH _WARN_  $    4;
 
******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_stockprice = 'Predicted: stockprice' ;
label V_stockprice = 'Validated: stockprice' ;
label _WARN_ = 'Warnings' ;
 
 
******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_8 $      8; DROP _ARBFMT_8;
_ARBFMT_8 = ' '; /* Initialize to avoid warning. */
 
 
******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(oilprice ) AND
       72.060001373291 <= oilprice  THEN DO;
  _NODE_  =                    3;
  _LEAF_  =                    3;
  P_stockprice  =     3.46428571428571;
  V_stockprice  =                    0;
  END;
ELSE DO;
  _ARBFMT_8 = PUT( polarity_cat , $CHAR8.);
   %DMNORMIP( _ARBFMT_8);
  IF _ARBFMT_8 IN ('NEUTRAL' ) THEN DO;
    _NODE_  =                    5;
    _LEAF_  =                    2;
    P_stockprice  =     3.21833333333333;
    V_stockprice  =                    0;
    END;
  ELSE DO;
    _NODE_  =                    4;
    _LEAF_  =                    1;
    P_stockprice  =     3.08714285714285;
    V_stockprice  =                    0;
    END;
  END;
 
****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
 
drop _LEAF_;
