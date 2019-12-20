if upcase(NAME) eq "_TSID_"   then role="ID" ;
if upcase(NAME) eq "_NAMEID_" then role="ID" ;
if upcase(NAME) eq "_TSNAME_" then role="CROSSID" ;
if upcase(NAME) eq "_TSVALUE_" then role="TARGET" ;
if upcase(NAME) eq "_ROLE_"   then role="REJECTED" ;
