if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'GASPRICE'
'GOLDPRICE'
'NEWSPOLARITY'
'OILPRICE'
'POLARITY_CAT'
'SILVERPRICE'
) then ROLE='INPUT';
else delete;
end;
