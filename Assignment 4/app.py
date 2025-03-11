from flask import Flask, jsonify, request
from db_utils import get_all_classes, get_all_weight, get_all_cardio, get_all_am, get_all_stretch

app = Flask(__name__)

@app.route('/')
def home():
    return "Time to sweat! Let's view today's classes."
# http://127.0.0.1:5000/

@app.route('/codeofconduct')
def code_of_conduct():
    return """
    Thank you for taking the time to read the following information. 
    By joining the MyFitness gym, you automatically agree to the following:
    1. Be courteous to all other gym users and staff. 
    2. Keep the gym  tidy and hygienic by returning equipment and wiping down equipment.
    3. Limit use of any one piece of equipment to no more than 30 minutes during peak hours.
    4. Wear gym-appropriate clothing and shoes.  
    """
# http://127.0.0.1:5000/codeofconduct

@app.route('/allclasses')
def fetch_classes():
    res = get_all_classes()
    return jsonify(res)

# http://127.0.0.1:5000/allclasses

@app.route('/allclasses/cardio')
def fetch_cardio():
    res = get_all_cardio()
    return jsonify(res)

# http://127.0.0.1:5000/allclasses/cardio

@app.route('/allclasses/stretch')
def fetch_stretch():
    res = get_all_stretch()
    return jsonify(res)

# http://127.0.0.1:5000/allclasses/stretch

@app.route('/allclasses/weight')
def fetch_weight():
    res = get_all_weight()
    return jsonify(res)

# http://127.0.0.1:5000/allclasses/weight

@app.route('/allclasses/am')
def fetch_am():
    res = get_all_am()
    return jsonify(res)

# http://127.0.0.1:5000/allclasses/am

if __name__ == '__main__':
    app.run(debug=True)