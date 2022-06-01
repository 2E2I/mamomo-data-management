<h1 align="center"><strong>마</strong>음을 <strong>모</strong>두 <strong>모</strong>아, MaMoMo</h1>

<div align="center">
  :heartpulse::heartpulse::heartpulse::heartpulse::heartpulse:
</div>

<div align="center">
  <strong>HSU 2022 Capstone Project</strong>
</div>

<div align="center">
  따뜻한 세상을 위한 통합 기부 플랫폼
</div>

<div align="center">
  <h3>
    <a href="https://flossy-thursday-5ea.notion.site/2022-2195650e0c2d4c589aa8a32016fae4ea">
      📖 Wiki
    </a>
    <span> | </span>
    <a href="https://github.com/2E2I/mamomo-server">
     🔮 Backend
    </a>
    <span> | </span>
    <a href="https://github.com/2E2I/mamomo-client">
      🌏 Frontend
    </a>
  </h3>
</div>
<br>

## data-management

마모모의 데이터를 수집 및 조작합니다.


마모모 프로젝트의 전체적인 구조 및 동작 방법에 대한 설명은 Frontend, Backend 레포지토리의 리드미를 참고해 주세요! ☺️

## 💾 디렉토리 구조

```bash
📦donation-crawler
 ┣ 📂crawler
 ┃ ┣ 📜campaign.py
 ┃ ┣ 📜cherry.py
 ┃ ┣ 📜chromeDriver.py
 ┃ ┣ 📜happybean.py
 ┃ ┣ 📜kakao.py
 ┃ ┗ 📜thedirectdonation.py
 ┣ 📂data
 ┃ ┣ 📜cherry.json
 ┃ ┣ 📜happybean.json
 ┃ ┣ 📜kakao.json
 ┃ ┗ 📜thedirectdonation.json
 ┣ 📂elasticSearch
 ┃ ┗ 📜elasticSearch_crud.py
 ┣ 📜app.py
 ┣ 📜extract.py
 ┗ 📜stopwords.txt
```

## 📂crawler

기부 사이트 데이터를 크롤링합니다.

## 📂data

크롤링 한 데이터를 json파일로 저장한 결과물들 입니다.

## 📂elasticSearch

Elasticsearch에 insert 및 update 작업을 수행합니다.

## 📍 텍스트마이닝

### 📜app.py

Spring서버의 텍스트마이닝 요청을 받는 Flask서버를 운영합니다.

### 📜extract.py

Spring쪽에서 요청받은 텍스트를

- `KoNLpy`로 형태소 단위로 분해하고
- 📜stopwords.txt 목록을 이용해 불용어를 제거합니다.
- `scikit-learn`으로 빈도수를 분석해 주요 단어를 추출합니다.
- `{"단어": 추출값}` 리스트를 Spring에 보냅니다.

## 🗺️ 구조도

### 크롤링 & ES 삽입

![기부글 크롤링](https://user-images.githubusercontent.com/67352902/171436348-1c6707fc-3c75-4e4e-9115-781e102e489e.png)

### 텍스트 마이닝

![텍스트 마이닝](https://user-images.githubusercontent.com/67352902/171436887-4611d567-da34-4b72-9e51-c640f514d25e.png)

