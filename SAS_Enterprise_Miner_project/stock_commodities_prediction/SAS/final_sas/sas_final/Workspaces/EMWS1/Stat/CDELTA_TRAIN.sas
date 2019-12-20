if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'GASPRICE'
'GOLDPRICE'
'NEWSPOLARITY'
'OILPRICE'
) then ROLE='INPUT';
else delete;
end;
