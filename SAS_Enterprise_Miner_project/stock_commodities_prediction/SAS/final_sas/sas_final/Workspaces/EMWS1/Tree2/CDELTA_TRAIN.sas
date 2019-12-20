if upcase(NAME) = "GASPRICE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "GOLDPRICE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "Q_STOCKPRICE" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "_NODE_" then do;
ROLE = "SEGMENT";
LEVEL = "NOMINAL";
end;
