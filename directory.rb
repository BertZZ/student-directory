@students = []
def input_students
    puts "please enter the names of the students"
    puts "To exit, hit return twice"
    name = $stdin.gets.chomp
# while the name is not empty, repeat this code
    while !name.empty? do
        @students << {name: name, cohort: :november}
        puts "Now we have #{@students.count} students"
        name = $stdin.gets.chomp
    end
    @students
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end 

def print_students_list(students)
    @students.each_with_index do |student, index|
         puts "#{index + 1}: #{student [:name]} (#{student[:cohort]} cohort)"
    end
end 

def print_footer(students)
puts "Overall, we have #{@students.count} great students"
end

def students_by_letter(students)
    puts "Select students whose names begin with what letter?"
    puts ">"
    letter = $stdin.gets.chomp
    @students.each do |student|
        if student[:name][0] == letter  
           puts student
        end
   end 
end

def students_by_length(students)
    puts "Select students whose names are what length or shorter long"
    puts ">"
    number = $stdin.gets.chomp.to_i
    @students.each do |student|
        if student[:name].length <= number 
           puts student
        end
   end 
end

def print_menu
    puts "1. Input the Students"
    puts "2. Print the Students"
    puts "3. Save Students to students.csv "
    puts "4. Load the list from students.csv"
    puts "9. Exit"
end

def process(selection)
    case selection 
        when "1"
            input_students
        when "2"
            show_students
        when "3"
            save_students
        when "4"
            load_students
        when "9"
            exit 
        else
            puts "I don't know what you mean, Try Again"
    end
end

def show_students
    print_header
    print_students_list(@students)
    print_footer(@students)
end

def interactive_menu
    loop do
        print_menu
        process(gets.chomp)
    end
end

def save_students
    file = File.open("students.csv", "w")
    @students.each do |student|
        student_data = [student [:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
end

def load_students
    file = File.open("students.csv", "r")
    file.readlines.each do |line|
        name, cohort = line.chomp.split(",")
            @students << {name: name, cohort: cohort.to_sym}
    end
    file.close
end
            
    

interactive_menu 
