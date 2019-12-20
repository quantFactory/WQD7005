*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

drop _Y;
_Y = stockprice ;

drop _DM_BAD;
_DM_BAD=0;

*** Check gasprice for missing values ;
if missing( gasprice ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check goldprice for missing values ;
if missing( goldprice ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check newspolarity for missing values ;
if missing( newspolarity ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check oilprice for missing values ;
if missing( oilprice ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Generate dummy variables for polarity_cat ;
drop _0_0 ;
if missing( polarity_cat ) then do;
   _0_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm8 $ 8; drop _dm8 ;
   _dm8 = put( polarity_cat , $CHAR8. );
   %DMNORMIP( _dm8 )
   if _dm8 = 'POSITIVE'  then do;
      _0_0 = -1;
   end;
   else if _dm8 = 'NEUTRAL'  then do;
      _0_0 = 1;
   end;
   else do;
      _0_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _LP0 =               3.2585;
   goto REG2DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: gasprice ;
_TEMP = gasprice ;
_LP0 = _LP0 + (    0.62383738033481 * _TEMP);

***  Effect: goldprice ;
_TEMP = goldprice ;
_LP0 = _LP0 + (   -0.11518992816006 * _TEMP);

***  Effect: newspolarity ;
_TEMP = newspolarity ;
_LP0 = _LP0 + (   -0.02535923501541 * _TEMP);

***  Effect: oilprice ;
_TEMP = oilprice ;
_LP0 = _LP0 + (    0.11169979668424 * _TEMP);

***  Effect: polarity_cat ;
_TEMP = 1;
_LP0 = _LP0 + (    0.01730323878398) * _TEMP * _0_0;
*--- Intercept ---*;
_LP0 = _LP0 + (    -4.6481008076733);

REG2DR1:

*** Predicted Value, Error, and Residual;
label P_stockprice = 'Predicted: stockprice' ;
P_stockprice = _LP0;

drop _R;
if _Y = . then do;
   R_stockprice = .;
end;
else do;
   _R = _Y - _LP0;
    label R_stockprice = 'Residual: stockprice' ;
   R_stockprice = _R;
end;

*************************************;
***** end scoring code for regression;
*************************************;
