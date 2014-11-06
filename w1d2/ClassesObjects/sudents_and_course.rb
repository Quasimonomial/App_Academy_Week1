class Student
  def initialize first, last
    @first = first
    @last = last
    #array of course objects
    @courses_enrolled = []
  end
  
  def name
    return "#{@first} #{@last}"
  end
  
  def courses
    @courses_enrolled
  end
  
  def has_conflicts?(new_course)
    @courses_enrolled.each do  |course|
      if course.conflicts_with?(new_course)
        return true
      end
    end
    false
  end
    
  def enroll(course)
    if @courses_enrolled.include?(course)
      puts "Student is already enrolled"
    elsif self.has_conflicts?(course)
      puts "There's a conflict. No can do."
    else
      @courses_enrolled << course
      course.add_student(self)
    end
  end
  
  def course_load
    course_load = {}
    @courses_enrolled.each do |course|
      if course_load.has_key?(course.department)
        course_load[course.department] += course.num_credits
      else
        course_load[course.department] = course.num_credits
      end
    end
    course_load
  end
end

class Course
  def initialize (course_name, department, num_credits, block, days)
    @course_name = course_name
    @department = department
    @num_credits = num_credits
    @student_pile = []
    @block = block
    @days = days
    
  end
  def department
    @department
  end
  def num_credits
    @num_credits
  end
  
  def students
    @student_pile
  end
  
  def add_student student
    @student_pile << student
  end
  
  def time_block
    @block
  end
  
  def days
    @days
  end
  
  def conflicts_with?(course)
    @block == course.time_block && !(@days & course.days).empty?
    
    #(@days + course.days == (@days + course.days).uniq)
    #print course.days
    #puts "tests"
    #print @days
  end 
  
end

if $PROGRAM_NAME == __FILE__
  jeff = Student.new("Jeff", "Caves")
  puts jeff.courses
  puts jeff.name
  AA = Course.new("Ap_academy", "CS", 100, 1, [:mon, :tue, :wed, :thur, :fri, :sat])
  jeff.enroll(AA)
  puts jeff.courses
  puts AA.students
  travis = Student.new("Travos","Jerrocl")
  travis.enroll(AA)
  travis.enroll(AA)
  puts AA.students
  devboot = Course.new("Dev boot", "CS", 240, 1, [:mon, :tues])
  jeff.enroll(devboot)
  gym = Course.new("PE", "Health", -5565, 2, [:wed, :thur])
  jeff.enroll(gym)
  puts jeff.course_load
  puts gym.conflicts_with?(AA)
  puts AA.conflicts_with?(devboot)
end