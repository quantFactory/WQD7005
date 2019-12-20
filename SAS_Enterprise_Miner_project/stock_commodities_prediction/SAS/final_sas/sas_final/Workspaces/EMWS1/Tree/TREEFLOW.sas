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
IF  NOT MISSING(OilPrice ) AND 
  OilPrice  <     70.7200012207035 THEN DO;
  _NODE_  =                    3;
  _LEAF_  =                    1;
  P_StockPrice  =                2.634;
  END;
ELSE DO;
  IF  NOT MISSING(GasPrice ) AND 
         2.5034999847412 <= GasPrice  THEN DO;
    _NODE_  =                    6;
    _LEAF_  =                    3;
    P_StockPrice  =                 2.49;
    END;
  ELSE DO;
    _NODE_  =                    5;
    _LEAF_  =                    2;
    P_StockPrice  =     2.57166666666666;
    END;
  END;

*****  RESIDUALS R_ *************;
IF MISSING( StockPrice ) THEN R_StockPrice  = .;
ELSE R_StockPrice  = StockPrice  - P_StockPrice ;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

