from bs4 import BeautifulSoup
import requests
import pymysql.cursors

def get_news_urls(urls):

    source = requests.get(urls[0]).text
    soup = BeautifulSoup(source, "lxml")
    find_all_news_links = soup.find_all("div", {"class": "views-field views-field-title"})
    company_name = urls[1]

    for _ in find_all_news_links:
        headline = _.find("a").get_text()
        url = _.find("a").attrs["href"]
        crawl_data(company_name, headline, url)


def crawl_data(company_name, headline, url):
    article = ""
    target_url = "https://www.theedgemarkets.com" + url
    print(target_url)
    try:
         source = requests.get(target_url).text
         soup = BeautifulSoup(source, "lxml")
         news = soup.find("div",{"property": "content:encoded"}).find_all("p")
         for _ in news:
             article += _.getText()
         news_date = soup.find("span", {"class": "post-created"}).getText()
         data_transfer(news_date, company_name, headline, article, target_url)
    except:
        print("Error->crawling data Error")


def data_transfer(newsdate, company_name, headline, article, link):


    conn = pymysql.connect(host="localhost", user="root", passwd="123456", db="mysql")
    cur = conn.cursor()
    try:
        cur.execute("USE NewsDB")
        sql_query = "INSERT INTO companynews_db (newsdate,companyname,headline,article,link)" \
                    " VALUES (%s,%s,%s,%s,%s)"
        try:
            cur.execute(sql_query,(newsdate,company_name,headline,article,link))

        except ValueError:
                print("data trasnfer failed! no data")
        cur.connection.commit()

    finally:
        cur.close()
        conn.close()


company_news_urls = []
company_names = ["PETRONAS","CIMB","SAPNRG","TM","TENAGA","AIRASIA","GAMUDA"]


for item in company_names:
    for i in range (0,7):
        company_news_urls.append(["https://www.theedgemarkets.com/search-results?page={0}&keywords={1}".format(i,item), item])
for item in company_news_urls:
    get_news_urls(item)