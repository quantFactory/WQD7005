 
/*-------------------------------------------------*/
/* Varclus Score Code Begins*/
/*-------------------------------------------------*/
 
Clus1 = 0 ; /*---Cluster Component 1------ */
Clus2 = 0 ; /*---Cluster Component 2------ */
Clus2 = Clus2+0.53518725702076 * (gasprice - 2.59735712834766)/0.08137623778295;
Clus1 = Clus1+0.38236012188015 * (goldprice - 14.9730001177106)/0.14886382723575;
Clus1 = Clus1+0.15320588911508 * (newspolarity - 0.36245323761878)/0.34898400441679;
Clus2 = Clus2+-0.53518725702076 * (oilprice - 71.5950009482247)/1.52092212639709;
Clus1 = Clus1+0.3823999910204 * (silverprice - 14.9729286602564)/0.14904638923777;
Clus1 = Clus1+-0.28806082232814 * (stockprice - 6.64464285714285)/0.08863082579116;
