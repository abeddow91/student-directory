def input_students
  month = %w[January February March April May June July August September
     October November December Unknown]

  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  @students =[]
  #get the first name
  name = gets.chomp.capitalize

  #while the name is not empty, repeat this code
    while !name.empty? do
      #add the student has to the array
      puts "Please enter which cohort they are in"
      cohort = gets.chomp.capitalize
        if cohort.empty?
        cohort = "Unknown"
        end

        while !month.include?(cohort)
            puts "Sorry that's not a month, please enter a valid month"
            cohort = gets.chomp.capitalize
        end
      cohort.to_sym
      puts  "Please enter the country of birth"
      country=gets.chomp.capitalize
        if country.empty?
          country = "Unknown"
        end
      puts "Please enter height"
        height=gets.chomp.capitalize
        if height.empty?
          height = "Unknown"
        end
      puts "Please enter hobbies"
      hobbies = gets.chomp.capitalize
      if hobbies.empty?
        hobbies = "Unkown"
      end


      @students << {name: name, cohort: cohort, country: country, height: height, hobbies: hobbies}
      puts @students.count ==1?  "Now we have #{@students.count} student" :  "Now we have #{@students.count} students"
      # get another name from the user
      name = gets.chomp
    end
  #return the array of students
    @students
end


def print_header
  puts "The students of Villains Academy".center(100)
  puts "_____________".center(100)
end


def print_students_list
    if @students.empty? == false
  @students.each_with_index do |student, index |
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(100)
    end
    else
      puts "There are not any students currently enrolled".center(100)
    end
end



def print_footer
  puts @students.count ==1? "Overall, we have #{@students.count} great student".center(100) : "Overall, we have #{@students.count} great students".center(100)
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
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
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit #this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end


def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end


interactive_menu
