from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time
import json
from campaign import *


_URL_DONATE_LIST = "https://together.kakao.com/fundraisings/now?sort=1"
_DONATE_SITE = "kakao"
_ES_INDEX = "campaigns"
_ES_TYPE = "card"


def set_chrome_driver():
    options = webdriver.ChromeOptions()
    options.add_argument('headless')  # 웹 브라우저를 띄우지 않는 headless chrome 옵션
    options.add_argument('lang=ko_KR')  # 언어 설정
    options.add_experimental_option("excludeSwitches", ["enable-logging"])  # 개발도구 로그 숨기기
    options.add_argument("window-size=1920,1080")  # window size 수동 조정
    options.add_argument("disable-gpu")
    options.add_argument("disable-infobars")
    options.add_argument("--disable-extensions")

    # 속도 향상을 위한 옵션 해제
    prefs = {'profile.default_content_setting_values': {'cookies': 2, 'images': 2, 'plugins': 2, 'popups': 2,
                                                        'geolocation': 2, 'notifications': 2,
                                                        'auto_select_certificate': 2, 'fullscreen': 2, 'mouselock': 2,
                                                        'mixed_script': 2, 'media_stream': 2, 'media_stream_mic': 2,
                                                        'media_stream_camera': 2, 'protocol_handlers': 2,
                                                        'ppapi_broker': 2, 'automatic_downloads': 2, 'midi_sysex': 2,
                                                        'push_messaging': 2, 'ssl_cert_decisions': 2,
                                                        'metro_switch_to_desktop': 2, 'protected_media_identifier': 2,
                                                        'app_banner': 2, 'site_engagement': 2, 'durable_storage': 2}}
    options.add_experimental_option('prefs', prefs)

    return webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=options)


def get_campaign_id():
    return page_url.split('/')[4]


def get_url():
    return driver.current_url


def get_title():
    return driver.find_element(By.CLASS_NAME, "tit_visual").text


def get_tags():
    # 태그
    tags = []
    for tag in driver.find_elements(By.TAG_NAME, "tag-card > a"):
        tags.append(tag.text.replace("#", ""))
    return tags


def get_body():
    return driver.find_element(By.TAG_NAME, "fundraising-content").text.replace('\n',' ')


def get_organization_name():
    return driver.find_element(By.CLASS_NAME, "txt_sponsor").text.split("by ")[1]


def get_thumbnail():
    return driver.find_element(By.CLASS_NAME, 'cont_visual').value_of_css_property('background-image').split("\"")[
        1]


def get_dates():
    txt_date = driver.find_element(By.CLASS_NAME, "txt_date").text.split(" ~ ")
    start_date = txt_date[0]
    due_date = txt_date[1]
    return start_date, due_date


def get_prices():
    status_price = driver.find_element(By.CLASS_NAME, "txt_goal").text.split("원")[0]
    target_price = driver.find_element(By.CLASS_NAME, "total_fund").text.split("원")[0]
    return status_price, target_price


def get_percent():
    return driver.find_element(By.CLASS_NAME, "txt_result").text


def set_campaign_data_with_index(campaign):
    index = dict()
    index["_index"] = _ES_INDEX
    index["_type"] = _ES_TYPE
    index["_id"] = campaign.campaign_id
    index["_source"] = campaign.__dict__     # 딕셔너리 형태로 저장
    return index


def crawling_each_campaign():
    campaign_id = get_campaign_id()
    site_type = _DONATE_SITE
    url = get_url()
    title = get_title()
    tags = get_tags()
    body = get_body()
    organization_name = get_organization_name()
    thumbnail = get_thumbnail()
    start_date, due_date = get_dates()
    status_price, target_price = get_prices()
    percent = get_percent()

    campaign = Campaign(
        campaign_id,
        site_type,
        url,
        title,
        tags,
        body,
        organization_name,
        thumbnail,
        due_date,
        start_date,
        target_price,
        status_price,
        percent)

    campaign_data = set_campaign_data_with_index(campaign)

    data.append(campaign_data)



if __name__ == '__main__':

    print("... 카카오같이가치 크롤링 시작 ...")
    start = time.time()  # 시작시간

    data = []
    page_url_list = []

    driver = set_chrome_driver()
    driver.get(_URL_DONATE_LIST)

    # 페이지 끝까지 스크롤
    for i in range(10000000000):
        driver.execute_script('window.scrollTo(0, document.body.scrollHeight);')
        time.sleep(0.1)
        try:
            list_more = driver.find_element(By.CSS_SELECTOR, ".list_more")
            if not list_more:
                break
        except:
            break

    # 각 캠페인 카드에 대한 크롤링 진행                
    html_campaign_cards = driver.find_elements(By.CLASS_NAME, "link_pack")
    for card in html_campaign_cards:
        page_url_list.append(card.get_attribute('href'))

    # 각 캠페인 페이지에 대한 크롤링 진행
    for page_url in page_url_list:
        driver.get(page_url)
        driver.implicitly_wait(time_to_wait=1.3)
        crawling_each_campaign()

    driver.close()

    end = time.time()  # 종료 시간
    print(f"{end - start:.5f} sec")

    print("... 카카오같이가치 크롤링 끝 ...")

    # json 으로 저장
    with open('.\data\kakao.json', 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=4)