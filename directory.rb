def months
    month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
end

def input_students
    
    students = []
    
    puts "Welcome to the Villains Academy Student Directory"
    puts "Please enter the Students name: (press ENTER to skip)"
    name = $stdin.gets.delete("\n").capitalize
    
    puts "Please add the student's birth year: (press ENTER to skip)"
    birth_year = $stdin.gets.delete("\n")
    
    puts "Please add the student's hobby: (press ENTER to skip)"
    hobby = $stdin.gets.delete("\n").capitalize
    
    puts "Please add the student's cohort month (press ENTER to skip)"
    cohort = $stdin.gets.delete("\n").capitalize
    cohort.to_sym
    
    # while the name is not empty, repeat this code
    while !name.empty? do
        puts "Please check details:"
        puts "Name: #{name}".center(80)
        puts "Birth Year: #{if birth_year.empty? then (birth_year = "N/A") else birth_year end}".center(80)
        puts "Hobby: #{if hobby.empty? then (hobby = "N/A") else hobby end}".center(80)
        puts "Cohort: #{if cohort.empty? then (cohort = "N/A") else cohort end}".center(80)
        puts "Are all the details are correct? Y/N:"
        details_conf = $stdin.gets.delete("\n").upcase
        
        if (details_conf == "Y") && (months.include? cohort)
            # add the student hash to the array
            students << {name: name, birth_year: birth_year, hobby: hobby, cohort: cohort}
            # pluralisation of student
            if students.count >= 2
                student_plural = "students"
            else
                student_plural = "student"
            end
            puts "Now we have #{students.count} #{student_plural}."
        else
            puts "Incorrect Input, please try again."
            exit(0)
        end
        
        # get another name, birth year and hobby from the user
        puts "Please add another Student name: (press ENTER to skip)"
        name = $stdin.gets.delete("\n").capitalize
        
        puts "Please add the student's birth year: (press ENTER to skip)"
        birth_year = $stdin.gets.delete("\n")
    
        puts "Please add the student's hobby: (press ENTER to skip)"
        hobby = $stdin.gets.delete("\n").capitalize
    
        puts "Please add the student's cohort month (press ENTER to skip)"
        cohort = $stdin.gets.delete("\n").capitalize
        cohort.to_sym
        
    end
    # return the array of students
    students.sort_by! {|x| x[:cohort] }
    students
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end
    
def print(students)
    if students.count >= 1
        puts "Please enter the letter you wish to filter names by"
        letter = $stdin.gets.delete("\n")
        # rewritten each() method to use while loop
        counter = 0
        while counter < students.length
            if students[counter][:name].start_with?(letter) && students[counter][:name].length < 12
                puts "#{counter+1}. #{students[counter][:name]}".center(80)
                puts "Year of Birth: #{students[counter][:birth_year]}".center(80)
                puts "Hobby: #{students[counter][:hobby]}".center(80)
                puts "Cohort: #{students[counter][:cohort]}".center(80)
                counter += 1
            else
                counter += 1
            end
        end
    else
        puts "Student list is empty"
    end
end

def print_footer(names)
    if names.count >= 2
        student_plural = "students"
    else
        student_plural = "student"
    end
    puts "Overall, we have #{names.count} great #{student_plural}."
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)