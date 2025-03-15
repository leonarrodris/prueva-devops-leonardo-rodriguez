from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "Bienvenido a la Prueba de Docker"

@app.route('/devops')
def devops():
    return "La automatización es clave en DevOps"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
