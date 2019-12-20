* ;
*Variable: newspolarity;
* ;
Label REP_newspolarity= 'Replacement: newspolarity';
REP_newspolarity= newspolarity;
if newspolarity eq . then REP_newspolarity = .;
else
if newspolarity<-1.134456853 then REP_newspolarity=-1.134456853;
else
if newspolarity>1.8567520187 then REP_newspolarity=1.8567520187;
