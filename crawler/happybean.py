from email.quoprimime import body_check
from lib2to3.pgen2 import driver
from selenium import webdriver
import requests
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
import time
import json

_URL_DONATE_LIST = "https://happybean.naver.com/donation/DonateHomeMain"

# 카테고리
# category_dic = {
#     3 : "children",
#     4 : "elder",
#     5 : "impairment",
#     6 : "multiculture",
#     7 : "abroad",
#     8 : "family-woman",
#     9 : "citizen",
#     10 : "animal",
#     11 : "environment",
#     12 : "etc"
# }

# CATEGORY_CHILDREN = 3 # 아동·청소년
# CATEGORY_ELDER = 4 # 어르신
# CATEGORY_IMPAIRMENT = 5 # 장애인
# CATEGORY_MULTICULTURE = 6 # 다문화
# CATEGORY_ABROAD = 7 # 지구촌
# CATEGORY_FAMILY_WOMAN = 8 # 가족·여성
# CATEGORY_CITIZEN = 9 # 시민사회
# CATEGORY_ANIMAL = 10 # 동물
# CATEGORY_ENVIRONMENT = 11 # 환경
# CATEGORY_ETC = 12 # 기타


class Campaign:
    def __init__(
        self,
        campaign_id,
        title,
        category,
        theme,
        body,
        organization_name,
        thumbnail,
        due_date,
        start_date,
        target_price,
        status_price,
    ):
        self.campaign_id = campaign_id
        self.title = title
        self.category = category
        self.theme = theme
        self.body = body
        self.organization_name = organization_name
        self.thumbnail = thumbnail
        self.due_date = due_date
        self.start_date = start_date
        self.target_price = target_price
        self.status_price = status_price

def get_title(soup: BeautifulSoup):
    return soup.find("h3", "tit").text


def get_theme_and_category(soup: BeautifulSoup):
    _theme = soup.find("a", "theme").text.split(">")
    theme = _theme[1].strip()
    category = _theme[0].strip()
    return theme, category


def get_body(soup: BeautifulSoup):
    body = soup.select_one(
        "#container > div > div.collect_content > div > ul.intro_lst.editor_base"
    ).text.strip()
    return body


def get_organization_name(soup: BeautifulSoup):
    return soup.select_one(
        "#container > div > div.collect_side > div.section_group > div > h3 > span > a > strong"
    ).text.strip()


def get_dates(soup: BeautifulSoup):
    _term = soup.select_one(
        "#container > div > div.collect_side > div.section_status > div.term_area > p > strong"
    ).text.split("~")
    start_date = _term[0].strip()
    due_date = _term[1].strip()
    return start_date, due_date


def get_prices(soup: BeautifulSoup):
    status_price = soup.select_one(
        "#container > div > div.collect_side > div.section_status > div.num_area > p.status_num > strong"
    ).text.replace(",", "")
    target_price = soup.select_one(
        "#container > div > div.collect_side > div.section_status > div.num_area > p.detail_num.v2 > strong > span"
    ).text.replace(",", "")
    return status_price, target_price


def crawling_each_campaign(url: str, src: str):
    response = requests.get(url)
    soup = BeautifulSoup(response.content, "html.parser")

    campaign_id = url.split("/")[4]
    title = get_title(soup)
    theme, category = get_theme_and_category(soup)
    body = get_body(soup)
    organization_name = get_organization_name(soup)
    thumbnail = src
    start_date, due_date = get_dates(soup)
    status_price, target_price = get_prices(soup)

    campaign = Campaign(
        campaign_id,
        title,
        category,
        theme,
        body,
        organization_name,
        thumbnail,
        due_date,
        start_date,
        target_price,
        status_price,
    )
    data.append(campaign.__dict__)

def set_chrome_driver():
    options = webdriver.ChromeOptions()
    options.add_argument("headless")  # 웹 브라우저를 띄우지 않는 headless chrome 옵션
    options.add_argument("lang=ko_KR")  # 언어 설정
    options.add_experimental_option(
        "excludeSwitches", ["enable-logging"]
    )  # 개발도구 로그 숨기기
    options.add_argument("start-maximized")
    options.add_argument("disable-infobars")
    options.add_argument("--disable-extensions")
    driver = webdriver.Chrome(
        service=Service(ChromeDriverManager().install()), options=options
    )
    return driver


if __name__ == "__main__":

    print("... 해피빈 크롤링 시작 ...")
    start = time.time() # 시작시간
    
    data = []

    driver = set_chrome_driver()
    driver.get(_URL_DONATE_LIST)

    # 더보기 버튼 끝까지 클릭
    while True:
        btn_more = driver.find_element(By.CSS_SELECTOR, "#btn_more")
        if btn_more:
            try:
                WebDriverWait(driver, 1).until(
                    EC.element_to_be_clickable((By.CSS_SELECTOR, "#btn_more"))
                ).click()
            except TimeoutException:
                break
        else:
            break

    # 각 캠페인 카드에 대한 크롤링 진행
    html_campaign_cards = driver.find_elements(By.CLASS_NAME, "card")
    for card in html_campaign_cards:
        campaign_url = card.get_attribute("href")
        campaign_thumbnail = card.find_element(
            By.CSS_SELECTOR, "a > img"
        ).get_attribute("src")
        crawling_each_campaign(campaign_url, campaign_thumbnail)
    driver.close()
    
    end = time.time() # 종료 시간
    print(f"{end - start:.5f} sec")
    
    print("... 해피빈 크롤링 끝 ...")
    
    # json 으로 저장
    with open('data\happybean.json', "w", encoding = 'utf-8') as f:
        json.dump(data, f, ensure_ascii = False, indent = 4)