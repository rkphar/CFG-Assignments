# Importing the module to allow me to interact with the Trivia Database API
import requests

# Importing the module to randomise the multiple choice answers
import random

# Importing the module to allow special characters like &, ', ! and ? to be printed correctly
import html

# Calling the Trivia Database API. I have limited the number of questions to 10, but this can be easily changed and you could add another user input where the user decides how many questions they want to answer. I have not specified which questions
# can be asked. If required, I could have specified the category, type or difficulty level of the questions.
url = 'https://opentdb.com/api.php?amount=10'

# Checking the response has been successful by printing 200
response = requests.get(url)
print(response.status_code)

data = response.json()

# An example of string slicing where I wrote Good Luck backwards and then printed it in reverse order
comment = 'kcuL dooG'
print(comment[::-1])

# Setting variables to be used throughout the code and setting the users starting score to 0
questions = data['results']
score = 0

# For loop which allows each question to be asked in turn and for the user to be able to answer the question with them
# being informed if they are correct or not. Will also randomise the answers so that the correct answer is placed
# randomly in the choice list. I have also used the html.unescape() method to allow special characters to be shown
# correctly as when I didn't have this I was getting the encoded format on some of the questions and answers. I found
# this through Google which took some trial and error to code correctly.
question_no = 1
for question in questions:
    question_text = html.unescape(question['question'])
    correct_answer = html.unescape(question['correct_answer'])
    incorrect_answers = html.unescape(question['incorrect_answers'])
    answers = incorrect_answers + [correct_answer]
    random.shuffle(answers)

    print(f'\nQ{question_no}: {question_text}')

# For loop allowing the question number to be updated to the next question e.g. Q1, Q2, Q3, Q4 all the way to Q10
    for count in range(len(answers)):
        print(f'  {count + 1}. {answers[count]}')

# Allows the user to input their answer by choosing 1 or 2 for True or False or 1, 2, 3 or 4 for multiple choice
# questions. This has to be input as a number.
    user_answer = input('Your answer (enter number): ')

# If... else statements to check if the users answer has been first entered in the correct format, and then if it is
# the correct answer or not.
    if user_answer.isdigit():
        user_answer_id = int(user_answer) - 1
        if 0 <= user_answer_id < len(answers):
            user_answer_text = answers[user_answer_id]
            if user_answer_text == correct_answer:
                print('Correct!\n')
                score += 1
            else:
                print(f'Wrong! The correct answer was: {correct_answer}\n')
        else:
            print('Invalid input! Please enter a number corresponding to one of the answers.')
    else:
        print('Invalid input! Please enter a number corresponding to one of the answers.')

# Increments the question number to the next question
    question_no += 1

# Creates a results text file and prints the result of the trivia questions in the text file
with open('results.txt', 'w') as text_file:
    text_file.write(f'Your final score is: {score} out of {len(questions)}')

# Advises the user where they can check their trivia results
print('Please check your results in results.txt')
