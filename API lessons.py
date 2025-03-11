# print ('hi')
### EXERCISE 1 ###
# """
# Create a to-do list program that writes user input to a file
#
# The program should:
#
# Ask the user to input a new to-do item
# Read the contents of the existing to-do items
# Add the new to do item to the existing to-do items
# Save the updated to-do items
#
# NB: You will need to manually create a new file called todo.txt in the same folder as your program before you start.
# """
#
# list = (open('todo.txt', 'w'))

# 'a' to change, 'w' to write/overwrite/create 'r' to read and if in doubt add +

# task = input('What do you have to do today?')
#
# with open ('todo.txt', 'a') as list:
#     list.write(task + '\n')

# import csv
#
# spreadsheet = 'trees.csv'
#
# heights = []
#
# for row in spreadsheet:
#     tree_height = row['height']
#     heights.append(tree_height)
#
# shortest_height = min(heights)
# print(shortest_height)

import requests
from pprint import pprint as pp
#pretty print
#
endpoint1 = 'http://api.open-notify.org/astros.json'  # this endpoint returns data about astronauts currently in space
#
response = requests.get(endpoint1) # making a call to the API
#
print(response.status_code)  # make sure that your connection status code is 200, which means success!
#
data = response.json()  # lets see what data about people in space we get back from the API response
pp(data)
#
#
# # let's extract data from the response and write it to a file
# # we need section 'people' from json, which is a list of dict, so...
# # we also need to extract name from each dict item in that list
#
with open('astranouts.txt', 'w') as text_file:
     for item in data['people']:
         text_file.write(item['name'] + '\n') # added new line character, so each name appears on a new line.





