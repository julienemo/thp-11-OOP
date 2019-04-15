require 'pry'

class User

# PUBLIC SECTION
  attr_accessor :email, :age
  @@all_users = []

  # INSTANCE METHODS
  def initialize(email, age)
    # data validation : if good format, proceed.
    if check_format(email,age)
      @email = email
      @age = age
      @@all_users << self

      # thi ObjectSpace thing is just something I found online
      # it looks more efficient than stuff +=1
      # also tested with the data validation
      # when there is format error in email and age it doesn't increment
      puts "User created with email and age information"
    else
      puts "Wrong email or age format.\nEmail should be xxx@xxx.xxx format.\nAge should be natural interger.\nUser creation failded. Please start again."
    end
  end

  # CLASS METHODS
  def self.count
    ObjectSpace.each_object(self).count
  end

  def self.all
    @@all_users
    # alternatively use ObjectSpace.each_object(self).to_a
  end

  def self.find_by_email(email)
    begin
      user = ObjectSpace.each_object(User).find {
        |object| object.instance_variable_get(:@email) == email
      }
      # alternatively use
      # @@all_users.each do |user|
      #   if user.email == email
      # return user
      puts "User found, age #{user.age}."
    rescue
      puts "No matching user."
    end
  end

  private

  def check_format(email, age)
    if (email =~ /@/) && (email =~ /./) && (age.to_i == age)
      true
    else
      false
    end
  end

end

binding.pry
puts "Program ends here."

=begin
def self.all?
  return @@all_users
end
=end
