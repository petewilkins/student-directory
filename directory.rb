def input_students
    
    students = []
    
    puts "Welcome to the Villains Academy Student Directory"
    puts "Please enter the Students name:"
    name = gets.chomp
    
    puts "Please add the student's birth year:"
    birth_year = gets.chomp
    
    puts "Please add the student's hobby:"
    hobby = gets.chomp
    
    # while the name is not empty, repeat this code
    while !name.empty? do
        # add the student hash to the array
        students << {name: name, birth_year: birth_year, hobby: hobby, cohort: :november}
        puts "Now we have #{students.count} students"
        
        # get another name, birth year and hobby from the user
        puts "Please add another Student name:"
        puts "(to finish adding names, just hit return three times)"
        name = gets.chomp
        puts "Please add the student's birth year:"
        birth_year = gets.chomp
        puts "Please add the student's hobby:"
        hobby = gets.chomp
    end
    # return the array of students
    students
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end
    
def print(students)
    puts "Please enter the letter you wish to filter names by"
    letter = gets.chomp
    # rewritten each() method to use while loop
    counter = 0
    while counter < students.length
        if students[counter][:name].start_with?(letter) && students[counter][:name].length < 12
            puts "#{counter+1}. #{students[counter][:name]}"
            puts "Year of Birth: #{students[counter][:birth_year]}"
            puts "Hobby: #{students[counter][:hobby]}"
            puts "Cohort: #{students[counter][:cohort]}"
            counter += 1
        else
            counter += 1
        end
    end
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)