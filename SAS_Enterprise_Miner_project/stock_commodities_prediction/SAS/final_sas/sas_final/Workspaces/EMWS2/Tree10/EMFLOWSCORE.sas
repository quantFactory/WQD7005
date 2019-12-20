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
_NODE_  =                    1;
_LEAF_  =                    1;
P_stockprice  =                2.564;
V_stockprice  =                2.615;
 
*****  RESIDUALS R_ *************;
IF MISSING( stockprice ) THEN R_stockprice  = .;
ELSE R_stockprice  = stockprice  - P_stockprice ;
 
****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
 
drop _LEAF_;
