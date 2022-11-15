# three modeof file
# - read, write. append
# write the file
with open('review.txt', 'w') as f:
    f.write('Hello, welcome to Python Review Session')
# append the file
with open('review.txt', 'a') as f:
    f.write('\n Append to the last line')
# read the file
with open('review.txt', 'r') as f:
    for line in f:
        print(line)
