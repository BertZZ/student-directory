
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
    letter = $stdin.gets.chomp
    students.each do |student|
        if student[:name][0] == letter  
           puts student
        end
   end 
end

def students_by_length(students)
    puts "Select students whose names are what length or shorter long"
    puts ">"
    number = $stdin.gets.chomp.to_i
    students.each do |student|
        if student[:name].length <= number 
           puts student
        end
   end 
end

def interactive_menu
    students = []
    loop do
        puts "1. Input the Students"
        puts "2. Print the Students"
        puts "9. Exit"
        selection = gets.chomp
        case selection 
        when "1"
            students = input_students
        when "2"
            print_header
            print(students)
            print_footer(students)
        when "9"
            exit 
        else
            puts "I don't know what you mean, Try Again"
        end
    end
end

interactive_menu 
