# Grades

It is common practice for college written exams to score points for each correct question but also points against for each wrong question.
The following program must calculate the final score of the students based on the number of correct and incorrect questions and show at the end a brief report with the scores from highest to lowest.

This is how the program should look like:

```
$ ruby grades.rb
Number of students: 3
Insert the student information in the following way:
Student n: <name>, <correct-answers>, <incorrect-answers>
Student 1: Deyvi, 60, 20
Student 2: Wences, 70, 30
Student 3: Diego, 65, 10
--------------------------------------------------
Results:
Wences scored 640 points
################################::::::::::::::::::
Diego scored 630 points
###############################:::::::::::::::::::
Deyvi scored 560 points
############################::::::::::::::::::::::
```

First, the program ask the user for the number of students.

Then, the program shows 2 lines of instructions on how the data should be registered.

After that the program asks the user for the information of each student. The expected format is \<name>, \<correct-answers>, \<incorrect-answers>. The exam has 100 question so the sum of correct and incorrect answers should be less than or equal to 100.
For each correct answer, the student score 10 points. For each incorrect answer the student loses 2 points. The minimum and maximum scores are 0 and 1000 respectively.

After that comes a divisor of 50 characters (-) and the text 'Results:'

Finally, the information of each student is present on the folloinf format:

One line with the text '\<name> scored \<score> points'.

Another line with a bar made of 50 characters. Each "#" worth 20 points. Example:

- 52 points -> ## (2 #'s)
- 10 points -> (0 #'s)

The remaining spaces should be filled with ":". It should be 50 character in total between `#`'s and `:`'s

> For this exercise you can asume that all inputs will be valid. The only inout to validate is the sum of correct and incorrect answers for each student.
