# -*- coding: utf-8 -*-
from sklearn.feature_extraction.text import TfidfVectorizer
from collections import defaultdict
import numpy as np
from konlpy.tag import Okt
import re
import pprint

def okt_tokenizer(text):
    okt = Okt()
    text = re.sub(r'[^ ㄱ-ㅣ가-힣A-Za-z]', '', text) # 특수기호 제거
    return okt.morphs(text, norm=True, stem=True)

def extract_keywords(text):
         
    vectorizer = TfidfVectorizer(tokenizer=okt_tokenizer)
    vectorizer.fit(text)
    matrix = vectorizer.transform(text)
    
    # 단어 사전: {"token": id}
    vocabulary_word_id = defaultdict(int)
    
    for idx, token in enumerate(vectorizer.get_feature_names()):
        vocabulary_word_id[token] = idx
    
    # 특징 추출 결과: {"token": value}
    result = defaultdict(str)
    
    for token in vectorizer.get_feature_names():
        result[token] = matrix[0, vocabulary_word_id[token]]
    
    # 내림차순 (중요도 high) 기준 정렬
    result = sorted(result.items(), key = lambda item: item[1], reverse = True)
    pprint.pprint(result)
    
    return [token for token, value in result]