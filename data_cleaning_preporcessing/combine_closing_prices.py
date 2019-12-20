import pandas as pd
import numpy as np
import seaborn as sns
from textblob import TextBlob
import nltk
import tslearn
from scipy import stats
import matplotlib.pyplot as plt
from sklearn import preprocessing
import timestring
import datetime

# in this part of project all closing prices plus news polarity
#are combined for the purpose of further analysis such as finding
#corelation between stocks and commodities and news.

# read csv values, save them to dataframe
gold = pd.read_csv("gold.csv", sep = ",",na_values = missing_values)
silver = pd.read_csv("silver.csv", sep = ",",na_values = missing_values)
oil = pd.read_csv("oil.csv", sep = ",",na_values = missing_values)
gas = pd.read_csv("gas.csv", sep = ",",na_values = missing_values)

#dropping ID and created at columns
gold.drop(["Id","created_at"], axis=1, inplace=True)
silver.drop(["Id","created_at"], axis=1, inplace=True)
oil.drop(["Id","created_at"], axis=1, inplace=True)
gas.drop(["Id","created_at"], axis=1, inplace=True)

# using concat function to attach all closing prices togheter
combained = pd.concat([gold["golddate"],gold["closeprice"],silver["closeprice"],
                     oil["closeprice"],gas["closeprice"]
                      ]
                      , keys = ["date","goldprice","silverprice","oilprice","gasprice"], axis = 1).ffill().bfill()


combained.to_csv("combined.csv", sep=',', encoding='utf-8')
