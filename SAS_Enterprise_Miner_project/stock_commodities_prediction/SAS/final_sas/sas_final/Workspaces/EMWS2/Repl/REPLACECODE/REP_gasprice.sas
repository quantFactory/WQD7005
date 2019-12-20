* ;
*Variable: gasprice;
* ;
Label REP_gasprice= 'Replacement: gasprice';
REP_gasprice= gasprice;
if gasprice eq . then REP_gasprice = .;
else
if gasprice<2.353228415 then REP_gasprice=2.353228415;
else
if gasprice>2.8414858417 then REP_gasprice=2.8414858417;
