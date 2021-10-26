import requests
from bs4 import BeautifulSoup

def get_soup(url: str) -> BeautifulSoup:
    response=requests.get(url)
    s=(str(BeautifulSoup(response.content,"html.parser")))
    return s

def get_soup_v2(url: str) -> BeautifulSoup:
                response=requests.get(url)
                return BeautifulSoup(response.content, "html.parser")

def img(url):
    soup=get_soup_v2(url)
    imagenes=soup.find_all("img")
    altdeimg=[{"src": image.get("src"), "alt": image.get("alt")
               } for image in imagenes]
    return altdeimg

if __name__=="__main__":
    answer = get_soup("https://www.ufcespanol.com")
    with open ("scr.txt","w")as res:
        res.write(answer)

    ansimg = img("https://www.ufcespanol.com/rankings")
    with open ("imagen.txt","w")as i:
       i.write(str(ansimg))

