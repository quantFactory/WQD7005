* ;
*Variable: goldprice;
* ;
Label REP_goldprice= 'Replacement: goldprice';
REP_goldprice= goldprice;
if goldprice eq . then REP_goldprice = .;
else
if goldprice<14.526408636 then REP_goldprice=14.526408636;
else
if goldprice>15.419591599 then REP_goldprice=15.419591599;
