if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'REP_GASPRICE'
'REP_GOLDPRICE'
'REP_NEWSPOLARITY'
'REP_OILPRICE'
'REP_SILVERPRICE'
'POLARITY_CAT'
) then ROLE='INPUT';
else delete;
end;
