from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from bs4 import BeautifulSoup
import time

from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service
#옵션 설정
options = Options()
user = "Mozilla/5.0 (IPhone; CPU iPhone OS 13_3 like Mac OS X) AppleWebKit/605.1.15(KHTML, like Gecko) CriOS/80.0.3987.95 Mobile/15E148 Safari/604.1"
#options.add_argument(f"User-Agent={user}")
options.add_argument("user-agent=" + user)

options.add_experimental_option("detach", True)
options.add_experimental_option("excludeSwitches", ["enable-automation"])

service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service, options=options)

#크롤링 코드 작성
url = "https://m2.melon.com/index.htm"
driver.get(url)
time.sleep(3)

if driver.current_url != url:
    driver.get(url)
    time.sleep(2)

driver.find_element(By.LINK_TEXT, "닫기").click()
time.sleep(0.2)
driver.find_element(By.LINK_TEXT, "멜론차트").click()
time.sleep(0.2)

more_btn = driver.find_elements(By.CSS_SELECTOR, "#moreBtn")[1].click()
time.sleep(3)
# 노래순위
# 노래제목
# 가수이름
# 추가로 가져올 수 있는 정보 가져오기
#for i in range(10):
    #driver.find_element(By.TAG_NAME, "body").send_keys(Keys.PAGE_DOWN)
    #time.sleep(0.2)

html = driver.page_source
soup = BeautifulSoup(html, "html.parser")

items = soup.select(".list_item")

num =1
for i in items:
    if i.find(class_="ranking_num"):
       title = i.select_one(".title.ellipsis")
       name = i.select_one(".name.ellipsis")
       img = i.select_one(".img")
       rankupdown = i.select_one(".rankimg_updown")

       print(f"순위: [{num}]위")
       print(f"순위 변동: {rankupdown.text}")
       print(f"제목:{title.text.strip()}")
       print(f"가수 이름: {name.text}")
       print(f"앨범 커버: {img['style']}")
       print()

       num +=1