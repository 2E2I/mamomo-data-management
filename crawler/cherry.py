from lib2to3.pgen2 import driver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time
import json
from campaign import *
import chromeDriver

_URL_DONATE_LIST = "https://cherry.charity/public/campaigns/fullList?fullListCode=userTag&homeQuery=Y&cherryChoice=tag"
_DONATE_SITE = "cherry"
_ES_INDEX = "campaigns"
_ES_TYPE = "_doc"


def get_url():
    return driver.current_url


def get_title():
    title = ""
    try:
        title = WebDriverWait(driver, 20).until(EC.presence_of_element_located((
                                                                               By.CSS_SELECTOR,
                                                                               '#wrap > div > div > div > div.prflArea > p.tit'))).text
    except:
        driver.quit()
        title = "no_title"
    return title


def get_category():
    return ""


def get_tags():
    tags = []
    try:
        tag_elements = WebDriverWait(driver, 10).until(
            EC.presence_of_all_elements_located((By.CLASS_NAME, 'sl_tag')))
        tags = [tag.text.replace("#", '') for tag in tag_elements]
    except:
        print("태그 찾지 못함")
        driver.quit()
    return tags


def get_body():
    return driver.find_element(By.ID, 'cmpgnDcDiv').text


def get_organization_name():
    return driver.find_element(By.CLASS_NAME, 'name').text


def get_thumbnail():
    return driver.find_element(By.CLASS_NAME, 'campaignVisual').get_attribute(
        'data-imgurl')


def get_dates():
    _term = driver.find_element(By.CLASS_NAME, 'sl_cmpgndtlTerm').text.replace(
        '모금기간 ', '').split(' ~ ')
    start_date = _term[0].strip().replace('.', '-')
    due_date = _term[1].strip().replace('.', '-')

    return start_date, due_date


def get_prices():
    status_price = driver.find_element(By.CLASS_NAME,
                                       'sl_counter').text.replace(",", "")
    target_price = driver.find_element(By.CLASS_NAME, 'sl_total').text.replace(
        '원', '').replace(",", "")
    return status_price, target_price


def get_percent():
    return soup.select_one(
            "#container > div > div.collect_side > div.section_status > div.graph_wrap > div.graph_status > span > strong").text


def set_campaign_data_with_index(campaign):
    index = dict()
    index["_index"] = _ES_INDEX
    index["_type"] = _ES_TYPE
    index["_id"] = campaign.campaign_id
    index["_source"] = campaign.__dict__  # 딕셔너리 형태로 저장
    return index


def crawling_each_campaign():
    url = get_url()
    campaign_id = url.split('/')[6]
    site_type = _DONATE_SITE
    title = get_title()
    category = get_category()
    tags = get_tags()
    body = get_body()
    organization_name = get_organization_name()
    thumbnail = get_thumbnail()
    start_date, due_date = get_dates()
    status_price, target_price = get_prices()

    if int(status_price) is not 0:
        percent = int(target_price) // int(status_price)
    else:
        percent = 0

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


def scroll_to_end_of_page():
    SCROLL_PAUSE_SEC = 1

    # 스크롤 높이 가져옴
    last_height = driver.execute_script("return document.body.scrollHeight")

    while True:
        # 끝까지 스크롤 다운
        driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")

        # 1초 대기
        time.sleep(SCROLL_PAUSE_SEC)

        # 스크롤 다운 후 스크롤 높이 다시 가져옴
        new_height = driver.execute_script("return document.body.scrollHeight")
        if new_height == last_height:
            break
        last_height = new_height


if __name__ == "__main__":

    print("... 체리 크롤링 시작 ...")
    start = time.time()  # 시작시간

    data = []
    page_url_list = []

    driver = chromeDriver.set_chrome_driver()
    driver.get(_URL_DONATE_LIST)
    driver.implicitly_wait(time_to_wait=1)

    scroll_to_end_of_page()

    # card list 구하기
    cards_container = driver.find_element(By.CLASS_NAME, 'campaignList')
    cards = cards_container.find_elements(By.TAG_NAME, 'li')

    # 캠페인 세부페이지 url list
    for card in cards:
        onclick_tag = card.get_attribute('onclick')
        campaign_id = onclick_tag.replace('cmmCmpgn.goCmpgnPag(', '').replace(
            ')', '')
        campaign_url = "https://cherry.charity/public/campaign/cmpgnDtlPage/" + campaign_id
        page_url_list.append(campaign_url)

    for url in page_url_list:
        driver.get(url)
        driver.implicitly_wait(time_to_wait=1.3)
        crawling_each_campaign()

    driver.close()

    end = time.time()  # 종료 시간
    print(f"{end - start:.5f} sec")

    print(f"... 총 {len(data)}개 체리 크롤링 ...")

    # json 으로 저장
    with open("data\cherry.json", "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=4)
