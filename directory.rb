
def input_students
    puts "please enter the names of the students"
    puts "To exit, hit return twice"
    students = []
    name = $stdin.gets.chomp
# while the name is not empty, repeat this code
    while !name.empty? do
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        name = $stdin.gets.chomp
    end
    students
end

def print_header
puts "The students of Villains Academy"
puts "-------------"
end 

def print(students)
    students.each_with_index do |student, index|
         puts "#{index + 1}: #{student [:name]} (#{student[:cohort]} cohort)"
    end
end 

def print_footer(students)
puts "Overall, we have #{students.count} great students"
end

def students_by_letter(students)
    puts "Select students whose names begin with what letter?"
    puts ">"
    letter = gets.chomp.to_s
    students.each do |student|
        if student[:name][0] == letter  
           puts student
        end
   end 
end

students = input_students
print_header
print(students)
print_footer(students)
students_by_letter(students)
