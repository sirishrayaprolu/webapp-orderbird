from flask import Flask, send_from_directory
from flask import request
from flask import render_template

app = Flask(__name__)
@app.route("/")
def main():
    #return 'Hello world'
    return render_template('index.html')
if __name__ == "__main__":
    app.run(host="0.0.0.0",port=8080)