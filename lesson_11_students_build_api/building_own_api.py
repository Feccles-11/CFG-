from flask import Flask, jsonify, request


app = Flask(__name__)


# GETTING INFORMATION

@app.route('/')
def hello():
    return {'hello': 'Universe'}


if __name__ == '__main__':
    app.run(debug=True)
