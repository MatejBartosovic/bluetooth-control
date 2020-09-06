from flask import Flask
app = Flask(__name__)
import subprocess

@app.route('/')
def hello_world():
    return '<a href="discoverable">Discovarable</button></br><a href="pairable">Pairable</a>'

@app.route('/pairable')
def pairable():
    return subprocess.check_output('sudo bluetoothctl pairable on', shell=True)


@app.route('/discoverable')
def discoverable():
    return subprocess.check_output('sudo bluetoothctl discoverable on', shell=True)

