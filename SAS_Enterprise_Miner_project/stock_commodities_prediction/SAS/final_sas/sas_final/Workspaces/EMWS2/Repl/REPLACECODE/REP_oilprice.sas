* ;
*Variable: oilprice;
* ;
Label REP_oilprice= 'Replacement: oilprice';
REP_oilprice= oilprice;
if oilprice eq . then REP_oilprice = .;
else
if oilprice<67.032234569 then REP_oilprice=67.032234569;
else
if oilprice>76.157767327 then REP_oilprice=76.157767327;
