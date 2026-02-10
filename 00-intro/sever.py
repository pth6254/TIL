from flask import Flask

app = Flask(__name__)

@app.route("/")
def main():
    return "<p>Hello, World!</p>"


@app.route("/qwer")
def about():
    return "<p>HAHAHA</p>"

if __name__ == '__main__':
    app.run(port=3000, debug=True)