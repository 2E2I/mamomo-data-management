from elasticsearch import helpers, Elasticsearch
import json

sites = ['happybean', 'kakao']

def createIndex():
    es.indices.create(
        index = "campaigns",
        mappings= {
                "properties" : {
                    "campaign_id" : {"type" : "keyword"},
                    "site_type" : {"type" : "keyword"},
                    "url" : {"type" : "keyword"},
                    "title" : {"type" : "text"},
                    "body" : {"type" : "text"},
                    "organization_name" : {"type" : "keyword"},
                    "thumbnail" : {"type" : "keyword"},
                    "due_date" : {"type" : "date"},
                    "start_date" : {"type" : "date"},
                    "target_price" : {"type" : "long"},
                    "status_price" : {"type" : "long"},
                    "percent" : {"type" : "integer"}
                }
            }
    )

def initData():
    createIndex()
    
    for site in sites:
        with open(f'data/{site}.json', 'r', encoding='utf-8') as f:
            data = json.loads(f.read())
        res = helpers.bulk(es, data)
        print(f"{site} insert : {res}")


if __name__ == '__main__':
    es = Elasticsearch('localhost:9200/', timeout=30, max_retries=10, retry_on_timeout=True)
    initData()