from elasticsearch import helpers, Elasticsearch
import json
import os

sites = ['happybean', 'kakao', 'thedirectdonation', 'cherry']


def createIndex():
    if not es.indices.exists(index="campaigns"):
        return es.indices.create(
                index = "campaigns",
                mappings = {
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
                        "percent" : {"type" : "integer"},
                        "heart_count" : {"type" : "integer"}
                    }
                }
        )


def initData():
    createIndex()
    
    path = os.path.dirname(os.path.abspath(os.path.join(__file__, os.pardir)))
    
    for site in sites:
        file_path = os.path.join(path,f"data/{site}.json")
        with open(file_path, 'r', encoding='utf-8') as f:
            data = json.loads(f.read())
        res = helpers.bulk(es, data)
        print(f"{site} insert : {res}")


if __name__ == '__main__':
    es = Elasticsearch('http://elastic:hansung@localhost:9200/', timeout=30,max_retries=10, retry_on_timeout=True)

    initData()
