****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;
 
******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH _WARN_  $    4;
 
******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_StockPrice = 'Predicted: StockPrice' ;
label R_StockPrice = 'Residual: StockPrice' ;
label _WARN_ = 'Warnings' ;
 
 
 
******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(NewsPolarity ) AND
  NewsPolarity  <     0.30225790362531 THEN DO;
  _NODE_  =                    3;
  _LEAF_  =                    1;
  P_StockPrice  =     6.57428571428571;
  END;
ELSE DO;
  IF  NOT MISSING(OilPrice ) AND
         71.840000152588 <= OilPrice  THEN DO;
    _NODE_  =                    6;
    _LEAF_  =                    3;
    P_StockPrice  =                 6.69;
    END;
  ELSE DO;
    _NODE_  =                    5;
    _LEAF_  =                    2;
    P_StockPrice  =                6.618;
    END;
  END;
 
*****  RESIDUALS R_ *************;
IF MISSING( StockPrice ) THEN R_StockPrice  = .;
ELSE R_StockPrice  = StockPrice  - P_StockPrice ;
 
****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
 
drop _LEAF_;
