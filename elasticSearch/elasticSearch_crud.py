from elasticsearch import helpers,Elasticsearch
import json

sites = ['happybean']
    
def insertData():
    for site in sites:
        with open(f'data\{site}.json', 'r', encoding = 'utf-8') as f:
            data = json.loads(f.read())
        res = helpers.bulk(es, data, index="campaigns", doc_type=site)
    
if __name__ == '__main__':
    es = Elasticsearch('http://localhost:9200/')
    insertData()