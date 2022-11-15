# SAMPLE OUTPUT:
#
# Student Information
# Name: Jon Snow
# Student Number: 33415221
# ----------------------
# Course Information
# Course Title: Intro to Python
# Course Code: CST8279
# ----------------------
# Mark Breakdown
# Assignments: 25/40
# Midterm: 25/35
# Exam: 25/25
#
# Percent Grade: 75%
# Letter Grade: B

# 5 marks
# Prompt the user for inputs
# Validate the inputs
# Student number is exactly 8 digits
# Function returns a string and int value
def get_student_info():
    stnum_flag = True
    while stnum_flag:
        try:
            st_name = input("Please enter your name > ")
            st_number = int(input("Please enter your student number (8digits) > "))
            # to check the length make st_number to str temporally
            if len(str(st_number)) == 8:
                stnum_flag = False

        # catch valueError from st_number
        except ValueError:
            print("this is not a number. please try again.")

    return st_name, st_number
# na, num = get_student_info()
# print(na, num)


# 5 marks
# Prompt the user for inputs
# Validate the inputs
# Course code is exactly 7 characters
# Function returns two string values
def get_course_info():
    cocode_flag = True
    while cocode_flag:
        co_title = input("Please enter your course title > ")
        co_code = input("Please enter your course code (7characters) > ")
        # to check the length make co_code to str temporally
        if len(co_code) == 7:
            cocode_flag = False

    return co_title, co_code


# title, code = get_course_info()
# print(title, code)


# 5 marks
# Prompts the user for the weights of each component: Assignments, Midterm, Exam
# Validate the inputs
# Weight value for each component is between 0 and 100.
# Function returns 3 float values. wAssignment, wMidterm, wExam
def get_assessment_weights():
    weight_flag = True
    while weight_flag:
        try:
            wAssignment = float(input("Please enter the weight of Assignments(0~100) > "))
            wMidterm = float(input("Please enter the weight of Midterm(0~100) > "))
            wExam = float(input("Please enter the weight of Exam(0~100) > "))
            if 0 <= wAssignment <= 100 and 0 <= wMidterm <= 100 and 0 <= wExam <= 100:
                weight_flag = False
            else:
                print("The weights should be the number between 0 to 100. please try again")
        except ValueError:
            print("this is not number. please try again")
    return wAssignment, wMidterm, wExam


# w_ass, w_mid, w_exa = get_assessment_weights()
# print(w_ass, w_mid, w_exa)
# 5 marks
# Returns True if the sum of the 3 arguments is 100. False otherwise
# Assign the default values 40, 35, 25 to wAssign, wMidterm and wExam respectively
def check_weights(wAssign = 40, wMidterm = 35, wExam = 25):
    check_result = False
    if wAssign + wMidterm + wExam == 100:
        check_result = True
    return check_result


# print(check_weights(13, 38, 50))

# 5 marks
# Prompts the user for the number of assignments
# Keep prompting until the number is a positive integer.
# Returns the number of assignments
def get_number_of_assignments():
    assi_flag = True
    while assi_flag:
        try:
            num_assignments = int(input("Please enter the number of assignments > "))
            if num_assignments > 0:
                assi_flag = False
            else:
                print("This is not a positive number. please try again.")
        except ValueError:
            print("this is not a number. please try again.")
    return num_assignments


# get_number_of_assignments()
# 5 marks
# Convert the percent grade to a letter grade according to the conversion table
# in the course outline
def calculate_alpha_grade(percent_grade):
    letter_grade = ""
    if 90 <= percent_grade <= 100:
        letter_grade = "A+"
    elif 85 <= percent_grade <= 89:
        letter_grade = "A"
    elif 80 <= percent_grade <= 84:
        letter_grade = "A-"
    elif 77 <= percent_grade <= 79:
        letter_grade = "B+"
    elif 73 <= percent_grade <= 76:
        letter_grade = "B"
    elif 70 <= percent_grade <= 72:
        letter_grade = "B-"
    elif 67 <= percent_grade <= 69:
        letter_grade = "C+"
    elif 63 <= percent_grade <= 66:
        letter_grade = "C"
    elif 60 <= percent_grade <= 62:
        letter_grade = "C-"
    elif 57 <= percent_grade <= 59:
        letter_grade = "D+"
    elif 53 <= percent_grade <= 56:
        letter_grade = "D"
    elif 50 <= percent_grade <= 52:
        letter_grade = "D-"
    elif percent_grade < 49:
        letter_grade = "F"

    return letter_grade


