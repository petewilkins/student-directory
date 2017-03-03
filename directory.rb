@students = []
DEFAULT_FILE = "students.csv"

def interactive_menu
    loop do
        print_menu
        process($stdin.gets.chomp)
    end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to a file"
    puts "4. Load the list from a file"
    puts "9. Exit"
end

def show_students
    print_header
    print_students_list
    print_footer
end

def process(selection)
    case selection
        when "1"
            puts "SELECTED: 1. Input the students"
            input_students
        when "2"
            puts "SELECTED: 2. Show the students"
            show_students
        when "3"
            puts "SELECTED 3. Save the list to a file"
            save_students
        when "4"
            puts "SELECTED: 4. Load the list from a file"
            load_students
        when "9"
            puts "SELECTED: 9. Exit"
            exit
        else
            puts "I don't know what you meant, try again"
    end
end

def months
    month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
end

def try_load_students
    filename = ARGV.first # first argument from the command line
    if filename.nil? # if filename is blank load students with the default "students.csv"
        load_students()
    elsif File.exist?(filename)
        load_students(filename)
        puts "Loaded #{@students.count} from #{filename}"
    else
        puts "Sorry, #{filename} doesn't exist."
        exit
    end
end

def load_students(filename = DEFAULT_FILE)
    puts "Select from the following load options"
    puts "1. Load from 'students.csv'"
    puts "2. Load from a different file"
    load_choice = $stdin.gets.chomp
    
    if load_choice == "1"
        File.open(filename, "r") do |f|
            f.readlines.each do |line|
                name, birth_year, hobby, cohort = line.chomp.split(',')
                list_student(name, birth_year, hobby, cohort)
            end
        end
    elsif load_choice == "2"
        puts "Please enter the filename you wish to load from"
        temp_file = $stdin.gets.chomp
        File.open(temp_file, "r") do |f|
            f.readlines.each do |line|
                name, birth_year, hobby, cohort = line.chomp.split(',')
                list_student(name, birth_year, hobby, cohort)
            end
        end
    else
        puts "Please enter a valid filename"
        load_students()
    end
end

def list_student(name, birth_year, hobby, cohort)
    @students << {name: name, birth_year: birth_year, hobby: hobby, cohort: cohort.to_sym}
end

def input_students
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
            list_student(name, birth_year, hobby, cohort)
            if @students.count >= 2
                student_plural = "students"
            else
                student_plural = "student"
            end
            puts "Now we have #{@students.count} #{student_plural}."
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
    @students
end

def save_students
    puts "Select from the following save options"
    puts "1. Save file to 'students.csv'"
    puts "2. Save to a new file"
    save_choice = $stdin.gets.chomp
    if save_choice == "1"
        File.open(DEFAULT_FILE, "w") do |file|
            #iterate over the array of students
            @students.each do |student|
                student_data = [student[:name], student[:birth_year], student[:hobby], student[:cohort]]
                csv_line = student_data.join(",")
                file.puts csv_line
            end
        end
    elsif save_choice == "2"
        puts "Please enter the name of the file you wish to save to"
        temp_file = $stdin.gets.chomp
        File.open(temp_file, "w+") do |file|
            @students.each do |student|
                student_data = [student[:name], student[:birth_year], student[:hobby], student[:cohort]]
                csv_line = student_data.join(",")
                file.puts csv_line
            end
        end
    else
        puts "Please only choose from option 1 or 2"
        save_students
    end
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end
    
def print_students_list
    if @students.count >= 1
        puts "Would you like to filter names by a letter?"
        puts "Please enter the letter you wish to filter names by, or press ENTER for no filter"
        letter = $stdin.gets.delete("\n")
        counter = 0
        while counter < @students.length
            if @students[counter][:name].start_with?(letter.upcase) && @students[counter][:name].length < 12
                puts "#{counter+1}. #{@students[counter][:name]}".center(80)
                puts "Year of Birth: #{@students[counter][:birth_year]}".center(80)
                puts "Hobby: #{@students[counter][:hobby]}".center(80)
                puts "Cohort: #{@students[counter][:cohort]}".center(80)
                counter += 1
            else
                counter += 1
            end
        end
    else
        puts "Student list is empty"
    end
end

def print_footer
    if @students.count >= 2
        student_plural = "students"
    else
        student_plural = "student"
    end
    puts "Overall, we have #{@students.count} great #{student_plural}."
end

#nothing happens until we call the methods
try_load_students
interactive_menu