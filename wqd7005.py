from urllib.request import Request, urlopen
import urllib
import string
from datetime import datetime
import json
import pymysql

url = "https://advcharts.investing.com/advinion2016/advanced-charts/1/1/8/GetRecentHistory?strSymbol=8836&iTop=1500&strPriceType=bid&strFieldsMode=allFields&strExtraData=lang_ID=1&strTimeFrame=1D"

class Gold:
    def __init__(self, url):
        self.url = url

    def crawl_data(self):
        response = urllib.request.urlopen(self.url)
        gold_data_decode = response.read().decode("utf-8")
        gold_raw_json = json.loads(gold_data_decode)
        try:
            gold_list = gold_raw_json["data"]
            for i in gold_list:
                self.data_trasfer(i)
        except KeyError:
            print("Error->Key is invalid")

    def data_trasfer(self, data):
        database_connection = pymysql.connect(host="127.0.0.1", user="root", passwd="123456", db="mysql")
        cur = database_connection.cursor()
        try:
            cur.execute("USE stockDB")
            sql_query = "INSERT INTO Gold_table (golddate, openprice, highprice, lowprice, closeprice, volume)" \
                        " VALUES (%s,%s,%s,%s,%s,%s)"
            try:
                cur.execute(sql_query,
                            (data["date"], data["open"], data["high"], data["low"], data["close"], data["volume"]))
                cur.connection.commit()
                print("--done--")
            except KeyError:
                print("Invalid Key!!!")

        finally:
            cur.close()
            database_connection.close()

gold_data = Gold(url)
gold_data.crawl_data()
