import requests
from bs4 import BeautifulSoup

header_user = {"User-Agent" : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"}

# 접속하고자 하는 주소 입력 => url
url = "https://www.melon.com/chart/month/index.htm"
req = requests.get(url, headers=header_user)

html = req.text
soup = BeautifulSoup(html, "html.parser")

lst_all = soup.find_all(class_=["lst50","lst100"])

for rank,i in enumerate(lst_all, 1):
    list_updown = i.select_one(".rank_wrap")
    if "상승" in list_updown.text:

      title = i.select_one(".ellipsis.rank01 a")
      singer = i.select_one(".ellipsis.rank02 a")
      album = i.select_one(".ellipsis.rank03 a")
      image = i.select_one(".image_typeAll img")
      increase = i.select_one(".rank_wrap")
      increasenum = i.select_one(".up")

      print(f"[순위] : {rank}위")
      print(f"제목 :{title.text}")
      print(f"가수이름:{singer.text}")
      print(f"월간 순위 상승/하락: {increasenum.text} {increase.text[1:7]}")
      print(f"앨범 : {album.text}")
      print(f"앨범커버 : {image['src']}")
      print()
    elif "하락" in list_updown.text:
      title = i.select_one(".ellipsis.rank01 a")
      singer = i.select_one(".ellipsis.rank02 a")
      album = i.select_one(".ellipsis.rank03 a")
      image = i.select_one(".image_typeAll img")
      increase = i.select_one(".rank_wrap")
      downnum = i.select_one(".down")


      print(f"[순위] : {rank}위")
      print(f"제목 :{title.text}")
      print(f"가수이름:{singer.text}")
      print(f"월간 순위 상승/하락: {downnum.text} {increase.text[1:7]}")
      print(f"앨범 : {album.text}")
      print(f"앨범커버 : {image['src']}")
      print()
       
    else:
      title = i.select_one(".ellipsis.rank01 a")
      singer = i.select_one(".ellipsis.rank02 a")
      album = i.select_one(".ellipsis.rank03 a")
      image = i.select_one(".image_typeAll img")
      increase = i.select_one(".rank_wrap")
      increasenum = i.select_one(".up")

      print(f"[순위] : {rank}위")
      print(f"제목 :{title.text}")
      print(f"가수이름:{singer.text}")
      #print(f"월간 순위 상승/하락: {increasenum.text} {increase.text[1:7]}")
      print(f"앨범 : {album.text}")
      print(f"앨범커버 : {image['src']}")
      print()
       
 
