from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "Hello! The Automated Python Web App is successfully deployed."

@app.route('/health')
def health_check():
    return "Status: Healthy"

if __name__ == '__main__':
    # Listen on all network interfaces to work smoothly within Docker
    app.run(host='0.0.0.0', port=5000)