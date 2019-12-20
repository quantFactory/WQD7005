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
label R_stockprice = 'Residual: stockprice' ;
label _WARN_ = 'Warnings' ;



******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(oilprice ) AND 
      71.8500022888185 <= oilprice  THEN DO;
  _NODE_  =                    3;
  _LEAF_  =                    3;
  P_stockprice  =     2.89111111111111;
  V_stockprice  =                    0;
  END;
ELSE DO;
  IF  NOT MISSING(oilprice ) AND 
    oilprice  <     71.1399993896485 THEN DO;
    _NODE_  =                    4;
    _LEAF_  =                    1;
    P_stockprice  =                3.102;
    V_stockprice  =                    0;
    END;
  ELSE DO;
    _NODE_  =                    5;
    _LEAF_  =                    2;
    P_stockprice  =                 3.04;
    V_stockprice  =                    0;
    END;
  END;

*****  RESIDUALS R_ *************;
IF MISSING( stockprice ) THEN R_stockprice  = .;
ELSE R_stockprice  = stockprice  - P_stockprice ;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

