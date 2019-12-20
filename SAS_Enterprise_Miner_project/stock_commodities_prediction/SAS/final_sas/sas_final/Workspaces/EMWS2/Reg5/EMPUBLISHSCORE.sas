*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;


drop _DM_BAD;
_DM_BAD=0;

*** Check REP_gasprice for missing values ;
if missing( REP_gasprice ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check REP_goldprice for missing values ;
if missing( REP_goldprice ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check REP_newspolarity for missing values ;
if missing( REP_newspolarity ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check REP_oilprice for missing values ;
if missing( REP_oilprice ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Generate dummy variables for polarity_cat ;
drop _0_0 _0_1 ;
if missing( polarity_cat ) then do;
   _0_0 = .;
   _0_1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm8 $ 8; drop _dm8 ;
   _dm8 = put( polarity_cat , $CHAR8. );
   %DMNORMIP( _dm8 )
   if _dm8 = 'POSITIVE'  then do;
      _0_0 = -1;
      _0_1 = -1;
   end;
   else if _dm8 = 'NEUTRAL'  then do;
      _0_0 = 0;
      _0_1 = 1;
   end;
   else if _dm8 = 'NEGATIVE'  then do;
      _0_0 = 1;
      _0_1 = 0;
   end;
   else do;
      _0_0 = .;
      _0_1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _LP0 =                2.564;
   goto REG5DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: REP_gasprice ;
_TEMP = REP_gasprice ;
_LP0 = _LP0 + (    0.34649239239096 * _TEMP);

***  Effect: REP_goldprice ;
_TEMP = REP_goldprice ;
_LP0 = _LP0 + (   -0.01945916000338 * _TEMP);

***  Effect: REP_newspolarity ;
_TEMP = REP_newspolarity ;
_LP0 = _LP0 + (    0.03027893523755 * _TEMP);

***  Effect: REP_oilprice ;
_TEMP = REP_oilprice ;
_LP0 = _LP0 + (    0.01322146901618 * _TEMP);

***  Effect: polarity_cat ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.05442730519232) * _TEMP * _0_0;
_LP0 = _LP0 + (    0.05961139809289) * _TEMP * _0_1;
*--- Intercept ---*;
_LP0 = _LP0 + (    0.99891539821116);

REG5DR1:

*** Predicted Value;
label P_stockprice = 'Predicted: stockprice' ;
P_stockprice = _LP0;


*************************************;
***** end scoring code for regression;
*************************************;
