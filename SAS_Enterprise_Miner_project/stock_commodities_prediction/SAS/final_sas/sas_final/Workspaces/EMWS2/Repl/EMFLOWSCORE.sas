* ;
* Variable: gasprice ;
* ;
Label REP_gasprice='Replacement: gasprice';
REP_gasprice =gasprice ;
if gasprice  eq . then REP_gasprice = . ;
else
if gasprice <2.353228415  then REP_gasprice  = 2.353228415 ;
else
if gasprice >2.8414858417  then REP_gasprice  = 2.8414858417 ;
* ;
* Variable: goldprice ;
* ;
Label REP_goldprice='Replacement: goldprice';
REP_goldprice =goldprice ;
if goldprice  eq . then REP_goldprice = . ;
else
if goldprice <14.526408636  then REP_goldprice  = 14.526408636 ;
else
if goldprice >15.419591599  then REP_goldprice  = 15.419591599 ;
* ;
* Variable: newspolarity ;
* ;
Label REP_newspolarity='Replacement: newspolarity';
REP_newspolarity =newspolarity ;
if newspolarity  eq . then REP_newspolarity = . ;
else
if newspolarity <-1.134456853  then REP_newspolarity  = -1.134456853 ;
else
if newspolarity >1.8567520187  then REP_newspolarity  = 1.8567520187 ;
* ;
* Variable: oilprice ;
* ;
Label REP_oilprice='Replacement: oilprice';
REP_oilprice =oilprice ;
if oilprice  eq . then REP_oilprice = . ;
else
if oilprice <67.032234569  then REP_oilprice  = 67.032234569 ;
else
if oilprice >76.157767327  then REP_oilprice  = 76.157767327 ;
* ;
* Variable: silverprice ;
* ;
Label REP_silverprice='Replacement: silverprice';
REP_silverprice =silverprice ;
if silverprice  eq . then REP_silverprice = . ;
else
if silverprice <14.525789493  then REP_silverprice  = 14.525789493 ;
else
if silverprice >15.420067828  then REP_silverprice  = 15.420067828 ;
