import sys
import requests

url = 'https://random-word-api.herokuapp.com/word?length=5'
response = requests.get(url)
data = response.json()
word = data[0]

def display_feedback(word, player_word):
    while len(player_word) != 5:
        print("Your guess must be 5 letters.")
        player_word = (input('Enter your guess.'))
    if word == player_word:
        print('You guessed it, well done!')
        sys.exit()
    for i in range(len(word)):
        if word[i] == player_word[i]:
            print(word[i], end='')
        else:
            print('_', end='')
    print()

player_word = (input('Enter your first guess.'))

display_feedback(word, player_word)

print('Not quite...')
player_word = (input('Enter your second guess:'))

display_feedback(word, player_word)

print('Guess again!')
player_word = (input('Enter your third guess:'))

display_feedback(word, player_word)

print("You'll get it this time!")
player_word = (input('Enter your fourth guess:'))

display_feedback(word, player_word)

print("Keep going!")
player_word = (input('Enter your fifth guess:'))

display_feedback(word, player_word)

print("Last chance... You can do it!")
player_word = (input('Enter your sixth guess:'))

display_feedback(word, player_word)
print(f"Too bad...The word was '{word}'. Better luck next time!")
