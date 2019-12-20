* ;
*Variable: silverprice;
* ;
Label REP_silverprice= 'Replacement: silverprice';
REP_silverprice= silverprice;
if silverprice eq . then REP_silverprice = .;
else
if silverprice<14.525789493 then REP_silverprice=14.525789493;
else
if silverprice>15.420067828 then REP_silverprice=15.420067828;
