from urllib.request import Request
import urllib
import json
import pymysql

url = "https://advcharts.investing.com/advinion2016/advanced-charts/1/1/8/GetRecentHistory?strSymbol=8833&iTop=1500&strPriceType=bid&strFieldsMode=allFields&strExtraData=lang_ID=1&strTimeFrame=1D"

class Oil:
    def __init__(self, url):
        self.url = url

    def crawl_data(self):
        response = urllib.request.urlopen(self.url)
        oil_data_decode = response.read().decode("utf-8")
        oil_raw_json = json.loads(oil_data_decode)
        try:
            oil_list = oil_raw_json["data"]
            for i in oil_list:
                self.store(i)
        except KeyError:
            print("Error->Key is invalid")

    def store(self,data):
        conn = pymysql.connect(host="127.0.0.1", user="root", passwd="123456", db="mysql")
        cur = conn.cursor()
        try:
            cur.execute("USE stockDB")
            sql_query = "INSERT INTO oil_table (oildate, openprice, highprice, lowprice, closeprice, volume)" \
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

oil_instance = Oil(url)
oil_instance.get_data()