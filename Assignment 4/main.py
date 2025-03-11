import requests
import json

def view_cardio():
    result = requests.get('http://127.0.0.1:5000/allclasses/cardio')
    return result.json()

def view_stretch():
    result = requests.get('http://127.0.0.1:5000/allclasses/stretch')
    return result.json()

def view_weight():
    result = requests.get('http://127.0.0.1:5000/allclasses/weight')
    return result.json()

def run():
    print('############################')
    print('Hey, welcome to MyFitness Gym!')
    print('############################')
    print()

    type_of_class = input('What type of class are you looking for today? (Cardio, Stretch, Weights): ').strip().capitalize()
    print()

    if type_of_class == 'Cardio':
        cardio_classes = view_cardio()
        print("Here are the available Cardio classes:")
        for gym_class in cardio_classes:
            print(f"- {gym_class['class_name']} at {gym_class['class_time']}")

    if type_of_class == 'Stretch':
        stretch_classes = view_stretch()
        print("Here are the available Stretch classes:")
        for gym_class in stretch_classes:
            print(f"- {gym_class['class_name']} at {gym_class['class_time']}")

    if type_of_class == 'Weights':
        weight_classes = view_weight()
        print("Here are the available Weight Training classes:")
        for gym_class in weight_classes:
            print(f"- {gym_class['class_name']} at {gym_class['class_time']}")

if __name__ == "__main__":
    run()