# print(calculate_alpha_grade(2374))
# 5 marks
# Get the weight values of each assessment component (call the appropriate function)
# Check if summation of weight values is 100 (call the appropriate function)
# If False, repeat until True.
total_wflag = True
while total_wflag:
    w_assignment, w_midterm, w_exam = get_assessment_weights()
    # set the return value to total_wflag to repeat it or not
    total_wflag = not check_weights(w_assignment, w_midterm, w_exam)

# 10 marks
# Get the number of assignments
# For each assignment prompt the user to enter assignment grades
# Validate the input as a float between 0 and 100
# Calculate the average assignment grade.
numb_assignments = get_number_of_assignments()
total_assignments_grade = 0
for i in range(numb_assignments):
    assi_flag = True
    while assi_flag:
        try:
            assi_grades = float(input("Please enter assignment grade > "))
            if 0 <= assi_grades <= 100:
                assi_flag = False
            else:
                print("The grade should be the number between 0 to 100. please try again")
        # catch error of converting assi_grades
        except ValueError:
            print("this is not a number. please try again.")
    total_assignments_grade += assi_grades
avg_assignments_grade = total_assignments_grade / numb_assignments
print(avg_assignments_grade)

# 5 marks
# Prompt the user to enter the grade for midterm
# Validate the input as a float between 0 and 100
midterm_flag = True
while midterm_flag:
    try:
        midterm_grade = float(input("Please enter midterm grade > "))
        if 0 <= midterm_grade <= 100:
            assi_flag = False
        else:
            print("The grade should be the number between 0 to 100. please try again")
    # catch error of converting assi_grades
    except ValueError:
        print("this is not a number. please try again.")
# print(midterm_grade)

# 5 marks
# Prompt the user to enter the grade for exam
# Validate the input as a float between 0 and 100
exam_flag = True
while exam_flag:
    try:
        exam_grade = float(input("Please enter exam grade > "))
        if 0 <= exam_grade <= 100:
            exam_flag = False
        else:
            print("The grade should be the number between 0 to 100. please try again")
    # catch error of converting assi_grades
    except ValueError:
        print("this is not a number. please try again.")
# print(exam_grade)

# 10 marks
# Calculate the weighted average of each assessment component: Assignments, Midterm, Exam
# Calculate the percent grade as specified in the course outline
# https://www.wikihow.com/Calculate-Weighted-Average
percent_grade = 0
weighted_assignment = avg_assignments_grade * w_assignment / 100
weighted_midterm = midterm_grade * w_midterm / 100
weighted_exam = exam_grade * w_exam / 100

# i couldn't figure out what is total possible score that can take which use to denominator
# put 100 instead to denominator to calculate percent frade
percent_grade = (weighted_assignment + weighted_midterm + weighted_exam)/100

# 2 marks
# Calculate letter grade (call the appropriate function)
lett_grade = calculate_alpha_grade(percent_grade)

# 3 marks
# Display the data as shown in the sample output
s_name, s_num = get_student_info()
c_title, c_code = get_course_info()

print('Student Information\nName: {}\nStudent Number: {}\n----------------------'.format(s_name, s_num))
print('Course Information\nCourse Title: {}\nCourse Code: {}\n----------------------'.format(c_title, c_code))
print('Mark Breakdown\nAssignments: {}/{}\nMidterm: {}/{}\nExam: {}/{}\n'
      .format(weighted_assignment, w_assignment, weighted_midterm, w_midterm, weighted_exam, exam_grade))
print('\nPercent Grade: {}%\nLetter Grade: {}\n'.format(percent_grade, lett_grade))
