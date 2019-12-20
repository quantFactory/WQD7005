if upcase(NAME) = "POLARITY_CAT" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "Q_STOCKPRICE" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "REP_GASPRICE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "REP_GOLDPRICE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "REP_NEWSPOLARITY" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "REP_OILPRICE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "REP_SILVERPRICE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "_NODE_" then do;
ROLE = "SEGMENT";
LEVEL = "NOMINAL";
end;
