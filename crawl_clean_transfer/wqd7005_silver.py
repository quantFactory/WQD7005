from urllib.request import Request, urlopen
import urllib
import json
import pymysql
import string
from datetime import datetime



url = "https://advcharts.investing.com/advinion2016/advanced-charts/1/1/8/GetRecentHistory?strSymbol=8836&iTop=1500&strPriceType=bid&strFieldsMode=allFields&strExtraData=lang_ID=1&strTimeFrame=1D"

class Silver:
    def __init__(self, url):
        self.url = url

    def crawl_data(self):
        response = urllib.request.urlopen(self.url)
        silver_data_decode = response.read().decode("utf-8")
        silver_raw_json = json.loads(silver_data_decode)
        try:
            silver_list = silver_raw_json["data"]
            for i in silver_list:
                self.data_transfer(i)
        except KeyError:
            print("Invalid Key!!!")

    def data_transfer(self, data):
        conn = pymysql.connect(host="127.0.0.1", user="root", passwd="123456", db="mysql")
        cur = conn.cursor()
        try:
            cur.execute("USE stockDB")
            sql_query = "INSERT INTO Silver_table (silverdate, openprice, highprice, lowprice, closeprice, volume)" \
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
            conn.close()

silver_data = Silver(url)
silver_data.crawl_data()