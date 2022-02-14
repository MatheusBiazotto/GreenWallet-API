from resources import criarAPI
import os
from flask_cors import CORS

app = criarAPI()
CORS(app)

if __name__ == '__main__':
    port = int(os.environ.get("PORT", 5000))
    app.run(host='0.0.0.0', port=port)
