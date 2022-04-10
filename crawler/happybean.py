import requests
from bs4 import BeautifulSoup
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
import time
import json
from campaign import *
import chromeDriver

_URL_DONATE_LIST = "https://happybean.naver.com/donation/DonateHomeMain"
_DONATE_SITE = "happybean"
_ES_INDEX = "campaigns"
_ES_TYPE = "_doc"


def get_title(soup: BeautifulSoup):
    return soup.find("h3", "tit").text


def get_category(soup: BeautifulSoup):
    category = []
    theme = soup.find("a", "theme").text.split(">")[0].strip()
    if theme == "기타":
        category.append("어려운이웃")
    elif theme == "시민사회":
        category.append("우리사회")
    else:
        category.append(theme.replace("•", "|"))
    return category


def get_tags(soup: BeautifulSoup):
    tags = []
    _theme = soup.find("a", "theme").text.split(">")
    tags.append(_theme[1].strip())
    category = _theme[0].strip()
    if "•" in category:
        tags.extend(category.split("•"))
    else:
        tags.append(category)
    return tags


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

    start_date = _term[0].strip().replace('.', '-')
    due_date = _term[1].strip().replace('.', '-')

    return start_date, due_date


def get_prices(soup: BeautifulSoup):
    status_price = soup.select_one(
            "#container > div > div.collect_side > div.section_status > div.num_area > p.status_num > strong"
    ).text.replace(",", "")
    target_price = soup.select_one(
            "#container > div > div.collect_side > div.section_status > div.num_area > p.detail_num.v2 > strong > span"
    ).text.replace(",", "")
    return status_price, target_price


def get_percent(soup: BeautifulSoup):
    return soup.select_one(
            "#container > div > div.collect_side > div.section_status > div.graph_wrap > div.graph_status > span > strong").text


def set_campaign_data_with_index(campaign):
    index = dict()
    index["_index"] = _ES_INDEX
    index["_type"] = _ES_TYPE
    index["_id"] = campaign.campaign_id
    index["_source"] = campaign.__dict__  # 딕셔너리 형태로 저장
    return index


def crawling_each_campaign(url: str, src: str):
    response = requests.get(url)
    soup = BeautifulSoup(response.content, "html.parser")
    campaign_id = url.split("/")[4]
    site_type = _DONATE_SITE
    title = get_title(soup)
    category = get_category(soup)
    tags = get_tags(soup)
    body = get_body(soup)
    organization_name = get_organization_name(soup)
    thumbnail = src
    start_date, due_date = get_dates(soup)
    status_price, target_price = get_prices(soup)
    percent = get_percent(soup)

    campaign = Campaign(
            campaign_id,
            site_type,
            url,
            title,
            category,
            tags,
            body,
            organization_name,
            thumbnail,
            due_date,
            start_date,
            target_price,
            status_price,
            percent
    )

    campaign_data = set_campaign_data_with_index(campaign)

    data.append(campaign_data)


if __name__ == "__main__":

    print("... 해피빈 크롤링 시작 ...")
    start = time.time()  # 시작시간

    data = []

    driver = chromeDriver.set_chrome_driver()
    driver.get(_URL_DONATE_LIST)

    # 더보기 버튼 끝까지 클릭
    while driver.find_element(By.CSS_SELECTOR, "#btn_more").is_displayed:
        try:
            WebDriverWait(driver, 1).until(
                    EC.element_to_be_clickable((By.CSS_SELECTOR, "#btn_more"))
            ).click()
        except TimeoutException:
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

    end = time.time()  # 종료 시간
    print(f"{end - start:.5f} sec")

    print("... 해피빈 크롤링 끝 ...")

    # json 으로 저장
    with open("data\happybean.json", "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=4)
