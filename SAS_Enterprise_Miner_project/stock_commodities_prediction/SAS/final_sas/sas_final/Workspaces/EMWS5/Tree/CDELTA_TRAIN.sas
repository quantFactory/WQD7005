if upcase(NAME) = "AGE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "BUSINESSTRAVEL" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "DAILYRATE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "DEPARTMENT" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "DISTANCEFROMHOME" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "EDUCATION" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "EDUCATIONFILED" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "EMPLOYEENUMBER" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "ENVIRONMENTSATISFACTION" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "GENDER" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "HOURLYRATE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "JOBINVOLVEMENT" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "JOBLEVEL" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "JOBROLE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "JOBSATISFACTION" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "MARTIALSTATUS" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "MONTHLYINCOME" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "MONTHLYRATE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "NUMCOMPANIESWORKED" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "PERCENTSALARYHIKE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "PERFORMANCERATING" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "Q_ATTRITION0" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "Q_ATTRITION1" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "RELATIONSHIPSATISFACTION" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "STOCKOPTIONLEVEL" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TRAININGTIMESLASTYEAR" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "WORKLIFEBALANCE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "YEARSATCOMPANY" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "YEARSINCURRENTROLE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "YEARSSINCELASTPROMOTION" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "YEARSWITHCURRMANAGER" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "_NODE_" then do;
ROLE = "SEGMENT";
LEVEL = "NOMINAL";
end;
