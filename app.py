from flask import Flask, jsonify, request
import extract

app = Flask(__name__)

@app.route("/", methods=['POST'])
def extract_keywords():
    # 요청이 json형식인지 검사
    if not request.is_json:
        return jsonify(msg = "Missing JSON in request"), 400
    
    # {"text" : 본문}
    params = request.get_json()
    text = params['text']
    result = extract.extract_keywords([text])
    
    return jsonify(result = result), 200

if __name__ == "__main__":
    app.run(port = 5000)