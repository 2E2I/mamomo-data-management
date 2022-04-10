from selenium.webdriver.common.by import By
import time
import json
from campaign import *
import chromeDriver

_URL_DONATE_LIST = "https://thedirectdonation.org/index/donate_list"
_DONATE_SITE = "thedirectdonation"
_ES_INDEX = "campaigns"
_ES_TYPE = "_doc"


def get_campaign_id():
    return page_url.split('/')[6]


def get_url():
    return driver.current_url


def get_title():
    return driver.find_element(By.XPATH,
                               "/html/body/section[1]/div/div[1]/h3").text


def get_category(tags):
    before_tags = ["아동센터", "보육원", "다문화", "육아", "유기견", "유기묘"]
    after_tags = ["아동|청소년", "아동|청소년", "다문화", "가족|여성", "동물", "동물"]
    category = []

    for idx, val in enumerate(before_tags):
        if val == "아동센터":
            for tag in tags:
                if val in tag:
                    category.append(after_tags[idx])
        elif val in tags:
            category.append(after_tags[idx])
    return category


def get_tags():
    tags = []
    for tag in driver.find_elements(By.CLASS_NAME, "tag_item"):
        tags.append(tag.text.replace("# ", ""))
    return tags


def get_body():
    body1 = driver.find_element(By.CLASS_NAME, "desc_wrap").text
    body2 = driver.find_element(By.CLASS_NAME, "balloon_txt").text
    return (body1 + body2).replace("\n", " ")


def get_organization_name():
    return driver.find_element(By.XPATH,
                               "/html/body/section[1]/div/div[1]/div/span[1]").text.replace(
            "# ", "")


def get_thumbnail():
    return driver.find_element(By.CLASS_NAME,
                               'donate_view_thumb').value_of_css_property(
            'background-image').split("\"")[1]


def get_dates():
    start_date = driver.find_element(By.XPATH,
                                     "/html/body/section[1]/div/div[2]/div[2]/div/div/p").text.split(
            ":")[1].replace(".", "-").replace(" ", "")
    due_date = "2099-01-01"
    return start_date, due_date


def get_prices():
    status_price = driver.find_element(By.XPATH,
                                       "/html/body/section[1]/div/div[2]/div[2]/div/div/h4/b").text.replace(
            ',', '')
    target_price = driver.find_element(By.XPATH,
                                       "/html/body/section[1]/div/div[2]/div[2]/div/div/div[3]/dl[1]/dd/b").text.replace(
            ',', '')
    return status_price, target_price


def get_percent():
    return driver.find_element(By.XPATH,
                               "/html/body/section[1]/div/div[2]/div[2]/div/div/div[1]/h2").text.split(
        ".")[0]


def set_campaign_data_with_index(campaign):
    index = dict()
    index["_index"] = _ES_INDEX
    index["_type"] = _ES_TYPE
    index["_id"] = campaign.campaign_id
    index["_source"] = campaign.__dict__  # 딕셔너리 형태로 저장
    return index


def crawling_each_campaign():
    campaign_id = get_campaign_id()
    site_type = _DONATE_SITE
    url = get_url()
    title = get_title()
    tags = get_tags()
    category = get_category(tags)
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
            category,
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

    print("... 곧장기부 크롤링 시작 ...")
    start = time.time()  # 시작시간

    data = []
    page_url_list = []

    driver = chromeDriver.set_chrome_driver()
    driver.get(_URL_DONATE_LIST)

    # 각 캠페인 카드에 대한 크롤링 진행
    html_campaign_cards = driver.find_elements(By.XPATH,
                                               "/html/body/section[2]/div[2]/div[2]/div/a")
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

    print("... 곧장기부 크롤링 끝 ...")

    # json 으로 저장
    with open('.\data\\thedirectdonation.json', 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=4)
