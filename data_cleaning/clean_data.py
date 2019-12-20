#importing required libraries

from scipy import stats
import matplotlib.pyplot as plt
from sklearn import preprocessing
import timestring
import datetime
import pandas as pd
import numpy as np
import seaborn as sns
from textblob import TextBlob
import nltk
import tslearn


# An array is defined to store the keyworkds that are
# represntntives of missing values (N/A,..)

missing_values = ["null","n/a", "na", "--"]
#reading CSV dataset uisng pandas read method
stock = pd.read_csv("AprilData.csv", sep = ",", na_values = missing_values)
#reading  news CSV dtaset uisng pandas read method
news = pd.read_csv("newsdata.csv", sep=",",na_values = missing_values)
#reading CSV dataset for combined files which includes the combination
#of closing prices of stocks and comoodities
combained = pd.read_csv("combined.csv", sep = ",",na_values = missing_values)
news.head()

#storing the sum of all null values in stock dataframe
stock_missing = stock.isnull().sum()
#storing the sum of all null values in news dataframe
news_missing = news.isnull().sum()

# fixing the date feature of news dataset
news["newsdate"]= news["newsdate"].apply(lambda x:timestring.Date(x).date)

#creating news section for each stock
PETRONAS_news

TM_news = TM_news.iloc[np.where(news["companyname"]=="TM")]


GAMUDA_news = GAMUDA_news.iloc[np.where(news["companyname"]=="GAMUDA")]


AIRASIA_news = AIRASIA_news.iloc[np.where(news["companyname"]=="AIRASIA")]

#creating news polarity category (positive,Negative and neutral)

if (x > 0):
    return "positive"
elif (x < 0):
    return "negative"
else:
    return "neutral"

PETRONAS_news1["headlinepolarity_cat"] = PETRONAS_news1["headlinepolarity"].apply(polarity_cat)
PETRONAS_news1

TM_news1["headlinepolarity_cat"] = TM_news1["headlinepolarity"].apply(polarity_cat)
TM_news1

GAMUDA_news1["headlinepolarity_cat"] = GAMUDA_news1["headlinepolarity"].apply(polarity_cat)
GAMUDA_news1

AIRASIA_news1["headlinepolarity_cat"] = AIRASIA_news1["headlinepolarity"].apply(polarity_cat)

#create a CSV dataset output for combines stocks , commodity and news
TM = pd.concat([TM_stock["lastprice"],TM_combained["goldprice"],
                     TM_combained["silverprice"],TM_combained["oilprice"],
                     TM_combained["gasprice"],TM_news1["polarity"]]
                      , keys = ["stockprice","goldprice","silverprice","oilprice","gasprice","newspolarity"], axis = 1).ffill().bfill()

#create a CSV dataset output for combines stocks , commodity and news(AirAsia)
AIRASIA = pd.concat([AIRASIA_stock["lastprice"],AIRASIA_combained["goldprice"],
                     AIRASIA_combained["silverprice"],AIRASIA_combained["oilprice"],
                     AIRASIA_combained["gasprice"],AIRASIA_news1["polarity"]]
                      , keys = ["stockprice","goldprice","silverprice","oilprice","gasprice","newspolarity"], axis = 1).ffill().bfill()
