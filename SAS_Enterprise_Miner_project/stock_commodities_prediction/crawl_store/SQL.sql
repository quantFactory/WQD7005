create database DataMiningAssignment;

use DataMiningAssignment;
create table StockDataFinal(

Id INT AUTO_INCREMENT PRIMARY KEY,
stockdate varchar (50),
sector varchar (50),
subsector varchar (50),
companyname varchar (50),
stockcode varchar (50),
openprice varchar (50),
highprice varchar (50),
lowprice varchar (50),
lastprice varchar (50),
volume varchar (50),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                        
);

select * from StockDataFinal;


create database DataMiningAssignment;

use DataMiningAssignment;
create table StockDataFinal(

Id INT AUTO_INCREMENT PRIMARY KEY,
stockdate varchar (50),
companyname varchar (50),
stockcode varchar (50),
openprice varchar (50),
highprice varchar (50),
lowprice varchar (50),
lastprice varchar (50),
volume varchar (50),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                        
);

select * from StockDataFinal;

select count(*) from StockDataFinal;

create table SilverDataFinal(

Id INT AUTO_INCREMENT PRIMARY KEY,
silverdate varchar (50),
openprice varchar (50),
highprice varchar (50),
lowprice varchar (50),
closeprice varchar (50),
volume varchar (50),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                        
);

select * from SilverDataFinal;

use DataMiningAssignment;
create table OilDataFinal(

Id INT AUTO_INCREMENT PRIMARY KEY,
oildate varchar (50),
openprice varchar (50),
highprice varchar (50),
lowprice varchar (50),
closeprice varchar (50),
volume varchar (50),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                        
);

select * from OilDataFinal;

create table GoldDataFinal(

Id INT AUTO_INCREMENT PRIMARY KEY,
golddate varchar (50),
openprice varchar (50),
highprice varchar (50),
lowprice varchar (50),
closeprice varchar (50),
volume varchar (50),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                        
);

select * from GoldDataFinal;

create table GasDataFinal(

Id INT AUTO_INCREMENT PRIMARY KEY,
gasdate varchar (50),
openprice varchar (50),
highprice varchar (50),
lowprice varchar (50),
closeprice varchar (50),
volume varchar (50),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                        
);

select * from GasDataFinal;

create database MLAssignment;

use MLAssignment;
create table weatherData(

Id INT AUTO_INCREMENT PRIMARY KEY,
dateData varchar (50),
temperature varchar (30),
dewpoint varchar(30),
pressure varchar(30),
wind_speed varchar(30),
visibility varchar(30),
max_temperature varchar(30),
min_temperature varchar(30),
max_humidity varchar(30),
min_humidity varchar(30),
gdegreedays varchar(30),
fog varchar(30),
hail varchar(30),
snow varchar(30),
rain varchar(30),
thunder varchar(30),
tornado varchar(30),
snowfall varchar(30),
icon varchar(30),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                        
);


select * from weatherData;
