if NAME="gasprice" then do;
ROLE="REJECTED";
COMMENT= "Replaced by Repl";
end;
else
if NAME="REP_gasprice" then do;
ROLE="INPUT";
LEVEL="INTERVAL";
end;
else
if NAME="goldprice" then do;
ROLE="REJECTED";
COMMENT= "Replaced by Repl";
end;
else
if NAME="REP_goldprice" then do;
ROLE="INPUT";
LEVEL="INTERVAL";
end;
else
if NAME="newspolarity" then do;
ROLE="REJECTED";
COMMENT= "Replaced by Repl";
end;
else
if NAME="REP_newspolarity" then do;
ROLE="INPUT";
LEVEL="INTERVAL";
end;
else
if NAME="oilprice" then do;
ROLE="REJECTED";
COMMENT= "Replaced by Repl";
end;
else
if NAME="REP_oilprice" then do;
ROLE="INPUT";
LEVEL="INTERVAL";
end;
else
if NAME="silverprice" then do;
ROLE="REJECTED";
COMMENT= "Replaced by Repl";
end;
else
if NAME="REP_silverprice" then do;
ROLE="INPUT";
LEVEL="INTERVAL";
end;
