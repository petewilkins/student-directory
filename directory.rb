def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
        # add the student hash to the array
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
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
            puts "#{counter+1}. #{students[counter][:name]} (#{students[counter][:cohort]} cohort)"
            counter += 1
        else
            counter += 1
        end
    end
    
    # code below this works, but has been rewritten above to use a while loop.
    #students.each_with_index do |student, index|
    #    # if the students name starts with the letter chosen
    #    if student[:name].start_with?(letter) && student[:name].length < 12
    #        puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    #    else
    #        # move onto next name in key/value pair
    #    end
    #end
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)