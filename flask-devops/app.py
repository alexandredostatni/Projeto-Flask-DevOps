from flask import Flask
from prometheus_client import Counter, start_http_server

app = Flask(__name__)
requests_count = Counter('requests_total', 'Total de requisições')

@app.route('/')
def home():
    requests_count.inc()
    return "Olá, DevOps!"

if __name__ == "__main__":
    start_http_server(8000)  # Porta para métricas
    app.run(host='0.0.0.0', port=5000)