
def input_students
  month = ["January", "February", "March","April","May","June","July","August",
          "September","October","November","December", "Unknown"]

  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students =[]
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


      students << {name: name, cohort: cohort, country: country, height: height, hobbies: hobbies}
      puts students.count ==1?  "Now we have #{students.count} student" :  "Now we have #{students.count} students"
      # get another name from the user
      name = gets.chomp
    end
  #return the array of students
    students
end

#Our code only works with the student name and cohort.
#Add more information: hobbies, country of birth, height, etc.


def print_header
  puts "The students of Villains Academy".center(100)
  puts "_____________".center(100)
end


def print(students)
    if students.empty? == false
  students.each_with_index do |student, index |
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(100)
    end
    else
      puts "There are not any students currently enrolled".center(100)
    end
end

def print_footer(students)
  puts students.count ==1? "Overall, we have #{students.count} great student".center(100) : "Overall, we have #{students.count} great students".center(100)
end

students = input_students
print_header
print(students)
print_footer(students)
