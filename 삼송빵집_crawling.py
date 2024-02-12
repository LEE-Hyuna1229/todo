from bs4 import BeautifulSoup
from selenium import webdriver

#셀레니움에 다양한 옵션을 적용시키기 위한 패키지
from selenium.webdriver.chrome.options import Options

#크롬 드라이버 매니저를 실행시키기 위해 설치해주는 패키지
from selenium.webdriver.chrome.service import Service
#자동으로 크롬 드라이브를 최신으로 유지해주는 패키지 
from webdriver_manager.chrome import ChromeDriverManager
#클래스, 아이디, css_selector를 이용하고자 할때
from selenium.webdriver.common.by import By
#키보드 입력
from selenium.webdriver.common.keys import Keys

import time

user = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"

options_ = Options()
options_.add_argument(f"User-Agent={user}")
options_.add_experimental_option("detach", True)
options_.add_experimental_option("excludeSwitches", ["enable-logging"])


#크롬 드라이버 매니저를 자동으로 설치되도록 실행시키는 코드
service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service, options=options_)

url = "https://ssbnc.kr/"
driver.get(url)
time.sleep(0.5)

driver.find_element(By.LINK_TEXT,"제품소개").click()
time.sleep(0.5)

for i in range(6):
    driver.find_element(By.TAG_NAME, "body").send_keys(Keys.PAGE_DOWN)
    time.sleep(0.2)

html = driver.page_source
soup = BeautifulSoup(html, "html.parser")

items = soup.select(".modal-content")
bread_list = []
for i in items:
    bread_name = i.select_one(".info > h4")
    if '고로케' in bread_name.text:
        category = '고로케'
        bread_name = i.select_one(".info > h4").text
        bread_command = i.select_one(".t1").text
        bread_price = i.select_one(".price").text
        # bread_allergy = i.select_one(".contWrap > p").text
    elif '빵' in bread_name.text:
        category = '기본빵(단팥,소금,맘모스)'
        bread_name = i.select_one(".info > h4").text
        bread_command = i.select_one(".t1").text
        bread_price = i.select_one(".price").text
    elif '떡' in bread_name.text:
        category = '떡'
        bread_name = i.select_one(".info > h4").text
        bread_command = i.select_one(".t1").text
        bread_price = i.select_one(".price").text
    else:
        category = '그 외 빵들'
        bread_name = i.select_one(".info > h4").text
        bread_command = i.select_one(".t1").text
        bread_price = i.select_one(".price").text

    bread = [category, bread_name, bread_command, bread_price]
    bread_list.append(bread)

    time.sleep(0.3)

print(bread_list)  

# 데이터베이스에 값 넣기
import pymysql

connection = pymysql.connect(
    host = '127.0.0.1',
    user = 'root',
    password = 'yung00420',
    db='songbread',
    charset='utf8mb4'
) 

connection.cursor()

def execute_query(connection, query, args=None):
    with connection.cursor() as cursor:
        cursor.execute(query, args or ())
        if query.strip().upper().startswith('SELECT'):
            return cursor.fetchall()
        else:
            connection.commit()

for i in bread_list:
    execute_query(connection, "INSERT INTO Breads (category, bread_name, bread_command, bread_price) VALUES (%s, %s, %s, %s)", (i[0],i[1],i[2],i[3]))