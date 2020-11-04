# Ask the user for the number (N) of students and store the response

# Print the instructions

# Repeat N times the following:
# Ask the user for the student data
# From the response, extract the name, the number of correct and incorrect answers
# If the correct and the incorrect adds more than 100, display the error message and ask again.
# Do it until the user complies.
# Calculate and store the score in a variable. Each correct answer score 10 point and each of the incorrect -2 points.
# Remember that the minimun score is 0.
# Store the information of the student (name and score) among the other students (some type of collection)

# After finishing to store the students data. Sort the collection by the score, from highest to lowest.

# Display the divisor line and the Result subtitle

# For each student in the sorted collection, show the message 'Name scored X points' followed by the bar.
# The bar should be 50 characters long. If the maximum score is 1000 points, each character should be worth 20 points.

class String
  def letter?
    /[A-Za-z]/.match?(self)
  end
end

# Preguntando por la cantidad de estudiantes
cant_student = 0
loop do
  print("Number of student: ")
  cant_student = gets.to_i
  cant_student.positive? && break
end

# Preguntando por el nombre, nota_1 y nota_2 de cada estudiante
a = ""
b = 0
c = 0

students = {}

x = 1
while x <= cant_student
  print("Student #{x}: ")
  a, b, c = gets.to_s.split(",")

  if a.letter? && b.to_i >= 0 && c.to_i >= 0 && c.to_i + b.to_i <= 100
    students[a.strip] = [b.to_i, c.to_i]
    x += 1
  end
end

# Separador
puts("-" * 50)
puts("Results:")

# Ordenando del score mas alto al menor
students = Hash[students.sort_by { |_, v| (v[0] * 10) - (v[1] * 2) <= 0 ? 0 : (v[0] * 10) - (v[1] * 2) }]
students = students.to_a.reverse.to_h

# Mostrando los datos
students.each do |k, v|
  score = (v[0] * 10) - (v[1] * 2) <= 0 ? 0 : (v[0] * 10) - (v[1] * 2)
  puts("#{k} scored #{score} points")
  puts("#{'#' * (score / 20)}#{':' * ((1000 / 20) - (score / 20)).abs}")
end
