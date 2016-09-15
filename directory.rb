def input_students
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

      students << {name: name, cohort: cohort}
      puts students.count ==1?  "Now we have #{students.count} student" :  "Now we have #{students.count} students"
      # get another name from the user
      name = gets.chomp
    end
  #return the array of students
    students
end


def print_header
  puts "The students of Villains Academy"
  puts "_____________"
end

def print_certain_letter(students)
  puts "These are the students whose names begin with A"
  students.each_with_index do |student, index |
    if student[:name].start_with?("A")
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print(students)
    if students.empty? == false
  students.each_with_index do |student, index |
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
    else
      puts "There are not any students currently enrolled"
    end
end

def print_12_letters(students)
  puts "These are the students whose names have less than 12 letters"
  students.each_with_index do |student, index |
    if student[:name].length <=12
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end


def print_footer(students)
  puts students.count ==1? "Overall, we have #{students.count} great student" : "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_certain_letter(students)
print_12_letters(students)
print_footer(students)
