require 'pry'

class User

# PUBLIC SECTION
  attr_accessor :email
  attr_accessor :age
  @@user_count = 0
  #@@all_users = [] # haven't figured out how to increment

  def initialize(email, age)

    if check_info(email,age)
      @email = email
      @age = age
      @@user_count += 1

      puts "User n#{@@user_count} created with email and age information"
    else
      puts "Wrong email or age format.\nEmail should be xxx@xxx.xxx format.\nAge should be natural interger.\nUser creation failded. Please start again."
      puts "Now #{@@user_count} registered."
    end
  end

  def self.count
   return @@user_count
  end

  =begin
  def self.all?
    return @@all_users
  end
  =end


  private

  def check_info(email, age)
    if (email =~ /@/) && (email =~ /./) && (age.to_i == age)
      true
    else
      false
    end
  end

end

binding.pry
puts "Program ends here."
