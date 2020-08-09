from flask import *
import json

app = Flask(__name__)

@app.route("/")
def index():
    return jsonify({"language": "python"})

## おまじない
if __name__ == "__main__":
    app.run(debug=True)

